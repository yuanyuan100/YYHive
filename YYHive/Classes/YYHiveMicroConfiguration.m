//
//  YYHiveMicroConfiguration.m
//  Pods-TestXXXX
//
//  Created by YuanYuan Peng on 2019/12/10.
//

#import "YYHiveMicroConfiguration.h"

@implementation YYHiveMicroConfiguration

- (id<YYMicroApplicationDelegate>)microApplication {
       if (self.ApplicationClass.length == 0) {
         return nil;
     }
     
     if (![self.MicroAppMode isEqualToString:YYHiveMicroAppRunViewMode]) {
         return nil;
     }
     
     if (_microApplication == nil) {
         _microApplication = [[NSClassFromString(self.ApplicationClass) alloc] init];
     }
     return _microApplication;
}

- (id<YYMicroServiceDelegate>)microSerivce {
    if (self.ApplicationClass.length == 0) {
         return nil;
    }
    
    if (![self.MicroAppMode isEqualToString:YYHiveMicroAppRunServiceMode]) {
        return nil;
    }
    
    if (_microSerivce == nil) {
       _microSerivce = [[NSClassFromString(self.ApplicationClass) alloc] init];
    }
    return _microSerivce;
}

@end
