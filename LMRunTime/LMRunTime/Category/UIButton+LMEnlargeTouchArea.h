//
//  UIButton+LMEnlargeTouchArea.h
//  LMRunTime
//
//  Created by iOSDev on 17/6/20.
//  Copyright © 2017年 linhongmin. All rights reserved.
//  runtime实现增大按钮的响应区域

#import <UIKit/UIKit.h>

@interface UIButton (LMEnlargeTouchArea)
/**
 设置响应边距
 
 @param size 增加的边距
 */
-(void)setEnlargeEdge:(CGFloat)size;

/**
 设置响应边距(增加)
 
 @param top 上边距
 @param right 右边距
 @param bottom 下边距
 @param left 左边距
 */
-(void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
@end
