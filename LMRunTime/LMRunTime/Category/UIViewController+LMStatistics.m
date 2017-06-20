//
//  UIViewController+LMStatistics.m
//  LMRunTime
//
//  Created by iOSDev on 17/6/20.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "UIViewController+LMStatistics.h"
#import <objc/runtime.h>
@implementation UIViewController (LMStatistics)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod1=class_getInstanceMethod([self class], @selector(viewWillAppear:));
        Method swizzledMethod1=class_getInstanceMethod([self class], @selector(lm_viewWillAppear:));
        
        Method originalMethod2=class_getInstanceMethod([self class], @selector(viewDidDisappear:));
        Method swizzledMethod2=class_getInstanceMethod([self class], @selector(lm_viewDidDisappear:));
        
        //交换实现
        method_exchangeImplementations(originalMethod1, swizzledMethod1);
        method_exchangeImplementations(originalMethod2, swizzledMethod2);

    });
}
-(void)lm_viewWillAppear:(BOOL)animated{
    ;
    NSLog(@"进入%@界面",NSStringFromClass([self class]));
    [self lm_viewWillAppear:animated];



}
-(void)lm_viewDidDisappear:(BOOL)animated{
    NSLog(@"离开%@界面",NSStringFromClass([self class]));
    [self lm_viewDidDisappear:animated];



}
@end
