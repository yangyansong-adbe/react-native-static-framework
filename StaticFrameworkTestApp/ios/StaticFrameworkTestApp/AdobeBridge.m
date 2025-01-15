//
//  AdobeBridge.m
//  StaticFrameworkTestApp
//
//  Created by Yansong Yang on 1/15/25.
//

#import "AdobeBridge.h"

@import AEPCore;
@import AEPLifecycle;
@import AEPIdentity;
@import AEPSignal;
@import AEPServices;

@implementation AdobeBridge

+ (void)initializeAdobeSDK
{
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
  
}

@end
