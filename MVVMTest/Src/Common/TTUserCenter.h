//
//  TTUserCenter.h
//  MVVMTest
//
//  Created by lawn on 16/1/6.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TTIsLogined ([TTUserCenter center].isLogined)

@interface TTUserCenter : NSObject

@property (nonatomic, copy  ) NSString *username;
@property (nonatomic, copy  ) NSString *mobile;
@property (nonatomic, copy  ) NSString *token;

+ (instancetype)center;

- (BOOL)isLogined;

@end
