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

#import "ICMediator.h"
#import "ICMediator.m"
#import "ICRouterViewController.h"
#import "ICRouterViewController.m"

FOUNDATION_EXPORT double ICMediatorVersionNumber;
FOUNDATION_EXPORT const unsigned char ICMediatorVersionString[];

