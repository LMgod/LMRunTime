//
//  LMArchiveModel.m
//  LMRunTime
//
//  Created by iOSDev on 17/6/19.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMArchiveModel.h"
#import <objc/runtime.h>
@implementation LMArchiveModel
//解档
-(id)initWithCoder:(NSCoder *)decoder{
    self=[super init];
    if (self) {
        unsigned int count = 0;
        //获取类中所有成员变量名
        Ivar *ivar = class_copyIvarList([self class], &count);
        for (int i=0 ; i<count; i++) {
            Ivar iva=ivar[i];
            const char * name = ivar_getName(iva);
            NSString *strName = [NSString stringWithUTF8String:name];
            
            //进行解档取值
            id value = [decoder decodeObjectForKey:strName];
            
            //利用KVC对属性赋值
            [self setValue:value forKey:strName];
        }
        free(ivar);
    }
    return self;
}
//归档
-(void)encodeWithCoder:(NSCoder *)encoder{
    
    unsigned int count;
    Ivar *ivar=class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar iva=ivar[i];
        const char *name = ivar_getName(iva);
        NSString *strName=[NSString stringWithUTF8String:name];
        //利用KVC取值
        id value =[self valueForKey:strName];
        [encoder encodeObject:value forKey:strName];
    }
    free(ivar);
}
#pragma mark  - 方便打印结果
-(NSString *)description{
    NSMutableString *descriptionString=[NSMutableString stringWithFormat:@"\n"];
    unsigned int count;
    Ivar *ivar=class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar iva=ivar[i];
        const char *name = ivar_getName(iva);
        NSString *strName=[NSString stringWithUTF8String:name];
        id value=[self valueForKey:strName];
        
        [descriptionString appendFormat:@"%@:%@\n",strName,value];
    }
    return descriptionString.copy;
}

@end
