//
//  Utilites.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "Utilites.h"

@implementation Utilites

+ (NSString*)getTimeString:(NSDate*)date{
    NSDate* currDate=[NSDate dateWithTimeIntervalSinceNow:0];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents* cmps = [calendar components:type fromDate:date toDate:currDate options:0];
    if(cmps.year!=0 || cmps.month!=0 || cmps.day!=0){
        NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY-MM-dd"];
        NSString* timeStr=[formatter stringFromDate:date];
        return timeStr;
    }else if(cmps.hour!=0){
        NSString* timeStr=[NSString stringWithFormat:@"%ld小时前",cmps.hour];
        return timeStr;
    }else if(cmps.minute!=0){
        NSString* timeStr=[NSString stringWithFormat:@"%ld分钟前",cmps.minute];
        return timeStr;
    }else{
        NSString* timeStr=[NSString stringWithFormat:@"%ld秒前",cmps.second];
        return timeStr;
    }
}

+ (void)dynamicCalculateLabelHight:(UILabel*)label maxLine:(NSInteger)n{
    CGSize labelSize={0, 0};
    labelSize=[self GLtextHeightFromTextString:label.text width:label.frame.size.width fontSize:label.font.pointSize];
    CGFloat rate=label.font.lineHeight;
    CGRect frame=label.frame;
    if (labelSize.height>rate*n) {
        frame.size.height=rate*n;
    }else{
        frame.size.height=labelSize.height;
    }
    label.frame=frame;
}

+ (CGSize)GLtextHeightFromTextString:(NSString*)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    CGSize size1 = [text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:size]}];
    return CGSizeMake(size1.width, rect.size.height);
}

+ (void)dynamicCalculateLabelWidth:(UILabel*)label{
    CGRect rect=[label.text boundingRectWithSize:CGSizeMake(MAXFLOAT,label.frame.size.height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:label.font}
                                     context:nil];
    CGRect frame=label.frame;
    frame.size.width=rect.size.width;
    label.frame=frame;
}

@end
