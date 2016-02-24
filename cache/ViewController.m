//
//  ViewController.m
//  cache
//
//  Created by 昂神 on 16/2/23.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import "ViewController.h"
#import "ASCache.h"
#import "UIImageView+WebImage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ASCache * cache = [ASCache SharedCache];
    UIImage * image = [cache getImageForDiskCache:@"test"];
    UIImageView * imgview = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    imgview.image = image;
    [self.view addSubview:imgview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
