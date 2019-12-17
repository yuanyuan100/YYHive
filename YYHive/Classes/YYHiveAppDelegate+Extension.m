//
//  YYHiveAppDelegate+Extension.m
//  Pods-TestXXXX
//
//  Created by YuanYuan Peng on 2019/12/10.
//

#import "YYHiveAppDelegate+Extension.h"

@implementation YYHiveAppDelegate (Extension)
- (NSArray<YYHiveMicroConfiguration *> *)readMicroAppFromMainBundle {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"YYHiveInit-info" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *allMicroConfiguration = @[].mutableCopy;
    for (NSDictionary *dict in array) {
        
        YYHiveMicroConfiguration *c = [[YYHiveMicroConfiguration alloc] init];
        c.ApplicationClass = dict[@"ApplicationClass"];
        c.LibraryName = dict[@"LibraryName"];
        c.LibraryVersion = dict[@"LibraryVersion"];
        c.MicroAppMode = dict[@"MicroAppMode"];
        c.InitializationDependencyLibrary = dict[@"InitializationDependencyLibrary"];
        c.IsMainMicroApplication = [dict[@"IsMainMicroApplication"] boolValue];
        c.MustBeInitialized = [dict[@"MustBeInitialized"] boolValue];
        [allMicroConfiguration addObject:c];
    }
    return allMicroConfiguration.copy;
}
@end
