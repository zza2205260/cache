//
//  UIImageView+WebImage.h
//  cache
//
//  Created by 昂神 on 16/2/24.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebImage)
/**
 * 加载网络图片
 * @param url 图片的网络链接
 * @param defult 默认的背景图片
 * @param isdisk 网络图片是否加入到磁盘缓存
 * @param progress 正在进行的block
 * @param finish 完成时的block
 */
-(void)setImageWithUrl:(NSString *)url default:(NSString *) defaultName ToDisk:(BOOL) isdisk inProgress:(dispatch_block_t) progress complete:(dispatch_block_t) finish;
@end
