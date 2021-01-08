//
//  GLCommentTableViewCell.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/3.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../Config/GLPostConfigurator.h"
#import "../../../Utilites/Utilites.h"
#import "../../User/Controller/GLUserHomePageViewController.h"
#import "../Model/GLComment.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLCommentTableViewCell : UITableViewCell

- (instancetype)initWithGLComment:(GLComment*)comment;

- (CGFloat)getCellHeight;

@end

NS_ASSUME_NONNULL_END
