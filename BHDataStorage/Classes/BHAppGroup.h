//
//  BHAppGroup.h
//  BHDataStorage
//
//  Created by 詹学宝 on 2019/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHAppGroup : NSObject

+ (void)saveShareData:(id)data forKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier;

+ (id)shareDataForKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier;

+ (void)deleteShareDataForKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier;


+ (void)saveShareData:(id)data forKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier tag:(NSString *)tag;

+ (id)shareDataForKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier tag:(NSString *)tag;

+ (void)deleteShareDataForKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier tag:(NSString *)tag;

@end

NS_ASSUME_NONNULL_END
