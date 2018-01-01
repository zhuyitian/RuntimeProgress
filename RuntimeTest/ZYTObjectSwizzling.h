//
//  ZYTObjectSwizzling.h
//  RuntimeTest
//
//  Created by 朱一天 on 2018/1/1.
//  Copyright © 2018年 朱一天. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface ZYTObjectSwizzling : NSObject

/** 交换两个方法的实现 */
+ (void)swizzWithClass:(Class)cls
       withSysSelector:(SEL)sysSelector
        withMySelector:(SEL)mySelector;

@end
