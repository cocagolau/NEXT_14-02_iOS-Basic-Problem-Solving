//
//  main.m
//  FileString
//
//  Created by Dec7 on 2014. 7. 10..
//  Copyright (c) 2014년 NHNNEXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DecFileManager: NSObject
{
    NSFileManager *fm;
}

-(void) displayAllFilesAtPath: (NSString*) path;
-(NSMutableArray *) allFilesAtPath: (NSString*) path;
@end


@implementation DecFileManager

-(id)init
{
    self = [super init];
    if(self){
        fm = [NSFileManager defaultManager];
    }
    return self;
}

-(void) displayAllFilesAtPath: (NSString*) path
{
    NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtPath:path];
    NSString *itemPath;
    while ((itemPath = [dirEnumerator nextObject]) != nil) {
        NSDictionary * dict = [fm attributesOfItemAtPath:itemPath error:nil];
        
        
        
        NSLog(@"%@ -type: %@", itemPath, [dict objectForKey:NSFileType]);
    }
}

-(NSMutableArray *) allFilesAtPath: (NSString*) path
{
    NSMutableArray * files = [[NSMutableArray alloc] init];
    NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtPath:path];
    NSString *item;
    while ((item = [dirEnumerator nextObject]) != nil) {
        [files addObject:item];
    }
    
    return files;
}

@end



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *path = @"/Users/Dec7/Documents/workspace";
        NSString *filename = @"HelloWorld.java";
        
        DecFileManager * dfm = [[DecFileManager alloc] init];
        [dfm displayAllFilesAtPath:path];
        
//        NSMutableArray * allFiles = [dfm allFilesAtPath:path];
//        for (id file in allFiles)
//            NSLog(@"name: %@", file);
    }
    return 0;
}