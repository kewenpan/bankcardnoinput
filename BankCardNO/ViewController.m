//
//  ViewController.m
//  BankCardNO
//
//  Created by blithe.pan on 2017/11/23.
//  Copyright © 2017年 blithe.pan. All rights reserved.
//

#import "ViewController.h"
#import "UIBankCardTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBankCardTextField* bTextField = [UIBankCardTextField new];
    bTextField.frame = CGRectMake(40, 90, 260, 30);
    bTextField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bTextField];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
