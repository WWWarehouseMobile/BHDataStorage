//
//  BHArchiveObject.h
//  BHDataStorage
//
//  Created by 詹学宝 on 2019/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  @brief 根目录
 */
typedef NS_ENUM(NSInteger, BHRootPathType) {
    /**
     *  document
     */
    BHRootPathDocumentType,
    /**
     *  cache
     */
    BHRootPathCacheType,
    /**
     *  temp
     */
    BHRootPathTempType,
};

@interface BHArchiveObject : NSObject

/**
 *  @brief 归档
 *
 *  @param object 归档对象
 *  @param key    归档的文件名，将会进行md5加密
 *  @param pathType 根路径类型
 */
+ (void)archiveObject:(id<NSCoding>)object forKey:(NSString *)key pathType:(BHRootPathType)pathType;

/**
 *  @brief 解档
 *
 *  @param key 所解档的文件名，将会进行md5加密后读取
 *  @param pathType 根路径类型
 *
 *  @return 解档后的对象
 */
+ (id)unarchiveObjectForKey:(NSString *)key pathType:(BHRootPathType)pathType;

/**
 *  @brief 删除已经归档的对象文件
 *
 *  @param key 所要删除的文件名，将会进行md5加密后删除
 *  @param pathType 根路径类型
 */
+ (void)removeArchiveObjectForKey:(NSString *)key pathType:(BHRootPathType)pathType;

@end

NS_ASSUME_NONNULL_END
