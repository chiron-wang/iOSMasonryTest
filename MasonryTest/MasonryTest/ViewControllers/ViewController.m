//
//  ViewController.m
//  MasonryTest
//
//  Created by mikewang on 2020/4/7.
//  Copyright © 2020 chiron wang. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customUI];
}


- (void)customUI {
    // case1: 畫面置中紅色view 大小 300, 300
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    // case2 與sv一樣大，加上間距10
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor yellowColor];
    [sv addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        /*
        // 另外一種寫法
        make.top.equalTo(sv).with.offset(10);
        make.left.equalTo(sv).with.offset(10);
        make.bottom.equalTo(sv).with.offset(10);
        make.right.equalTo(sv).with.offset(10);
         
        // 另外一種寫法
        make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        */
    }];
    
    // case3 兩個高度150的view，寬度等寬．間距為10
    int padding1 = 10;
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor blueColor];
    [sv1 addSubview:sv2];
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor greenColor];
    [sv1 addSubview:sv3];
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).with.offset(padding1);
        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
    }];
    
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv2.mas_right).with.offset(padding1);
        make.right.equalTo(sv.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv2);
    }];
    
    
    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.layer.cornerRadius = 25;
    [nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitle:@"next" forState:UIControlStateNormal];
    [nextButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:nextButton];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(sv.mas_bottom).offset(120);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
}

- (void) nextButtonPressed: (id)sender {
    NSLog(@"next button have been clicked.");
//    SecondViewController *nextVC = [[SecondViewController alloc] init];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondViewController *nextVC = [storyboard instantiateViewControllerWithIdentifier:@"secondVC"];
    [self.navigationController pushViewController:nextVC animated:YES];
}



@end
