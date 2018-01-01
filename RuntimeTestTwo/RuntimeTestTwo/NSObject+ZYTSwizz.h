//
//  NSObject+ZYTSwizz.h
//  RuntimeTest
//
//  Created by 朱一天 on 2017/12/26.
//  Copyright © 2017年 朱一天. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface NSObject (ZYTSwizz)
/** 交换两个方法的实现 */
- (void)swizzMethodWithSysSelector:(SEL)sysMethod swizzMySelector:(SEL)myMethod;


@end
