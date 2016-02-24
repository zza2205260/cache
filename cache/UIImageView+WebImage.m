//
//  UIImageView+WebImage.m
//  cache
//
//  Created by 昂神 on 16/2/24.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import "UIImageView+WebImage.h"
#import "ASCache.h"
@implementation UIImageView (WebImage)

-(void)setImageWithUrl:(NSString *)url default:(NSString *)defaultName ToDisk:(BOOL)isdisk inProgress:(dispatch_block_t)progress complete:(dispatch_block_t)finish{
    self.image = [UIImage imageNamed:defaultName];
    ASCache * cache = [ASCache SharedCache];
    __block UIImage * webImage = [cache getImageForCache:url];
    if (!webImage) {
        progress();
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            webImage = [self urlToimage:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setImage:webImage];
                finish();
                [cache setImage:webImage forkey:url toDisk:isdisk];
            });
        });
    }
}

-(UIImage *)urlToimage:(NSString *)url{
    
    if (!url) {
        return nil;
    }
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    result = [UIImage imageWithData:data];
    return result;
}
@end
