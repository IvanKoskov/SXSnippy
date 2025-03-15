//
//  pathsManager.h
//  SXSnippy
//
//  Created by Evan Matthew on 15/3/2568 BE.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface pathsManager : NSObject

-(NSString *)locateDocumentsFolder;
-(NSString *)filesLocationOnMac;
-(nonnull NSArray<NSString *> *)fileListedOnTheLocation:(nonnull NSString *)folder;
-(NSString *)deleteTheFile:(NSString *)file;
-(BOOL)importFileToTheApp:(NSString *)path;
-(BOOL)saveTheNewTextToThefile:(NSString *)pathToFile And:(NSString *)contents;
-(BOOL)createNewFile:(NSString *)fileName At:(NSString *)path;
-(BOOL)exportSelectedFile:(nonnull NSString *)path To:(nonnull NSString *)folder;

@end

NS_ASSUME_NONNULL_END
