//
//  SideBarViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "SideBarViewController.h"
#import "SideBarTableViewCell.h"
#import "RootViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "RadioDetailController.h"
#import "NondefectiveViewController.h"
#import "LoginViewController.h"
@interface SideBarViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *Sidearray;
@property (nonatomic,strong) NSArray *sideImgArr;



@end

@implementation SideBarViewController

- (NSArray *)Sidearray
{
    if (!_Sidearray) {
        _Sidearray = [[NSArray alloc] init];
    }


    return _Sidearray;

}

- (NSArray *)sideImgArr
{
    if (!_sideImgArr) {
        _sideImgArr = [[NSArray alloc] init];
    }

    return _sideImgArr;
}




- (void)tablev
{
    self.TableV.delegate = self;
    self.TableV.dataSource = self;
    [self.TableV registerNib:[UINib nibWithNibName:@"SideBarTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
   
}









- (void)viewDidLoad {
    [super viewDidLoad];
    self.Sidearray = @[@"电台",@"阅读",@"社区",@"良品",@"设置"];
    
    
    
    
    [self tablev];
    self.navigationController.navigationBar.translucent = NO;
    
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return self.Sidearray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[SideBarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.SideLabel.text = self.Sidearray[indexPath.row];
    cell.SideImg.image = [UIImage imageNamed:self.Sidearray[indexPath.row]];
    
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 50;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//      [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    SideBarTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    协议
    [_delegate aaaaa:cell.SideLabel.text];
    
//    
//   [self.mm_drawerController closeDrawerAnimated:NO completion:^(BOOL finished) {
//       
//       RadioDetailController *view  = [[RadioDetailController alloc] init];
//       
//       
//       UINavigationController *cen = (UINavigationController *)self.mm_drawerController.centerViewController;
//       
//       [cen pushViewController:view animated:NO];
//   }];
    
    
//    if (indexPath.row == 0) {
//        
//      [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
//     
//    }else if (indexPath.row == 1){
//        
//        NSLog(@"1");
//    }else if (indexPath.row == 2){
//      
//        
//    }else if (indexPath.row == 3){
//        
//        SideBarTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        //    协议
//        [_delegate aaaaa:cell.SideLabel.text];
//        
//        
//        
//        [self.mm_drawerController closeDrawerAnimated:NO completion:^(BOOL finished) {
//            
//            NondefectiveViewController *view  = [[NondefectiveViewController alloc] init];
//            
//            
//            UINavigationController *cen = (UINavigationController *)self.mm_drawerController.centerViewController;
//            
//            [cen pushViewController:view animated:NO];
//        }];
//       
//    }




}

- (IBAction)loginAction:(id)sender {
    
   
    
    [_delegate bbbbb:@"111"];
    
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
