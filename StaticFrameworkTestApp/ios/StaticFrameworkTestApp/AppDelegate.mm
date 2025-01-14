#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>

@import AEPCore;
@import AEPLifecycle;
@import AEPIdentity;
@import AEPSignal;
@import AEPServices;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"StaticFrameworkTestApp";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  
  [AEPMobileCore setLogLevel: AEPLogLevelTrace];
  NSArray *extensionsToRegister = @[
                                  AEPMobileIdentity.class,
                                  AEPMobileLifecycle.class,
                                  AEPMobileSignal.class
                                ];
  [AEPMobileCore registerExtensions:extensionsToRegister completion:^{
    [AEPMobileCore lifecycleStart:@{@"contextDataKey": @"contextDataVal"}];
  }];
  
  [AEPMobileCore configureWithAppId:@"app_id_here"];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
