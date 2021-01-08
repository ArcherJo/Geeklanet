//
//  GLPostSubmitViewController.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostSubmitViewController.h"

@interface GLPostSubmitViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate>

@property (strong,nonatomic) UIButton* addPicture;
@property (strong,nonatomic) UIButton* addTag;
@property (strong,nonatomic) UIButton* submit;
@property (strong,nonatomic) UITextField* titleInput;
@property (strong,nonatomic) UITextView* contentInput;
@property (strong,nonatomic) UILabel* promptTitle;
@property (strong,nonatomic) UISegmentedControl* typeSelect;
@property (strong,nonatomic) UIView* lineView;

@property (strong,nonatomic) UILabel* tag1;
@property (strong,nonatomic) UILabel* tag2;
@property (strong,nonatomic) UILabel* tag3;
@property (strong,nonatomic) UIButton* delete;

//@property (strong,nonatomic) UILabel*

@property (nonatomic) int tagNum;
@property (nonatomic) int picNum;
@property (nonatomic) CGFloat width;
@property (nonatomic) NSMutableArray* picturePos;
@property (nonatomic) GLPostSubmitManager* manager;

@property (nonatomic) NSMutableArray* pictures;
@end

@implementation GLPostSubmitViewController

#pragma mark - init

- (instancetype)init{
    if(self = [super init]){
        self.picNum=0;
        self.picturePos=[[NSMutableArray alloc] init];
        self.pictures=[[NSMutableArray alloc] init];
        self.manager=[[GLPostSubmitManager alloc] init];
        
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(50, 469, 95, 95)]];
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(155, 469, 95, 95)]];
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(260, 469, 95, 95)]];
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(50, 574, 95, 95)]];
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(155, 574, 95, 95)]];
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(260, 574, 95, 95)]];
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(50, 679, 95, 95)]];
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(155, 679, 95, 95)]];
        [self.picturePos addObject:[NSValue valueWithCGRect:CGRectMake(260, 679, 95, 95)]];
        //[self testPicture];
        [self testTag];
    }
    return self;
}

- (void)testPicture{
    for (int i=0; i<9; i++) {
        UIImageView* picture=[[UIImageView alloc] init];
        picture.image=[UIImage imageNamed:@"smilyt"];
        picture.frame=[self.picturePos[i] CGRectValue];
        [self.view addSubview:picture];
    }
}

- (void)testTag{
    NSArray* tags=[[NSArray alloc] initWithObjects:@"Python",@"Java",@"C/C++",nil];
    self.tag1.text=[NSString stringWithFormat:@"#%@",tags[0]];
    self.tag1.hidden=NO;
    self.tag1.frame=CGRectMake(16, self.view.frame.size.height-106, 40, 20);
    [Utilites dynamicCalculateLabelWidth:self.tag1];
    CGRect frame=self.tag1.frame;
    frame.size.width+=8;
    self.tag1.frame=frame;
    self.width=21+self.tag1.frame.size.width;
    
    self.tag2.text=[NSString stringWithFormat:@"#%@",tags[1]];
    self.tag2.hidden=NO;
    self.tag2.frame=CGRectMake(self.width, self.view.frame.size.height-106, 40, 20);
    [Utilites dynamicCalculateLabelWidth:self.tag2];
    frame=self.tag2.frame;
    frame.size.width+=8;
    self.tag2.frame=frame;
    self.width=self.width+self.tag2.frame.size.width+5;
    
    self.tag3.text=[NSString stringWithFormat:@"#%@",tags[2]];
    self.tag3.hidden=NO;
    self.tag3.frame=CGRectMake(self.width, self.view.frame.size.height-106, 40, 20);
    [Utilites dynamicCalculateLabelWidth:self.tag3];
    frame=self.tag3.frame;
    frame.size.width+=8;
    self.tag3.frame=frame;
    self.width=self.width+self.tag3.frame.size.width;
    
    self.delete.hidden=NO;
    self.delete.frame=CGRectMake(self.width-10, self.view.frame.size.height-113, 16, 16);
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.submit];
    [self.view addSubview:self.promptTitle];
    [self.view addSubview:self.titleInput];
    [self.view addSubview:self.contentInput];
    [self.view addSubview:self.addPicture];
    [self.view addSubview:self.addTag];
    [self.view addSubview:self.typeSelect];
    [self.view addSubview:self.tag1];
    [self.view addSubview:self.tag2];
    [self.view addSubview:self.tag3];
    [self.view addSubview:self.delete];
    [self.view addSubview:self.lineView];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.addPicture.frame=CGRectMake(20, self.view.frame.size.height-71, 35, 35);
    self.addTag.frame=CGRectMake(70, self.view.frame.size.height-71, 35, 35);
    self.titleInput.frame=CGRectMake(35, 100, 345, 50);
    self.contentInput.frame=CGRectMake(35, 160, 345, 265);
    self.typeSelect.frame=CGRectMake(200, self.view.frame.size.height-71, 200, 35);
    self.lineView.frame=CGRectMake(35, 145, 345, 2);
    self.promptTitle.frame=CGRectMake(42, 168, 40, 20);
    self.submit.frame=CGRectMake(360, 55, 40, 40);
}

#pragma mark - response

- (void)addPhoto:(UIButton*)sender{
    UIImagePickerController* picker=[[UIImagePickerController alloc] init];
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate=self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)addTags:(UIButton*)sender{
    
}

- (void)deleteTags:(UIButton*)sender{
    
}

- (void)goHome:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeColor:(UISegmentedControl*)sender{
    if(sender.selectedSegmentIndex == 0){
        sender.tintColor=[GLPostConfigurator getColorByType:@"分享"];
        self.lineView.backgroundColor=[GLPostConfigurator getColorByType:@"分享"];
        [self.submit setBackgroundImage:[UIImage imageNamed:@"submit1"] forState:UIControlStateNormal];
    }else if(sender.selectedSegmentIndex == 1){
        sender.tintColor=[GLPostConfigurator getColorByType:@"求助"];
        self.lineView.backgroundColor=[GLPostConfigurator getColorByType:@"求助"];
        [self.submit setBackgroundImage:[UIImage imageNamed:@"submit3"] forState:UIControlStateNormal];
    }else if(sender.selectedSegmentIndex == 2){
        sender.tintColor=[GLPostConfigurator getColorByType:@"日常"];
        self.lineView.backgroundColor=[GLPostConfigurator getColorByType:@"日常"];
        [self.submit setBackgroundImage:[UIImage imageNamed:@"submit2"] forState:UIControlStateNormal];
    }
}

#pragma mark - UITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView
{
    if(textView.text.length > 0){
        self.promptTitle.hidden = YES;
    }else{
        self.promptTitle.hidden = NO;
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString*,id>*)info {
    UIImage *image=info[UIImagePickerControllerOriginalImage];
    UIImageView* picture=[[UIImageView alloc] init];
    picture.image=image;
    [self.pictures addObject:image];
    picture.frame=[self.picturePos[self.picNum] CGRectValue];
    self.picNum++;
    if(self.picNum == 9) self.addPicture.enabled=NO;
    [self.view addSubview:picture];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - setter and getter

- (UIButton*)addPicture{
    if(_addPicture == nil){
        _addPicture=[[UIButton alloc] init];
        [_addPicture setBackgroundImage:[UIImage imageNamed:@"addPicture"] forState:UIControlStateNormal];
        _addPicture.backgroundColor=UIColor.clearColor;
        _addPicture.layer.borderWidth=0;
        [_addPicture addTarget:self action:@selector(addPhoto:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addPicture;
}

- (UIButton*)addTag{
    if(_addTag == nil){
        _addTag=[[UIButton alloc] init];
        [_addTag setBackgroundImage:[UIImage imageNamed:@"addTag"] forState:UIControlStateNormal];
        _addTag.backgroundColor=UIColor.clearColor;
        _addTag.layer.borderWidth=0;
        [_addTag addTarget:self action:@selector(addTags:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addTag;
}

- (UITextField*)titleInput{
    if(_titleInput == nil){
        _titleInput=[[UITextField alloc] init];
        _titleInput.placeholder=@"标题";
        _titleInput.font=[UIFont systemFontOfSize:25];
        _titleInput.backgroundColor=UIColor.clearColor;
        _titleInput.layer.borderWidth=0;
    }
    return _titleInput;
}

- (UITextView*)contentInput{
    if(_contentInput == nil){
        _contentInput=[[UITextView alloc] init];
        _contentInput.font=[UIFont systemFontOfSize:18];
        _contentInput.backgroundColor=UIColor.clearColor;
        _contentInput.layer.borderWidth=0;
        _contentInput.delegate=self;
    }
    return _contentInput;
}

- (UISegmentedControl*)typeSelect{
    if(_typeSelect == nil){
        NSArray* array=[[NSArray alloc] initWithObjects:@"分享",@"求助",@"日常",nil];
        _typeSelect=[[UISegmentedControl alloc] initWithItems:array];
        _typeSelect.apportionsSegmentWidthsByContent=YES;
        _typeSelect.tintColor=[GLPostConfigurator getColorByType:@"分享"];
        _typeSelect.selectedSegmentIndex=0;
        [_typeSelect addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    }
    return _typeSelect;
}

- (UILabel*)tag1{
    if(_tag1 == nil){
        _tag1=[[UILabel alloc] init];
        _tag1.text=@"";
        _tag1.backgroundColor=[GLPostConfigurator getTagColor];
        _tag1.layer.borderWidth=0;
        _tag1.layer.masksToBounds=YES;
        _tag1.layer.cornerRadius=[GLPostConfigurator getSubmitTagViewRadius];
        _tag1.textAlignment=NSTextAlignmentCenter;
        _tag1.hidden=YES;
    }
    return _tag1;
}

- (UILabel*)tag2{
    if(_tag2 == nil){
        _tag2=[[UILabel alloc] init];
        _tag2.text=@"";
        _tag2.backgroundColor=[GLPostConfigurator getTagColor];
        _tag2.layer.borderWidth=0;
        _tag2.layer.masksToBounds=YES;
        _tag2.layer.cornerRadius=[GLPostConfigurator getSubmitTagViewRadius];
        _tag2.textAlignment=NSTextAlignmentCenter;
        _tag2.hidden=YES;
    }
    return _tag2;
}

- (UILabel*)tag3{
    if(_tag3 == nil){
        _tag3=[[UILabel alloc] init];
        _tag3.text=@"";
        _tag3.backgroundColor=[GLPostConfigurator getTagColor];
        _tag3.layer.borderWidth=0;
        _tag3.layer.masksToBounds=YES;
        _tag3.layer.cornerRadius=[GLPostConfigurator getSubmitTagViewRadius];
        _tag3.textAlignment=NSTextAlignmentCenter;
        _tag3.hidden=YES;
    }
    return _tag3;
}

- (UIButton*)delete{
    if(_delete == nil){
        _delete=[[UIButton alloc] init];
        [_delete setBackgroundImage:[UIImage imageNamed:@"tagDelete"] forState:UIControlStateNormal];
        _delete.layer.masksToBounds=YES;
        _delete.layer.cornerRadius=[GLPostConfigurator getSubmitDeleteHeight]/2;
        _delete.layer.borderWidth=0;
        _delete.hidden=YES;
        [_delete addTarget:self action:@selector(deleteTags:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _delete;
}

- (UIView*)lineView{
    if(_lineView == nil){
        _lineView=[[UIView alloc] init];
        _lineView.backgroundColor=[GLPostConfigurator getColorByType:@"分享"];
        _lineView.layer.borderWidth=0;
    }
    return _lineView;
}

- (UILabel*)promptTitle{
    if(_promptTitle == nil){
        _promptTitle=[[UILabel alloc] init];
        _promptTitle.text=@"内容";
        _promptTitle.backgroundColor=UIColor.clearColor;
        _promptTitle.textAlignment=NSTextAlignmentLeft;
        _promptTitle.font=[UIFont systemFontOfSize:18];
        _promptTitle.textColor=UIColorFromHex(0xB8B8B8);
    }
    return _promptTitle;
}

- (UIButton*)submit{
    if(_submit == nil){
        _submit=[[UIButton alloc] init];
        [_submit setBackgroundImage:[UIImage imageNamed:@"submit1"] forState:UIControlStateNormal];
        _submit.backgroundColor=UIColor.clearColor;
        _submit.layer.borderWidth=0;
        [_submit addTarget:self action:@selector(goHome:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submit;
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
