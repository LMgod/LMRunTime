//
//  UIButton+LMRetouch.h
//  LMRunTime
//
//  Created by iOSDev on 17/6/20.
//  Copyright © 2017年 linhongmin. All rights reserved.
//  runtime实现按钮不可重复点击问题(默认2秒内)

#import <UIKit/UIKit.h>

@interface UIButton (LMRetouch)
/**  再次点击的间隔,默认3秒钟  */
@property(nonatomic, assign)NSTimeInterval  timeInterval;
/** YES:不可重复点击 (因为之前的按钮太多,怕造成冲突,默认可以重复点击)  */
@property(nonatomic, assign)BOOL isIgnore;
@end
