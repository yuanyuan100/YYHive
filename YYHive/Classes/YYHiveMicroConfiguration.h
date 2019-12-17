//
//  YYHiveMicroConfiguration.h
//  Pods-TestXXXX
//
//  Created by YuanYuan Peng on 2019/12/10.
//

#import <Foundation/Foundation.h>
#import "YYHive.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYHiveMicroConfiguration : NSObject
@property (nonatomic, copy) NSString *ApplicationClass;
@property (nonatomic, copy) NSString *LibraryName;
@property (nonatomic, copy) NSString *LibraryVersion;
@property (nonatomic, copy) NSString *MicroAppMode;
@property (nonatomic) BOOL IsMainMicroApplication;
@property (nonatomic) BOOL MustBeInitialized;
@property (nonatomic, copy) NSArray<NSString *> *InitializationDependencyLibrary;

@property (nullable, nonatomic, strong) id<YYMicroApplicationDelegate> microApplication;
@property (nullable, nonatomic, strong) id<YYMicroServiceDelegate> microSerivce;

//  是否完成初始化
@property (nonatomic) BOOL InitCompleted;
@end

NS_ASSUME_NONNULL_END
