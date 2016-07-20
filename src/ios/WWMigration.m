/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#include <sys/types.h>
#include <sys/sysctl.h>
#include "TargetConditionals.h"

#import <Cordova/CDV.h>
#import "WWMigration.h"

// project-specific
#import "MECurrency.h"
#import "MAccount.h"
#import "Transaction.h"

#import <CommonCrypto/CommonCryptor.h>

#define ENCRYPTION_KEY          @"9oJK68STxJNEdAc9BN"

@implementation WWMigration

@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

+ (NSString*)AES256DecryptData:(NSData*)toDecrypt {
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    char keyPtr[kCCKeySizeAES256 + 1]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    // fetch key data
    [ENCRYPTION_KEY getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [toDecrypt length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize           = dataLength + kCCBlockSizeAES128;
    void* buffer                = malloc(bufferSize);
    
    size_t numBytesDecrypted    = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES256,
                                          NULL /* initialization vector (optional) */,
                                          [toDecrypt bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess)
    {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        NSData *d = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        return [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    }
    
    free(buffer); //free the buffer;
    return nil;
}

/*
- (void) testCallback:(CDVInvokedUrlCommand*)command
{
    NSLog(@"NSLOGG");
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"A param was null"];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
 */

- (void) getPreferences:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *responseDict = [NSMutableDictionary dictionary];
    
    BOOL soundEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"preference-sound-enabled"];
    responseDict[@"soundsEnabled"] = [NSNumber numberWithBool:soundEnabled];
    
    BOOL syncEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"preference-sync-enabled"];
    responseDict[@"sync_enabled"] = [NSNumber numberWithBool:syncEnabled];

    BOOL pinEnabled = FALSE;
    NSString *finalPIN = [[NSUserDefaults standardUserDefaults] stringForKey:@"preference-final-pin"];
    if(finalPIN != nil) {
        pinEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"preference-pin-timeout"];
    }
    responseDict[@"pin"] = pinEnabled ? finalPIN : nil;
    
    NSString *limitFull = [[NSUserDefaults standardUserDefaults] objectForKey:@"preference-limit-full-string"];
    responseDict[@"csFullAmount"] = [NSNumber numberWithLong:(long)(limitFull == nil ? 0 : limitFull.integerValue)];
    
    NSString *limitLow = [[NSUserDefaults standardUserDefaults] objectForKey:@"preference-limit-low-string"];
    responseDict[@"csLowAmount"] = [NSNumber numberWithLong:(long)(limitLow == nil ? 0 : limitLow.integerValue)];
    
    NSString *limitAlert = [[NSUserDefaults standardUserDefaults] objectForKey:@"preference-limit-alert-string"];
    responseDict[@"csAlertAmount"] = [NSNumber numberWithLong:(long)(limitAlert == nil ? 0 : limitAlert.integerValue)];
    
    NSData *d = [[NSUserDefaults standardUserDefaults] objectForKey:@"preference-registration-email"];
    if(d != nil) {
        responseDict[@"migratedEmail"] = [WWMigration AES256DecryptData:d];
    }
    
    d = [[NSUserDefaults standardUserDefaults] objectForKey:@"preference-registration-password"];
    if(d != nil) {
        responseDict[@"migratedPassword"] = [WWMigration AES256DecryptData:d];
    }
    
    NSUInteger serverLocation = [[NSUserDefaults standardUserDefaults] integerForKey:@"preference-server-location"];
    responseDict[@"serverLocation"] = [NSNumber numberWithInteger:serverLocation];
    
    NSInteger type = [[NSUserDefaults standardUserDefaults] integerForKey:@"com.whitewaterlabs.moniengine.preference.currency_type"];
    if(type < USD) {
        type = USD;
    }
    MECurrency *currency = [MECurrency currencyWithType:(MECurrencyType)type];
    responseDict[@"defaultCurrency"] = currency.shortLabel.lowercaseString;

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:responseDict];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil) {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil) {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Moni" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}


// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil) {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Moni.sqlite"];
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                    configuration:nil
                                                              URL:storeURL
                                                          options:options
                                                            error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return __persistentStoreCoordinator;
}


// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
