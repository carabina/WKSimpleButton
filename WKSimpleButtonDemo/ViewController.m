//
//  ViewController.m
//  WKSimpleButtonDemo
//
//  Created by admin on 2017/8/17.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "ViewController.h"
#import "WKSimpleButton.h"
#import "Masonry.h"
#import "WKSimpleButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self creatSimpleButton];
}

- (void)creatSimpleButton
{
    WKSimpleButton *simpleBtn = [WKSimpleButton new];
    simpleBtn.contentMode = UIViewContentModeScaleAspectFit;
    simpleBtn.spacing = 10;
    
    [simpleBtn setTitle:@"sdad" forState:UIControlStateNormal];
    [simpleBtn setImage:[UIImage imageNamed:@"acct_normal"] forState:UIControlStateNormal];
    [simpleBtn setButtonType:WKSimpleButtonTypeTextBehindImage forState:UIControlStateNormal];

    [simpleBtn setTitle:@"神经" forState:UIControlStateHighlighted];
    [simpleBtn setImage:[UIImage imageNamed:@"acct_selected"] forState:UIControlStateSelected];
    [simpleBtn setButtonType:WKSimpleButtonTypeTextAboveImage forState:UIControlStateSelected];

    [self.view addSubview:simpleBtn];
    [simpleBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [simpleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(0, 0));
    }];
}

- (void)click:(UIControl*)control
{
    control.selected = !control.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
