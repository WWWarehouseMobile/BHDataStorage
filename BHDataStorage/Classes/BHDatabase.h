//
//  BHDatabase.h
//  BHDataStorage
//
//  Created by 汪志刚 on 2019/5/28.
//

#import <Foundation/Foundation.h>
#import <fmdb/FMDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHDatabase : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong, readonly) FMDatabase *fmdb;

+ (BOOL)setupWithName:(NSString *)name;

//+ (BOOL)createTableWithName:(NSString *)name format:(NSString *)format;

//+ (BOOL)executeUpdate:(NSString*)sql, ...;
//
//+ (BOOL)executeUpdateWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
//
//+ (BOOL)executeUpdate:(NSString*)sql withArgumentsInArray:(NSArray *)arguments;
//
//+ (BOOL)executeUpdate:(NSString*)sql values:(NSArray * _Nullable)values error:(NSError * _Nullable __autoreleasing *)error;
//
//+ (BOOL)executeUpdate:(NSString*)sql withParameterDictionary:(NSDictionary *)arguments;

+ (BOOL)close;

//+ (BOOL)insertIntoTable:(NSString *)table keysFormat:(NSString *)keyFormat values:(NSArray *)values;
//
//+ (BOOL)deleteFromTable:(NSString *)table keysFormat:(NSString *)keyFormat values:(NSArray *)values;
//
//+ (BOOL)updateFromTable:(NSString *)table setKey:(NSString *)setKey conditionKey:(NSString *)conditionKey values:(NSArray *)values;

@end

NS_ASSUME_NONNULL_END
