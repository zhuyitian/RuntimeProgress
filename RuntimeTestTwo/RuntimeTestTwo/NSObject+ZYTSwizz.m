//
//  NSObject+ZYTSwizz.m
//  RuntimeTest
//
//  Created by 朱一天 on 2017/12/26.
//  Copyright © 2017年 朱一天. All rights reserved.
//

#import "NSObject+ZYTSwizz.h"

@implementation NSObject (ZYTSwizz)


/**
 sysSelector：原方法
 mySelector：将要替换的方法
 */
- (void)swizzMethodWithSysSelector:(SEL)sysSelector swizzMySelector:(SEL)mySelector {
    //调用此方法的类
    Class class = [self class];
    
    Method systemMethod = class_getInstanceMethod(class, sysSelector);
    Method myMethod = class_getInstanceMethod(class, mySelector);
    //didAddMethod 为NO，表示添加成功
    BOOL didAddMethod = class_addMethod(class, sysSelector, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    if (didAddMethod) {
        class_replaceMethod(class, mySelector, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else {
        method_exchangeImplementations(systemMethod, myMethod);
    }
}

@end
