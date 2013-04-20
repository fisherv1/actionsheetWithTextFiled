//
//  MyActionSheet.h
//  testActionsheet
//
//  Created by Matthew Lu on 11/04/13.
//  Copyright (c) 2013 Matthew Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyActionSheet : UIActionSheet<UITextFieldDelegate>
{
    UITextField *textField;
}
@property (nonatomic, retain) UITextField *textField;



- (id)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;
@end
