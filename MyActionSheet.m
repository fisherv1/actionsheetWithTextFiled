//
//  MyActionSheet.m
//  testActionsheet
//
//  Created by Matthew Lu on 11/04/13.
//  Copyright (c) 2013 Matthew Lu. All rights reserved.
//

#import "MyActionSheet.h"

@implementation MyActionSheet
@synthesize textField;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}





- (id)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles{
    self = [super initWithTitle:title delegate:delegate cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil, nil];
    
    
    if (self) {
		// Create and add UITextField to UIAlertView
		UITextField *myTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
		myTextField.autocorrectionType = UITextAutocorrectionTypeNo;
		myTextField.alpha = 0.75;
		myTextField.borderStyle = UITextBorderStyleRoundedRect;
		myTextField.delegate = delegate;
		[self setTextField:myTextField];
		// insert UITextField before first button
		BOOL inserted = NO;
		for( UIView *view in self.subviews ){
			if(!inserted && ![view isKindOfClass:[UILabel class]])
				[self insertSubview:myTextField aboveSubview:view];
		}
        
		// add a transform to move the UIAlertView above the keyboard
	}
	return self;

}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return  NO;
}


-(void)show:(UIView*)view{

    [super showInView:view];
    [[self textField] becomeFirstResponder];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
