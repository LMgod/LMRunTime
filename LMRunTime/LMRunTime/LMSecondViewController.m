//
//  LMSecondViewController.m
//  LMRunTime
//
//  Created by iOSDev on 17/6/20.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMSecondViewController.h"

@interface LMSecondViewController ()

@end

@implementation LMSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark  - 返回
- (IBAction)back:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
