//
//  payWebViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "payWebViewController.h"

#import "NSString+Html.h"

@interface payWebViewController ()

@end

@implementation payWebViewController







- (void)viewDidLoad {
    [super viewDidLoad];
    self.payWebView.backgroundColor = [ UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
    self.payWebView.scalesPageToFit = NO;
    
//    NSString *newUrl = [NSString importStyleWithHtmlString:self.buyUrl];
//    
//    NSURL *baseurl = [NSURL fileURLWithPath:[NSBundle mainBundle].bundlePath];
//    [self.payWebView loadHTMLString:newUrl baseURL:baseurl];
    NSURL *url = [NSURL URLWithString:self.buyUrl];
    
    [self.payWebView loadRequest:[NSURLRequest requestWithURL:url]];
    
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
