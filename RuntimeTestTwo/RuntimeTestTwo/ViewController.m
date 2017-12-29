//
//  ViewController.m
//  RuntimeTestTwo
//
//  Created by 朱一天 on 2017/12/28.
//  Copyright © 2017年 朱一天. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ZYTCategory.h"

@interface ViewController ()

@property (nonatomic , strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self creatBtn];

}

- (void)creatBtn {
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置button的点击间隔为1秒
    self.btn.custom_acceptEventInterval = 1;
    self.btn.frame = CGRectMake(100, 100, 100, 100);
    [self.btn addTarget:self action:@selector(aaaAction) forControlEvents:UIControlEventTouchUpInside];
    self.btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.btn];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)aaaAction {
    CGFloat r,g,b;
    r = arc4random() % 256;
    g = arc4random() % 256;
    b = arc4random() % 256;
    self.view.backgroundColor = [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
