//
//  GLSubCommentTableViewCell.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/3.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLSubCommentTableViewCell.h"

@interface GLSubCommentTableViewCell ()

@property (strong,nonatomic) UIButton* delete;
@property (strong,nonatomic) UILabel* content;
@property (strong,nonatomic) UILabel* info;

@property (nonatomic) CGFloat height;

@end

@implementation GLSubCommentTableViewCell

#pragma mark - init

- (instancetype)initWithGLSubComment:(GLSubComment*)subComment{
    if(self = [super init]){
        self.delete=[[UIButton alloc] init];
        self.content=[[UILabel alloc] init];
        self.info=[[UILabel alloc] init];
        
        self.content.text=subComment.content;
        self.content.font=[UIFont systemFontOfSize:15];
        self.content.backgroundColor=UIColor.clearColor;
        self.content.frame=CGRectMake(80, 10, 300, 20);
        self.content.numberOfLines=0;
        [Utilites dynamicCalculateLabelHight:self.content maxLine:100];
        self.height=16+self.frame.size.height;
        
        self.info.text=[NSString stringWithFormat:@"———— %@,%@",subComment.userName,subComment.timeStamp];
        self.info.font=[UIFont systemFontOfSize:14];
        self.info.textColor=UIColorFromHex(0x909090);
        self.info.textAlignment=NSTextAlignmentRight;
        self.info.frame=CGRectMake(80, self.height, 100, 15);
        [Utilites dynamicCalculateLabelWidth:self.info];
        CGRect frame=self.info.frame;
        frame.origin.x=370-self.info.frame.size.width;
        self.info.frame=frame;
        
        [self.delete setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        self.delete.backgroundColor=UIColor.clearColor;
        self.delete.layer.borderWidth=0;
        self.delete.frame=CGRectMake(378, self.height-8, 25, 25);
        self.height=self.height+30;
        
        [self.contentView addSubview:self.delete];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.info];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark - count height

- (CGFloat)getCellHeight{
    return self.height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
