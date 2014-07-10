//
//  main.m
//  FileString
//
//  Created by Dec7 on 2014. 7. 10..
//  Copyright (c) 2014년 NHNNEXT. All rights reserved.
//

#import <Foundation/Foundation.h>

void NXDisplayAllFilesAtPath(NSString *path) {
    NSFileManager *fm =[NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtPath:path];
    NSString *itemPath;
    while ((itemPath = [dirEnumerator nextObject]) != nil) {
        NSDictionary * dict = [fm attributesOfItemAtPath:itemPath error:nil];
        [dict ]
        
        NSLog(@"%@ -type: %@", itemPath, [dict objectForKey:NSFileType]);
    }
}

NSArray * NXAllFilesAtPath(NSString * path) {
    NSArray * files = [NSArray array];
    
    NSFileManager *fm =[NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtPath:path];
    NSString *item;
    while ((item = [dirEnumerator nextObject]) != nil) {
        [files arrayByAddingObject:item];
    }
    
    return files;
}

BOOL isExistFilenameAtPath(NSString * filename, NSString * path) {
    
    NSFileManager *fm =[NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtPath:path];
    NSString *item;
    while ((item = [dirEnumerator nextObject]) != nil) {
        if (filename == item) {
            return true;
        }
    }
    
    return false;
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *path = @"/Users/Dec7/Documents/workspace";
        NSString *filename = @"HelloWorld.java";
        
        NXDisplayAllFilesAtPath(path);
        NXAllFilesAtPath(path);
        
        if (isExistFilenameAtPath(filename, path)) {
            NSLog(@"%@ 있음!!", filename);
        }
        else {
            NSLog(@"%@ 없음!!", filename);
        }
        
    }
    return 0;
}