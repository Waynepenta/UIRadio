//
//  ReadViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "ReadViewController.h"
#import "NetWorkRequestManager.h"
#import "ReadModel.h"
#import "CollectionViewCell.h"
#import "DetailCollectionController.h"


#define wScreen [UIScreen mainScreen].bounds.size.width
#define hScreen [UIScreen mainScreen].bounds.size.height


@interface ReadViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) NSMutableArray *imageArr;
@property (nonatomic,strong) NSMutableArray *dataArr;


@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) UICollectionViewFlowLayout *flowlayout;


@end

@implementation ReadViewController

- (NSMutableArray *)imageArr
{
    if (!_imageArr) {
        _imageArr = [[NSMutableArray alloc] init];
    }


    return _imageArr;
    

}

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }


    return _dataArr;


}



- (void)analyData
{
    [NetWorkRequestManager requestWithType:POST urlString:ReadUrl parDic:nil finish:^(NSData *data) {
        
     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSArray *array1 = dict[@"data"][@"list"];
        for (NSDictionary *dic in array1) {
            ReadModel *model = [[ReadModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.dataArr addObject:model];
        }
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.ReadCollectionView reloadData];
        });
     
        
    } finishError:^(NSError *error) {
       
        
        NSLog(@"网络错误");
    }];
  
}

- (void)ImgData
{
    
    NSURL *url = [NSURL URLWithString:ReadUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (data == nil) {
        NSLog(@"网路错误！");
    }
    
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *array = dict[@"data"][@"carousel"];
    for (NSDictionary *dic in array) {
        
        ReadModel *model = [[ReadModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.imageArr addObject:model];
    }
 

}






- (void)CreatView
{
    
    self.ReadScrollView.delegate = self;
    self.ReadScrollView.pagingEnabled = YES;
    self.ReadScrollView.bounces = NO;
    self.ReadScrollView.showsVerticalScrollIndicator = NO;
    self.ReadScrollView.showsHorizontalScrollIndicator = NO;
    self.ReadScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*2, 0);
    
    for (int i = 0; i < self.imageArr.count; i++) {
        ReadModel *model = self.imageArr[i];
        
//        UIView *viem1 = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        UIImageView *view  = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        
        
        NSURL *url = [NSURL URLWithString:model.img];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        view.image = [UIImage imageWithData:data];
        
//        [viem1 addSubview:view];
        
        [self.ReadScrollView addSubview:view];
    }
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 170, 120, 20)];
    self.pageControl.numberOfPages = 2;
    
    [self.view addSubview:_pageControl];
    
    [self.pageControl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self CreatTimer];
    
    


}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    self.pageControl.currentPage = _ReadScrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;


}


- (void)pageClick:(UIPageControl *)pageControl
{
    [_ReadScrollView setContentOffset:CGPointMake(_pageControl.currentPage*[UIScreen mainScreen].bounds.size.width, 0) animated:YES];
    

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    [self CreatTimer];



}


- (void)CreatTimer
{
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAct:) userInfo:nil repeats:YES];

    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}


- (void)timeAct:(NSTimer *)timer
{
    int page = (self.pageControl.currentPage + 1)%(int)self.imageArr.count;
    
    self.pageControl.currentPage = page;

    [self pageChange:self.pageControl];
}


- (void)pageChange:(UIPageControl *)pagecontrol
{
    
    CGFloat x = (pagecontrol.currentPage)*self.ReadScrollView.bounds.size.width;

    [self.ReadScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];

    _timer = nil;

}

- (void)CreatCollection
{
    
    self.flowlayout = [[UICollectionViewFlowLayout alloc] init];
    
    _flowlayout.itemSize = CGSizeMake((wScreen-20)/3, 150);
    
    _flowlayout.minimumInteritemSpacing = 5;
    _flowlayout.minimumLineSpacing = 5;
    
    _flowlayout.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0);
    
    self.ReadCollectionView.collectionViewLayout = _flowlayout;
    self.ReadCollectionView.backgroundColor = [UIColor whiteColor];
    self.ReadCollectionView.delegate = self;
    self.ReadCollectionView.dataSource = self;
    
    [self.ReadCollectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self ImgData];
    [self analyData];
    [self CreatCollection];
    
//    [self CreatTimer];
    [self CreatView];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    
    return self.dataArr.count;



}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    ReadModel *model = self.dataArr[indexPath.row];
    [cell setValueWithReadModel:model];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailCollectionController *view = [[DetailCollectionController alloc] init];
    
    ReadModel *model = self.dataArr[indexPath.row];
    
    view.typeID = model.type;
    
    

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
