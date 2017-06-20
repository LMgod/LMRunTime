//
//  LMAccount.h
//  LMRunTime
//
//  Created by iOSDev on 17/6/20.
//  Copyright © 2017年 linhongmin. All rights reserved.
//  账号信息

#import "LMArchiveModel.h"

@interface LMAccount : LMArchiveModel
//账号信息
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *mobile;
@property(nonatomic, copy)NSString *address;
@property(nonatomic, copy)NSString *email;
@property(nonatomic, copy)NSString *age;
@property(nonatomic, copy)NSString *userIcon;
@property(nonatomic, copy)NSString *signature;
@property(nonatomic, copy)NSString *userId;
@property(nonatomic, copy)NSString *state;


/**
 存储
 */
-(void)saveAccount;

/**
 取出账号信息

 @return 返回账号
 */
+(id)getAccount;


@end
