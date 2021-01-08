//
//  GLPostDetailViewController.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../View/GLCommentTableViewCell.h"
#import "../View/GLSubCommentTableViewCell.h"
#import "../Manager/GLPostDetailManager.h"
#import "GLPostCommentViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLPostDetailViewController : UIViewController

- (instancetype)initWithPostID:(NSString*)postID;

@end

NS_ASSUME_NONNULL_END
