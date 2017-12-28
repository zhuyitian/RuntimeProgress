//
//  UILabel+category.m
//  RuntimeTest
//
//  Created by 朱一天 on 2017/12/26.
//  Copyright © 2017年 朱一天. All rights reserved.
//

#import "UILabel+category.h"
#import "NSObject+ZYTSwizz.h"

@implementation UILabel (category)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("UILabel") swizzMethodWithSysSelector:@selector(setText:) swizzMySelector:@selector(exchangeText:)];
            [objc_getClass("UILabel") swizzMethodWithSysSelector:@selector(setTextColor:) swizzMySelector:@selector(exchangeTextColor:)];
        }
    });
}

- (void)exchangeText:(NSString *)text {
    
    if ([text isEqualToString:@"一样的"]) {
        text = @"不一样";
    }
    [self exchangeText:text];
}

- (void)exchangeTextColor:(UIColor *)color {
    
    if (color == [UIColor redColor]) {
        color = [UIColor blueColor];
    }
    [self exchangeTextColor:color];
}



@end
