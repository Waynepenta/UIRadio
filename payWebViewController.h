//
//  payWebViewController.h
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface payWebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *payWebView;
@property (nonatomic,strong) NSString *buyUrl;
@end
