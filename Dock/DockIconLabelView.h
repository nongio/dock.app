#ifndef _DockIconLabelView
#define _DockIconLabelView

#include <Foundation/Foundation.h>
#include <AppKit/NSView.h>

@interface DockIconLabelView : NSView
{
  NSAttributedString *label;
}
- (void)setLabel:(NSString *)newlabel;
@end

#endif
