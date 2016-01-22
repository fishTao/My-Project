//
//  Guide.m
//  微健身
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Guide.h"
#import "AppDelegate.h"
@interface Guide ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageView;

@end

@implementation Guide


#pragma mark - Scroll view delegate
////////让pageView跟视图同步

//拖拽结束，开始减速
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{   //不减速，则滚动结束
    if (!decelerate) {
        self.pageView.currentPage = self.ScrollView.contentOffset.x/self.view.frame.size.width;
    }
}

//减速结束.
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    self.pageView.currentPage = self.ScrollView.contentOffset.x/self.view.frame.size.width;

}


- (IBAction)guide:(id)sender {
    //调用切换控制器
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate guideEnd];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view.
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
