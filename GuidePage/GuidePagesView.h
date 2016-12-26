//
//  GuidePagesView.h
//  GuidePage
//
//  Created by DBOX on 2016/12/19.
//  Copyright © 2016年 DBOX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"
@interface GuidePagesView : UIView<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageControl_Bottom;
@property (weak, nonatomic) IBOutlet UIScrollView *pageScrollView;

/**
 *  page 1
 */
@property (weak, nonatomic) IBOutlet UIImageView *pageOne_BgImg_1;
@property (weak, nonatomic) IBOutlet UIImageView *pageOne_BgImg_2;
@property (weak, nonatomic) IBOutlet UIImageView *pageOne_ContentImg_1;
@property (weak, nonatomic) IBOutlet UIImageView *pageOne_ContentImg_2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageOne_ContentImg_1_top;

/**
 *  page2
 */
@property (weak, nonatomic) IBOutlet UIView *pageTwoView;
@property (weak, nonatomic) IBOutlet UIImageView *pageTwo_BgImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageTwo_BgImg_Top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageTwo_BgImg_Left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageTwo_BgImg_Width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageTwo_BgImg_Height;
@property (weak, nonatomic) IBOutlet UIImageView *pageTwo_ContentImg_1;

@property (weak, nonatomic) IBOutlet UIImageView *pageTwo_ContentImg_2;
/**
 *  page3
 */

@property (weak, nonatomic) IBOutlet UIView *pageThreeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageThreeView_Left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageThreeView_Right;
@property (weak, nonatomic) IBOutlet UIImageView *pageThree_BgImg_1;
@property (weak, nonatomic) IBOutlet UIImageView *pageThree_BgImg_2;
@property (weak, nonatomic) IBOutlet UIImageView *pageThree_BgImg_3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageThree_BgImg_3_Top;
@property (weak, nonatomic) IBOutlet UIImageView *pageThree_ContentImg_1;
@property (weak, nonatomic) IBOutlet UIImageView *pageThree_ContentImg_2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageThree_ContentImg_1_top;

/**
 *  page4
 */
@property (weak, nonatomic) IBOutlet UIView *pageFourView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFourView_Top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFourView_Bottom;
@property (weak, nonatomic) IBOutlet UIImageView *pageFour_BgImg_1;
@property (weak, nonatomic) IBOutlet UIImageView *pageFour_BgImg_2;
@property (weak, nonatomic) IBOutlet UIImageView *pageFour_ContentImg_1;
@property (weak, nonatomic) IBOutlet UIImageView *pageFour_ContentImg_2;

@property (weak, nonatomic) IBOutlet UIView *pageFour_View;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFour_View_Top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFour_View_Left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFour_View_Right;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFour_View_Bottom;


/**
 *  page5
 */
@property (weak, nonatomic) IBOutlet UIView *pageFiveView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFourView_Left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFourView_Right;
@property (weak, nonatomic) IBOutlet UIImageView *pageFive_BgImg_1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFive_BgImg_1_Width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFive_BgImg_1_Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFive_BgImg_1_Bottom;
@property (weak, nonatomic) IBOutlet UIImageView *pageFive_BgImg_2;
@property (weak, nonatomic) IBOutlet UIImageView *pageFive_ContentImg_1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFive_ContentImg_1_top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFive_ContentImg_2_Bottom;
@property (weak, nonatomic) IBOutlet YLImageView *pageFive_RunImg;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFive_RunImg_Left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageFive_RunImg_Bottom;
- (IBAction)loadInApp:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *pageFive_LoadBtn;

+ (void)showGuidPagesView;
@end
