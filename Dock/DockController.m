#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "DockController.h"
#import "DockContainerView.h"
#import "DockIconView.h"

NSWindow	 *_window;


@implementation DockController
+ (DockController *)sharedInstance
{
  static DockController *_sharedDockController = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedDockController = [[DockController alloc] init];
  });

  return _sharedDockController;
}

- (id) init
{

  if(self = [super init]) {
    favouriteApps = [[NSMutableArray alloc] initWithCapacity:10];
    runningApps = [[NSMutableArray alloc] initWithCapacity:5];
    dockServer = [[DockServer alloc] init];
    applicationIcons = [NSMutableDictionary dictionary];
  }
  return self;
}

- (void)startService
{
  RETAIN(applicationIcons);

  NSConnection *conn = [NSConnection defaultConnection];
  [conn setRootObject:dockServer];
  if ([conn registerName:@"DockService"] == NO)
    {
      NSLog(@"Unable to register as 'DockService'");
      NSLog(@"Perhaps another copy of this program is running?");
      exit(1);
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNote
{
  NSRect windowFrame = NSMakeRect(40, 40, 900, 200);
  _window = [[NSWindow alloc] initWithContentRect:windowFrame
					styleMask: NSBorderlessWindowMask
					  backing:NSBackingStoreNonretained
					    defer:NO];

  [_window setBackgroundColor:[NSColor colorWithCalibratedRed:1.0
							green:1.0
							 blue:1.0
							alpha:0.7]];

  [_window setContentView: [[DockContainerView alloc] initWithFrame: NSMakeRect(0,0,900,200)]];

  [_window makeKeyAndOrderFront:nil];
  [_window setAcceptsMouseMovedEvents: YES];
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(id)sender
{
  return NO;
}

- (BOOL)acceptsFirstResponder
{
  return YES;
}

- (DockIconView *)viewForApp:(NSString *)appId
{
  NSDebugLog(@"[%lu] viewForApp:%@", [applicationIcons count], appId);
  return [applicationIcons objectForKey:appId];
}

- (void)addView:(DockIconView *)div forApp:(NSString *)appId
{

  if(div == nil)
  {
    return;
  }

  [applicationIcons setObject:div forKey:appId];

  [div setRunning];
  [_window.contentView addSubview: div];
  [self layout];
}

- (void) layout
{
  NSView * view;
  int i = 0;
  for(view in [_window.contentView subviews])
  {
    view.frame = NSMakeRect(20 + 105 * i, 10, 100, 150);
    i++;
  }
}

- (void)dealloc
{
  RELEASE(_window);
  RELEASE(dockServer);
  [super dealloc];
}
@end
