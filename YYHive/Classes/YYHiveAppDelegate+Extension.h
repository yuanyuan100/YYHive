//
//  YYHiveAppDelegate+Extension.h
//  Pods-TestXXXX
//
//  Created by YuanYuan Peng on 2019/12/10.
//

#import "YYHiveAppDelegate.h"
#import "YYHiveMicroConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYHiveAppDelegate (Extension)
- (NSArray<YYHiveMicroConfiguration *> *)readMicroAppFromMainBundle;
@end

NS_ASSUME_NONNULL_END
