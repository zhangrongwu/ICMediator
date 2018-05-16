//
//  Target_Chat.m
//  ICMediator_Example
//
//  Created by zhangrongwu on 2018/5/16.
//  Copyright © 2018年 zhangrongwu. All rights reserved.
//

#import "Target_Chat.h"
#import "ICChatViewController.h"
@implementation Target_Chat
- (UIViewController *)Action_nativeFetchChatViewController:(NSDictionary *)params {
    ICChatViewController *viewController=[[ICChatViewController alloc] initWithRouterParams:params];
    return viewController;
}
@end
