//
//  ViewController.m
//  微健身
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "DataModels.h"
#import "CartoonViewController.h"
#import "jihuaViewController.h"
#import "jiluViewController.h"
#import "zixunViewController.h"


@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

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
    self.view.backgroundColor = [UIColor grayColor];
    
    [self addScrollView];
    

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
    zixunViewController *zixunView = [[zixunViewController alloc]init];
    
    UINavigationController *zixun = [[UINavigationController alloc]initWithRootViewController:zixunView];
    
    [self presentViewController:zixun animated:YES completion:^{
        
    }];

    
}


//#pragma mark  --------设置咨询弹窗--------
////设置登录咨询弹窗
//- (IBAction)login:(UIButton *)sender {
//    //创建alertController
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请登录" preferredStyle:UIAlertControllerStyleAlert];
//    
//    //创建action
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
//        NSLog(@"取消");
//    }];
//    
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//        
//        NSLog(@"前往，登陆");
//    }];
//    
//    //添加
//    [alertController addAction:cancelAction];
//    [alertController addAction:okAction];
//    //显示alertController
//    [self presentViewController:alertController animated:YES completion:^{
//        
//    }];
//    
//}


#pragma mark  --------右上角弹出弹窗--------
- (IBAction)set:(UIBarButtonItem *)sender {
    //创建右上角退出弹窗
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"是否退出 ? " delegate:self cancelButtonTitle:@"再看看" otherButtonTitles:@"退出", nil];
    //设置弹窗的风格
    alertView.alertViewStyle = UIAlertViewStyleDefault ;
    //弹出alertView
    [alertView show];
}


#pragma mark    ---------添加SclollView----------

//添加用于滚动的scrollView
-(void)addScrollView{
    
    //循环的图片数量
     int count = 3;
    
    _myScroller= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 63, 375, 160)];
    [self.view addSubview:_myScroller];
    
    //设置contentsize
    _myScroller.contentSize = CGSizeMake(_myScroller.frame.size.width * count, 160);
    //分页
    self.myScroller.pagingEnabled = YES;
    //设置代理
    _myScroller.delegate = self;
    // 设置pagecontrol-------------******
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(167, 200, 40, 25)];
   
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = count;
    
    //设置背景
    _myScroller.backgroundColor = [UIColor blackColor];
    
    
    
    for (int i = 0;i < count; i++ ) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(375 * i,0, 370, 160 )];
        [_myScroller addSubview:scroll];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 370, 150)];
        [scroll addSubview:imageView];
        
    //设置scroll的图片
        NSString *imageName = [NSString stringWithFormat:@"11_%d.jpg",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
    }
}

- (void)addTimer
{
//设置定时器，让其两秒执行一次方法并循环
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
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
