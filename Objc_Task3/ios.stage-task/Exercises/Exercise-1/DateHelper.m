#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    // supe boring code
//    typedef NS_ENUM(NSInteger, month) {
//        January = 1,
//        February = 2,
//        March = 3,
//        April = 4,
//        May = 5,
//        June = 6,
//        July = 7,
//        August = 8,
//        September = 9,
//        October = 10,
//        November = 11,
//        December = 12
//    };
//
//    month setMonth = monthNumber;
//
//    switch (setMonth) {
//        case January:
//            return @"January";
//            break;
//        case February:
//            return @"February";
//            break;
//        case March:
//            return @"March";
//            break;
//        case April:
//            return @"April";
//            break;
//        case May:
//            return @"May";
//            break;
//        case June:
//            return @"June";
//            break;
//        case July:
//            return @"July";
//            break;
//        case August:
//            return @"August";
//            break;
//        case September:
//            return @"September";
//            break;
//        case October:
//            return @"October";
//            break;
//        case November:
//            return @"November";
//            break;
//        case December:
//            return @"December";
//            break;
//        default:
//            return nil;
//            break;
    
    // check if month number is valid
    if (monthNumber == 0 || monthNumber > 12) {
        return nil;
    }
    // create two Date Formatters
    NSDateFormatter *dateFormatterOutput = [NSDateFormatter new];
    dateFormatterOutput.dateFormat = @"MMMM";
    NSDateFormatter *dateFormatterInput = [NSDateFormatter new];
    dateFormatterInput.dateFormat = @"M";
    
    // output convertation
    NSString *dayString = [dateFormatterOutput stringFromDate:[dateFormatterInput dateFromString:[NSString stringWithFormat:@"%li", monthNumber]]];
    return  dayString;
    
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    // check if input date is exists
    if (date == nil || date.length == 0) {
        return 0;
    }
    
    // create date formatter from string
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    dateFormatter.dateFormat = dateFormat;
    NSDate *dateFromString = [dateFormatter dateFromString:date];

    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    // return day unit from date
    return [calendar component:NSCalendarUnitDay fromDate:dateFromString];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    if (date == nil) {
        return 0;
    }
    
    // create date format with RU locale and day type with 3 chars
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.calendar = [NSCalendar autoupdatingCurrentCalendar];
    dateFormatter.dateFormat = @"eee";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    dateFormatter.timeZone = NSTimeZone.defaultTimeZone;
    
    NSString *dateFormatString = [dateFormatter stringFromDate:date];

//    NSLog(@"Russian day: %@", dateFormatString);
    
    return dateFormatString;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    if (date == nil) {
        return NO;
    }
    
    // create Now date
    NSDate *nowDate = [NSDate now];
    
    // create 2 calendars
    NSCalendar *calendarDate = [NSCalendar autoupdatingCurrentCalendar];
    NSCalendar *calendarNow = [NSCalendar autoupdatingCurrentCalendar];
    
    // compare unitYear and unitWeekOfYear
    if ([calendarDate component:NSCalendarUnitWeekOfYear fromDate:date] == [calendarNow component:NSCalendarUnitWeekOfYear fromDate:nowDate] && [calendarDate component:NSCalendarUnitYear fromDate:date] == [calendarNow component:NSCalendarUnitYear fromDate:nowDate]) {
        return YES;
    }
    
    return NO;
}

@end
