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
    return [[NSClassFromString(self.ApplicationClass) alloc] init];
}

- (id<YYMicroServiceDelegate>)microSerivce {
    if (self.ApplicationClass.length == 0) {
         return nil;
     }
    
    if (![self.MicroAppMode isEqualToString:YYHiveMicroAppRunServiceMode]) {
        return nil;
    }
    
    return [[NSClassFromString(self.ApplicationClass) alloc] init];
}

@end
