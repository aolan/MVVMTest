//
//  MVTabBarViewModel.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVTabBarViewModel.h"

@implementation MVTabBarViewModel

#pragma mark - Override By SubClass

- (NSArray *)titles{
    return @[];
}

- (NSArray *)viewModels{
    return @[];
}

- (NSArray *)tabBarNormalImages{
    return @[];
}

- (NSArray *)tabBarSelectedImages{
    return @[];
}

- (UIImage *)tabBarNormalBackgroundImage{
    return nil;
}

- (UIImage *)tabBarSelectedBackgroundImage{
    return nil;
}


@end
