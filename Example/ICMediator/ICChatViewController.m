//
//  ICChatViewController.m
//  ICMediator_Example
//
//  Created by zhangrongwu on 2018/5/16.
//  Copyright © 2018年 zhangrongwu. All rights reserved.
//

#import "ICChatViewController.h"
#import "ICMediator.h"

@interface ICChatViewController ()

@end

@implementation ICChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // TargetName: 每个模块的名称
    // action: 模块对应的页面名称
    [[ICMediator shareInstance] toHandlerTargetName:@"Chat" action:@"nativeFetchChatViewController" params:@{@"id":@"回调的参数"}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
