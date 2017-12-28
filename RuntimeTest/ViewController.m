//
//  ViewController.m
//  RuntimeTest
//
//  Created by 朱一天 on 2017/12/26.
//  Copyright © 2017年 朱一天. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //这样不会崩
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:nil forKey:nil];
    NSLog(@"%@",dic);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //Runtime实用途径举个例子：
    UILabel *label = [[UILabel alloc] init];
    label.text = @"一样的";
    label.frame = CGRectMake(100, 100, 100, 100);
    label.textColor = [UIColor redColor];
    label.numberOfLines = 0;
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
