//
//  GLPostDetailViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostDetailViewController.h"

@interface GLPostDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UILabel* titleLabel;
@property (strong,nonatomic) UIButton* comment;
@property (strong,nonatomic) UIView* areaLabel;
@property (strong,nonatomic) UILabel* tag1;
@property (strong,nonatomic) UILabel* tag2;
@property (strong,nonatomic) UILabel* tag3;

@property (strong,nonatomic) UITableView* commentTabel;

@property (nonatomic) GLPost* post;
@property (nonatomic) GLPostDetailManager* manager;
@property (nonatomic) NSMutableArray* dataList;
@property (nonatomic,strong)UILabel* navigationBar;
@property (strong,nonatomic) UIButton* backBtn;

@property (nonatomic) CGFloat titleHeight;

@end

@implementation GLPostDetailViewController

#pragma mark - init

- (instancetype)init{
    if(self = [super init]){
        self.manager=[[GLPostDetailManager alloc] init];
        self.dataList=[[NSMutableArray alloc] init];
        self.post=self.manager.post;
        int commentCnt=(int)self.post.dataList.count;
        for(int i=0;i<commentCnt;i++){
            if(i == 0){
                NSMutableArray* dataList=[[NSMutableArray alloc] init];
                [dataList addObject:[self titleCell]];
                [self.dataList addObject:dataList];
            }
            
            NSMutableArray* dataList=[[NSMutableArray alloc] init];
            GLComment* comment=self.post.dataList[i];
            GLCommentTableViewCell* commentCell=[[GLCommentTableViewCell alloc] initWithGLComment:comment];
            [dataList addObject:commentCell];
            
            int subCommentCnt=(int)comment.dataList.count;
            for(int j=0;j<subCommentCnt;j++){
                GLSubComment* subComment=comment.dataList[j];
                GLSubCommentTableViewCell* subCommentCell=[[GLSubCommentTableViewCell alloc] initWithGLSubComment:subComment];
                [dataList addObject:subCommentCell];
            }
            [self.dataList addObject:dataList];
            
            if(i == 0){
                NSMutableArray* dataList=[[NSMutableArray alloc] init];
                [dataList addObject:[self replyCell]];
                [self.dataList addObject:dataList];
            }
        }
    }
    return self;
}

- (instancetype)initWithPostID:(NSString*)postID{
//    if(self = [super init]){
//    }
    return [self init];
}

#pragma mark - create cell

- (UITableViewCell*)titleCell{
    UITableViewCell* cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    [cell.contentView addSubview:self.areaLabel];
    [cell.contentView addSubview:self.titleLabel];
    [cell.contentView addSubview:self.comment];
    [cell.contentView addSubview:self.tag1];
    [cell.contentView addSubview:self.tag2];
    [cell.contentView addSubview:self.tag3];
    
    self.titleLabel.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 60);
    [Utilites dynamicCalculateLabelHight:self.titleLabel maxLine:2];
    self.titleHeight=self.titleLabel.frame.size.height+20;
    int currWidth=10;

    self.tag1.frame = CGRectMake(0, 0, 0, 0);
    if([self.tag1.text isEqualToString:@"#"]){
        self.tag1.frame=CGRectMake(currWidth, self.titleHeight, 0, 0);
    }else{
        self.tag1.frame=CGRectMake(currWidth, self.titleHeight, 40, 20);
        [Utilites dynamicCalculateLabelWidth:self.tag1];
        CGRect frame=self.tag1.frame;
        frame.size.width+=8;
        self.tag1.frame=frame;
        currWidth=currWidth+self.tag1.frame.size.width+5;
    }
    self.tag2.frame = CGRectMake(0, 0, 0, 0);
    if([self.tag2.text isEqualToString:@"#"]){
        self.tag2.frame=CGRectMake(currWidth, self.titleHeight, 0, 0);
    }else{
        self.tag2.frame=CGRectMake(currWidth, self.titleHeight, 40, 20);
        [Utilites dynamicCalculateLabelWidth:self.tag2];
        CGRect frame=self.tag2.frame;
        frame.size.width+=8;
        self.tag2.frame=frame;
        currWidth=currWidth+self.tag2.frame.size.width+5;
    }
    self.tag3.frame = CGRectMake(0, 0, 0, 0);
    if([self.tag3.text isEqualToString:@"#"]){
        self.tag3.frame=CGRectMake(currWidth, self.titleHeight, 0, 0);
    }else{
        self.tag3.frame=CGRectMake(currWidth, self.titleHeight, 40, 20);
        [Utilites dynamicCalculateLabelWidth:self.tag3];
        CGRect frame=self.tag3.frame;
        frame.size.width+=8;
        self.tag3.frame=frame;
    }
    self.areaLabel.frame=CGRectMake(7, 11, 50, 22);
    self.comment.frame = CGRectMake(375, self.titleHeight, 20, 20);
    self.titleHeight=self.titleHeight+35;
    return cell;
}

- (UITableViewCell*)replyCell{
    UITableViewCell* cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UILabel* label=[[UILabel alloc] init];
    label.text=@" 回 复";
    label.textColor=[GLPostConfigurator getColorByType:self.post.type];
    label.font=[UIFont systemFontOfSize:20];
    label.backgroundColor=UIColor.clearColor;
    label.layer.borderWidth=0;
    
    label.frame=CGRectMake(0, 40, 80, 20);
    [cell.contentView addSubview:label];
    return cell;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.commentTabel];
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.backBtn];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];

    CGFloat navHeight = [GLPostConfigurator getNavHeight];
    self.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, navHeight);
    self.backBtn.frame = CGRectMake(20, 50, 30, 30);
    
    CGRect frame = self.view.frame;
    frame.origin.y+=navHeight;
    frame.size.height-=navHeight;
    self.commentTabel.frame=frame;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray* dataList=self.dataList[section];
    return dataList.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section < 4) return 0.1;
    else return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int section=(int)indexPath.section,row=(int)indexPath.row;
    
    if(section == 0) return self.titleHeight;
    if(section == 2) return 75;
    
    NSMutableArray* dataList=self.dataList[section];
    return [dataList[row] getCellHeight];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* view=[[UIView alloc] init];
    view.backgroundColor=UIColorFromHex(0xF2F3F7);
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int section=(int)indexPath.section,row=(int)indexPath.row;
    NSMutableArray* dataList=self.dataList[section];
    return dataList[row];
}


- (void)back:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - setter and getter

- (UITableView*)commentTabel{
    if(_commentTabel == nil){
        _commentTabel=[[UITableView alloc] init];
        _commentTabel.delegate=self;
        _commentTabel.dataSource=self;
    }
    return _commentTabel;
}

-(UILabel*) navigationBar{
    if(_navigationBar==nil){
        _navigationBar = [[UILabel alloc] init];
        _navigationBar.backgroundColor = [GLPostConfigurator getNavColor];
    }
    return _navigationBar;
}

- (UIButton*)backBtn{
    if(_backBtn == nil){
        _backBtn = [[UIButton alloc] init];
        [_backBtn setImage:[UIImage imageNamed:@"arrowLeft"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchDown];
    }
    return _backBtn;
}

- (UILabel*) titleLabel{
    if(_titleLabel == nil){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text=[NSString stringWithFormat:@"%@: %@",self.post.type,self.post.title];
        _titleLabel.font=[UIFont systemFontOfSize:19];
        _titleLabel.layer.borderWidth=0;
        _titleLabel.backgroundColor=UIColor.clearColor;
        _titleLabel.textAlignment=NSTextAlignmentLeft;
        _titleLabel.numberOfLines=0;
    }
    return _titleLabel;
}

- (UIView*) areaLabel{
    if(_areaLabel == nil){
        _areaLabel=[[UIView alloc] init];
        _areaLabel.backgroundColor=[GLPostConfigurator getColorByType:self.post.type];
        _areaLabel.layer.cornerRadius=10;
        _areaLabel.layer.masksToBounds=YES;
        _areaLabel.layer.borderWidth=0;
    }
    return _areaLabel;
}

- (UIButton*) comment{
    if(_comment == nil){
        _comment=[[UIButton alloc] init];
        [_comment setBackgroundImage:[UIImage imageNamed:@"postComment"] forState:UIControlStateNormal];
        _comment.backgroundColor=UIColor.clearColor;
        _comment.layer.borderWidth=0;
        [_comment addTarget:self action:@selector(commentPost:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _comment;
}

- (UILabel*) tag1{
    if(_tag1 == nil){
        _tag1=[[UILabel alloc] init];
        _tag1.text=[NSString stringWithFormat:@"#%@",self.post.tags[0]];
        _tag1.font=[UIFont systemFontOfSize:14];
        _tag1.backgroundColor=UIColorFromHex(0xFFF8C4);
        _tag1.layer.masksToBounds=YES;
        _tag1.layer.borderWidth=0;
        _tag1.layer.cornerRadius=[GLPostConfigurator getPostTagViewRadius];
        _tag1.textAlignment=NSTextAlignmentCenter;
    }
    return _tag1;
}

- (UILabel*) tag2{
    if(_tag2 == nil){
        _tag2=[[UILabel alloc] init];
        _tag2.text=[NSString stringWithFormat:@"#%@",self.post.tags[1]];
        _tag2.font=[UIFont systemFontOfSize:14];
        _tag2.backgroundColor=UIColorFromHex(0xFFF8C4);
        _tag2.layer.masksToBounds=YES;
        _tag2.layer.borderWidth=0;
        _tag2.layer.cornerRadius=[GLPostConfigurator getPostTagViewRadius];
        _tag2.textAlignment=NSTextAlignmentCenter;
    }
    return _tag2;
}

- (UILabel*) tag3{
    if(_tag3 == nil){
        _tag3=[[UILabel alloc] init];
        _tag3.text=[NSString stringWithFormat:@"#%@",self.post.tags[2]];
        _tag3.font=[UIFont systemFontOfSize:14];
        _tag3.backgroundColor=UIColorFromHex(0xFFF8C4);
        _tag3.layer.masksToBounds=YES;
        _tag3.layer.borderWidth=0;
        _tag3.layer.cornerRadius=[GLPostConfigurator getPostTagViewRadius];
        _tag3.textAlignment=NSTextAlignmentCenter;
    }
    return _tag3;
}

#pragma mark - response

- (void)commentPost:(UIButton*)sender{
    GLPostCommentViewController* commentVC=[[GLPostCommentViewController alloc] init];
    [self.navigationController pushViewController:commentVC animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
