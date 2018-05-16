//
//  ICMediator+ChatModule.h
//  ICMediator_Example
//
//  Created by zhangrongwu on 2018/5/16.
//  Copyright © 2018年 zhangrongwu. All rights reserved.
//  聊天模块

#import <ICMediator/ICMediator.h>

@interface ICMediator (ChatModule)


- (UIViewController *)ICMediator_ChatViewController:(NSDictionary *)params handler:(ICMediatorObjectHandler)handler;

@end
