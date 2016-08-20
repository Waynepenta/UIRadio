//
//  RadioDetailController.m
//  UIRadio
//
//  Created by lanou on 16/7/7.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "RadioDetailController.h"
#import "RadioDetailCell.h"
#import "NetWorkRequestManager.h"
#import "RadioDetailModel.h"
#import "MJRefresh.h"
#import "RadioDetailModel.h"
#import "PlayViewController.h"
#import "PlayManage.h"

@interface RadioDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableV;
@property (nonatomic,strong) NSMutableArray *DetailArray;
@property (nonatomic,strong) UIImageView *ImageV;

@property (nonatomic,strong) NSMutableArray *DetailArr;

@property (nonatomic,assign) NSInteger start;
@property (nonatomic,assign) NSInteger limit;

@property (nonatomic,strong) UIImageView *img;
@property (nonatomic,strong) UILabel *labelCount;
@property (nonatomic,assign) NSInteger visitNum;
@property (nonatomic,strong)UILabel *labelV;

@property (nonatomic,strong) NSString *labelVString;

@property (nonatomic,strong) NSMutableArray *DelArr;

@end

@implementation RadioDetailController
- (NSMutableArray *)DetailArray
{
    if (!_DetailArray) {
        _DetailArray = [[NSMutableArray alloc] init];
    }


    return _DetailArray;

}

- (NSMutableArray *)DetailArr
{
    if (!_DetailArr) {
        _DetailArr = [[NSMutableArray alloc] init];
    }


    return _DetailArr;


}
- (NSMutableArray *)DelArr
{
    if (!_DelArr) {
        _DelArr = [[NSMutableArray alloc] init];
    }
    
    
    return _DelArr;
    
    
}








- (void)CreatView
{
    self.ImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    
   
    

    [self.view addSubview:_ImageV];

}



- (void)jsonData
{
    [NetWorkRequestManager requestWithType:POST urlString:DetailUrl parDic:@{@"radioid":_radioID} finish:^(NSData *data) {
       
       
   NSDictionary  *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSURL *url1 = [NSURL URLWithString:dict[@"data"][@"radioInfo"][@"coverimg"]];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        self.ImageV.image = [UIImage imageWithData:data1];
        
        
        
     
        
        NSArray *array = dict[@"data"][@"list"];
        
        for (NSDictionary *dic in array) {
            RadioDetailModel *model = [[RadioDetailModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            
            [self.DetailArray addObject:model];
        
           
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
          
            [self.tableV reloadData];
            
           
            
            
        });
       
        
        
        
    } finishError:^(NSError *error) {
        
        NSLog(@"网络错误");
    }];

    

}

//- (void)detailJosnData
//{
//    
//    NSURL *url = [NSURL URLWithString:DetailUrl];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//    [request setHTTPMethod:@"POST"];
//    
//    NSString *str = [NSString stringWithFormat:@"auth=&client=1&deviceid=63A94D37-33F9-40FF-9EBB-481182338873&radioid=%@&version=3.0.4",_radioID];
//    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//       
//   NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//       
//        DELModel *model = [[DELModel alloc] init];
//        
//        [model setValuesForKeysWithDictionary:dic[@"data"][@"radioInfo"]];
//        self.labelVString = model.uname;
//        [self.DelArr addObject:model];
//       
//        
//    }];
//  
//
//    [task resume];
//
//
//}






- (void)CreatTableV
{
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-150)];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    
    [self.tableV registerNib:[UINib nibWithNibName:@"RadioDetailCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_tableV];


}


- (void)detailJsonData
{
    [NetWorkRequestManager requestWithType:POST urlString:upUrl parDic:@{@"start":@(9),@"limit":@(9),@"radioid":_radioID} finish:^(NSData *data) {
        
        
   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
//        if (_start == 0) {
//            [self.DetailArr removeAllObjects];
//        }
        
        
        
        NSArray *array = dict[@"data"][@"list"];
        for (NSDictionary *dic in array) {
            RadioDetailModel *model = [[RadioDetailModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            
            [self.DetailArr addObject:model];
        }
        
        
       dispatch_async(dispatch_get_main_queue(), ^{
        
           [self.tableV reloadData];
           [self.tableV.mj_footer endRefreshing];
//           [self.tableV.mj_header endRefreshing];
           
       });
        
        
        
        
        
    } finishError:^(NSError *error) {
       
        
        NSLog(@"网络错误");
        
        
    }];



}

- (void)Refresh
{
//    self.tableV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        _start = 0;
//        [self detailJsonData];
//    }];
    
    
    
    self.tableV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.start = _start += 9;
        
        [self detailJsonData];
    } ];


}


















- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self jsonData];
//    [self detailJosnData];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"电台详情";
    
    
    [self CreatView];
    [self CreatTableV];
    
    NSLog(@"%@11------------------------",self.labelVString);
    
//    [self Refresh];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{



    return self.DetailArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RadioDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    if (!cell) {
        cell = [[RadioDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    RadioDetailModel *model = self.DetailArray[indexPath.row];
    [cell setValueDataWithModel:model];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    cell.PlayButton.userInteractionEnabled = YES;
    [cell.PlayButton addGestureRecognizer:tap];
    
   
    
    return cell;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{


    return 120;


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 60;
    
}





- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    
    
    self.img = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 40, 40)];
    self.img.image = [UIImage imageNamed:@"2"];
    
    self.labelV= [[UILabel alloc] initWithFrame:CGRectMake(80, 15, 80, 30)];
    self.labelV.text = @"111111";
    
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(265, 20, 20, 20)];
    img.image = [UIImage imageNamed:@"77.gif"];
    
    self.labelCount = [[UILabel alloc] initWithFrame:CGRectMake(290, 15, 80, 30)];
    self.labelCount.text = @"3705547";
    
    [view addSubview:_labelCount];
    [view addSubview:img];
    [view addSubview:_labelV];
    [view addSubview:_img];
    return view;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{


    return 60;

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    [view setBackgroundColor:[UIColor whiteColor]];
   
    return view;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayViewController *view = [[PlayViewController alloc] init];

    
    [PlayManage shareInstance].musicArray = self.DetailArray;
    
    [PlayManage shareInstance].index = indexPath.row;

  
    
    
    
    [self.navigationController pushViewController:view animated:NO];

}


- (void)tapAction:(UIGestureRecognizer *)tap
{
    
    UIImageView *imageV = (UIImageView *)tap.view;
    
    RadioDetailCell *cell = (RadioDetailCell *)imageV.superview.superview;

    NSIndexPath *indexpath = [self.tableV indexPathForCell:cell];
    
    RadioDetailModel *model = self.DetailArray[indexpath.row];
    
    NSLog(@"%@%%%%%%%%%%",model.musicUrl);
//    [[PlayManage shareInstance] replaceItemWithUrlString:model.musicUrl];
   
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
