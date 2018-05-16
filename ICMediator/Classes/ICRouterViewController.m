//
//  ICRouterViewController.m
//  ICMediator
//
//  Created by zhangrongwu on 2018/5/16.
//

#import "ICRouterViewController.h"

@interface ICRouterViewController ()

@end

@implementation ICRouterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithRouterParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        _parameterDictionary=params;
    }
    return self;
}

@end
