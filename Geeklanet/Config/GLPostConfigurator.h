//
//  GLPostConfigurator.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLGlobalConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLPostConfigurator : GLGlobalConfigurator

//GLPostBasicTableViewController.h -> GLPostBasicTableViewCell.h
+ (int)getPostBasicAvatraWidth;
+ (int)getPostBasicCellCornerRadius;
+ (int)getPostDotViewHeight;
+ (int)getPostTagViewRadius;
+ (UIColor*)getPostBasicCellColor;
+ (UIColor*)getColorByType:(NSString*)type;

//GLPostDetailViewController.h -> GLCommentTableViewCell.h
+ (int)getCommentAvatraWidth;
+ (int)getCommentDotViewHeight;
+ (int)getCommentFollowButtonCornerDadius;

//GLPostSubmitViewController.h
+ (int)getSubmitTagViewRadius;
+ (int)getSubmitDeleteHeight;
+(UIColor*)getSliderColor;
+ (CGFloat)getSliderHeight;

+(UIColor*)getSelectedColor;

+ (CGFloat)getSelectedFontsize;

+(UIColor*)getDefaultColor;

+ (CGFloat)getDefaultFontsize;

+ (UIColor*)getTagColor;



@end

NS_ASSUME_NONNULL_END
