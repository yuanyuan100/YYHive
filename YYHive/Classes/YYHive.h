//
//  YYHive.h
//  Expecta
//
//  Created by YuanYuan Peng on 2019/12/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YYMicroLifeCycleDelegate;
@protocol YYMicroServiceDelegate;
@protocol YYMicroLifeCycleDelegate;
@protocol YYMicroApplicationDelegate;
@class YYMicroAppDelegate;

NS_ASSUME_NONNULL_BEGIN

extern NSString *YYHiveMicroAppRunViewMode;
extern NSString *YYHiveMicroAppRunServiceMode;

@interface YYHive : NSObject

@end

@protocol YYMicroApplicationDelegate <UIApplicationDelegate, YYMicroLifeCycleDelegate>

@end

@protocol YYMicroServiceDelegate <YYMicroLifeCycleDelegate>

@optional

/**
 在该方法中进行初始化（mainThread）

 @param completed 初始化完毕后的回调
 */
- (void)couldInitAndCompleted:(void(^)(BOOL success))completed;

@end

@protocol YYMicroLifeCycleDelegate <NSObject>

@optional

- (void)microServiceDidFinishLaunching;

- (void)microServiceWillResignActive;

- (void)microServiceDidEnterBackground;

- (void)microServiceWillEnterForeground;

- (void)microServiceDidBecomeActive;

- (void)microServiceWillTerminate;

@end

NS_ASSUME_NONNULL_END
