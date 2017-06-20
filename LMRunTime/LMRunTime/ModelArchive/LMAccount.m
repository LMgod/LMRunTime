//
//  LMAccount.m
//  LMRunTime
//
//  Created by iOSDev on 17/6/20.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMAccount.h"

@implementation LMAccount
//存储
-(void)saveAccount{
    NSString *filePath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/LMAccount.data"];
    [NSKeyedArchiver archiveRootObject:self toFile:filePath];
    
}
//取出
+(id)getAccount{

    NSString *filePath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/LMAccount.data"];
    id account =[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return account;

}
@end
