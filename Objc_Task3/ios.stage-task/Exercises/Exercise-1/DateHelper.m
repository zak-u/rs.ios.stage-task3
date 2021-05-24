#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSNumber *number = [NSNumber numberWithUnsignedInteger:(monthNumber) ];
    const NSDictionary *months = @{ @1: @"January", @2: @"February",@3: @"March",@4: @"April",@5: @"May",@6: @"June",  @7: @"July", @8: @"August",@9: @"September",@10: @"October",@11: @"November",@12: @"December"};
    
    NSString * monthName = [months objectForKey: number ];
        return monthName;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
      NSDate *dateInNSDate = [dateFormatter dateFromString:date];
    if (dateInNSDate)
    {
        NSDateComponents *dayComponent = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:dateInNSDate];
        long day = [dayComponent day];
        return day;
    } else {
        return 0;
    }
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"EE"];
    NSString *dayName = [dateFormatter stringFromDate:date];
    if (dayName)
    {
        return dayName;
    } else {
        return nil;
    }
    
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *startDate = nil;
    NSTimeInterval interval = 0.0;
    NSCalendar *calendar = [NSCalendar currentCalendar];
  calendar.firstWeekday = 2;//у нас первый день понедельник, в америке вс
  [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate: &startDate interval: &interval forDate: [NSDate date]];
  NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitSecond value: (NSInteger)interval toDate: startDate options:NSCalendarMatchNextTime];

    BOOL dateInThisWeek =
    [date compare:startDate] == NSOrderedDescending // дата позже сравняемой
    && [date compare:endDate] == NSOrderedAscending;// дата раньше сравняемой
    // то есть  в нашем промежутке
    return dateInThisWeek;
}

@end
