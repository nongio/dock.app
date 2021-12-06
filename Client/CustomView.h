#include <Foundation/Foundation.h>
#include <AppKit/NSView.h>
#include <AppKit/NSImage.h>
#include <AppKit/NSCell.h>

@interface CustomView : NSView
{
  NSImage *icon;
}
- (void)load;
@end
