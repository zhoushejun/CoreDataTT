//
//  NSDate+RegexAddition.m
//  CoreDataTT
//
//  Created by shejun.zhou on 15/8/16.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "NSDate+RegexAddition.h"

@implementation NSDate (RegexAddition)

+ (NSDateComponents *)currentTime{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =   NSYearCalendarUnit      |
    NSMonthCalendarUnit     |
    NSDayCalendarUnit       |
    NSWeekdayCalendarUnit   |
    NSHourCalendarUnit      |
    NSMinuteCalendarUnit    |
    NSSecondCalendarUnit;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    return comps;
}

+ (NSString *)currentDate{
    NSDateComponents *comps = [self currentTime];
    NSInteger day = [comps day];
    return [NSString stringWithFormat:@"%li", (long)day];
}

+ (NSString *)currentMonth{
    NSDateComponents *comps = [self currentTime];
    NSInteger month = [comps month];
    return [NSString stringWithFormat:@"%li", (long)month];
}

+ (NSString *)currentYear{
    NSDateComponents *comps = [self currentTime];
    NSInteger year = [comps year];
    return [NSString stringWithFormat:@"%li", (long)year];
}

@end
