//
//  ViewController.m
//  AXWaveAnimationViewDemo
//
//  Created by arnoldxiao on 2017/2/9.
//  Copyright © 2017年 arnoldxiao. All rights reserved.
//

#import "ViewController.h"
#import "AXWaveAnimationView.h"

@interface ViewController ()

@property (nonatomic, strong) AXWaveAnimationView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.view.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:self.animationView];
    
}

- (AXWaveAnimationView *)animationView {
    if (!_animationView) {
        _animationView = [[AXWaveAnimationView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300)
                                                    backgroundColor:[UIColor lightGrayColor]
                                                          fillColor:[UIColor redColor]
                                                           autoPlay:YES];
    }
    return _animationView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
