#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>
#import "AppController.h"


int main(int argc, const char **argv, char **environ) {
  NSAutoreleasePool *pool = [NSAutoreleasePool new];
  AppController * controller = [AppController new];

  NSApplication *app = [NSApplication sharedApplication];
  [app setDelegate:controller];
  [NSProcessInfo initializeWithArguments: (char**)argv
                                   count: argc
                             environment: environ];


  [app run];
  [pool drain];
  return 0;
}
