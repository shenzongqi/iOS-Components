//
//  ShFloatWindow.m
//  LeeMall
//
//  Created by guest on 16/7/27.
//  Copyright © 2016年 zongqi.shen. All rights reserved.
//
#define HELP_DISTANCE 40

#import "ShFloatWindow.h"
#import "UIButton+Sh.h"

@implementation ShFloatWindow

//添加悬浮窗
+(void)showWindow:(id)tagert
{
    [self removeWindow];
    UIButton *btnAdd=[UIButton buttonWithType:UIButtonTypeCustom];
    btnAdd.frame =CGRectMake(SIZE.width-60, SIZE.height*0.6, 44, 44);
    [btnAdd setImage:[UIImage imageNamed:@"float_window"] forState:UIControlStateNormal];
    btnAdd.tag = 6321;
    [btnAdd addTarget:tagert action:@selector(btnAddClick:) forControlEvents:UIControlEventTouchUpInside];
    NSString *strCenter= [[NSUserDefaults standardUserDefaults] objectForKey:@"addCenter"];
    
    if (strCenter)
    {
        btnAdd.center= CGPointFromString(strCenter);
    }
    else
    {
        btnAdd.center=CGPointMake(SIZE.width-HELP_DISTANCE, btnAdd.center.y);
    }
    [[UIApplication sharedApplication].keyWindow addSubview:btnAdd];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:btnAdd];
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:tagert action:@selector(btnPan:)];
    [btnAdd addGestureRecognizer:pan];
    
}

//移除悬浮窗
+(void)removeWindow
{
    [[UIApplication sharedApplication].keyWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([NSStringFromClass([obj class]) isEqualToString:@"UIButton"])
        {
            UIButton *btn=obj;
            if (btn.tag==6321)
            {
                [btn removeFromSuperview];
            }
        }
    }];

}

-(void)btnPan:(UIPanGestureRecognizer *)pan
{
    CGPoint point=[pan translationInView:pan.view];
    
    pan.view.center=CGPointMake(pan.view.center.x+point.x, pan.view.center.y+point.y);
    [pan  setTranslation:CGPointZero inView:pan.view];
    
    if (pan.state==UIGestureRecognizerStateEnded)
    {
        if (pan.view.center.x>SIZE.width/2&&pan.view.center.x<(SIZE.width-HELP_DISTANCE))
        {
            [UIView animateWithDuration:0.3 animations:^{
                pan.view.center=CGPointMake((SIZE.width-HELP_DISTANCE), pan.view.center.y);
                [[NSUserDefaults standardUserDefaults] setObject:NSStringFromCGPoint(pan.view.center) forKey:@"addCenter"];
            }];
        }
        
        if (pan.view.center.x>(SIZE.width-HELP_DISTANCE))
        {
            [UIView animateWithDuration:0.3 animations:^{
                pan.view.center=CGPointMake((SIZE.width-HELP_DISTANCE), pan.view.center.y);
                [[NSUserDefaults standardUserDefaults] setObject:NSStringFromCGPoint(pan.view.center) forKey:@"addCenter"];
            }];
        }
        if (pan.view.center.x<SIZE.width/2&&pan.view.center.x>HELP_DISTANCE)
        {
            [UIView animateWithDuration:0.3 animations:^{
                pan.view.center=CGPointMake(HELP_DISTANCE, pan.view.center.y);
                [[NSUserDefaults standardUserDefaults] setObject:NSStringFromCGPoint(pan.view.center) forKey:@"addCenter"];
            }];
        }
        
        if (pan.view.center.x<HELP_DISTANCE)
        {
            [UIView animateWithDuration:0.3 animations:^{
                pan.view.center=CGPointMake(HELP_DISTANCE, pan.view.center.y);
                [[NSUserDefaults standardUserDefaults] setObject:NSStringFromCGPoint(pan.view.center) forKey:@"addCenter"];
            }];
        }
   
    }
}

@end
