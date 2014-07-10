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
    NSString *item;
    while ((item = [dirEnumerator nextObject]) != nil) {
        NSLog(@"%@", item);
    }
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *path = @"/Users/Dec7/Documents/workspace";
        
        NXDisplayAllFilesAtPath(path);
        
    }
    return 0;
}