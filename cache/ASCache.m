//
//  ASCache.m
//  cache
//
//  Created by 昂神 on 16/2/23.
//  Copyright © 2016年 周子昂. All rights reserved.
//

#import "ASCache.h"
#import <CommonCrypto/CommonDigest.h>
@implementation ASCache

+(instancetype)SharedCache{
    static ASCache * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}
-(instancetype)init{
    self = [super init];
    
    _mCache = [NSCache new];
    
    return self;
}


-(void)setImage:(UIImage *)image forkey:(NSString *)key{
    
    if (!image || !key) {
        return;
    }
    NSString * fileName = [self FileName:key];
    [_mCache setObject:image forKey:fileName];
}

-(void)setImage:(UIImage *)image forkey:(NSString *)key toDisk:(BOOL)isdisk{
    
    if (!image || !key) {
        return;
    }
    
    if (!isdisk) {
        [self setImage:image forkey:key];
        return;
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString * fileName = [self FileName:key];
    NSString *filePath = [[paths objectAtIndex:0]
                          stringByAppendingPathComponent:fileName];   // 保存文件的名称
    BOOL result = [UIImagePNGRepresentation(image)writeToFile: filePath    atomically:YES]; // 保存成功会返回YES
    if (result) {
        NSLog(@"保存成功");
    }else{
        NSLog(@"保存失败");
    }
}

-(UIImage *)getImageForMemoryCache:(NSString *)key{
    return [_mCache objectForKey:[self FileName:key]];
}

-(UIImage *)getImageForDiskCache:(NSString *)key{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);

    NSString *fullPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[self FileName:key]];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    return savedImage;
}

-(void)removeImageForKey:(NSString *)key{
    [_mCache removeObjectForKey:[self FileName:key]];
}

-(void)cleanDisk{
    
}

-(NSString *)FileName:(NSString *)str{
    
    if (!str) {
        return nil;
    }
    
    const char * cStr = [str UTF8String];
    
    unsigned char result[16];
    
    CC_MD5( cStr, strlen(cStr), result );
    
    NSString * fileName = [NSString stringWithFormat:
                           @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                           result[0], result[1], result[2], result[3],
                           
                           result[4], result[5], result[6], result[7],
                           
                           result[8], result[9], result[10], result[11],
                           
                           result[12], result[13], result[14], result[15]
                           
                           ];
    return fileName;
}

@end
