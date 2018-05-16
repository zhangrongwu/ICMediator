//
//  ICMediator.m
//  ICMediator
//
//  Created by zhangrongwu on 2018/5/16.
//  调度器 所有模块化后需要打开的VC都通过该类调取对应模块Category中的方法打开页面

#import "ICMediator.h"
@interface ICMediator()
@property (nonatomic, strong)NSMutableDictionary *handlerDictionary;
@end

@implementation ICMediator

+(instancetype)shareInstance {
    static ICMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[ICMediator alloc] init];
    });
    return mediator;
}

- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion {
    
    NSDictionary *params = [ICMediator dictionaryWithURLQuery:[url query]];
    
    NSString *actionName =
    [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    id result = [self performTarget:url.host action:actionName params:params];
    if (completion) {
        if (result) {
            completion(@{ @"result" : result });
        } else {
            completion(nil);
        }
    }
    return result;
}

// 本地组件调用入口
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params {
    // 运行时方式 让对应的目标类执行对应的目标方法
    NSString *targetClassString =
    [NSString stringWithFormat:@"Target_%@", targetName];
    NSString *actionString =
    [NSString stringWithFormat:@"Action_%@:", actionName];
    
    Class targetClass = NSClassFromString(targetClassString);
    id target = [[targetClass alloc] init];
    SEL action = NSSelectorFromString(actionString);
    
    if (target == nil) {
        // 这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的
        return nil;
    }
    
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
    } else {
        // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
        SEL action = NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        } else {
            // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。实际开发过程中，可以用前面提到的固定的target顶上的。
            return nil;
        }
    }
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params completion:(ICMediatorObjectHandler)completion {
    if (completion) {
        NSString *key = [NSString stringWithFormat:@"%@_%@", targetName,actionName];
        [[ICMediator shareInstance].handlerDictionary setValue:completion forKey:key];
    }
    
    // 运行时方式 让对应的目标类执行对应的目标方法
    NSString *targetClassString =
    [NSString stringWithFormat:@"Target_%@", targetName];
    NSString *actionString =
    [NSString stringWithFormat:@"Action_%@:", actionName];
    
    Class targetClass = NSClassFromString(targetClassString);
    id target = [[targetClass alloc] init];
    SEL action = NSSelectorFromString(actionString);
    
    if (target == nil) {
        // 错误处理 用于跳转指定页面
        return nil;
    }
    
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
    } else {
        // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
        SEL action = NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        } else {
            // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。实际开发过程中，可以用前面提到的固定的target顶上的。
            return nil;
        }
    }
}

- (void)toHandlerTargetName:(NSString *)targetName action:(NSString *)actionName params:(id)params {
    NSString *key = [NSString stringWithFormat:@"%@_%@", targetName,actionName];
    void (^completion)(id result) = [ICMediator shareInstance].handlerDictionary[key];
    if (completion) {
        [[ICMediator shareInstance].handlerDictionary removeObjectForKey:key];
        completion(params);
    }
}

-(NSMutableDictionary *)handlerDictionary {
    if (!_handlerDictionary) {
        _handlerDictionary = [[NSMutableDictionary alloc] init];
    }
    return _handlerDictionary;
}

+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *parameters = [query componentsSeparatedByString:@"&"];
    for(NSString *parameter in parameters) {
        NSArray *contents = [parameter componentsSeparatedByString:@"="];
        if([contents count] == 2) {
            NSString *key = [contents objectAtIndex:0];
            NSString *value = [contents objectAtIndex:1];
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if (key && value) {
                [dict setObject:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}


@end
