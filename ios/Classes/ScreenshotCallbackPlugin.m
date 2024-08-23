#import "ScreenshotCallbackPlugin.h"
#import <screenshot_callback_pro/screenshot_callback_pro-Swift.h>

@implementation ScreenshotCallbackPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftScreenshotCallbackPlugin registerWithRegistrar:registrar];
}
@end
