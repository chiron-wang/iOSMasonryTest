//
//  SecondViewController.m
//  MasonryTest
//
//  Created by mikewang on 2020/4/7.
//  Copyright © 2020 chiron wang. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    // case1: 畫面置中紅色view 大小 300, 300
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    // case4 UIScrollView順序排列
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    
    for (int i = 1; i <= count; ++i) {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0) saturation:(arc4random() % 128 / 256.0) + 0.5 brightness:(arc4random() % 128 / 256.0) + 0.5 alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
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
