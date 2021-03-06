//
//  ThirdViewController.m
//  MasonryTest
//
//  Created by mikewang on 2020/4/8.
//  Copyright © 2020 chiron wang. All rights reserved.
//

#import "ThirdViewController.h"
#import "Masonry.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customeUI];
}

- (void) customeUI {
    self.view.backgroundColor = [UIColor blueColor];
    
    // case1 [insertSubview: atIndex:]
    UIView *viewB = [UIView new];
    viewB.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewB];
    [viewB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(100, 50, 50, 50));
    }];
    UILabel *labelB = [UILabel new];
    labelB.text = @"viewB";
    [viewB addSubview:labelB];
    [labelB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewB).offset(20);
        make.centerX.equalTo(viewB);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIView *viewC = [UIView new];
    viewC.backgroundColor = [UIColor yellowColor];
    [viewB addSubview:viewC];
    [viewC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewB).insets(UIEdgeInsetsMake(200, 20, 50, 50));
    }];
    UILabel *labelC = [UILabel new];
    labelC.text = @"viewC";
    [viewC addSubview:labelC];
    [labelC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewC).offset(30);
        make.centerX.equalTo(viewC);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIView *viewD = [UIView new];
    viewD.backgroundColor = [UIColor purpleColor];
//    [viewB insertSubview:viewD atIndex:2];
//    [viewB insertSubview:viewD atIndex:1];
    [viewB insertSubview:viewD atIndex:0];
    [viewD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(380, 50, 50, 150));
    }];
    UILabel *labelD = [UILabel new];
    labelD.text = @"viewD";
    [viewD addSubview:labelD];
    [labelD mas_makeConstraints:^(MASConstraintMaker *make) {
        // make.centerY.equalTo(viewD);
        make.centerX.equalTo(viewD);
        make.bottom.equalTo(viewD.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    // case2 [insertSubview: aboveSubview:];
    UIView *viewE = [UIView new];
    viewE.backgroundColor = [UIColor redColor];
    [viewB insertSubview:viewE aboveSubview:viewC];
    [viewE mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewC).insets(UIEdgeInsetsMake(100, 10, 50, 10));
    }];
    UILabel *labelE = [UILabel new];
    labelE.text = @"viewE";
    [viewE addSubview:labelE];
    [labelE mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(viewD);
        make.centerY.equalTo(viewD);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    // case3 [insertSubview: belowSubview:];
    UIView *viewF = [UIView new];
    viewF.backgroundColor = [UIColor orangeColor];
    [viewB insertSubview:viewF belowSubview:viewE];
    [viewF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewC).offset(80);
        make.left.equalTo(viewC).offset(30);
        make.bottom.equalTo(viewC).offset(-10);
        make.right.equalTo(viewC).offset(-50);
    }];
    UILabel *labelF = [UILabel new];
    labelF.text = @"viewF";
    [viewF addSubview:labelF];
    [labelF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(viewF);
        make.bottom.equalTo(viewF);
        make.size.mas_equalTo(CGSizeMake(50, 50));
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
