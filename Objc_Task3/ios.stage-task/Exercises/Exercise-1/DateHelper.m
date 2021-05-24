#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if (monthNumber < 1 || monthNumber > 12){
        return nil;
    }
    
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    
    NSArray *monthNames = [formate standaloneMonthSymbols];
    NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];

    return monthName;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    
    [dateFormatter setDateFormat:@"dd"];
    NSString *stringFromDate = [dateFormatter stringFromDate:dateFromString];
    
    int number = [stringFromDate intValue];
    
    return number;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"E"];
    
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    cal.firstWeekday = 2;

    NSDate *now = [NSDate date];
    NSDate *startOfTheWeek;
    NSDate *endOfWeek;
    NSTimeInterval interval;
    [cal rangeOfUnit:NSCalendarUnitWeekOfYear
           startDate:&startOfTheWeek
            interval:&interval
             forDate:now];

    endOfWeek = [startOfTheWeek dateByAddingTimeInterval:interval - 1];

    [cal rangeOfUnit:NSCalendarUnitDay
           startDate:&endOfWeek
            interval:NULL
             forDate:endOfWeek];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    
    if ([date timeIntervalSinceDate:startOfTheWeek] > 0 &&
        [date timeIntervalSinceDate:endOfWeek] < 0){
        return YES;
    }
    
    else{
        return NO;
    }
}

@end
