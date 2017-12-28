//
//  NSMutableDictionary+ZYTCategory.m
//  RuntimeTest
//
//  Created by 朱一天 on 2017/12/26.
//  Copyright © 2017年 朱一天. All rights reserved.
//

#import "NSMutableDictionary+ZYTCategory.h"
#import "NSObject+ZYTSwizz.h"

@implementation NSMutableDictionary (ZYTCategory)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            //类名后面跟的M表示可变字典，跟I表示不可变字典，跟0表示刚实例化还没有赋值
            [objc_getClass("__NSDictionaryM") swizzMethodWithSysSelector:@selector(setObject:forKey:) swizzMySelector:@selector(safe_setObject:forKey:)];
            
        }
    });
}
/** 防止当object或key为空时crash */
- (void)safe_setObject:(id)obj forKey:(NSString *)key {
    if (obj == nil || key == nil) {
        return;
    }
    [self safe_setObject:obj forKey:key];
    
}



@end
