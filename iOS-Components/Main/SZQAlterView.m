//
//  SZQAlterView.h
//  iOS-Components
//
//  Created by felix on 2016/5/6.
//  Copyright © 2016年 zongqi.shen. All rights reserved.
//

#import "SZQAlterView.h"

#define KSCREEN_W  [UIScreen mainScreen].bounds.size.width
#define KSCREEN_H   [UIScreen mainScreen].bounds.size.height


@interface SZQAlterView ()
/**标题lable*/
@property(strong,nonatomic)UILabel *titleLab;
/**内容lable*/
@property(strong,nonatomic)UILabel *contentLab;
/**取消Btn*/
@property(strong,nonatomic)UIButton *cancelBtn;
/**确定Btn*/
@property(strong,nonatomic)UIButton *sureBtn;

/**标题*/
@property(copy,nonatomic)NSString *title;
/**内容*/
@property(copy,nonatomic)NSString *content;
/**取消*/
@property(copy,nonatomic)NSString *cancelTitle;
/**确定*/
@property(copy,nonatomic)NSString *sureTitle;
@end
@implementation SZQAlterView

#pragma mark - 初始化（添加控件）
- (instancetype)initWithFrame:(CGRect)frame
{
    self =  [super initWithFrame:frame];
    if (self) {
        
        //   标题
        _titleLab = [[UILabel alloc]initWithFrame:(CGRect){0,0,self.bounds.size.width,50}];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor = [UIColor blackColor];
        [self addSubview:_titleLab];
        
        //   内容
        _contentLab = [[UILabel alloc]initWithFrame:(CGRect){0,CGRectGetMaxY(_titleLab.frame),self.bounds.size.width,50}];
        _contentLab.textAlignment = NSTextAlignmentCenter;
        _contentLab.textColor = [UIColor redColor];
        [self addSubview:_contentLab];
        
        //   取消按钮
        _cancelBtn = [[UIButton alloc]initWithFrame:(CGRect){0,CGRectGetMaxY(_contentLab.frame),self.bounds.size.width/2,50}];
        _cancelBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _cancelBtn.layer.borderWidth = 0.5;
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelBtn];
        
        //   确定按钮
        _sureBtn = [[UIButton alloc]initWithFrame:(CGRect){self.bounds.size.width/2,CGRectGetMaxY(_contentLab.frame),self.bounds.size.width/2,50}];
        _sureBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _sureBtn.layer.borderWidth = 0.5;
        [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureBtn];
    }
    
    return self;
}

#pragma mark----实现类方法
+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                           cancel:(NSString *)cancel
                             sure:(NSString *)sure
               cancel_Block_Clcik:(cancelBlock)cancelBlock
                 sure_Block_Click:(sureBlock)sureBlock
{
    
    SZQAlterView *alterView = [[SZQAlterView alloc]initWithFrame:(CGRect){0,0,250,150}];
    alterView.backgroundColor = [UIColor grayColor];
    alterView.center = (CGPoint){KSCREEN_W/2,KSCREEN_H/2};
    alterView.layer.cornerRadius = 5;
    alterView.layer.masksToBounds = YES;
    alterView.title=title;
    alterView.content=content;
    alterView.cancelTitle=cancel;
    alterView.sureTitle=sure;
    alterView.cancel_block=cancelBlock;
    alterView.sure_block=sureBlock;
    return alterView;
    
}

#pragma mark--给属性重新赋值
-(void)setTitle:(NSString *)title
{
    _titleLab.text  = title;
}

-(void)setContent:(NSString *)content
{
    _contentLab.text = content;
}

-(void)setSureTitle:(NSString *)sureTitle
{
    [_sureBtn setTitle:sureTitle forState:UIControlStateNormal];
}

- (void)setCancelTitle:(NSString *)cancelTitle
{
    [_cancelBtn setTitle:cancelTitle forState:UIControlStateNormal];
}

#pragma mark----取消按钮点击事件
-(void)cancelBtClick
{
    [self removeFromSuperview];
    self.cancel_block();
}
#pragma mark----确定按钮点击事件
-(void)sureBtClick
{
    [self removeFromSuperview];
    self.sure_block();
    
}
@end

