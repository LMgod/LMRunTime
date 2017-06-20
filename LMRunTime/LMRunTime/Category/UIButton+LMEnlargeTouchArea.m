//
//  UIButton+LMEnlargeTouchArea.m
//  LMRunTime
//
//  Created by iOSDev on 17/6/20.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "UIButton+LMEnlargeTouchArea.h"
#import <objc/runtime.h>
@implementation UIButton (LMEnlargeTouchArea)
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

//设置边距
#pragma mark  - setter
-(void)setEnlargeEdge:(CGFloat)size{
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark  - setter
-(void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left{
    //  需要添加关联的对象
    //  添加的唯一标识符
    //  关联的对象
    //  关联的策略,是个枚举
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}
//getter
//获取新的rect
-(CGRect)enlargedRect{
    // 添加过关联的对象
    // 添加的唯一标识符
    NSNumber *topEdge =objc_getAssociatedObject(self, &topNameKey);
    NSNumber *bottomEdge =objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftEdge =objc_getAssociatedObject(self, &leftNameKey);
    NSNumber *rightEdge =objc_getAssociatedObject(self, &rightNameKey);
    
    if (topEdge && bottomEdge &&leftEdge && rightEdge) {
        
        
        return CGRectMake(self.bounds.origin.x-leftEdge.floatValue,
                          self.bounds.origin.y-topEdge.floatValue,
                          self.bounds.size.width+leftEdge.floatValue+rightEdge.floatValue,
                          self.bounds.size.height+topEdge.floatValue+bottomEdge.floatValue);
        
    }else{
        
        return self.bounds;
    }
    
}
#pragma mark  -  override
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect=[self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point)? self:nil;
    
}
@end
