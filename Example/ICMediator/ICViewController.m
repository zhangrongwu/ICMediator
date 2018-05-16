//
//  ICViewController.m
//  ICMediator
//
//  Created by zhangrongwu on 05/16/2018.
//  Copyright (c) 2018 zhangrongwu. All rights reserved.
//

#import "ICViewController.h"
#import "ICMediator.h"
#import "ICMediator+ChatModule.h"
@interface ICViewController ()

@end

@implementation ICViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
  
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *vc = [[ICMediator shareInstance] ICMediator_ChatViewController:@{@"id":@"111"} handler:^(id result) {
            NSLog(@"%@", result);
        }];
        [self presentViewController:vc animated:YES completion:nil];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
