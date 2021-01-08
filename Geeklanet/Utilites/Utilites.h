//
//  Utilites.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utilites : NSObject

//计算date据当前的时间差
+ (NSString*)getTimeString:(NSDate*)date;

//动态计算label的行高 && label最多显示n行
+ (void)dynamicCalculateLabelHight:(UILabel*)label maxLine:(NSInteger)n;

//动态计算label的定高行宽
+ (void)dynamicCalculateLabelWidth:(UILabel*)label;

@end

NS_ASSUME_NONNULL_END
