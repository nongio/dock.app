#import "CustomView.h"
#import <AppKit/NSGraphics.h>
@implementation CustomView

- (void)load
{
  NSString *ipath = [[NSBundle mainBundle] pathForResource:@"icon" ofType:@"png"];

  icon = [[NSImage alloc]
    initWithContentsOfFile:ipath];
}

- (void)drawRect:(NSRect)rect
{
  [[NSColor clearColor] set];
  NSRectFill([self bounds]);
  [icon drawInRect:NSMakeRect(0, 0, 400, 400)];
}

@end
