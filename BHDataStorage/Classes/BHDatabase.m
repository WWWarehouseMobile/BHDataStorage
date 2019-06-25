//
//  BHDatabase.m
//  BHDataStorage
//
//  Created by 汪志刚 on 2019/5/28.
//

#import "BHDatabase.h"

@interface BHDatabase()

@property (nonatomic, strong) FMDatabase *fmdb;

@end

@implementation BHDatabase

#pragma mark-
#pragma mark-   public method
+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    static BHDatabase *database = nil;
    dispatch_once(&onceToken, ^{
        database = [self new];
    });
    return database;
}

+ (BOOL)setupWithName:(NSString *)name {

    
    NSString *docuPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *dbSurfix = @".db";
    if (![name containsString:dbSurfix]) {
        name = [name stringByAppendingString:dbSurfix];
    }
    NSString *dbPath = [docuPath stringByAppendingPathComponent:name];

//    NSLog(@"dbPath ---> %@", dbPath);
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    BOOL flag = [db open];
    if (flag) {
        [BHDatabase sharedInstance].fmdb = db;
    }
    return flag;
}

//+ (BOOL)createTableWithName:(NSString *)name format:(NSString *)format {
//    
//    NSString *createTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (%@)", name, format];
////    NSLog(@"create ---> %@", createTable);
//    
//    BOOL result = [[BHDatabase sharedInstance].fmdb executeUpdate:createTable];
//    return result;
//}

//+ (BOOL)executeUpdate:(NSString*)sql, ... {
//    va_list args;
//    va_start(args, sql);
//    
//    BOOL result = [[BHDatabase sharedInstance].fmdb executeUpdate:sql];
//
//    va_end(args);
//    return result;
//}
//
//+ (BOOL)executeUpdateWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
//    va_list args;
//    va_start(args, format);
//    
//    BOOL result = [[BHDatabase sharedInstance].fmdb executeUpdateWithFormat:@"%@", format];
//
//    
//    va_end(args);
//    return result;
//}
//
//+ (BOOL)executeUpdate:(NSString*)sql withArgumentsInArray:(NSArray *)arguments {
//    return [[BHDatabase sharedInstance].fmdb executeUpdate:sql withArgumentsInArray:arguments];
//}
//
//+ (BOOL)executeUpdate:(NSString*)sql values:(NSArray * _Nullable)values error:(NSError * _Nullable __autoreleasing *)error {
//    return [[BHDatabase sharedInstance].fmdb executeUpdate:sql values:values error:error];
//}
//
//+ (BOOL)executeUpdate:(NSString*)sql withParameterDictionary:(NSDictionary *)arguments {
//    return [[BHDatabase sharedInstance].fmdb executeUpdate:sql withParameterDictionary:arguments];
//}

+ (BOOL)close {
    return [[BHDatabase sharedInstance].fmdb close];
}

//+ (BOOL)insertIntoTable:(NSString *)table keysFormat:(NSString *)keyFormat values:(NSArray *)values {
//
//    NSString *valuesFormat = @"";
//    NSInteger count = [keyFormat componentsSeparatedByString:@","].count;
//    for (int i=0; i<count; i++) {
//        valuesFormat = [valuesFormat stringByAppendingString:@",?"];
//    }
//    if ([valuesFormat hasPrefix:@","]) valuesFormat = [valuesFormat substringFromIndex:1];
//    NSString *insertTable = [NSString stringWithFormat:@"INSERT INTO '%@' (%@) values(%@)", table, keyFormat, valuesFormat];
//    NSLog(@"insert ---> %@", insertTable);
//
//    BOOL result = [[BHDatabase sharedInstance].fmdb executeUpdate:insertTable withArgumentsInArray:values];
//    return result;
//}
//
//+ (BOOL)deleteFromTable:(NSString *)table keysFormat:(NSString *)keyFormat values:(NSArray *)values {
//
//    NSString *newKeyFormat = @"";
//    NSArray *keys  = [keyFormat componentsSeparatedByString:@","];
//    for (NSString *key in keys) {
//        newKeyFormat = [NSString stringWithFormat:@"%@ AND %@ = ?", newKeyFormat, key];
//    }
//    if ([newKeyFormat hasPrefix:@" AND "]) newKeyFormat = [newKeyFormat substringFromIndex:5];
//    NSString *deleteTable = [NSString stringWithFormat:@"DELETE FROM '%@' WHERE %@", table, newKeyFormat];
//    NSLog(@"delete ---> %@", deleteTable);
//
//    BOOL result = [[BHDatabase sharedInstance].fmdb executeUpdate:deleteTable withArgumentsInArray:values];
//    return result;
//}
//
//+ (BOOL)updateFromTable:(NSString *)table setKey:(NSString *)setKey conditionKey:(NSString *)conditionKey values:(NSArray *)values {
//
//    NSString *setKeyFormat = @"";
//    NSString *conditionKeyFormat = @"";
//    NSArray *setKeys  = [setKey componentsSeparatedByString:@","];
//    NSArray *conditionKeys  = [conditionKey componentsSeparatedByString:@","];
//
//    for (NSString *tempSetKey in setKeys) {
//        setKeyFormat = [NSString stringWithFormat:@"%@, %@ = ?", setKeyFormat, tempSetKey];
//    }
//
//    for (NSString *tempConditionKey in conditionKeys) {
//        conditionKeyFormat = [NSString stringWithFormat:@"%@ AND %@ = ?", conditionKeyFormat, tempConditionKey];
//    }
//
//    if ([setKeyFormat hasPrefix:@", "]) setKeyFormat = [setKeyFormat substringFromIndex:2];
//    if ([conditionKeyFormat hasPrefix:@" AND "]) conditionKeyFormat = [conditionKeyFormat substringFromIndex:5];
//
//    NSString *updateTable = [NSString stringWithFormat:@"UPDATE '%@' SET %@ WHERE %@", table, setKeyFormat, conditionKeyFormat];
//    NSLog(@"update ---> %@", updateTable);
//
//    BOOL result = [[BHDatabase sharedInstance].fmdb executeUpdate:updateTable withArgumentsInArray:values];
//    return result;
//}

@end
