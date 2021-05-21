#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    switch (monthNumber) {
        case 1: return @"January";
        case 2: return @"February";
        case 3: return @"March";
        case 4: return @"April";
        case 5: return @"May";
        case 6: return @"June";
        case 7: return @"July";
        case 8: return @"August";
        case 9: return @"September";
        case 10: return @"October";
        case 11: return @"November";
        case 12: return @"December";
            
        default: return nil;;
    }
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    switch ([[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate: date]) {
        case 1: return @"Вс";
        case 2: return @"Пн";
        case 3: return @"Вт";
        case 4: return @"Ср";
        case 5: return @"Чт";
        case 6: return @"Пт";
        case 7: return @"Сб";
        default: return nil;
    }
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:[NSDate now]];
    NSDateComponents *givenDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:date];
    
    if (currentDateComponents.year == givenDateComponents.year) {
        return currentDateComponents.weekOfYear == givenDateComponents.weekOfYear;
    }
    
    return NO;
}

@end
