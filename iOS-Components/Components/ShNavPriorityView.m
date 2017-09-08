//
//  ShNavPriorityView.m
//  LeeMall
//
//  Created by guest on 16/12/26.
//  Copyright © 2016年 zongqi.shen. All rights reserved.
//

#import "ShNavPriorityView.h"

#define distance_10 10.0

@interface ShNavPriorityView()<UITextFieldDelegate>

@end

@implementation ShNavPriorityView


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor=[UIColor blackColor];
        self.frame=CGRectMake(0, 0, SIZE.width, 64);
        self.btnLeft=[UIButton buttonWithType:UIButtonTypeCustom];
        self.btnLeft.frame=CGRectMake(distance_10, 20, 40, 30);
        [self.btnLeft setImage:[UIImage imageNamed:@"back-灰"] forState:UIControlStateNormal];
        self.btnLeft.adjustsImageWhenHighlighted = NO;
        [self.btnLeft addTarget:self action:@selector(btnLeftClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnLeft];
        
        
        self.btnRight=[UIButton  buttonWithType:UIButtonTypeCustom];
        self.btnRight.frame=CGRectMake(SIZE.width-distance_10-40, 20, 40, self.btnLeft.frame.size.height);
        self.btnRight.titleLabel.font=[UIFont systemFontOfSize:15];
        [self.btnRight setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self.btnRight addTarget:self action:@selector(btnRightClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnRight];
        
        
        self.centerTextF = [[UITextField alloc] initWithFrame:CGRectMake(self.btnLeft.frame.origin.x + self.btnLeft.frame.size.width + distance_10, self.btnLeft.frame.origin.y + self.btnLeft.frame.size.height, SIZE.width - distance_10 * 4 - self.btnLeft.frame.size.width + self.btnLeft.frame.size.width, self.btnLeft.frame.size.height)];
        self.centerTextF.delegate = self;
        self.centerTextF.placeholder = @"大家都在搜：ACE17";
        [self addSubview:self.centerTextF];

    }
    return self;
}

-(void)btnRightClick
{
    
    if ([self.delegate respondsToSelector:@selector(btnNavRightClick)])
    {
        [self.delegate btnNavRightClick];
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(navTouch)])
    {
        [self.delegate navTouch];
    }
}

-(void)btnLeftClick
{
    if ([self.delegate respondsToSelector:@selector(btnNavLeftClick)])
    {
        [self.delegate btnNavLeftClick];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
