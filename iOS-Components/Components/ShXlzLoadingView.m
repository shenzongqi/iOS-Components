//
//  ShXlzLoadingView.m
//  LeeMall
//
//  Created by Felix on 17/1/7.
//  Copyright © 2017年 zongqi.shen. All rights reserved.
//

#import "ShXlzLoadingView.h"


@interface ShXlzLoadingView()
@property (nonatomic, retain)UIView *viewAlpha;
@property (nonatomic, retain)UIImageView *gifImageView;
@property (nonatomic, retain)UILabel *titleLabel;

@end

@implementation ShXlzLoadingView

+(ShXlzLoadingView *)showLoading
{
    static ShXlzLoadingView *show = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        show = [[self alloc] initWithFrame:CGRectMake(0,64,SIZE.width,SIZE.height - 64)];
    });
    return show;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor= [UIColor whiteColor];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (frame.size.height - 20)/2, SIZE.width, 20)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = @"100%正品·30天包退换·24小时发货";
        self.titleLabel.font = FONT_14;
        self.titleLabel.textColor = COLOR_323232;
        [self addSubview:self.titleLabel];
        
        self.gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SIZE.width - 50)/2, self.titleLabel.frame.origin.y - 55, 50, 50)];
        NSMutableArray *arrImages=[NSMutableArray arrayWithCapacity:0];
        for (NSUInteger i = 1; i<=46; i++) {
            [arrImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"Image.bundle/football%zd", i]]];
        }
        [self addSubview:self.gifImageView];
        //动画
        self.gifImageView.animationImages = [arrImages copy];
        [self.gifImageView setAnimationDuration:46*0.06f];
        self.gifImageView.animationRepeatCount = 0;//设置动画次数 0 表示无限
        
    }
    return self;
}
+(void)show
{
    ShXlzLoadingView *loading = nil;
    loading = [ShXlzLoadingView showLoading];
    [loading.gifImageView startAnimating];
    [[UIApplication sharedApplication].keyWindow addSubview:loading];
}
+(void)remove
{
    ShXlzLoadingView *loading = nil;
    loading = [ShXlzLoadingView showLoading];
    [loading removeFromSuperview];
}

@end
