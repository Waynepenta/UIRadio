//
//  RootViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/6.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "RootViewController.h"
#import "NetWorkRequestManager.h"
#import "ImageModel.h"
#import "RadioModelCell.h"
#import "RadioModel.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "RadioDetailController.h"
#import "MJRefresh.h"
#import "PlayManage.h"

#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "NondefectiveViewController.h"
#import "communityViewController.h"
#import "ReadViewController.h"
#import "LoginViewController.h"
#import "RegistViewController.h"

@interface RootViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) NSMutableArray *imageArr;



@property (nonatomic,strong) NSMutableArray *RadioModelArray;


@property (nonatomic,strong) UITableView *tableV;


@property (nonatomic,assign) NSInteger start;
@property (nonatomic,assign) NSInteger limit;





@end

@implementation RootViewController
- (NSMutableArray *)imageArr
{
    if (!_imageArr) {
        _imageArr = [[NSMutableArray alloc] init];
    }


    return _imageArr;
}

- (NSMutableArray *)RadioModelArray
{
    if (!_RadioModelArray) {
        _RadioModelArray = [[NSMutableArray alloc] init];
    }



    return _RadioModelArray;


}


//遵循协议方法
- (void)aaaaa:(NSString *)str
{
    
//    if ([str isEqualToString:@"电台"]) {
//        RadioDetailController *aaa = [[RadioDetailController alloc] init];
//        [self.navigationController pushViewController:aaa animated:YES];
//    }
    
    if ([str isEqualToString:@"良品"]) {
        
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
        NondefectiveViewController *view = [[NondefectiveViewController alloc] init];
        
        [self.navigationController pushViewController:view animated:NO];
        
    }else if ([str isEqualToString:@"电台"]){
        
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
        
    }else if ([str isEqualToString:@"社区"]){
    
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
        communityViewController *view = [[communityViewController  alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    }else if ([str isEqualToString:@"阅读"]){
    
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        ReadViewController *view = [[ReadViewController alloc] init];
        
        [self.navigationController pushViewController:view animated:YES];
    }
    
    
    
    
}

- (void)bbbbb:(NSString *)str
{
    if ([str isEqualToString:@"111"]) {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
        RegistViewController *view = [[RegistViewController  alloc] init];
        [self.navigationController pushViewController:view animated:YES];
        
        
    }

   
}





- (void)ScrollView
{
   
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*self.imageArr.count, 0);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = YES;
    [self.view addSubview:_scrollView];
    
    for (int i = 1; i <= self.imageArr.count; i++) {
        ImageModel *model = self.imageArr[i - 1];
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*(i-1), 0,[UIScreen mainScreen].bounds.size.width, 200)];
//        NSString *str = [NSString stringWithFormat:@"%d",i];
        NSURL *url = [NSURL URLWithString:model.img];
        NSData *data = [NSData dataWithContentsOfURL:url];
      
        view.image = [UIImage imageWithData:data];
        
        [self.scrollView addSubview:view];
        
        
    }
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(180, 170, 100, 30)];

    _pageControl.numberOfPages = 4;
    [self.view addSubview:_pageControl];
    [_pageControl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self setTimer];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    _pageControl.currentPage = _scrollView.contentOffset.x/375;


}

- (void)pageClick:(UIPageControl *)pageControl
{

    [_scrollView setContentOffset:CGPointMake(_pageControl.currentPage*375, 0) animated:YES];
 

}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

    [self setTimer];
}






- (void)timeAction:(NSTimer *)timer
{
    int page = (self.pageControl.currentPage + 1)%(int)self.imageArr.count;
   
    self.pageControl.currentPage = page;
    [self pagechange:self.pageControl];
    
   


}

- (void)pagechange:(UIPageControl *)pagecontrol
{

    CGFloat x = (pagecontrol.currentPage)* self.scrollView.bounds.size.width;
    
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];


}





- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

    [_timer invalidate];
    _timer = nil;


}

- (void)setTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}



//- (void)jsonData
//{
//    [NetWorkRequestManager requestWithType:POST urlString:kUrl parDic:nil finish:^(NSData *data) {
//        
//        NSDictionary *dict  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        
//        NSDictionary *dic3 = dict[@"data"];
//        NSArray *array = dic3[@"alllist"];
//        
//        
//        for (NSDictionary *dic1 in array) {
//            RadioModel *model = [[RadioModel alloc] init];
//            
//            [model setValuesForKeysWithDictionary:dic1];
//            
//            [self.RadioModelArray addObject:model];
//            
//            
//        }
//       
//        dispatch_async(dispatch_get_main_queue(), ^{
//           
//            [self.tableV reloadData];
//            
//            [self.tableV.mj_footer endRefreshing];
//        });
//        
//        
//    } finishError:^(NSError *error) {
//        NSLog(@"%@",error);
//        
//    }];
//  
//
//}

- (void)jsonData
{
    [NetWorkRequestManager requestWithType:POST urlString:DUrl parDic:@{@"start":@(_start),@"limit":@(_limit)} finish:^(NSData *data) {
        
        NSDictionary *dict  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
       
        
        
        
        
        NSDictionary *dic3 = dict[@"data"];
        NSArray *array = dic3[@"list"];
        
        
        for (NSDictionary *dic1 in array) {
            RadioModel *model = [[RadioModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic1];
            
            [self.RadioModelArray addObject:model];
            
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableV reloadData];
            
            [self.tableV.mj_footer endRefreshing];
        });
        
        
    } finishError:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
    
}












- (void)ImageJson
{
    NSURL *url = [NSURL URLWithString:kUrl];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if (data == nil) {
        NSLog(@"网络错误");
    }

 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *array = dict[@"data"][@"carousel"];
    
    
    for (NSDictionary *dic in array) {
        ImageModel *model = [[ImageModel alloc] init];
        
        [model setValuesForKeysWithDictionary:dic];
        
        [self.imageArr addObject:model];
        
    }
    
    
    



}


- (void)CreatTabelView
{
    self.tableV = [[UITableView alloc] init];
    self.tableV.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-264);
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
//    self.tableV.separatorColor = [ UIColor redColor];
//    self.tableV.separatorStyle = YES;
    [self.tableV registerNib:[UINib nibWithNibName:@"RadioModelCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_tableV];

}


- (void)downAndRefresh
{

    self.tableV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.start = _start += 9;
        [self jsonData];
        
    }];




}


- (void)CreatBarButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    MMDrawerBarButtonItem *btn2 = [[MMDrawerBarButtonItem alloc] initWithCustomView:btn];
  
    self.navigationItem.leftBarButtonItem = btn2;
}

- (void)btnClick:(UIButton *)btn
{
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
  
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self jsonData];
    [self ImageJson];
    self.navigationItem.title = @"电台";
    NSLog(@"%ld",self.imageArr.count);
    
    
    [self CreatTabelView];
    [self downAndRefresh];
    self.navigationController.navigationBar.translucent = NO;
    [self ScrollView];
    [self CreatBarButton];
    // Do any additional setup after loading the view from its nib.
}










- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return self.RadioModelArray.count;
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RadioModelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[RadioModelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    RadioModel *model = self.RadioModelArray[indexPath.row];
    
    
    [cell setValueWithModel:model];
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return  140;


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;


}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(200, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    [view setBackgroundColor:[UIColor whiteColor]];
    

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 160, 20)];
    label.text = @"全部电台.ALL Radio";
    label.textColor = [UIColor grayColor];
    
//    RadioModel *model = self.RadioModelArray[section];
    
    
    
    
    
//    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 30, 30)];
    
//    imageV.image = [UIImage imageNamed:@"77.gif"];
    
//    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 100, 30)];
//    label1.text = @"1111111111";
    
    
    
    
//    [view addSubview:label1];
//    [view addSubview:imageV];
    [view addSubview:label];
    



    return view;

}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 40;


}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RadioDetailController *view = [[RadioDetailController alloc] init];
    RadioModel *model = self.RadioModelArray[indexPath.row];
    
    view.radioID = model.radioid;
  
 
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
