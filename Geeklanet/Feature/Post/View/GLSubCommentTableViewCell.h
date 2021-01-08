//
//  GLSubCommentTableViewCell.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/3.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../Config/GLPostConfigurator.h"
#import "../../../Utilites/Utilites.h"
#import "../Model/GLSubComment.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLSubCommentTableViewCell : UITableViewCell

- (instancetype)initWithGLSubComment:(GLSubComment*)subComment;

- (CGFloat)getCellHeight;

@end

NS_ASSUME_NONNULL_END
