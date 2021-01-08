//
//  GLNoticeConfigurator.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLGlobalConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLNoticeConfigurator : GLGlobalConfigurator

//GLNoticePageViewController
+ (int)getNoticeRedDotWidth;
+ (int)getButtonRadius;
+ (UIColor*)getLikeButtonColor;
+ (UIColor*)getReplyButtonColor;
+(UIColor*)getCallButtonColor;
+ (UIColor*)getFanButtonColor;
+ (UIColor*)getRedDotColor;

//GLReplyTableViewController->GLReplyTableViewCell && GLLikeTableViewController->GLLikeTableViewCell
+ (int)getCellAvatraWidth;
+ (int)getGrayAeraCornerRadius;

//GLNoticeFanTableViewController
+ (int)getFanAvatraHeight;
+ (int)getFanCellHeight;

@end

NS_ASSUME_NONNULL_END
