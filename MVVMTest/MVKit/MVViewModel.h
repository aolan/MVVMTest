//
//  MVViewModel.h
//  MVVMTest
//
//  Created by lawn on 16/1/4.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVViewModel : NSObject

@property (nonatomic, copy  ) NSString *title;

@property (nonatomic, strong, readonly) RACSubject *willDisappearSignal;
@property (nonatomic, strong, readonly) id parameter;

- (instancetype)initWithTitle:(NSString *)title parameter:(id)parameter;

/**
 *  An additional method, in which you can initialize data, RACCommand etc.
 *
 *  This method will be excute after the execution of '-initWithTitle:parameter:' method.
 */
- (void)initialize;

@end
