#import <Foundation/Foundation.h>
#import "DockServer.h"
#import "DockController.h"
#import "DockIconView.h"

@implementation DockServer : NSObject

- (void)pong:(bycopy NSString *)processId
{

  NSDebugLog(@"pong: %@", processId);
}


- (void)setMenu:(byref NSMenu *)menu forApp:(bycopy NSString *)processId
{
  DockController *dc = [DockController sharedInstance];
  DockIconView   *div = [dc viewForApp:processId];
  if (div == nil)
    {
      return;
    }
  [div setMenu:menu];
}

- (void)setView:(byref NSView *)view
	 forApp:(bycopy NSString *)processId
       withName:(NSString *)name
{
  DockController *dc = [DockController sharedInstance];

  DockIconView   *div = [dc viewForApp:processId];
  if (div == nil)
    {
      div = [[DockIconView alloc] init];
      [div setAppName: name];
      [dc addView:div forApp:processId];
    }
    NSBitmapImageRep * bitmapImageRep = [view bitmapImageRepForCachingDisplayInRect:[view bounds]];
    [div load:bitmapImageRep];
    [div setAppName:name];
}

- (void)setAppClosed:(NSString *)processId
{
  DockController *dc = [DockController sharedInstance];
  DockIconView   *div = [dc viewForApp:processId];
  if (div == nil)
    {
      return;
    }
  [div setClosed];
}

- (void)setAppRunning:(NSString *)processId
{
  DockController *dc = [DockController sharedInstance];
  DockIconView   *div = [dc viewForApp:processId];
  if (div == nil)
    {
      return;
    }
  [div setRunning];
}

@end

