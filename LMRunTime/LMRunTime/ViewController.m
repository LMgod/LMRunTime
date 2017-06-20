//
//  ViewController.m
//  LMRunTime
//
//  Created by iOSDev on 17/6/19.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "ViewController.h"
#import "LMFirstViewController.h"
#import "LMAccount.h"
#import "UIButton+LMEnlargeTouchArea.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *smallBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.smallBtn setEnlargeEdge:30];
    
    
}
#pragma mark  - 存储信息
- (IBAction)saveAccountAction:(id)sender {
    LMAccount *account=[[LMAccount alloc]init];
    account.age=@"18";
    account.name=@"LBJ敏";
    account.email=@"1234567@qq.com";
    account.address=@"上海";
    account.userId=@"888888";
    [account saveAccount];
    
    
}
#pragma mark  - 获取信息
- (IBAction)getAccountAction:(id)sender {
    
    LMAccount *account=[LMAccount getAccount];
    NSLog(@"%@",account.description);
    
    
}
#pragma mark  - 按钮点击
- (IBAction)smallClickAction:(id)sender {
    UIButton *btn=(UIButton *)sender;
    [btn setTitle:@"我被点击了" forState:UIControlStateNormal];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [btn setTitle:@"小按钮" forState:UIControlStateNormal];
    });
 
}
#pragma mark  - 到下一页
- (IBAction)nextPageAction:(id)sender {
    LMFirstViewController *firstController=[[LMFirstViewController alloc]init];
    [self presentViewController:firstController animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
