#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    // Method 2 (method 1 with blocks):
    
    // check the boundaries nil/length
    if (string1 == nil || string1.length == 0) {
        return string2;
    }
    if (string2 == nil || string2.length == 0) {
        return string1;
    }
    
    __block NSMutableString *resultString = [NSMutableString new];
    __block NSMutableString *str1 = [NSMutableString stringWithString:string1];
    __block NSMutableString *str2 = [NSMutableString stringWithString:string2];
    
    // block add 1 char and cut them from string
    NSMutableString* (^appendStringAndSubstring)(NSString*, NSMutableString*) = ^NSMutableString* (NSString* strInput, NSMutableString* resultString) {
        [resultString appendString:[NSString stringWithFormat:@"%c", [strInput characterAtIndex:0]]];
        strInput = [strInput substringFromIndex:1];
        return [strInput mutableCopy];
    };
    
    // block add 1 char without cutting
    void (^appendStringNoSubstring)(NSMutableString*, NSMutableString*) = ^(NSMutableString* strInput, NSMutableString* resultString) {
        [resultString appendString:[NSString stringWithFormat:@"%c", [strInput characterAtIndex:0]]];
 
    };
    
    // basic algorithm
    while (str1.length >= 0 && str2.length >= 0) {
        NSLog(@"%@    %@", str1, str2);
        if (str1.length > 0 && str2.length > 0) {
            if ([str1 characterAtIndex:0] <= [str2 characterAtIndex:0]) {
                str1 = appendStringAndSubstring(str1, resultString);
            }
            else {
                str2 = appendStringAndSubstring(str2, resultString);
            }
        }
        else if (str1.length == 0 && str2.length > 0) {
            if (str2.length > 1) {
                str2 = appendStringAndSubstring(str2, resultString);
            }
            else {
                appendStringNoSubstring(str2, resultString);
                return [resultString copy];
            }
        }
        else if (str1.length > 0 && str2.length == 0) {

            if (str1.length > 1) {
                str1 = appendStringAndSubstring(str1, resultString);
            }
            else {
                appendStringNoSubstring(str1, resultString);
                return [resultString copy];
            }
        }
    }
    
    return [resultString copy];
}

@end

// Method 1 (without blocks)
// while (str1.length >= 0 && str2.length >= 0) {
//    if (str1.length > 0 && str2.length > 0) {
//        if ([str1 characterAtIndex:0] <= [str2 characterAtIndex:0]) {
//            [resultString appendString:[NSString stringWithFormat:@"%c", [str1 characterAtIndex:0]]];
//            str1 = [[str1 substringFromIndex:1] mutableCopy];
//        }
//        else {
//            [resultString appendString:[NSString stringWithFormat:@"%c", [str2 characterAtIndex:0]]];
//            str2 = [[str2 substringFromIndex:1] mutableCopy];
//        }
//    }
//    else if (str1.length == 0 && str2.length > 0) {
//        if (str2.length > 1) {
//            [resultString appendString:[NSString stringWithFormat:@"%c", [str2 characterAtIndex:0]]];
//            str2 = [[str2 substringFromIndex:1] mutableCopy];
//        }
//        else {
//            [resultString appendString:[NSString stringWithFormat:@"%c", [str2 characterAtIndex:0]]];
//            return [resultString copy];
//        }
//    }
//    else if (str1.length > 0 && str2.length == 0) {
//
//        if (str1.length > 1) {
//            [resultString appendString:[NSString stringWithFormat:@"%c", [str1 characterAtIndex:0]]];
//            str1 = [[str1 substringFromIndex:1] mutableCopy];
//        }
//        else {
//            [resultString appendString:[NSString stringWithFormat:@"%c", [str1 characterAtIndex:0]]];
//            return [resultString copy];
//        }
//    }
//}
