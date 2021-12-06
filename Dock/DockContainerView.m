#import <AppKit/AppKit.h>
#import "DockContainerView.h"

@implementation DockContainerView

- (BOOL)acceptsFirstResponder
{
  return YES;
}

- (BOOL)acceptsFirstMouse:(NSEvent*)theEvent
{
  return YES;
}

- (void)mouseMoved:(NSEvent *)theEvent
{
  NSDebugLog(@"container move");
}

- (void)mouseDown:(NSEvent *)theEvent
{

  NSDebugLog(@"container down");
}

- (void)mouseUp:(NSEvent *)theEvent
{

  NSDebugLog(@"container up");
}

- (void)drawRect:(NSRect)rect
{
  // draw rounded cornerr ect
    [[NSColor colorWithCalibratedRed: 0.4
                                          green: 0.4
                                           blue: 0.4
                                          alpha: 1] set];
    NSRect r = NSInsetRect(self.frame, 0, 0);
    r.origin = NSMakePoint(0, 0);
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect: NSInsetRect(r, 5.0, 5.0)
                                                         xRadius: 10.0
                                                         yRadius: 10.0  ];
    [path fill];
}

@end
