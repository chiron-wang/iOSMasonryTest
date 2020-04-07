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
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
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
