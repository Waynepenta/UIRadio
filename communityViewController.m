//
//  communityViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "communityViewController.h"
#import "NormalTableViewCell.h"
#import "NormalModel.h"
#import "NetWorkRequestManager.h"
#import "communityDetailController.h"
#import "PicTableViewCell.h"

@interface communityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *normalArr;

@end

@implementation communityViewController

- (NSMutableArray *)normalArr
{
    if (!_normalArr) {
        _normalArr = [[NSMutableArray alloc] init];
    }

    return _normalArr;


}







- (void)tabelView
{
    self.communityTableV.delegate =self;
    self.communityTableV.dataSource = self;

    [self.communityTableV registerNib:[UINib nibWithNibName:@"NormalTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.communityTableV registerNib:[UINib nibWithNibName:@"PicTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];


}

- (void)analyData
{
    [NetWorkRequestManager  requestWithType:POST urlString:talkUrl parDic:nil finish:^(NSData *data) {
        
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"%@",dict);
        NSArray *array = dict[@"data"][@"list"];
        
        for (NSDictionary *dic in array) {
            NormalModel *model = [[NormalModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            
            [self.normalArr addObject:model];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self.communityTableV reloadData];
            
        });
        
        
        
    } finishError:^(NSError *error) {
        
        
        NSLog(@"网络错误");
        
    }];




}






- (void)viewDidLoad {
    [super viewDidLoad];
    [self analyData];
    
    [self tabelView];
    
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return self.normalArr.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NormalModel *model = self.normalArr[indexPath.row];
  
    if ([model.coverimg isEqualToString:@""]) {
        
        
        NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        [cell setValueWithModel:model];
        
        return cell;
     
       
        
    }else{
        
        
        
        
        
        
        PicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        if (!cell) {
            cell = [[PicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        
        [cell setValueWithPicModel:model];
        
        return cell;
        
       
    }
    
    
   
    
    


}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{


    return 200;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    communityDetailController *view = [[communityDetailController alloc] init];
    
    NormalModel *model = self.normalArr[indexPath.row];
    
    view.contentID = model.contentid;



    [self.navigationController pushViewController:view animated:YES];
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
