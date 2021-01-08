//
//  GLPostConfigurator.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostConfigurator.h"

@implementation GLPostConfigurator

//GLPostBasicTableViewController.h -> GLPostBasicTableViewCell.h
+ (int)getPostBasicAvatraWidth{
    return 60;
}
+ (int)getPostBasicCellCornerRadius{
    return 10;
}
+ (int)getPostDotViewHeight{
    return 8;
}
+ (int)getPostTagViewRadius{
    return 10;
}
+ (UIColor*)getPostBasicCellColor{
    return UIColorFromHex(0xFFFEFF);
}
+ (UIColor*)getColorByType:(NSString*)type{
    if([type isEqualToString:@"分享"]) return UIColorFromHex(0x96A4FF);
    else if([type isEqualToString:@"日常"]) return UIColorFromHex(0x8AFFA5);
    else if([type isEqualToString:@"求助"]) return UIColorFromHex(0xFF8A93);
    else return UIColor.clearColor;
}

//GLPostDetailViewController.h -> GLCommentTableViewCell.h
+ (int)getCommentAvatraWidth{
    return 60;
}
+ (int)getCommentDotViewHeight{
    return 8;
}
+ (int)getCommentFollowButtonCornerDadius{
    return 14;
}

//GLPostSubmitViewController.h
+ (int)getSubmitTagViewRadius{
    return 10;
}
+ (int)getSubmitDeleteHeight{
    return 16;
}


+(UIColor*)getSliderColor{
    return UIColorFromHex(0x549AE0);
}

+ (CGFloat)getSliderHeight{
    return 4;
}


+(UIColor*)getSelectedColor{
    return UIColorFromHex(0x549AE0);
}

+ (CGFloat)getSelectedFontsize{
    return 22;
}

+(UIColor*)getDefaultColor{
    return [UIColor whiteColor];
}

+ (CGFloat)getDefaultFontsize{
    return 19;
}

+ (UIColor*)getTagColor{
    return UIColorFromHex(0xFFF8C4);
}


@end
