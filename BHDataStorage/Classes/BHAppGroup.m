//
//  BHAppGroup.m
//  BHDataStorage
//
//  Created by 詹学宝 on 2019/3/1.
//

//key：app group用来存储业务数据的plist
static NSString *const kAppGroupSharePlistName = @"com.bhdatastorage.appgroup.plist";

static NSString *const kAppGroupShareUndefinedTag = @"bh.appgroupUndefinedTag";

#import "BHAppGroup.h"

@implementation BHAppGroup

+ (void)saveShareData:(id)data forKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier {
    [self saveShareData:data forKey:key appGroupIdentifier:appGroupIdentifier tag:kAppGroupShareUndefinedTag];
}

+ (id)shareDataForKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier {
    return [self shareDataForKey:key appGroupIdentifier:appGroupIdentifier tag:kAppGroupShareUndefinedTag];
}

+ (void)deleteShareDataForKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier {
    [self deleteShareDataForKey:key appGroupIdentifier:appGroupIdentifier tag:kAppGroupShareUndefinedTag];
}

+ (void)saveShareData:(id)data forKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier tag:(NSString *)tag {
    if (data == nil || key == nil || appGroupIdentifier == nil || tag == nil) {
        return;
    }
    
    NSURL *groupURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:appGroupIdentifier];
    NSURL *plistURL = [groupURL URLByAppendingPathComponent:kAppGroupSharePlistName];
    
    NSMutableDictionary *plistDic = [NSMutableDictionary dictionaryWithContentsOfURL:plistURL];
    NSDictionary *dict = plistDic[tag];
    if (dict) {
        NSMutableDictionary *tagDic = [NSMutableDictionary dictionaryWithDictionary:dict];
        [tagDic setValue:data forKey:key];
        [plistDic setValue:tagDic forKey:tag];
    }else {
        if (plistDic == nil) {
            plistDic = [[NSMutableDictionary alloc] init];
        }
        [plistDic setValue:@{key:data} forKey:tag];
    }
    [plistDic writeToURL:plistURL atomically:YES];
}

+ (id)shareDataForKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier tag:(NSString *)tag {
    if (key == nil || appGroupIdentifier == nil || tag == nil) {
        return nil;
    }
    
    NSURL *groupURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:appGroupIdentifier];
    NSURL *plistURL = [groupURL URLByAppendingPathComponent:kAppGroupSharePlistName];
    
    NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSDictionary *dict = plistDic[tag];
    if (dict) {
        return dict[key];
    }
    return nil;
}

+ (void)deleteShareDataForKey:(NSString *)key appGroupIdentifier:(NSString *)appGroupIdentifier tag:(NSString *)tag {
    if (key == nil || appGroupIdentifier == nil || tag == nil) {
        return;
    }
    
    NSURL *groupURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:appGroupIdentifier];
    NSURL *plistURL = [groupURL URLByAppendingPathComponent:kAppGroupSharePlistName];
    NSMutableDictionary *plistDic = [NSMutableDictionary dictionaryWithContentsOfURL:plistURL];
    NSDictionary *dict = plistDic[tag];
    if (dict) {
        if (dict[key] == nil) {
            return;
        }
        NSMutableDictionary *tagDic = [NSMutableDictionary dictionaryWithDictionary:dict];
        [tagDic removeObjectForKey:key];
        if (tagDic.count < 1) {
            [plistDic removeObjectForKey:tag];
        }else {
            [plistDic setObject:tagDic forKey:tag];
        }
        [plistDic writeToURL:plistURL atomically:YES];
    }
}
@end
