//
//  ASCache.h
//  cache
//
//  Created by 昂神 on 16/2/23.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ASCache : NSObject

//** 内存缓存 */
@property (nonatomic , readonly , strong) NSCache * mCache;

/** 初始化缓存库 */
+(instancetype)SharedCache;

/**
 * 存储图片
 * @param image 图片
 * @param key 唯一的存储ID
 */
-(void)setImage:(UIImage *)image forkey:(NSString *) key;

/**
 * 存储图片
 * @param image 图片
 * @param key 唯一的存储ID
 * @param isdisk 是否加入磁盘缓存
 */
-(void)setImage:(UIImage *)image forkey:(NSString *)key toDisk:(BOOL) isdisk;

/**
 * 从内存缓存中获取图片
 * @param key 唯一的存储ID
 */
-(UIImage *)getImageForMemoryCache:(NSString *)key;

/**
 * 从磁盘缓存中获取图片
 * @param key 唯一的存储ID
 */
-(UIImage *)getImageForDiskCache:(NSString *)key;

/**
 * 从磁盘缓存和内存缓存中获取图片
 * @param key 唯一的存储ID
 */
-(UIImage *)getImageForCache:(NSString *)key;


/**
 * 从内存缓存和磁盘缓存中移除图片
 * @param key 唯一的存储ID
 */
-(void)removeImageForKey:(NSString *)key;

/**
 * 清空磁盘缓存
 */
-(void)cleanDisk;

@end
