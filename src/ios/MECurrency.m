//
//  MECurrency.m
//  MoniEngine
//
//  Created by Chris Beauchamp on 3/28/13.
//  Copyright (c) 2013 Whitewater Labs. All rights reserved.
//

#import "MECurrency.h"

@interface MECurrency()
- (NSString*) addThousandsSeparators:(NSString*)input;
@end

@implementation MECurrency

@synthesize type = _type;
@synthesize decimalCount = _decimalCount;
@synthesize decimalIndicator = _decimalIndicator;
@synthesize thousandSeparator = _thousandSeparator;
@synthesize negativeFormat = _negativeFormat;
@synthesize negativeRegexPattern = _negativeRegexPattern;

@synthesize suffix = _suffix;
@synthesize prefix = _prefix;
@synthesize shortLabel = _shortLabel;
@synthesize longLabel = _longLabel;

- (void) configure {
    
    switch (_type) {
            //STARTCUR
case USD:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"USD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"USD"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case EUR:
		_prefix = @"";
		_suffix = @"€";
		_shortLabel = @"EUR";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"EUR"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case CAD:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"CAD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"CAD"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case AUD:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"AUD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"AUD"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case HKD:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"HKD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"HKD"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case GBP:
		_prefix = @"£";
		_suffix = @"";
		_shortLabel = @"GBP";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"GBP"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case CNY:
		_prefix = @"¥";
		_suffix = @"";
		_shortLabel = @"CNY";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"CNY"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case BRL:
		_prefix = @"R$";
		_suffix = @"";
		_shortLabel = @"BRL";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"BRL"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case SEK:
		_prefix = @"";
		_suffix = @" kr";
		_shortLabel = @"SEK";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"SEK"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case CHF:
		_prefix = @"";
		_suffix = @" CHF";
		_shortLabel = @"CHF";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"CHF"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @"'";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case TRY:
		_prefix = @"";
		_suffix = @" ₺";
		_shortLabel = @"TRY";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"TRY"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case JPY:
		_prefix = @"¥";
		_suffix = @"";
		_shortLabel = @"JPY";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"JPY"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case MXN:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"MXN";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"MXN"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case LTL:
		_prefix = @"";
		_suffix = @" Lt";
		_shortLabel = @"LTL";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"LTL"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case RUB:
		_prefix = @"";
		_suffix = @" руб.";
		_shortLabel = @"RUB";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"RUB"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case INR:
		_prefix = @"₹";
		_suffix = @"";
		_shortLabel = @"INR";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"INR"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case SGD:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"SGD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"SGD"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case CLP:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"CLP";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"CLP"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case CRC:
		_prefix = @"₡";
		_suffix = @"";
		_shortLabel = @"CRC";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"CRC"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case PEN:
		_prefix = @"S/.";
		_suffix = @"";
		_shortLabel = @"PEN";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"PEN"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case UYU:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"UYU";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"UYU"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case HUF:
		_prefix = @"";
		_suffix = @" Ft";
		_shortLabel = @"HUF";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"HUF"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case ARS:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"ARS";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"ARS"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case VEF:
		_prefix = @"Bs.F.";
		_suffix = @"";
		_shortLabel = @"VEF";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"VEF"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case BGN:
		_prefix = @"";
		_suffix = @" лв.";
		_shortLabel = @"BGN";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"BGN"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case BOB:
		_prefix = @"Bs";
		_suffix = @"";
		_shortLabel = @"BOB";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"BOB"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case PYG:
		_prefix = @"₲";
		_suffix = @"";
		_shortLabel = @"PYG";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"PYG"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case UAH:
		_prefix = @"";
		_suffix = @" ₴";
		_shortLabel = @"UAH";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"UAH"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case NIO:
		_prefix = @"C$";
		_suffix = @"";
		_shortLabel = @"NIO";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"NIO"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case COP:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"COP";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"COP"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case HNL:
		_prefix = @"L";
		_suffix = @"";
		_shortLabel = @"HNL";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"HNL"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case IDR:
		_prefix = @"Rp";
		_suffix = @"";
		_shortLabel = @"IDR";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"IDR"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case KRW:
		_prefix = @"₩";
		_suffix = @"";
		_shortLabel = @"KRW";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"KRW"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case NZD:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"NZD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"NZD"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case PHP:
		_prefix = @"₱";
		_suffix = @"";
		_shortLabel = @"PHP";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"PHP"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case GTQ:
		_prefix = @"Q";
		_suffix = @"";
		_shortLabel = @"GTQ";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"GTQ"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case NOK:
		_prefix = @"";
		_suffix = @" kr";
		_shortLabel = @"NOK";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"NOK"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case THB:
		_prefix = @"฿";
		_suffix = @"";
		_shortLabel = @"THB";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"THB"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case TWD:
		_prefix = @"NT$";
		_suffix = @"";
		_shortLabel = @"TWD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"TWD"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case MOP:
		_prefix = @"MOP";
		_suffix = @"";
		_shortLabel = @"MOP";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"MOP"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case ILS:
		_prefix = @"";
		_suffix = @" ₪";
		_shortLabel = @"ILS";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"ILS"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case CZK:
		_prefix = @"";
		_suffix = @" Kč";
		_shortLabel = @"CZK";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"CZK"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case DKK:
		_prefix = @"";
		_suffix = @" kr";
		_shortLabel = @"DKK";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"DKK"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case MAD:
		_prefix = @"";
		_suffix = @" د.م.";
		_shortLabel = @"MAD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"MAD"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case LVL:
		_prefix = @"";
		_suffix = @" Ls";
		_shortLabel = @"LVL";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"LVL"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case MYR:
		_prefix = @"RM";
		_suffix = @"";
		_shortLabel = @"MYR";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"MYR"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case RON:
		_prefix = @"";
		_suffix = @" RON";
		_shortLabel = @"RON";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"RON"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case GEL:
		_prefix = @"";
		_suffix = @" GEL";
		_shortLabel = @"GEL";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"GEL"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case ZAR:
		_prefix = @"R";
		_suffix = @"";
		_shortLabel = @"ZAR";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"ZAR"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case TTD:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"TTD";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"TTD"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case BYR:
		_prefix = @"BYR";
		_suffix = @"";
		_shortLabel = @"BYR";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"BYR"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case PLN:
		_prefix = @"";
		_suffix = @" zł";
		_shortLabel = @"PLN";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"PLN"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case VND:
		_prefix = @"";
		_suffix = @" ₫";
		_shortLabel = @"VND";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"VND"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case PKR:
		_prefix = @"₨";
		_suffix = @"";
		_shortLabel = @"PKR";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"PKR"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case HRK:
		_prefix = @"";
		_suffix = @" kn";
		_shortLabel = @"HRK";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"HRK"];
		_decimalCount = 2;
		_decimalIndicator = @",";
		_thousandSeparator = @".";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case TZS:
		_prefix = @"";
		_suffix = @" TSh";
		_shortLabel = @"TZS";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"TZS"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case CDF:
		_prefix = @"";
		_suffix = @" FCFA";
		_shortLabel = @"CDF";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"CDF"];
		_decimalCount = 0;
		_decimalIndicator = @"";
		_thousandSeparator = @" ";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;



case DOP:
		_prefix = @"$";
		_suffix = @"";
		_shortLabel = @"DOP";
		_longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"DOP"];
		_decimalCount = 2;
		_decimalIndicator = @".";
		_thousandSeparator = @",";
		_negativeFormat = @"(%@)";
		_negativeRegexPattern = @"\\((.*?)\\)";
		break;


            
        case GHS:
            _prefix = @"GH₵ ";
            _suffix = @"";
            _shortLabel = @"GHS";
            _longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"GHS"];
            _decimalCount = 2;
            _decimalIndicator = @".";
            _thousandSeparator = @",";
            _negativeFormat = @"(%@)";
            _negativeRegexPattern = @"\\((.*?)\\)";
            break;

        case MZN:
            _prefix = @"MZN";
            _suffix = @"";
            _shortLabel = @"MZN";
            _longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"MZN"];
            _decimalCount = 2;
            _decimalIndicator = @".";
            _thousandSeparator = @",";
            _negativeFormat = @"(%@)";
            _negativeRegexPattern = @"\\((.*?)\\)";
            break;
            
        case MDL:
            _prefix = @"MDL";
            _suffix = @"";
            _shortLabel = @"MDL";
            _longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"MDL"];
            _decimalCount = 2;
            _decimalIndicator = @".";
            _thousandSeparator = @",";
            _negativeFormat = @"(%@)";
            _negativeRegexPattern = @"\\((.*?)\\)";
            break;
            
        case XPF:
            _prefix = @"CFPF";
            _suffix = @"";
            _shortLabel = @"XPF";
            _longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"XPF"];
            _decimalCount = 2;
            _decimalIndicator = @".";
            _thousandSeparator = @",";
            _negativeFormat = @"(%@)";
            _negativeRegexPattern = @"\\((.*?)\\)";
            break;
            
        case XCD:
            _prefix = @"EC$";
            _suffix = @"";
            _shortLabel = @"XCD";
            _longLabel = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:@"XCD"];
            _decimalCount = 2;
            _decimalIndicator = @".";
            _thousandSeparator = @",";
            _negativeFormat = @"(%@)";
            _negativeRegexPattern = @"\\((.*?)\\)";
            break;
            

//ENDCUR
        default:
            break;
    }
    
}

- (NSString*) getDisplayLabel {
    return [NSString stringWithFormat:@"%@ (%@ %@%@)", _longLabel, _shortLabel, _prefix, _suffix];    
}

- (MECurrency*) initWithType:(MECurrencyType)type {
    
    self = [super init];
    
    if(self) {
        _type = type;
        [self configure];
    }
    
    return self;
}

- (NSString*) createCurrencyString:(NSString*)input {
    
    if(input == nil) {
        input = @"";
    }
    
    NSMutableString *mutable = [NSMutableString stringWithString:input];
    
    BOOL isNegative = [mutable rangeOfString:@"-"].location != NSNotFound;
    // now remove any negatives
    mutable = [NSMutableString stringWithString:[mutable stringByReplacingOccurrencesOfString:@"-" withString:@""]];
    
    // first convert it into decimal
    if(mutable.length == 0) {
        mutable = [NSMutableString stringWithString:@"0"];
    }
    
    // if there aren't enough for the decimal, pad it.
    // the default will be 0.00 (one to the left then however many decimals)
    while(mutable.length < _decimalCount+1 && _decimalCount > 0) {
        [mutable insertString:@"0" atIndex:0];
    }
    
    // now place the decimal
    int ndx = mutable.length - _decimalCount;
    [mutable insertString:_decimalIndicator atIndex:ndx];
    
    
    // remove any leading 0's
    int leftOfDecimal = [mutable rangeOfString:_decimalIndicator].location;
    while([mutable characterAtIndex:0] == '0' && mutable.length > 1 && leftOfDecimal > 1) {
        mutable = [NSMutableString stringWithString:[mutable substringFromIndex:1]];
        leftOfDecimal = [mutable rangeOfString:_decimalIndicator].location;
    }
    
    // add a thousand-separator [if needed]
    mutable = [NSMutableString stringWithString:[self addThousandsSeparators:mutable]];
    
    // and place the prefix/suffix
    [mutable insertString:_prefix atIndex:0];
    [mutable insertString:_suffix atIndex:mutable.length];
    
    // format if negative
    if(isNegative) {
        mutable = [NSMutableString stringWithFormat:_negativeFormat, mutable];
    }
    
    
    return [NSString stringWithString:mutable];
}

- (NSString*) addThousandsSeparators:(NSString*)input {
    
    NSMutableString *mutable = [NSMutableString stringWithString:input];
    
    int leftOfDecimal = [mutable rangeOfString:_decimalIndicator].location;

    NSString *leftOfDecimalString = nil;
    if(leftOfDecimal >= 3 && leftOfDecimal != NSNotFound) {
        
        leftOfDecimalString = [mutable substringToIndex:leftOfDecimal];
        
        // figure out where we should put the separators
        int numberOfSeparators = floor((leftOfDecimalString.length - 1) / 3);
        int offsetOfSeparators = leftOfDecimalString.length - numberOfSeparators * 3;
        
        for(int i=0; i<numberOfSeparators; i++) {
            // start at the end and work back
            int ndx = offsetOfSeparators + (3 * (numberOfSeparators - i - 1));
            [mutable insertString:_thousandSeparator atIndex:ndx];
        }
        
    }
    
    // jpy
    // there's no decimal, but we have a long number
    else if(leftOfDecimal == NSNotFound && mutable.length > 3) {
        
        leftOfDecimalString = [NSString stringWithString:mutable];
        
        // figure out where we should put the separators
        int numberOfSeparators = floor((leftOfDecimalString.length - 1) / 3);
        int offsetOfSeparators = leftOfDecimalString.length - numberOfSeparators * 3;
        
        for(int i=0; i<numberOfSeparators; i++) {
            // start at the end and work back
            int ndx = offsetOfSeparators + (3 * (numberOfSeparators - i - 1));
            [mutable insertString:_thousandSeparator atIndex:ndx];
        }
        
    }

    return (NSString*)mutable;
}

- (NSString*) createCurrencyStringFromDecimal:(NSDecimalNumber*)decimal {
    
    if(decimal == nil) {
        decimal = [NSDecimalNumber zero];
    }
    
    BOOL isNegative = decimal.floatValue < 0;
    
    if(isNegative) {
        decimal = [decimal decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"-1"]];
    }
    
    
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                             scale:_decimalCount
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                               raiseOnDivideByZero:NO];
    decimal = [decimal decimalNumberByRoundingAccordingToBehavior:handler];
    
    NSString *s = [decimal stringValue];
    
    // replace any decimals with this currency's indicator
    s = [s stringByReplacingOccurrencesOfString:@"." withString:_decimalIndicator];
    
    int loc = [s rangeOfString:_decimalIndicator].location;
    
    // remove the decimal [if needed]
    if(_decimalCount == 0) {
        if(loc != NSNotFound) {
            s = [s substringToIndex:loc];
        }
    }
    
    // or add the decimal [if needed]
    if(_decimalCount > 0 && loc == NSNotFound) {
        s = [s stringByAppendingString:_decimalIndicator];
    }
    
    loc = [s rangeOfString:_decimalIndicator].location;

    // pad the left
    if(_decimalCount > 0 && loc == 0) {
        s = [@"0" stringByAppendingString:s];
    }

    
    // and the right
    while(loc != NSNotFound && (s.length - loc - 1) < _decimalCount && _decimalCount > 0) {
        s = [s stringByAppendingString:@"0"];
        loc = [s rangeOfString:_decimalIndicator].location;
    }
    
    s = [self addThousandsSeparators:s];
    
    NSString *final = [NSString stringWithFormat:@"%@%@%@", _prefix, s, _suffix];
    
    if(isNegative) {
        
        // and create the negative format
        final = [NSString stringWithFormat:_negativeFormat, final];
    }
    
    // add currency stuff
    return final;
}

- (NSDecimalNumber*) getTransactionValue:(NSString*)input {
    
    if(input == nil) {
        input = @"0";
    }
    
    if(input.length == 0) {
        input = @"0";
    }
        
    // remove the excesses
    NSString *fullString = [input stringByReplacingOccurrencesOfString:_suffix withString:@""];
    fullString = [fullString stringByReplacingOccurrencesOfString:_prefix withString:@""];
    fullString = [fullString stringByReplacingOccurrencesOfString:_thousandSeparator withString:@""];
    
    // figure out if the string is negative
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:_negativeRegexPattern
                                  options:0
                                  error:nil];
    
    NSTextCheckingResult *match = [regex firstMatchInString:fullString options:0 range:NSMakeRange(0, [fullString length])];
    NSRange range = [match rangeAtIndex:1];
    
    BOOL isNegative = (range.location != 0 || range.length != 0);
    if(isNegative) {
        
        
        // remove the negative formatting
        fullString = [fullString substringWithRange:range];
    }

    
    // replace the decimal with a . for this
    fullString = [fullString stringByReplacingOccurrencesOfString:_decimalIndicator withString:@"."];

    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:fullString];
    if(isNegative) {
        number = [number decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"-1"]];
    }
    
    
    return number;
}

- (NSDecimalNumber*) getTransactionValueFromFlatString:(NSString*)input {
    NSString *fullString = [self createCurrencyString:input];
    return [self getTransactionValue:fullString];
}

- (NSString*) createFlatStringFromDecimal:(NSDecimalNumber*)decimal {
    
    BOOL isNegative = decimal.floatValue < 0;
    
    if(isNegative) {
        decimal = [decimal decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"-1"]];
    }
    
    NSString *full = [self createCurrencyStringFromDecimal:decimal];
    full = [full stringByReplacingOccurrencesOfString:_prefix withString:@""];
    full = [full stringByReplacingOccurrencesOfString:_suffix withString:@""];
    full = [full stringByReplacingOccurrencesOfString:_decimalIndicator withString:@""];
    full = [full stringByReplacingOccurrencesOfString:_thousandSeparator withString:@""];
    
    // remove leading zeros
    while(full.length > 1 && [full characterAtIndex:0] == '0') {
        full = [full substringFromIndex:1];
    }
    
    // prepend the minus if needed
    if(isNegative) {
        full = [@"-" stringByAppendingString:full];
    }
    
    return full;
}

+ (MECurrency*) currencyWithType:(MECurrencyType)type {
    return [[MECurrency alloc] initWithType:type];
}

@end
