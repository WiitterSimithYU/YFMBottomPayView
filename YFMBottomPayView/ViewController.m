//
//  ViewController.m
//  YFMBottomPayView
//
//  Created by YFM on 2018/8/7.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "ViewController.h"

#import "YFMPaymentView.h"

#import <STPopup/STPopup.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)handlePayAction:(UIButton *)sender {
    NSArray *payTypeArr = @[@{@"pic":@"pic_alipay",
                              @"title":@"支付宝",
                              @"type":@"alipay"},
                            @{@"pic":@"pic_wxpay",
                              @"title":@"微信",
                              @"type":@"wxpay"},
                            @{@"pic":@"pic_blance",
                              @"title":@"余额",
                              @"type":@"balance"}];
    
    YFMPaymentView *pop = [[YFMPaymentView alloc]initTotalPay:@"39.99" vc:self dataSource:payTypeArr];
    STPopupController *popVericodeController = [[STPopupController alloc] initWithRootViewController:pop];
    popVericodeController.style = STPopupStyleBottomSheet;
    [popVericodeController presentInViewController:self];
    
    pop.payType = ^(NSString *type,NSString *balance) {
        NSLog(@"选择了支付方式:%@\n需要支付金额:%@",type,balance);
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
