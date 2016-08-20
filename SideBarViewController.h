//
//  SideBarViewController.h
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
// 协议
@protocol aaaa <NSObject>

- (void)aaaaa:(NSString *)str;

- (void)bbbbb:(NSString *)str;

@end





@interface SideBarViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *TableV;
@property (weak, nonatomic) IBOutlet UIButton *loginAction;

@property (nonatomic, weak) id <aaaa> delegate;



@end
