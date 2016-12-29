//
//  ReviewBar.m
// 
//
//  Created by Anton Simonov on 12/19/16.
//  Copyright © 2016 Anton Simonov. All rights reserved.
//

#import "ReviewBar.h"

#define   DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@implementation ReviewBar
@synthesize img,rating,max;

-(id) initWithFrame:(CGRect)frame andImage:(UIImage*) image {

    self = [super initWithFrame:frame];
    self.frame = frame;
    self.img = image;
    rating = 5;
    max = 5;
    return self;
}

-(void) setRatingScore:(double)score
{
    int whole = score;
    float decimal = fmod(score, 1.0);
    int currentX = self.bounds.origin.x;
    UIImageView * iv;
    int prop = self.frame.size.width/max;

    
    for (int i=0;i<whole;i++)
    {
        iv = [[UIImageView alloc] initWithImage:img];
        [iv setFrame:CGRectMake(currentX, 0, prop, prop)];
        [self addSubview:iv];
        currentX = currentX + prop;
    }
 
    if (decimal!=0.0) {
        iv = [[UIImageView alloc] initWithImage:img];
        [iv setFrame:CGRectMake(currentX, 0, prop, prop)];
        UIBezierPath * cPath = [UIBezierPath bezierPath];
        [cPath moveToPoint:CGPointMake(iv.frame.size.width/2 , iv.frame.size.height/2)];
        [cPath addArcWithCenter:CGPointMake(iv.frame.size.width/2 , iv.frame.size.height/2) radius:75.0 startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(360*decimal) clockwise:YES];
        CAShapeLayer * mask = [CAShapeLayer layer];
        [mask setBackgroundColor:[[UIColor whiteColor] CGColor]];
        mask.path = cPath.CGPath;
        iv.layer.mask = mask;
        [self addSubview:iv];
    }

    rating = score;
}

-(void)makeSelectable {
    UIImageView * im;
    int currentX = 0;
    int prop = self.frame.size.width/max;
    
    for (int i=1;i<max+1; i++) {
        im = [[UIImageView alloc] initWithImage:img];
        [im setFrame:CGRectMake(currentX, 0, prop, prop)];
        [im setAlpha:0.6];
        UIGestureRecognizer * ge = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectRating:)];
        [im setUserInteractionEnabled:YES];
        [im addGestureRecognizer:ge];
        [im setTag:i];
        [self addSubview:im];
        currentX = currentX + prop;
    }

}

- (IBAction)selectRating:(id)sender{
    
    UITapGestureRecognizer * ob = sender;
    UIImageView * im = (UIImageView*) [ob view];
    long tag = [im tag];
    [self deselectAll];
    for (int i=1; i<tag+1; i++)
    [[self viewWithTag:i] setAlpha:1.0];
    rating = tag;
}

-(void) deselectAll{
for (int i=1;i<max+1; i++)
    [[self viewWithTag:i] setAlpha:0.6];

}
@end
