//
//  NSObject+ZYTSwizz.h
//  RuntimeTest
//
//  Created by 朱一天 on 2018/1/2.
//  Copyright © 2018年 朱一天. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (ZYTSwizz)

- (void)swizzWithSysSelector:(SEL)sysSelector
              withMySelector:(SEL)mySelector;

@end
