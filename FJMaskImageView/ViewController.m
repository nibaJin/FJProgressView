//
//  ViewController.m
//  FJMaskImageView
//
//  Created by fujin on 17/3/24.
//  Copyright © 2017年 fujin. All rights reserved.
//

#import "ViewController.h"
#import "FJProgressView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FJProgressView *progressView = [[FJProgressView alloc] initWithFrame:CGRectMake(100, 100, 10, 10)];
    progressView.fullSelectedImage = [UIImage imageNamed:@"starSelected_barList"];
    progressView.emptySelectedImage = [UIImage imageNamed:@"starNormal_barList"];
    progressView.progress = 0.5f;
    [self.view addSubview:progressView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
