//
//  TTTabBarViewModel.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "TTTabBarViewModel.h"

@implementation TTTabBarViewModel

- (NSArray *)titles{
    return @[@"首页", @"个人中心"];
}

- (NSArray *)viewModels{
    return @[@"TTHomeViewModel", @"TTMineViewModel"];
}

- (NSArray *)tabBarNormalImages{
    return @[@"TT_Tab_Bar_Home_Nor", @"TT_Tab_Bar_Mine_Nor"];
}

- (NSArray *)tabBarSelectedImages{
    return @[@"TT_Tab_Bar_Home_Sel", @"TT_Tab_Bar_Mine_Sel"];
}

- (UIImage *)tabBarNormalBackgroundImage{
    return [UIImage imageNamed:@"TT_Tab_Bar_Background_Nor"];
}

- (UIImage *)tabBarSelectedBackgroundImage{
    return [UIImage imageNamed:@"TT_Tab_Bar_Background_Sel"];
}

@end
