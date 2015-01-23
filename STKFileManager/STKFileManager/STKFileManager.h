
//
//  STKFileManager.h
//  STKFileManager
//
//  Created by kei on 2015/01/24.
//  Copyright (c) 2015年 kei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STKFileManager : NSObject

+ (instancetype)sharedManager;

- (NSString *)temporaryDirectory;
- (NSString *)temporaryDirectoryWithFileName:(NSString *)fileName;
- (NSString *)homeDirectory;
- (NSString *)homeDirectoryWithFileName:(NSString *)fileName;
- (NSString *)cacheDirectory;
- (NSString *)documentDirectory;
- (BOOL)fileExistsAtPath:(NSString *)filePath;
- (NSArray *)fileNamesAtDirectoryPath:(NSString *)directoryPath extension:(NSString *)extension;
- (NSInteger)directorySize:(NSString *)folderPath;

@end
