//
//  GLPostBasicTableViewCell.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../Config/GLPostConfigurator.h"
#import "../../../Utilites/Utilites.h"
#import "../../User/Controller/GLUserHomePageViewController.h"
#import "../Model/GLPostBasic.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLPostBasicTableViewCell : UITableViewCell

- (instancetype)initWithGLPostBasic:(GLPostBasic*)post;

- (CGFloat)getCellHeight;

@end

NS_ASSUME_NONNULL_END
