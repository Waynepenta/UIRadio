//
//  LoginViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/16.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
- (IBAction)regist:(id)sender {
    
    if (self.nameText.text != nil && self.passwordText.text != nil && self.agaginText.text != nil && self.passwordText.text == self.agaginText.text) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *done = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        
        [alert addAction:done];
        [self presentViewController:alert animated:YES completion:nil];
        
        
        
    }else{
    
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册失败，请检查用户名和密码" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *done = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        
        
        [alert addAction:done];
        [self presentViewController:alert animated:YES completion:nil];
  
    
    }
    
    
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.registBtn.layer setMasksToBounds:YES];
    [self.registBtn.layer setCornerRadius:10.f];
    [self.registBtn.layer setBorderWidth:1.f];
    
    self.registBtn.layer.borderColor = [UIColor cyanColor].CGColor;
    
    
    
    
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
