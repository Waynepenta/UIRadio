//
//  NondefectiveViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "NondefectiveViewController.h"
#import "ProductViewCell.h"
#import "NetWorkRequestManager.h"
#import "ProductModel.h"
#import "MJRefresh.h"
#import "payWebViewController.h"
#import "ProductDetailViewController.h"
@interface NondefectiveViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *productArr;
@property (nonatomic,assign) NSInteger start;
@property (nonatomic,assign) NSInteger limit;


@property (nonatomic,strong) NSString *Detail;

@end

@implementation NondefectiveViewController

- (NSMutableArray *)productArr
{
    if (!_productArr) {
        _productArr = [[NSMutableArray alloc] init];
    }
    return _productArr;
}

- (void)anayleData
{
    [NetWorkRequestManager requestWithType:POST urlString:ProUrl parDic:@{@"start":@(_start),@"limit":@(_limit)} finish:^(NSData *data) {
        
   NSDictionary  *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if (_start == 0) {
            [self.productArr removeAllObjects];
        }
        
        
        
        
        NSArray *array = dict[@"data"][@"list"];
        
        for (NSDictionary *dic in array) {
            ProductModel *model = [[ProductModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.productArr addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self.ProductTableV reloadData];
            [self.ProductTableV.mj_header endRefreshing];
            [self.ProductTableV.mj_footer endRefreshing];
            
        });
     
        
    } finishError:^(NSError *error) {
        
    }];



}

- (void)headerAndFooter
{
    self.ProductTableV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        _start = 0;
        [self anayleData];
    }];

    self.ProductTableV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.start = _start += 10;
        [self anayleData];
    }];


}









- (void)Creat
{
    self.ProductTableV.delegate = self;
    self.ProductTableV.dataSource = self;
    
    [self.ProductTableV registerNib:[UINib nibWithNibName:@"ProductViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}









- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"良品";
    [self anayleData];
    [self Creat];
    [self headerAndFooter];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return self.productArr.count;


}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[ProductViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    ProductModel *model = self.productArr[indexPath.row];

    [cell setVauleProductModel:model];
    
    
//    self.payUrl = model.buyurl;
    
    [cell.payButton addTarget:self action:@selector(btnCLick:) forControlEvents:UIControlEventTouchUpInside];
    cell.payButton.tag = indexPath.row;
    
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 200;

}

- (void)btnCLick:(UIButton *)button
{
    ProductModel *model = self.productArr[button.tag];
    
    payWebViewController *view = [[payWebViewController alloc] init];
    view.buyUrl = model.buyurl;
    
    [self.navigationController pushViewController:view animated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductModel *model = self.productArr[indexPath.row];

//    self.Detail = model.contentid;
    
    ProductDetailViewController *view = [[ProductDetailViewController alloc] init];

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
