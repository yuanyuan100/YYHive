#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YYHive.h"
#import "YYHiveAppDelegate+Extension.h"
#import "YYHiveAppDelegate.h"
#import "YYHiveMicroConfiguration.h"

FOUNDATION_EXPORT double YYHiveVersionNumber;
FOUNDATION_EXPORT const unsigned char YYHiveVersionString[];

