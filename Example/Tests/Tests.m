//
//  BHDataStorageTests.m
//  BHDataStorageTests
//
//  Created by XB-Paul on 03/01/2019.
//  Copyright (c) 2019 XB-Paul. All rights reserved.
//

@import XCTest;
#import <BHDataStorage/BHDataStorage.h>

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testArchiveObjectToDocument {
    NSString *archiveString = @"123木头人";
    NSString *key = @"testKey";
    [BHArchiveObject archiveObject:archiveString forKey:key pathType:BHRootPathDocumentType];
    NSString *unarchiveString1 = [BHArchiveObject unarchiveObjectForKey:key pathType:BHRootPathDocumentType];
    NSLog(@"archiveString:%@\n unarchiveString1:%@",archiveString,unarchiveString1);
    XCTAssertEqualObjects(archiveString, unarchiveString1);
    [BHArchiveObject removeArchiveObjectForKey:key pathType:BHRootPathDocumentType];
    NSString *unarchiveString2 = [BHArchiveObject unarchiveObjectForKey:key pathType:BHRootPathDocumentType];
    XCTAssertNil(unarchiveString2);
}

- (void)testArchiveObjectToLibrary {
    NSString *archiveString = @"123木头人";
    NSString *key = @"testKey";
    [BHArchiveObject archiveObject:archiveString forKey:key pathType:BHRootPathCacheType];
    NSString *unarchiveString1 = [BHArchiveObject unarchiveObjectForKey:key pathType:BHRootPathCacheType];
    XCTAssertEqualObjects(archiveString, unarchiveString1);
    [BHArchiveObject removeArchiveObjectForKey:key pathType:BHRootPathCacheType];
    NSString *unarchiveString2 = [BHArchiveObject unarchiveObjectForKey:key pathType:BHRootPathCacheType];
    XCTAssertNil(unarchiveString2);
}

- (void)testArchiveObjectToTemp {
    NSString *archiveString = @"123木头人";
    NSString *key = @"testKey";
    [BHArchiveObject archiveObject:archiveString forKey:key pathType:BHRootPathTempType];
    NSString *unarchiveString1 = [BHArchiveObject unarchiveObjectForKey:key pathType:BHRootPathTempType];
    XCTAssertEqualObjects(archiveString, unarchiveString1);
    [BHArchiveObject removeArchiveObjectForKey:key pathType:BHRootPathTempType];
    NSString *unarchiveString2 = [BHArchiveObject unarchiveObjectForKey:key pathType:BHRootPathTempType];
    XCTAssertNil(unarchiveString2);
}


- (void)testAppGroup {
    NSString *shareString = @"123木头人";
    NSString *key = @"testKey";
    //appGroupIdentifier必须是有效的！
    //appGroupIdentifier必须是有效的！
    //appGroupIdentifier必须是有效的！
    NSString *appGroupIdentifier = @"group.com.wwwarehouse.test";
    [BHAppGroup saveShareData:shareString forKey:key appGroupIdentifier:appGroupIdentifier];
    NSString *shareString2 = [BHAppGroup shareDataForKey:key appGroupIdentifier:appGroupIdentifier];
    XCTAssertEqualObjects(shareString, shareString2);
    [BHAppGroup deleteShareDataForKey:key appGroupIdentifier:appGroupIdentifier];
    NSString *shareString3 = [BHAppGroup shareDataForKey:key appGroupIdentifier:appGroupIdentifier];
    XCTAssertNil(shareString3);
}

- (void)testKeychain {
    NSString *keychainString = @"123木头人";
    NSString *account = @"BHTestUser";
    NSString *bundleId = [NSBundle mainBundle].bundleIdentifier;
    [BHKeychain setPassword:keychainString forService:bundleId account:account];
    NSString *keychainString2 = [BHKeychain passwordForService:bundleId account:account];
    XCTAssertEqualObjects(keychainString, keychainString2);
    [BHKeychain deletePasswordForService:bundleId account:account];
    NSString *keychainString3 = [BHKeychain passwordForService:bundleId account:account];
    XCTAssertNil(keychainString3);
}
@end

