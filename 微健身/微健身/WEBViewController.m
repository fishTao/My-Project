//
//  WEBViewController.m
//  微健身
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WEBViewController.h"
#import "Masonry.h"
@interface WEBViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *myWeb;
@property (nonatomic ,strong) UILabel *lab;

#define baseURl @"http://www.fit-time.com/news/"

@end

@implementation WEBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = btn;
    
    //使导航栏不透明
    self.navigationController.navigationBar.translucent = NO;

    NSURL *url=[NSURL URLWithString:baseURl];

    NSURLRequest *request =[NSURLRequest requestWithURL:url];

    [_myWeb loadRequest:request];
    _myWeb.delegate = self;
   // 3）是否与用户交互（即用户能不能控制webview）
    [_myWeb setUserInteractionEnabled:YES];

    
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(60, 100, 200, 50)];


    
    // Do any additional setup after loading the view from its nib.
}

- (void )webViewDidStartLoad:(UIWebView  *)webView {
    //网页开始加载的时候调用
    _lab.text = @"正在加载，请稍后...";
    
    //NSLog(@"===123====");

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    _lab.text = @"加载失败，请检查网络连接...";
    [_myWeb addSubview:_lab];

    //调用自动布局
    [self update];
    //NSLog(@"加载失败，请检查网络连接...");
}

- (void )webViewDidFinishLoad:(UIWebView  *)webView{
    
    //网页加载完成的时候调用
    //NSLog(@"123456789");

}


-(void)update{

    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).with.offset(100);
        make.centerX.mas_equalTo(_myWeb);

    }];


}


//返回的方法
-(void)back:(UIBarButtonItem *)sander{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
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
