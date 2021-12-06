#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@protocol DockApp
- (void)ping;
@end


@protocol DockService
- (void)setMenu:(byref NSMenu *)menu forApp:(bycopy NSString *)processId;
- (void)setView:(byref NSView *)view
	 forApp:(bycopy NSString *)processId
       withName:(NSString *)name;
- (void)setAppClosed:(NSString *)name;
- (void)setAppRunning:(NSString *)name;
- (void)pong:(bycopy NSString *)processId;
@end
