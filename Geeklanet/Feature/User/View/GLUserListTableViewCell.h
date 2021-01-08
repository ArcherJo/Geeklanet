//
//  GLFriendTableViewCell.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../Config/GLUserConfigurator.h"
#import "../Model/GLUserBaseInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLUserListTableViewCell : UITableViewCell

- (instancetype)initWithUserBaseInfo:(GLUserBaseInfo*)baseInfo;

@end

NS_ASSUME_NONNULL_END
