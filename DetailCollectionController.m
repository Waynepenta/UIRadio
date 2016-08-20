//
//  DetailCollectionController.m
//  UIRadio
//
//  Created by lanou on 16/7/16.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "DetailCollectionController.h"
#import "NetWorkRequestManager.h"

@interface DetailCollectionController ()

@end

@implementation DetailCollectionController

- (void)analyData
{
    
    [NetWorkRequestManager requestWithType:POST urlString:RDeatilUrl parDic:@{@"typeid":@(_typeID)} finish:^(NSData *data) {
        
   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"%@",dict[@"list"]);
        
        
        
        
        
        
    } finishError:^(NSError *error) {
       
        NSLog(@"网络错误");
        
        
        
    }];
    
    
    


}





- (void)viewDidLoad {
    [super viewDidLoad];
    [self analyData];
    
    
    
    
    
    
    
    
    
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
