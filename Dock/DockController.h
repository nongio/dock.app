#ifndef _DockController
#define _DockController

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "DockServer.h"
#import "DockIconView.h"

@interface DockController : NSResponder
{
  @private
  DockServer *dockServer;
  NSMutableArray * favouriteApps;
  NSMutableArray * runningApps;
  NSMutableDictionary * applicationIcons;

}
+ (DockController *)sharedInstance;
- (void)startService;
- (DockIconView *)viewForApp:(NSString *)appId;
- (void)addView:(DockIconView *)div forApp:(NSString *)appId;
@end

#endif
