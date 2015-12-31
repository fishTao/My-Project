//
//  AddViewController.h
//  微健身
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
@property (nonatomic, strong) NSString *addString;
@property (nonatomic, strong) void (^addLabelValue) (NSString *text);

@end
