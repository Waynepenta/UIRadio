//
//  RegistViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/16.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController
- (IBAction)registAction:(id)sender {
    
    LoginViewController *view = [[LoginViewController alloc] init];
    
    [self.navigationController pushViewController:view animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginAction.layer.masksToBounds = YES;
    [self.loginAction.layer setBorderWidth:1.f];
    [self.loginAction.layer setCornerRadius:10.f];
    self.registAction.layer.masksToBounds = YES;
    [self.registAction.layer setBorderWidth:1.f];
    [self.registAction.layer setCornerRadius:10.f];
    self.nameText.layer.masksToBounds = YES;
    [self.nameText.layer setBorderWidth:1.f];
    [self.nameText.layer setCornerRadius:10.f];
    self.passwordText.layer.masksToBounds = YES;
    [self.passwordText.layer setBorderWidth:1.f];
    [self.passwordText.layer setCornerRadius:10.f];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
