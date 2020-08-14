#import "MapsLauncherPlugin.h"
#if __has_include(<maps_launcher/maps_launcher-Swift.h>)
#import <maps_launcher/maps_launcher-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "maps_launcher-Swift.h"
#endif

@implementation MapsLauncherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMapsLauncherPlugin registerWithRegistrar:registrar];
}
@end
