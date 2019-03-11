//
//  BHArchiveObject.m
//  BHDataStorage
//
//  Created by 詹学宝 on 2019/3/1.
//

#import "BHArchiveObject.h"
#import <PINCache/PINDiskCache.h>
#import <CommonCrypto/CommonDigest.h>

@implementation BHArchiveObject

+ (PINDiskCache *)shareSolid {
    static PINDiskCache *solidCacheObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        solidCacheObj = [[PINDiskCache alloc] initWithName:@"BHSolid.Archive" rootPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]];
    });
    return solidCacheObj;
}

+ (PINDiskCache *)shareCache {
    static PINDiskCache *shareCacheObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareCacheObj = [[PINDiskCache alloc] initWithName:@"BHCache.Archive"];
    });
    return shareCacheObj;
}

+ (PINDiskCache *)shareTemp {
    static PINDiskCache *tmpCacheObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tmpCacheObj = [[PINDiskCache alloc] initWithName:@"BHTemp.Archive" rootPath:NSTemporaryDirectory()];
    });
    return tmpCacheObj;
}

+ (PINDiskCache *)diskCacheByPathType:(BHRootPathType)pathType {
    switch (pathType) {
        case BHRootPathDocumentType:
            return [self shareSolid];
        case BHRootPathCacheType:
            return [self shareCache];
        default:
            return [self shareTemp];
    }
}

+ (void)archiveObject:(id<NSCoding>)object forKey:(NSString *)key pathType:(BHRootPathType)pathType {
    if (object == nil || key == nil)    return;
    PINDiskCache *diskCache = [self diskCacheByPathType:pathType];
    [diskCache setObject:[NSKeyedArchiver archivedDataWithRootObject:object] forKey:[self md5String:key]];
}

+ (id)unarchiveObjectForKey:(NSString *)key pathType:(BHRootPathType)pathType {
    if (key == nil)     return nil;
    PINDiskCache *diskCache = [self diskCacheByPathType:pathType];
    id unarchiveData = [diskCache objectForKey:[self md5String:key]];
    if (unarchiveData == nil)   return nil;
    return [NSKeyedUnarchiver unarchiveObjectWithData:unarchiveData];
}

+ (void)removeArchiveObjectForKey:(NSString *)key pathType:(BHRootPathType)pathType {
    if (key == nil)     return;
    PINDiskCache *diskCache = [self diskCacheByPathType:pathType];
    [diskCache removeObjectForKey:[self md5String:key]];
}

+ (NSString *)md5String:(NSString *)string {
    if(string == nil || [string length] == 0)
        return nil;
    
    const char *value = [string UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
}

@end
