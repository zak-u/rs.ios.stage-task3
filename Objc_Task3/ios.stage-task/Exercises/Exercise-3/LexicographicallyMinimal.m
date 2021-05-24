#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    if (string1 == nil || string2 == nil ) {
        return nil;
    }
    NSString *firstCharOfString1 = @"";
    NSString *firstCharOfString2 = @"";
    NSMutableString *lexicographicallyMinimalString = [[NSMutableString alloc] init];
    NSMutableString *mutableString1 = string1.mutableCopy;
    NSMutableString *mutableString2 = string2.mutableCopy;
    NSRange range = {0,1};
    NSUInteger finalLength = string1.length+ string2.length;
    
    do {
        if ((mutableString1.length != 0)&&(firstCharOfString1.length == 0))  {
            firstCharOfString1 = [mutableString1 substringToIndex:1];
            [mutableString1 deleteCharactersInRange:range];
        }
        if ((mutableString2.length != 0)&&(firstCharOfString2.length == 0))  {
            firstCharOfString2 = [mutableString2 substringToIndex:1];
            [mutableString2 deleteCharactersInRange:range];
        }
        if ((![firstCharOfString1  isEqual: @""]) && (![firstCharOfString2  isEqual: @""]) ){
            NSComparisonResult compareResult = [firstCharOfString1 compare:firstCharOfString2];
            if (compareResult == NSOrderedAscending || compareResult == NSOrderedSame ) {
                [lexicographicallyMinimalString appendString:firstCharOfString1];
                firstCharOfString1 = @"";
            }else if (compareResult == NSOrderedDescending){
                [lexicographicallyMinimalString appendString:firstCharOfString2];
                firstCharOfString2 = @"";
            }
        }else if ([firstCharOfString1  isEqual: @""]){
            [lexicographicallyMinimalString appendString:firstCharOfString2];
            [lexicographicallyMinimalString appendString:mutableString2];
        }else if ([firstCharOfString2  isEqual: @""]){
            [lexicographicallyMinimalString appendString:firstCharOfString1];
            [lexicographicallyMinimalString appendString:mutableString1];
        }
    } while (lexicographicallyMinimalString.length != finalLength);
    
    
    return lexicographicallyMinimalString;
}

@end
