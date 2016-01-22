//
//  ViewController.m
//  微健身
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "DataModels.h"
#import "CartoonViewController.h"
#import "jihuaViewController.h"
#import "jiluViewController.h"
#import "WEBViewController.h"
#import "SetViewController.h"
#import "zijihuaViewController.h"
#import "Header.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (nonatomic ,strong) UIView *uiView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (nonatomic ,strong) UIScrollView *myScroller;
@property (nonatomic ,strong) UIPageControl *pageControl;
@property (nonatomic ,strong) NSTimer *timer;
@property(nonatomic ,strong) NSArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //执行图片轮播定时器
    [self addTimer];
    self.view.backgroundColor = [UIColor whiteColor];
   _backgroundImage.image = [UIImage imageNamed:@"背景1"];
    [self.view sendSubviewToBack:_backgroundImage];
//    [self.view addSubview:_backgroundImage];
    
    _uiView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, Kwidth, 160)];
    _uiView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_uiView];
    
    [self addScrollView];
    [self updateViewConstraints];


    // Do any additional setup after loading the view, typically from a nib.
}


//懒加载，添加数据。
-(NSArray *)datas
{
    if (_datas ==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"123" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            DataModels *image = [DataModels datasWithDictionary:dict];
            [models addObject:image];
        }
        _datas = models;

    }
    return _datas;
}


//传递数据
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CartoonViewController *vc = segue.destinationViewController;
    vc.arr= [NSArray arrayWithArray:self.datas];

}
#pragma mark   ---------跳转至计划---------
// 计划。
//初始化storyboard（Main），找到要用的storyboard的ID，用新建的类调用找到的storyboard的ID
- (IBAction)jihua:(UIButton *)sender {
    jihuaViewController *jihuaView = [[jihuaViewController alloc] init];
    UINavigationController *jihua = [[UINavigationController alloc] initWithRootViewController:jihuaView];
    [self presentViewController:jihua animated:YES completion:^{
    }];
    
}

#pragma mark  ----------跳转至记录-----------
- (IBAction)jilu:(UIButton *)sender {
    jiluViewController *jiluView = [[jiluViewController alloc]init];
    UINavigationController *jilu = [[UINavigationController alloc]initWithRootViewController:jiluView];
    [self presentViewController:jilu animated:YES completion:^{
    }];
}


- (IBAction)zixun:(UIButton *)sender {
    WEBViewController *webView = [[WEBViewController alloc]init];
    
    UINavigationController *web = [[UINavigationController alloc]initWithRootViewController:webView];
    
    [self presentViewController:web animated:YES completion:^{
        
    }];

    
}



#pragma mark  --------右上角弹出弹窗--------
- (IBAction)set:(UIBarButtonItem *)sender {
    
    SetViewController *setView = [[SetViewController alloc] init];
    UINavigationController *set = [[UINavigationController alloc] initWithRootViewController:setView];
    [self presentViewController:set animated:YES completion:^{
    
    }];
    

}


#pragma mark    ---------添加SclollView----------

//添加用于滚动的scrollView
-(void)addScrollView{
    
    //循环的图片数量
     int count = 2;
    
    _myScroller= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 63, Kwidth, 160)];
    [_uiView addSubview:_myScroller];
    
    //设置contentsize
    _myScroller.contentSize = CGSizeMake(Kwidth * count, 160);
    //分页
    self.myScroller.pagingEnabled = YES;
    //设置代理
    _myScroller.delegate = self;
    
    // 设置pagecontrol-------------******
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(167, 200, 40, 25)];
    
    [_uiView addSubview:self.pageControl];
    self.pageControl.numberOfPages = count;
    
//    //设置背景
    _myScroller.backgroundColor = [UIColor blackColor];
    
    
    
    for (int i = 0;i < count; i++ ) {

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((Kwidth * i)+5, 5, Kwidth-10, 162)];
        [_myScroller addSubview:imageView];
        
    //设置scroll的图片
        NSString *imageName = [NSString stringWithFormat:@"11_%d.jpg",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
    }
}

//scroller的自动布局
-(void)updateViewConstraints{
    
    [_backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
//        make.top.equalTo(self.view).with.offset(224);
     
    }];
    
    [_uiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(64);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        
        make.bottom.equalTo(_backgroundImage.mas_top);

    }];

    [_myScroller mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_uiView);
        make.left.equalTo(_uiView.mas_left);
        make.width.equalTo(_uiView.mas_width);
        make.height.equalTo(_uiView);
    
    }];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).with.offset(195);
        make.bottom.equalTo(_backgroundImage.mas_top);
        make.centerX.equalTo(_backgroundImage);
    }];
    
    
    
    [super updateViewConstraints];
}




- (void)addTimer
{
//设置定时器，让其两秒执行一次方法并循环
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}

- (void)nextImage
{
    // 当前页码(到达最大页数后，就返回第一页)
    NSInteger page = self.pageControl.currentPage;
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
    } else {
        page++;
    }
    //一秒翻页一次
    CGFloat offsetX = page * self.myScroller.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        self.myScroller.contentOffset = CGPointMake(offsetX, 0);
    }];
    
}

#pragma mark - scrollView滚动代理方法
// 正在滚动时
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2) / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}
// 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 停止定时器
    [self.timer invalidate];
}
// 结束拖拽的时候调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
