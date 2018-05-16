//
//  ICMediator.h
//  ICMediator
//
//  Created by zhangrongwu on 2018/5/16.
//  调度器 所有模块化后需要打开的VC都通过该类调取对应模块Category中的方法打开页面

#import <Foundation/Foundation.h>

@interface ICMediator : NSObject
typedef void (^ICMediatorObjectHandler)(id result);

+(instancetype)shareInstance;
// 远程App调用入口,外部app遵从协议打开具体某个页面，其中url.scheme需根据自己公司进行设置，内部未进行判断处理
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;
// 各个模块组件调用入口，无需回调
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;
// 充分模块化解耦，存储block用页面跳转调用，b页面需进行回调操作
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params completion:(ICMediatorObjectHandler)completion;
// 所有b页面回调方法
- (void)toHandlerTargetName:(NSString *)targetName action:(NSString *)actionName params:(id)params;
@end
