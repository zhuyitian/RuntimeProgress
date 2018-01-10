//
//  NSMutableDictionary+ZYTCategory.m
//  RuntimeTest
//
//  Created by 朱一天 on 2017/12/26.
//  Copyright © 2017年 朱一天. All rights reserved.
//

#import "NSMutableDictionary+ZYTCategory.h"
#import "NSObject+ZYTSwizz.h"
#import "ZYTObjectSwizzling.h"

@implementation NSMutableDictionary (ZYTCategory)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            //当勾住方法对象为类族时，必须写明该对象身份，__NSDictionaryM 后面跟的M表示可变字典，跟I表示不可变字典，跟0表示刚实例化还未赋值
            //当勾住方法对象不是类族的时候，直接[self class] 就可以了
            [ZYTObjectSwizzling swizzWithClass:objc_getClass("__NSDictionaryM")
                               withSysSelector:@selector(setObject:forKey:)
                                withMySelector:@selector(safe_setObject:forKey:)];
//            [objc_getClass("__NSDictionaryM") swizzWithSysSelector:@selector(setObject:forKey:) withMySelector:@selector(safe_setObject:forKey:)];
            
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
