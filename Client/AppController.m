#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

#import "AppController.h"
#import "CustomView.h"
#import "../Dock/Headers/DockService.h"

NSWindow	 *_window;
CustomView *_view;
NSMenu     *menu;

id<DockService> dockService;

@implementation AppController
- (void)applicationDidFinishLaunching:(NSNotification *)aNote
{
  dockService = (id<DockService>) [NSConnection
    rootProxyForConnectionWithRegisteredName:@"DockService"
					host:nil];

  RETAIN(dockService);

  menu = [[NSMenu alloc] initWithTitle:@"Main Menu"];

  [menu addItemWithTitle:@"GNUstep"
		  action:@selector(orderFrontStandardAboutPanel:)
	   keyEquivalent:@""];
  [menu addItemWithTitle:@"Quit"
		  action:@selector(terminate:)
	   keyEquivalent:@"q"];

  _view = [[CustomView alloc] initWithFrame:NSMakeRect(0, 0, 400, 400)];
  [_view load];

  _window = [[NSWindow alloc]
    initWithContentRect:NSMakeRect(200, 200, 400, 400)
	      styleMask:NSTitledWindowMask | NSClosableWindowMask
			| NSResizableWindowMask
		backing:NSBackingStoreBuffered
		  defer:YES];

  [_window setTitle:@"Client"];

  [_window setContentView:_view];
  [_window setBackgroundColor:[NSColor clearColor]];

  //[NSApp setMainMenu: menu];
  //[_window makeFirstResponder: self];
  [_window makeKeyAndOrderFront:nil];

  [dockService setView:_view forApp:@"client" withName:@"Client.app"];

  [dockService setMenu:menu forApp:@"client"];

  [dockService setAppRunning:@"client"];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(id)sender
{
  return YES;
}

//- (void) applicationDidUpdate: (NSNotification*)aNotification
//{
//  [dockService setView:_view
//	 forApp:@"client"
//       withName:@"Client.app"];
//
//}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
  [dockService setAppClosed:@"client"];
}

- (void)keyDown:(NSEvent *)theEvent
{
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}
@end
