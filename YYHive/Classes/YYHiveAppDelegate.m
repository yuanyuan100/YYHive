//
//  YYHiveAppDelegate.m
//  Expecta
//
//  Created by YuanYuan Peng on 2019/12/7.
//

#import "YYHiveAppDelegate.h"
#import "YYHiveAppDelegate+Extension.h"
#import "YYHiveMicroConfiguration.h"
#import "YYHive.h"

@interface YYHiveAppDelegate ()
@property (nonatomic, copy) NSArray<YYHiveMicroConfiguration *> *allMicroConfiguration;
@property (nonatomic, strong) NSMutableArray<YYHiveMicroConfiguration* > *allMicroViewObjects;
@property (nonatomic, strong) NSMutableArray<YYHiveMicroConfiguration *> *allMicroServiceObjects;
@property (nonatomic, strong) YYHiveMicroConfiguration* mainViewObject;
@end

@implementation YYHiveAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.allMicroConfiguration = [self readMicroAppFromMainBundle];
    
    self.allMicroViewObjects = @[].mutableCopy;
    self.allMicroServiceObjects = @[].mutableCopy;
    
    for (YYHiveMicroConfiguration *c in self.allMicroConfiguration) {
        if ([c.MicroAppMode isEqualToString:YYHiveMicroAppRunViewMode] && c.microApplication) {
            [self.allMicroViewObjects addObject:c];
            
            if (c.IsMainMicroApplication) {
                self.mainViewObject = c;
            }
        }
        
        if ([c.MicroAppMode isEqualToString:YYHiveMicroAppRunServiceMode] && c.microSerivce) {
            [self.allMicroServiceObjects addObject:c];
        }
    }
    
    if ([self.mainViewObject.microApplication respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
        return [self.mainViewObject.microApplication application:application didFinishLaunchingWithOptions:launchOptions];
    }
    
    for (YYHiveMicroConfiguration *c in self.allMicroViewObjects) {
        id<YYMicroApplicationDelegate> d = c.microApplication;
        if ([d respondsToSelector:@selector(microServiceDidFinishLaunching)]) {
            [d microServiceDidFinishLaunching];
        }
    }
    
    for (YYHiveMicroConfiguration *c in self.allMicroServiceObjects) {
        id<YYMicroServiceDelegate> d = c.microSerivce;
        if ([d respondsToSelector:@selector(microServiceDidFinishLaunching)]) {
            [d  microServiceDidFinishLaunching];
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    if ([self.mainViewObject.microApplication respondsToSelector:@selector(applicationWillResignActive:)]) {
        [self.mainViewObject.microApplication applicationWillResignActive:application];
    }
    
    for (YYHiveMicroConfiguration *c in self.allMicroViewObjects) {
        id<YYMicroApplicationDelegate> d = c.microApplication;
        if ([d respondsToSelector:@selector(microServiceWillResignActive)]) {
            [d microServiceWillResignActive];
        }
    }
      
    for (YYHiveMicroConfiguration *c in self.allMicroServiceObjects) {
        id<YYMicroServiceDelegate> d = c.microSerivce;
        if ([d respondsToSelector:@selector(microServiceWillResignActive)]) {
               [d microServiceWillResignActive];
           }
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
       
    if ([self.mainViewObject.microApplication respondsToSelector:@selector(applicationDidEnterBackground:)]) {
         [self.mainViewObject.microApplication applicationDidEnterBackground:application];
     }
        
    for (YYHiveMicroConfiguration *c in self.allMicroViewObjects) {
        id<YYMicroApplicationDelegate> d = c.microApplication;
        if ([d respondsToSelector:@selector(microServiceDidEnterBackground)]) {
            [d microServiceDidEnterBackground];
        }
      }
      
    for (YYHiveMicroConfiguration *c in self.allMicroServiceObjects) {
        id<YYMicroServiceDelegate> d = c.microSerivce;
        if ([d respondsToSelector:@selector(microServiceDidEnterBackground)]) {
            [d microServiceDidEnterBackground];
        }
    }
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    if ([self.mainViewObject.microApplication respondsToSelector:@selector(applicationWillEnterForeground:)]) {
         [self.mainViewObject.microApplication applicationWillEnterForeground:application];
     }
        
    for (YYHiveMicroConfiguration *c in self.allMicroViewObjects) {
        id<YYMicroApplicationDelegate> d = c.microApplication;
        if ([d respondsToSelector:@selector(microServiceWillEnterForeground)]) {
            [d microServiceWillEnterForeground];
        }
      }
      
    for (YYHiveMicroConfiguration *c in self.allMicroServiceObjects) {
        id<YYMicroServiceDelegate> d = c.microSerivce;
        if ([d respondsToSelector:@selector(microServiceWillEnterForeground)]) {
            [d microServiceWillEnterForeground];
        }
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    if ([self.mainViewObject.microApplication respondsToSelector:@selector(applicationDidBecomeActive:)]) {
         [self.mainViewObject.microApplication applicationDidBecomeActive:application];
     }
        
    for (YYHiveMicroConfiguration *c in self.allMicroViewObjects) {
        id<YYMicroApplicationDelegate> d = c.microApplication;
        if ([d respondsToSelector:@selector(microServiceDidBecomeActive)]) {
            [d microServiceDidBecomeActive];
        }
      }
      
    for (YYHiveMicroConfiguration *c in self.allMicroServiceObjects) {
        id<YYMicroServiceDelegate> d = c.microSerivce;
        if ([d respondsToSelector:@selector(microServiceDidBecomeActive)]) {
            [d microServiceDidBecomeActive];
        }
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    if ([self.mainViewObject.microApplication respondsToSelector:@selector(applicationWillTerminate:)]) {
         [self.mainViewObject.microApplication applicationWillTerminate:application];
     }
        
    for (YYHiveMicroConfiguration *c in self.allMicroViewObjects) {
        id<YYMicroApplicationDelegate> d = c.microApplication;
        if ([d respondsToSelector:@selector(microServiceWillTerminate)]) {
            [d microServiceDidBecomeActive];
        }
      }
      
    for (YYHiveMicroConfiguration *c in self.allMicroServiceObjects) {
        id<YYMicroServiceDelegate> d = c.microSerivce;
        if ([d respondsToSelector:@selector(microServiceWillTerminate)]) {
            [d microServiceWillTerminate];
        }
    }
}

@end
