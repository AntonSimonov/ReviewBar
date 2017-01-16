# ReviewBar
Subclass of UIView. Displays review score or get score from user.

 **How to use:**

## 1
   Add ReviewBar class to your project directory.
## 2
   Import ReviewBar where you want to use it.
   `#import "ReviewBar.h";`
## 3
Alllocate and initialaze ReviewBar instance. <br>
 (Must use `-(id)initWithFrame:(CGRect)frame;` method)<br>
`ReviewBar * rBar = [[ReviewBar alloc]initWithFrame:yourFrame];`
## 4
  Set star image you want. `[rBar setImage:[UIImage imageNamed:@"star.png"]];`
  <br> **!NOTE:** The image has to be right square (width = height)
## 5
  Use `-(void)setScore:(double score);` method to change rating score you want to display.
  <br>`[rBar setScore:3.7f];`

## 6
   Add ReviewBar to desired view
   `[view addSubview:rBar];`

 *That is all steps if you want to use ReviewBar to display rating score*

> If you want to use ReviewBar as input

* Call `-(void)makeSelectable;` method to handle taps.
* Check if user set the rating `-(bool)isSelected;`
* Get the result with `-(double)getRating;`
