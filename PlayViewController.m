//
//  PlayViewController.m
//  UIRadio
//
//  Created by lanou on 16/7/8.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "PlayViewController.h"
#import "PlayModel.h"
#import "PlayManage.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "PlayViewCell.h"

@interface PlayViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong)UILabel *labelName;

@property (nonatomic,strong) UIImageView *imaglike;
@property (nonatomic,strong) UILabel *labelLike;
@property (nonatomic,strong) UIImageView *imageMessage;
@property (nonatomic,strong) UILabel *labelMessage;


@property (nonatomic,strong) UISlider *processSlider;

@property (nonatomic,strong) UILabel *currentTime;
@property (nonatomic,strong) UILabel *allTime;

@property (nonatomic,strong) NSTimer *timer;


@property (nonatomic,strong)UITableView *tableV;


@property (nonatomic,strong) UIWebView *webV;


@property (nonatomic,assign) NSInteger index;

@property (nonatomic,assign) NSInteger index1;





@end

@implementation PlayViewController

- (IBAction)playAbove:(id)sender {
    
    [[PlayManage shareInstance] playerAbove];
    
    [self reloadDataWithIndex:[PlayManage shareInstance].index];
    
    
}



- (IBAction)PlayAndPause:(id)sender {
    
    UIButton *btn = sender;
    
    if ([PlayManage shareInstance].isPlay == YES){
        [btn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
      
    }else{
    
        [btn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    
    }
    [[PlayManage shareInstance] playerAndPause];
    
    
}



- (IBAction)playNext:(id)sender {
    
    [[PlayManage shareInstance] playerNext];
    [self reloadDataWithIndex:[PlayManage shareInstance].index];
    
    
    
}

















- (void)CreatScrollerView
{
//    self.PlayScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 100)];
    _PlayScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*3, 0);
    _PlayScrollView.pagingEnabled = YES;
    _PlayScrollView.bounces = NO;
    _PlayScrollView.showsVerticalScrollIndicator = YES;
    _PlayScrollView.showsHorizontalScrollIndicator = NO;
    _PlayScrollView.backgroundColor = [UIColor whiteColor];
   

   self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 90, 100, 200, 200)];
    _imageV.backgroundColor = [UIColor redColor];
    
    self.labelName = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 110, 320, 200, 40)];
    _labelName.text = @"name";
    
    
    self.imaglike = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 50, 420, 30, 30)];
//    _imaglike.backgroundColor = [UIColor redColor];
    
    self.labelLike = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 80, 420, 100, 30)];
    _labelLike.text = @"11111";
  
    
    self.imageMessage = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 250, 420, 35, 35)];
//    _imageMessage.backgroundColor = [UIColor redColor];
    
    self.labelMessage = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 285, 420, 80, 30)];
    _labelMessage.text = @"88888";
    
    self.processSlider = [[UISlider alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 80, 490, 200, 20)];
    
    
    self.currentTime = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 30, 490, 60, 20)];
//    self.currentTime.text = @"00:18";
    
    self.allTime = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width + 300, 490, 60, 20)];
//    self.allTime.text = @"03:46";
    
    
    
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 523)];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    [self.tableV registerNib:[UINib nibWithNibName:@"PlayViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
//    self.tableV.backgroundColor = [UIColor cyanColor];
    
    self.webV = [[UIWebView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-100)];
    self.webV.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    [self.PlayScrollView addSubview:_webV];
    [self.PlayScrollView addSubview:_tableV];
    [self.PlayScrollView addSubview:_currentTime];
    [self.PlayScrollView addSubview:_allTime];
    [self.PlayScrollView addSubview:_processSlider];
    [self.PlayScrollView addSubview:_imageMessage];
    [self.PlayScrollView addSubview:_labelMessage];
    [self.PlayScrollView addSubview:_labelName];
    [self.PlayScrollView addSubview:_labelLike];
    [self.PlayScrollView addSubview:_imaglike];
    [self.PlayScrollView addSubview:_imageV];
    
    
    
    
    [self.PlayVIew setBackgroundColor:[UIColor grayColor]];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    [self.view addSubview:_PlayScrollView];
}

- (void)reloadDataWithIndex:(NSInteger)index
{
    PlayModel *model = [PlayManage shareInstance].musicArray[index];
    
    self.navigationItem.title = model.title;
    


    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.coverimg] placeholderImage:[UIImage imageNamed:@"22.jpg"]];
    
    self.labelName.text = model.title;
    self.imaglike.image = [UIImage imageNamed:@"heart"];
    self.imageMessage.image = [UIImage imageNamed:@"message"];
    
    self.labelLike.text = model.musicVisit;
  
    self.labelMessage.text = [NSString stringWithFormat:@"%@",model.playInfo[@"authorinfo"][@"uid"]];
    
    NSLog(@"%@",model.playInfo[@"webview_url"]);
    
    NSURL *url = [NSURL URLWithString:model.playInfo[@"webview_url"]];
    
    [self.webV loadRequest:[NSURLRequest requestWithURL:url]];
    
    
   
    
    
    
    
    
    
    //音乐不可以给会崩溃 但是放在别的工程里就可以实现
    
//    [[PlayManage shareInstance] replaceItemWithUrlString:model.musicUrl];
    
    

}








- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
   
    
    [self CreatScrollerView];
    
    NSInteger index = [PlayManage shareInstance].index;
    [self reloadDataWithIndex:index];
    
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [self.timer fire];
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    //    [PlayManage shareInstance].player.volume = self.processSlider.value;
    
    
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}
- (void)timerAction
{
//    if ([PlayManage shareInstance].player.currentTime.timescale == 0 || [PlayManage shareInstance].player.currentItem.duration.timescale == 0) {
//        return;
//    }
    
//    long long int currentime = [PlayManage shareInstance].player.currentTime.value/[PlayManage shareInstance].player.currentTime.timescale;
//    
//    self.currentTime.text = [NSString stringWithFormat:@"%02lld:%02lld",currentime / 60,currentime % 60];
//    
//    long long int allTime = [PlayManage shareInstance].player.currentItem.duration.value/[PlayManage shareInstance].player.currentItem.duration.timescale;
//    
//    self.allTime.text = [NSString stringWithFormat:@"%02lld:%02lld",allTime/60,allTime%60];
//    
//    self.processSlider.maximumValue = allTime;
//    self.processSlider.minimumValue = currentime;
//    
//    if (self.processSlider.value == allTime + 1) {
//        [[PlayManage shareInstance] playerNext];
//        [self reloadDataWithIndex:[PlayManage shareInstance].index];
//    }

   
    [UIView beginAnimations:@"11" context:nil];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, 0.05);
    
   




}

- (void)viewWillAppear:(BOOL)animated
{
    self.imageV.layer.cornerRadius = 100;
    self.imageV.layer.masksToBounds = YES;
   
    self.PlayScrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [PlayManage shareInstance].musicArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[PlayViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    PlayModel *model = [PlayManage shareInstance].musicArray[indexPath.row];
    
    
    [cell setValueWithModel:model];
    cell.PlayImg.alpha = 0;
    cell.isClick = YES;
   cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{


    return 80;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     PlayViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
 
    if (self.index == 0) {
        self.index = indexPath.row;
        cell.PlayImg.alpha = 1;
      

        NSIndexPath *path1 = [NSIndexPath indexPathForRow:self.index1 inSection:0];
        PlayViewCell *cell1 = [tableView cellForRowAtIndexPath:path1];
        
        cell1.PlayImg.alpha = 0;
       
        self.index1 = 0;
      
    
       
    }else if(self.index != indexPath.row){
        
      
        
        PlayViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
        self.index1 = indexPath.row;
        
        cell.PlayImg.alpha = 1;
       
        
        NSIndexPath *path = [NSIndexPath indexPathForRow:self.index inSection:0];
        PlayViewCell *cell1 = [tableView cellForRowAtIndexPath:path];
      
        cell1.PlayImg.alpha = 0;
     
     
        self.index = 0;
    
        
    
    }else if(self.index == indexPath.row) {
        
        cell.PlayImg.alpha = 0;
   
        self.index = 0;
       
       
    }
   
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
