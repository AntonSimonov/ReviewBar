//
//  ReviewBar.h
//
//
//  Created by Anton Simonov on 12/19/16.
//  Copyright © 2016 Anton Simonov. All rights reserved.
//
/*
NOTE! Image of star has to be the right square (width = height)
MAX - Maximum stars count (Default = 5) YOU MAY SET DIFFERENT MAX IF YOU NEED MORE OR LESS THAT 5
Call makeSelectable function after allocation and initilization if wish to uset it as input view
By default shows only (no user interaction)
 */
#import <UIKit/UIKit.h>

@interface ReviewBar : UIView

@property NSInteger rating;
@property UIImage * img;
@property NSInteger max;

// CALL INIT METHOD AFTER ALLOCATION
-(id) initWithFrame:(CGRect)frame andImage:(UIImage*) image;
// SET RATING SCORE !USE THIS IF YOU WANT TO USE REVIEW BAR AS DISPLAY
-(void) setScore:(double)score;
// CALL makeSelectable AFTER ALLOCATION TO USE REVIEW BAR AS INPUT  (GET USER RATING)
-(void) makeSelectable;

//FUNCTIONS FOR USER INTERACTION
- (IBAction)selectRating:(id)sender;
- (void) deselectAll;

@end
