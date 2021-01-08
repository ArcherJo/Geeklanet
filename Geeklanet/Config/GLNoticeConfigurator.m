//
//  GLNoticeConfigurator.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLNoticeConfigurator.h"

@implementation GLNoticeConfigurator

//GLNoticePageViewController
+ (int)getNoticeRedDotWidth{
    return 10;
}
+ (int)getButtonRadius{
    return 17;
}
+ (UIColor*)getLikeButtonColor{
    return UIColorFromHex(0x8499D9);
}
+ (UIColor*)getReplyButtonColor{
    return UIColorFromHex(0x9BC1F2);
}
+(UIColor*)getCallButtonColor{
    return UIColorFromHex(0xBDD9F2);
}
+ (UIColor*)getFanButtonColor{
    return UIColorFromHex(0x1797A6);
}
+ (UIColor*)getRedDotColor{
    return UIColorFromHex(0xFF332B);
}

//GLReplyTableViewController->GLReplyTableViewCell && GLLikeTableViewController->GLLikeTableViewCell
+ (int)getCellAvatraWidth{
    return 60;
}
+ (int)getGrayAeraCornerRadius{
    return 10;
}

//GLNoticeFanTableViewController
+ (int)getFanAvatraHeight{
    return 60;
}
+ (int)getFanCellHeight{
    return 130;
}

@end
