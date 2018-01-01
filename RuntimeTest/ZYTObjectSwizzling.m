//
//  ZYTObjectSwizzling.m
//  RuntimeTest
//
//  Created by 朱一天 on 2018/1/1.
//  Copyright © 2018年 朱一天. All rights reserved.
//

#import "ZYTObjectSwizzling.h"

@implementation ZYTObjectSwizzling

/**
 sysSelector：原方法
 mySelector：将要替换的方法
 */
+ (void)swizzWithClass:(Class)cls
       withSysSelector:(SEL)sysSelector
        withMySelector:(SEL)mySelector {
    Method sysMethod = class_getInstanceMethod(cls, sysSelector);
    Method myMethod = class_getInstanceMethod(cls, mySelector);
    //didAddMethod 为NO 表示添加成功;
    BOOL didAddMethod = class_addMethod(cls, sysSelector, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, mySelector, method_getImplementation(sysMethod), method_getTypeEncoding(sysMethod));
    }else {
        method_exchangeImplementations(sysMethod, myMethod);
    }
}

@end
