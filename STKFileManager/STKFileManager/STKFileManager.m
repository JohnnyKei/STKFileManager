//
//  STKFileManager.m
//  STKFileManager
//
//  Created by kei on 2015/01/24.
//  Copyright (c) 2015年 kei. All rights reserved.
//

#import "STKFileManager.h"

@implementation STKFileManager

static STKFileManager *manager = nil;

+ (instancetype)sharedManager{
    @synchronized(self){
        if (!manager) {
            manager = [[self alloc]init];
        }
    }
    return manager;
}

- (id)init{
    self = [super init];
    if (self) {

    }
    return self;
}


- (NSString *)temporaryDirectory{
    return NSTemporaryDirectory();
}

- (NSString *)temporaryDirectoryWithFileName:(NSString *)fileName{
    //ファイルパスの末尾にファイル名を追加
    return [[self temporaryDirectory]stringByAppendingPathComponent:fileName];
}

- (NSString *)homeDirectory{
    return NSHomeDirectory();
}

- (NSString *)homeDirectoryWithFileName:(NSString *)fileName{
    return [[self homeDirectory]stringByAppendingPathComponent:fileName];
}

- (NSString *)cacheDirectory{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}

- (NSString *)documentDirectory{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

- (BOOL)fileExistsAtPath:(NSString *)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:filePath]) {
        return YES;
    }else{
        return NO;
    }
}

- (NSArray *)fileNamesAtDirectoryPath:(NSString *)directoryPath extension:(NSString *)extension{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    NSArray *allFileNames = [fileManager contentsOfDirectoryAtPath:directoryPath error:&error];
    if (error) {
        return nil;
    }
    NSMutableArray *hitFileNames = [NSMutableArray new];
    for (NSString *fileName in allFileNames) {
        
        if ([[fileName pathExtension] isEqualToString:extension]) {
            [hitFileNames addObject:fileName];
        }
    }
    
    return hitFileNames;
}


- (NSInteger)directorySize:(NSString *)folderPath{
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *filesEnumerator = [filesArray objectEnumerator];
    NSString *fileName;
    NSInteger fileSize = 0;
    
    while (fileName = [filesEnumerator nextObject]) {
        
//        http://d.hatena.ne.jp/csouls/20110105/1295185197
        
        NSDictionary *fileDictionary = [[NSFileManager defaultManager]
                                        attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName]
                                        error:nil];
        fileSize += [fileDictionary fileSize];
    }
    
    return fileSize;
}

@end
