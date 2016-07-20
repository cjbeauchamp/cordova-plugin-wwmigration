//
//  MECurrency.h
//  MoniEngine
//
//  Created by Chris Beauchamp on 3/28/13.
//  Copyright (c) 2013 Whitewater Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

//STARTCUR
typedef enum {USD,EUR,CAD,AUD,HKD,GBP,CNY,BRL,SEK,CHF,TRY,JPY,MXN,LTL,RUB,INR,SGD,CLP,CRC,PEN,UYU,HUF,ARS,VEF,BGN,BOB,PYG,UAH,NIO,COP,HNL,IDR,KRW,NZD,PHP,GTQ,NOK,THB,TWD,MOP,ILS,CZK,DKK,MAD,LVL,MYR,RON,GEL,ZAR,TTD,BYR,PLN,VND,PKR,HRK,TZS,CDF,DOP,GHS,MZN,MDL,XPF,XCD} MECurrencyType;
//ENDCUR

@interface MECurrency : NSObject {
    MECurrencyType _type;
    
    int _decimalCount;
    
    NSString *_decimalIndicator;
    NSString *_thousandSeparator;
    NSString *_suffix;
    NSString *_prefix;
    NSString *_shortLabel;
    NSString *_longLabel;
    
    NSString *_negativeFormat;
    NSString *_negativeRegexPattern;
}

@property (nonatomic, assign) MECurrencyType type;
@property (nonatomic, assign) int decimalCount;

@property (nonatomic, strong) NSString *decimalIndicator;
@property (nonatomic, strong) NSString *thousandSeparator;
@property (nonatomic, strong) NSString *negativeFormat;
@property (nonatomic, strong) NSString *negativeRegexPattern;
@property (nonatomic, strong) NSString *suffix;
@property (nonatomic, strong) NSString *prefix;
@property (nonatomic, strong) NSString *shortLabel;
@property (nonatomic, strong) NSString *longLabel;

+ (MECurrency*) currencyWithType:(MECurrencyType)type;

- (NSString*) getDisplayLabel;

- (NSString*) createCurrencyString:(NSString*)input;
- (NSString*) createCurrencyStringFromDecimal:(NSDecimalNumber*)decimal;
- (NSDecimalNumber*) getTransactionValue:(NSString*)input;
- (NSDecimalNumber*) getTransactionValueFromFlatString:(NSString*)input;
- (NSString*) createFlatStringFromDecimal:(NSDecimalNumber*)decimal;

@end