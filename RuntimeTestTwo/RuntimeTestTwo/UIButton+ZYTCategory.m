//
//  UIButton+ZYTCategory.m
//  RuntimeTestTwo
//
//  Created by 朱一天 on 2017/12/28.
//  Copyright © 2017年 朱一天. All rights reserved.
//

#import "UIButton+ZYTCategory.h"
#import "NSObject+ZYTSwizz.h"

@implementation UIButton (ZYTCategory)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("UIButton") swizzMethodWithSysSelector:@selector(sendAction:to:forEvent:) swizzMySelector:@selector(custom_sendAction:to:forEvent:)];
        }
    });
}

- (void)custom_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    // 设置统一的间隔时间
    if (self.custom_acceptEventInterval <= 0) {
        // 如果没有设置自定义时间间隔，则默认为0秒
        self.custom_acceptEventInterval = 0;
    }
    
    // 是否小于设定的时间间隔
    BOOL needSendAction = (NSDate.date.timeIntervalSince1970 - self.custom_acceptEventTime >= self.custom_acceptEventInterval);
    
    // 两次点击的时间间隔不小于设定的时间间隔时，才执行响应事件
    if (needSendAction) {
        [self custom_sendAction:action to:target forEvent:event];
        self.custom_acceptEventTime = NSDate.date.timeIntervalSince1970;
    }
    
}

#pragma mark - 用户自定义设置button点击时间间隔的属性set和get方法
- (void)setCustom_acceptEventInterval:(NSTimeInterval)custom_acceptEventInterval{
    //关联引用
    /**
     *  1.给哪个对象属性进行关联
     *  2.用来保存传入的值的指针(用于get方法获取值)
     *  3.传入的值(注意是对象类型)
     *  4.关联引用的策略(这个根据属性添加的修饰而定)
     */
    objc_setAssociatedObject(self, "custom_acceptEventInterval", @(custom_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval )custom_acceptEventInterval{
    return [objc_getAssociatedObject(self, "custom_acceptEventInterval") doubleValue];
}


#pragma mark - 存用户上一次点击button时间的属性
- (void)setCustom_acceptEventTime:(NSTimeInterval)custom_acceptEventTime{
    objc_setAssociatedObject(self, "UIControl_acceptEventTime", @(custom_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval )custom_acceptEventTime{
    return [objc_getAssociatedObject(self, "UIControl_acceptEventTime") doubleValue];
}




@end
