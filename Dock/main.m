#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>
#import "DockController.h"

int
main(int argc, const char **argv, char **environ)
{
  CREATE_AUTORELEASE_POOL (pool);

  NSApplication *app = [NSApplication sharedApplication];
  DockController * controller = [DockController sharedInstance];
  [controller startService];
  [app setDelegate:controller];
  [app run];
  DESTROY (pool);

  return 0;
}
