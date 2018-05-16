//
//  ICRouterViewController.h
//  ICMediator
//
//  Created by zhangrongwu on 2018/5/16.
//

#import <UIKit/UIKit.h>

@interface ICRouterViewController : UIViewController
// 用于参数传递
@property(nonatomic,strong)NSDictionary *parameterDictionary;
// 构造初始化方法
- (id)initWithRouterParams:(NSDictionary *)params;

@end

