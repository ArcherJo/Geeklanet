//
//  GLNoticeTableViewCell.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/7.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../Config/GLNoticeConfigurator.h"
#import "../../../Utilites/Utilites.h"
#import "../../User/Controller/GLUserHomePageViewController.h"
#import "../Model/GLNotice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLNoticeTableViewCell : UITableViewCell

@property (strong, nonatomic)GLNotice* data;
- (instancetype)initWithNotice:(GLNotice*)notice;
@property (nonatomic) CGFloat height;

@end

NS_ASSUME_NONNULL_END
