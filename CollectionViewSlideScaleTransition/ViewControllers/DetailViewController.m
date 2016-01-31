//
//  DetailViewController.m
//  SSTransitionDemo
//
//  Created by Shankar B S on 16/08/15.
//  Copyright (c) 2015 SliCode. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.detailImageView.image = self.selectedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
