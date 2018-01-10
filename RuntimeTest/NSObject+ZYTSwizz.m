//
//  NSObject+ZYTSwizz.m
//  RuntimeTest
//
//  Created by 朱一天 on 2018/1/2.
//  Copyright © 2018年 朱一天. All rights reserved.
//

#import "NSObject+ZYTSwizz.h"

@implementation NSObject (ZYTSwizz)

- (void)swizzWithSysSelector:(SEL)sysSelector
              withMySelector:(SEL)mySelector {
    Class class = [self class];
    Method sysMethod = class_getInstanceMethod(class, sysSelector);
    Method myMethod = class_getInstanceMethod(class, mySelector);
    BOOL didAddMethod = class_addMethod(class, sysSelector, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    if (didAddMethod) {
        class_replaceMethod(class, mySelector, method_getImplementation(sysMethod), method_getTypeEncoding(sysMethod));
    }else {
        method_exchangeImplementations(sysMethod, myMethod);
    }
}

@end
