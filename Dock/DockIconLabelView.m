#import <AppKit/AppKit.h>
#import "DockIconLabelView.h"

@implementation DockIconLabelView
- (void)setLabel:(NSString *)newlabel;
{
  NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
  paragraphStyle.alignment = NSTextAlignmentCenter;

  label = [[NSAttributedString alloc]
    initWithString:newlabel
	attributes:@{NSParagraphStyleAttributeName : paragraphStyle}];
  [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)rect
{
//  NSDictionary *attributes;

  [[NSColor colorWithCalibratedRed: 1.0
                                        green: 1.0
                                          blue: 1.0
                                        alpha: 0.7] set];
  float radius = 10;
  float width = 100;
  float height = 25;
  float arrowHeight = 10;
  float arrowWidth = 15;

  NSBezierPath *path = [NSBezierPath bezierPath];
  [path moveToPoint:NSMakePoint(radius, arrowHeight)];
  [path lineToPoint:NSMakePoint(width / 2.0 - arrowWidth / 2.0, arrowHeight)];
  [path lineToPoint:NSMakePoint(width / 2.0, 0)];
  [path lineToPoint:NSMakePoint(width / 2.0 + arrowWidth / 2.0, arrowHeight)];
  [path lineToPoint:NSMakePoint(width - radius, arrowHeight)];
  [path curveToPoint:NSMakePoint(width, arrowHeight + radius) controlPoint1:NSMakePoint(width, arrowHeight) controlPoint2:NSMakePoint(width, arrowHeight)];
  [path lineToPoint:NSMakePoint(width, arrowHeight + height - radius)];
  [path curveToPoint:NSMakePoint(width - radius, arrowHeight + height) controlPoint1:NSMakePoint(width, arrowHeight + height) controlPoint2:NSMakePoint(width, arrowHeight + height)];
  [path lineToPoint:NSMakePoint(radius, arrowHeight + height)];
  [path curveToPoint:NSMakePoint(0, arrowHeight + height - radius) controlPoint1:NSMakePoint(0, arrowHeight + height) controlPoint2:NSMakePoint(0, arrowHeight + height)];
  [path lineToPoint:NSMakePoint(0, arrowHeight + radius)];

  [path curveToPoint:NSMakePoint(radius, arrowHeight) controlPoint1:NSMakePoint(0, arrowHeight) controlPoint2:NSMakePoint(0, arrowHeight)];
  [path closePath];

  [path fill];

  NSRect r = NSMakeRect(0, arrowHeight - 5, width, height);
  [label drawInRect: r];
}

@end
