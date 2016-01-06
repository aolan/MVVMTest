//
//  TTUserCenter.h
//  MVVMTest
//
//  Created by lawn on 16/1/6.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTUserCenter : NSObject

@property (nonatomic, copy  ) NSString *username;
@property (nonatomic, copy  ) NSString *mobile;
@property (nonatomic, copy  ) NSString *token;
@property (nonatomic, assign, readonly) BOOL isLogined;

+ (instancetype)center;

@end
