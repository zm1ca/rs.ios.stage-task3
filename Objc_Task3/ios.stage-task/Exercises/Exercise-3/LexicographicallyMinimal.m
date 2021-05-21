#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *result = [NSMutableString new];
    int string1UsedCharacters = 0, string2UsedCharacters = 0;
    NSString *tmp1 = [NSString new];
    NSString *tmp2 = [NSString new];
    
    while ((string1UsedCharacters < string1.length) && (string2UsedCharacters < string2.length)) {
        tmp1 = [string1 substringWithRange:NSMakeRange(string1UsedCharacters, 1)];
        tmp2 = [string2 substringWithRange:NSMakeRange(string2UsedCharacters, 1)];
        
        if ([tmp1 UTF8String][0] <= [tmp2 UTF8String][0]) {
            [result appendString:tmp1];
            string1UsedCharacters++;
        } else { //code duplication. consider blocks
            [result appendString:tmp2];
            string2UsedCharacters++;
        }
    }
    
    string1UsedCharacters == string1.length
        ? [result appendString:[string2 substringFromIndex:string2UsedCharacters]]
        : [result appendString:[string1 substringFromIndex:string1UsedCharacters]];
    
    return result;
}

@end
