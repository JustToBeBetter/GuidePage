//
//  GuidePagesView.m
//  GuidePage
//
//  Created by DBOX on 2016/12/19.
//  Copyright © 2016年 DBOX. All rights reserved.
//

#import "GuidePagesView.h"
#import "YLGIFImage.h"
#define kScreenSize  [UIScreen mainScreen].bounds.size
#define Scale kScreenSize.width/320

@implementation GuidePagesView

{
    CGFloat beginContentOffsetX;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        }
    return self;
}
+ (void)showGuidPagesView{
    
  GuidePagesView *showView = [[[NSBundle mainBundle]loadNibNamed:@"GuidePagesView" owner:self options:nil]lastObject];
    [showView initAnimate];
    
    showView.frame = CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    showView.alpha = 0;
    [[[UIApplication sharedApplication] keyWindow] addSubview:showView];
    [UIView animateWithDuration:0.3 animations:^{
        showView.alpha = 1;
    }];

}
- (void)initAnimate{
    // 页面1
    [UIView animateWithDuration:0.3 animations:^{
        self.pageControl_Bottom.constant = 5;
        [self.pageControl setNeedsLayout];
        [self.pageControl layoutIfNeeded];
    }];
    
    //页面2
    
    self.pageTwo_BgImg_Width.constant = kScreenSize.width;
    self.pageTwo_BgImg_Height.constant = 312 * Scale;
    
    //页面3
    
    
    
    //页面4
    
    self.pageFive_BgImg_2.transform = CGAffineTransformMakeScale(0.9, 0.9);
    self.pageFour_BgImg_2.alpha = 0;
    
    //页面5
    
    self.pageFive_BgImg_1_Width.constant = 650 *Scale;
    self.pageFive_BgImg_1_Height.constant = 650 *Scale;
    self.pageFive_BgImg_1_Bottom.constant = -262 *Scale;
    
    [self goRatation];
    
    NSURL *path = [[NSBundle mainBundle] URLForResource:@"5_run" withExtension:@"gif"] ;
    
    NSData *data = [NSData dataWithContentsOfURL:path];
    
    self.pageFive_RunImg.image = [YLGIFImage imageWithData:data];
    self.pageFive_RunImg_Left.constant = 49 *Scale;
    self.pageFive_RunImg_Bottom.constant = 217 *Scale;
    
}

//地球旋转

- (void)goRatation{
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = @(0.0);
    rotateAnimation.toValue = @(-(M_PI *2.0));
    rotateAnimation.duration = 40;
    rotateAnimation.repeatCount = MAXFLOAT;
    [self.pageFive_BgImg_1.layer addAnimation:rotateAnimation forKey:nil];
    
}
 //滑动页面1  动画

- (void)scrollPageOneAnimateWithRate:(CGFloat)rate{
    
    self.pageOne_BgImg_1.alpha = 1 - rate *2;
    self.pageOne_BgImg_2.alpha = 1 - rate;
    self.pageOne_BgImg_2.transform = CGAffineTransformMakeScale(1-rate*2, 1-rate*2);
    self.pageOne_ContentImg_1_top.constant = 25 + 350 *rate;
    CGFloat pageTwoViewTransform = rate+0.3 > 1? 1:rate + 0.3;
    self.pageTwoView.alpha = rate;
    self.pageTwoView.transform = CGAffineTransformMakeScale(pageTwoViewTransform, pageTwoViewTransform);

}
- (void)scrollPageTwoAnimateWithRate:(CGFloat)rate{
    
    CGFloat oldImg_Width  = kScreenSize.width;
    CGFloat oldImg_Height = 312 * Scale;
    CGFloat oldImg_Top    = 100;
    CGFloat oldImg_Left   = 0;
    
    CGFloat newImg_Width  = 130 * Scale;
    CGFloat newImg_Height = 130 * Scale;
    CGFloat newImg_Top    = 140;
    CGFloat newImg_Left   = (kScreenSize.width/2-(newImg_Width/2))+kScreenSize.width;
    
    self.pageTwo_BgImg_Width.constant  = oldImg_Width - ((oldImg_Width - newImg_Width) * rate);
    self.pageTwo_BgImg_Height.constant = oldImg_Height - ((oldImg_Height - newImg_Height) * rate);
    self.pageTwo_BgImg_Top.constant    = oldImg_Top - ((oldImg_Top - newImg_Top) * rate);
    self.pageTwo_BgImg_Left.constant   = oldImg_Left - ((oldImg_Left - newImg_Left) * rate);
    
    CGFloat pageThreeBgImgTransform = rate + 0.3 > 1 ? 1 : rate + 0.3;
    self.pageThree_BgImg_1.transform = CGAffineTransformMakeScale(pageThreeBgImgTransform,pageThreeBgImgTransform);
    self.pageThree_BgImg_2.transform = CGAffineTransformMakeScale(rate,rate);
    self.pageThree_BgImg_3.transform = CGAffineTransformMakeScale(rate,rate);
    self.pageThree_BgImg_2.alpha = rate;
    self.pageThree_BgImg_3.alpha = rate;
    self.pageThree_BgImg_3_Top.constant = 100 - 400 * (1 - rate);
    
    self.pageThree_ContentImg_1.alpha = rate;
    self.pageThree_ContentImg_2.alpha = rate;
    self.pageThree_ContentImg_1_top.constant = 40 + 400 * (1 - rate);
}
//滑动页面 3 动画
- (void)scrollPageThreeAnimateWithRate:(CGFloat)rate{
    CGFloat img_Width  = 130 * Scale;
    CGFloat img_Left   = (kScreenSize.width/2-(img_Width/2))+kScreenSize.width;
    
    self.pageTwo_BgImg_Left.constant = img_Left + kScreenSize.width * rate;
    self.pageTwo_BgImg_Top.constant = 140 + (110 * kScreenSize.width) * rate;
    self.pageTwo_BgImg.alpha = 1 - rate*2;
    self.pageTwo_BgImg.transform = CGAffineTransformMakeScale(1 - rate,1 - rate);
    
    self.pageThreeView.alpha = 1 - rate*2;
    self.pageThreeView.transform = CGAffineTransformMakeScale(1 - rate,1 - rate);
    self.pageThreeView_Left.constant = kScreenSize.width * rate;
    self.pageThreeView_Right.constant = -(kScreenSize.width * rate);
    
    self.pageFourView.alpha = rate;
    self.pageFour_View.transform = CGAffineTransformMakeScale(rate,rate);
    self.pageFour_View_Left.constant = -(kScreenSize.width * (1 - rate));
    self.pageFour_View_Right.constant = kScreenSize.width * (1 - rate);
    self.pageFour_View_Top.constant = kScreenSize.height * (1 - rate);
    self.pageFour_View_Bottom.constant = -(kScreenSize.height * (1 - rate));

}
//滑动页面 4 动画
- (void)scrollPageFourAnimateWithRate:(CGFloat)rate{
    
    CGFloat pageFourViewTransform = 1 - rate < 0.3 ? 0.3 : 1 - rate;
    
    self.pageFour_View.transform = CGAffineTransformMakeScale(pageFourViewTransform,pageFourViewTransform);
    self.pageFour_View.alpha = 1 - rate;
    self.pageFour_View_Left.constant = kScreenSize.width * rate;
    self.pageFour_View_Right.constant = -(kScreenSize.width * rate);
    
    self.pageFiveView.alpha = rate;
    self.pageFourView_Left.constant = -(kScreenSize.width * (1 - rate));
    self.pageFourView_Right.constant = kScreenSize.width * (1 - rate);
    self.pageFive_BgImg_1.transform = CGAffineTransformMakeScale(1+2*(1-rate),1+2*(1-rate));
    
    self.pageFive_ContentImg_1_top.constant = 100 - (500*(1 - rate));
    self.pageFive_ContentImg_2_Bottom.constant = 93 - (500*(1 - rate));
    
    self.pageFive_RunImg.transform = CGAffineTransformScale(CGAffineTransformMakeRotation((360*(M_PI / 180.0))*rate),rate,rate);
    
    self.pageControl_Bottom.constant = 5 - (100 * rate);

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)loadInApp:(UIButton *)sender {
    
    self.pageScrollView.scrollEnabled = false;
    [UIView animateWithDuration:0.5 animations:^{
        sender.alpha = 0;
        self.pageFive_LoadBtn.alpha = 0;
        self.pageFive_RunImg.alpha = 0;
        self.pageFive_RunImg = nil;
    }];
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.pageFive_BgImg_1.transform = CGAffineTransformMakeScale(3, 3);
        self.pageFive_ContentImg_1_top.constant = -400;
        [self.pageFive_ContentImg_1 setNeedsLayout];
        [self.pageFive_ContentImg_1 layoutIfNeeded];
        
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.pageControl.currentPage = scrollView.contentOffset.x/kScreenSize.width;
    CGFloat rate = (CGFloat)((int)(scrollView.contentOffset.x)%(int)kScreenSize.width)/((int)kScreenSize.width);
    
    if (scrollView.contentOffset.x > 0) {
        if (scrollView.contentOffset.x
             - beginContentOffsetX) {
            
            // 从左到右滑动
            
            if (scrollView.contentOffset.x > kScreenSize.width *3) {
                //从第四到第五张
                [self scrollPageFourAnimateWithRate:rate];
                
            }else if (scrollView.contentOffset.x >kScreenSize.width *2 ){
                
                 //从第三到第四张
                [self scrollPageThreeAnimateWithRate:rate];
                
            }else if (scrollView.contentOffset.x >kScreenSize.width ){
                
                //从第二到第三张
                [self scrollPageTwoAnimateWithRate:rate];
                
            }else if (scrollView.contentOffset.x >0){
                
                //从第一到第二张
                [self scrollPageOneAnimateWithRate:rate];
            }
        
        }else{
            
            // 从右到左滑动
            if (scrollView.contentOffset.x < kScreenSize.width) {
                
                //从第二到第一张
                [self scrollPageOneAnimateWithRate:rate];
                
            }else if (scrollView.contentOffset.x < kScreenSize.width *2 ){
                
                 //从第三到第二张
                [self scrollPageTwoAnimateWithRate:rate];
                
            }else if (scrollView.contentOffset.x < kScreenSize.width * 3 ){
                
                //从第四到第三张
                [self scrollPageThreeAnimateWithRate:rate];
                
            }else if (scrollView.contentOffset.x < kScreenSize.width *4){
                
                //从第五到第四张
                [self scrollPageFourAnimateWithRate:rate];
                
            }
            
        }
    }
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    beginContentOffsetX = scrollView.contentOffset.x;
}
@end
