//
//  BHViewController.m
//  BHDataStorage
//
//  Created by XB-Paul on 03/01/2019.
//  Copyright (c) 2019 XB-Paul. All rights reserved.
//

#import "BHViewController.h"
#import <BHDataStorage/BHDataStorage.h>

@interface BHViewController ()

@end

@implementation BHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BOOL flag = [BHDatabase setupWithName:@"wwwarehouse.db"];
    BOOL createResult = [BHDatabase createTableWithName:@"REVIEW" format:@"id integer PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age integer NOT NULL"];
//    BOOL insertResult = [BHDatabase insertIntoTable:@"REVIEW" keysFormat:@"id,name,age" values:@[@(3), @"小红", @(4)]];
//    BOOL deleteResult = [BHDatabase deleteFromTable:@"REVIEW" keysFormat:@"id,age" values:@[@(3), @(4)]];
//    BOOL updateResult = [BHDatabase updateFromTable:@"REVIEW" setKey:@"id,age" conditionKey:@"name" values:@[@(5), @(15), @"小红"]];
//    BOOL updateResult = [BHDatabase executeUpdateWithFormat:@"update 't_student' set id = %d where name = %@",113,@"小红"];
    if (flag) {
        NSLog(@"数据库加载成功");
    }else{
        NSLog(@"数据库加载失败");
    }
    
    if (createResult) {
        NSLog(@"表创建成功");
    }else{
        NSLog(@"表创建失败");
    }
//
//    if (insertResult) {
//        NSLog(@"插入成功");
//    }else{
//        NSLog(@"插入失败");
//    }
//    if (deleteResult) {
//        NSLog(@"删除成功");
//    }else{
//        NSLog(@"删除失败");
//    }
//    if (updateResult) {
//        NSLog(@"更新成功");
//    }else{
//        NSLog(@"更新失败");
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
