//
//  UIButton+LMRetouch.m
//  LMRunTime
//
//  Created by iOSDev on 17/6/20.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "UIButton+LMRetouch.h"
#import <objc/runtime.h>
#define defaultTimeInterval 3 //默认间隔时间

@interface UIButton ()

@property(nonatomic, assign)BOOL isIgnoreEvent;

@end
@implementation UIButton (LMRetouch)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        Method method1= class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
        Method method2= class_getInstanceMethod([self class], @selector(customSendAction:to:forEvent:));
      
         method_exchangeImplementations(method1, method2);
    });
}
-(NSTimeInterval)timeInterval{
    //_cmd表示当前方法的selector
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
    
    
}
-(void)setTimeInterval:(NSTimeInterval)timeInterval{
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)customSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (self.isIgnore) {//设为YES,执行系统的方法
        [self customSendAction:action to:target forEvent:event];
        return;
    }
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        self.timeInterval=self.timeInterval==0? defaultTimeInterval:self.timeInterval;
        
        if (self.isIgnoreEvent) {//是否忽视此次事件
            return;
        }else if(self.timeInterval>0){
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
        }
        self.isIgnoreEvent=YES;
        [self customSendAction:action to:target forEvent:event];
        
    }
}
//重置
-(void)resetState{
    self.isIgnoreEvent=NO;
}
#pragma mark  - 动态添加属性
-(void)setIsIgnoreEvent:(BOOL)isIgnoreEvent{
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)isIgnoreEvent{
    
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
-(void)setIsIgnore:(BOOL)isIgnore{
    
    objc_setAssociatedObject(self, @selector(isIgnore), @(isIgnore), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    
}
-(BOOL)isIgnore{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}


@end
