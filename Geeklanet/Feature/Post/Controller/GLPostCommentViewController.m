//
//  GLPostCommentViewController.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/8.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostCommentViewController.h"

@interface GLPostCommentViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate>

@property (strong,nonatomic) UIButton* addPicture;
@property (strong,nonatomic) UIButton* submit;
@property (strong,nonatomic) UITextView* contentInput;
@property (strong,nonatomic) UILabel* promptTitle;
@property (strong,nonatomic) UIView* lineView;

@property (nonatomic) int picNum;
@property (nonatomic) NSMutableArray* picturePos;
@property (nonatomic) NSMutableArray* pictures;

@end

@implementation GLPostCommentViewController

- (instancetype)init{
    if(self = [super init]){
        self.picNum=0;
        self.picturePos=[[NSMutableArray alloc] init];
        self.pictures=[[NSMutableArray alloc] init];
        
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
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.submit];
    [self.view addSubview:self.promptTitle];
    [self.view addSubview:self.contentInput];
    [self.view addSubview:self.addPicture];
    [self.view addSubview:self.lineView];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.addPicture.frame=CGRectMake(20, self.view.frame.size.height-71, 35, 35);
    self.contentInput.frame=CGRectMake(35, 110, 345, 300);
    self.lineView.frame=CGRectMake(35, 410, 345, 2);
    self.promptTitle.frame=CGRectMake(42, 118, 40, 20);
    self.submit.frame=CGRectMake(360, 55, 40, 40);
}

#pragma mark - response

- (void)addPhoto:(UIButton*)sender{
    UIImagePickerController* picker=[[UIImagePickerController alloc] init];
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate=self;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)goHome:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:YES];
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

- (UIView*)lineView{
    if(_lineView == nil){
        _lineView=[[UIView alloc] init];
        _lineView.backgroundColor=UIColorFromHex(0x707070);
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
        [_submit setBackgroundImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
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
