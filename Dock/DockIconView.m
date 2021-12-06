#import "DockIconView.h"

@implementation DockIconView
- (id)init
{
  if (self = [super initWithFrame:NSMakeRect(0, 0, 150, 150)])
    {
      state = DockIconClosed;
      labelView =
	[[DockIconLabelView alloc] initWithFrame:NSMakeRect(0, 105, 200, 50)];
      [labelView setLabel:@"An application"];
      [labelView setHidden:YES];
      [self addSubview:labelView];
      [self addTrackingRect:NSMakeRect(0, 0, 150, 150)
		      owner:self
		   userData:nil
	       assumeInside:NO];
    }

  return self;
}

- (BOOL)acceptsFirstMouse:(NSEvent *)theEvent
{
  return YES;
}

- (void)setAppName:(NSString *)newname
{
  appname = newname;
  [labelView setLabel:appname];
}
- (void)setMenu:(NSMenu *)newmenu
{
  if (menu)
    {
      RELEASE(menu);
    }
  menu = newmenu;

  RETAIN(menu);
}

- (void)load:(NSBitmapImageRep *)imagerep
{
  NSData *data = [imagerep TIFFRepresentation];
  if (icon != nil)
    {
      RELEASE(icon);
    }
  icon = [[NSImage alloc] initWithData:data];

  [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)rect
{
  [[NSColor clearColor] set];
  NSRectFill([self bounds]);

  float opacity = pressed ? 0.6 : 1.0;

  [icon drawInRect:NSMakeRect(0, 10, 100, 100)
	  fromRect:NSZeroRect
	 operation:NSCompositeSourceOver
	  fraction:opacity];

  if (state == DockIconRunning)
    {
      [[NSColor greenColor] set];
      NSBezierPath *path = [NSBezierPath
	bezierPathWithOvalInRect:NSMakeRect(100.0 / 2.0 - 5.0 / 2.0, 0, 5, 5)];
      [path fill];
    }
}

- (void)mouseEntered:(NSEvent *)theEvent
{
  [labelView setHidden:NO];
}
- (void)mouseExited:(NSEvent *)theEvent
{
  [labelView setHidden:YES];
}

- (void)mouseDown:(NSEvent *)theEvent
{
  NSDebugLog(@"mouseDown");
  pressed = YES;
  [self setNeedsDisplay:YES];
  // FIXME how do we close the popup menu?
  //[menu closeTransient];
}

- (void)mouseUp:(NSEvent *)theEvent
{
  NSDebugLog(@"mouseUp");
  pressed = NO;
  [self setNeedsDisplay:YES];
}

- (void)rightMouseDown:(NSEvent *)theEvent
{
  pressed = YES;
  [self setNeedsDisplay:YES];
}

- (void)rightMouseUp:(NSEvent *)theEvent
{
  pressed = NO;
  [labelView setHidden:YES];

  if (menu && state == DockIconRunning)
    {
      NSDebugLog(@"popup menu");
      [NSMenu popUpContextMenu:menu withEvent:theEvent forView:nil];
    }
}

- (void)setRunning
{
  state = DockIconRunning;
  [self setNeedsDisplay:YES];
}

- (void)setClosed
{
  state = DockIconClosed;
  [self setNeedsDisplay:YES];
}

- (void)dealloc
{
  RELEASE(menu);
  RELEASE(icon);
  RELEASE(labelView);
  [super dealloc];
}
@end
