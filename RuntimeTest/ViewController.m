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
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UILabel *label = [[UILabel alloc] init];
    label.text = @"sdflkajflajdalkdjfalksjfajfal";
    label.frame = CGRectMake(100, 100, 100, 100);
    label.textColor = [UIColor redColor];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    NSLog(@"%@",label.custom_titleName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
