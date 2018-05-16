//
//  ICMediator+ChatModule.m
//  ICMediator_Example
//
//  Created by zhangrongwu on 2018/5/16.
//  Copyright © 2018年 zhangrongwu. All rights reserved.
//

#import "ICMediator+ChatModule.h"

NSString *const kICMediatorTargerChat = @"Chat";// 每一个模块

NSString *const kICNativeFetchChatViewController = @"nativeFetchChatViewController";

@implementation ICMediator (ChatModule)

- (UIViewController *)ICMediator_ChatViewController:(NSDictionary *)params handler:(ICMediatorObjectHandler)handler {
    UIViewController *viewController = [self performTarget:kICMediatorTargerChat
                                                    action:kICNativeFetchChatViewController
                                                    params:params
                                                completion:^(id result) {
                                                    if (handler) {
                                                        handler(result);
                                                    }
                                                    }];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}

@end
