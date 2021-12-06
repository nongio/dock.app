#ifndef _DockIconView
#define _DockIconView

#include <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "DockIconLabelView.h"


enum
{
  DockIconClosed = 0,
  DockIconRunning = 1,
  DockIconUnresponsive = 2
};


@interface DockIconView : NSView
{
  NSMenu	 *menu;
  NSImage  *icon;
  NSString *appname;

  NSInteger state;
  DockIconLabelView * labelView;
  BOOL pressed;
}
- (void)load:(NSBitmapImageRep *)imagerep;
- (void)setAppName:(NSString *)newname;
- (void)setMenu:(NSMenu *)newmenu;

- (void) setRunning;
- (void) setClosed;
@end

#endif
