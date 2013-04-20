//
//  ViewController.m
//  testActionsheet
//
//  Created by Matthew Lu on 11/04/13.
//  Copyright (c) 2013 Matthew Lu. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)showaActionSheet:(id)sender {
    [self showSheetView];
}


-(void)showSheetView
{
        
     NSString*   sheetTitleString=@"\n\n\n\n\n\n\n\n";
     UIView*   sheetView = [[UIView alloc] init];
 

    sheetAlter = [[UIActionSheet alloc] initWithTitle:sheetTitleString delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Redeem Now" otherButtonTitles:nil, nil];
    
       [sheetAlter setActionSheetStyle:UIActionSheetStyleBlackTranslucent];

    UILabel *titlelbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 20, 320-40, 40)];
    titlelbl.backgroundColor=[UIColor clearColor];
    titlelbl.textColor=[UIColor whiteColor];
    titlelbl.numberOfLines = 0;
    titlelbl.font=[UIFont systemFontOfSize:13];
    titlelbl.adjustsFontSizeToFitWidth = YES;
    titlelbl.text=@"There are several similar stores in this area, and we need to be sure you are at the correct store.";
    titlelbl.frame = [self height:titlelbl.text labelObj:titlelbl];
    [sheetView addSubview:titlelbl];


    UILabel *desclbl=[[UILabel alloc] initWithFrame:CGRectMake(20,titlelbl.frame.origin.y+titlelbl.frame.size.height+10, 320-40, 40)];
    desclbl.backgroundColor=[UIColor clearColor];
    desclbl.textColor=[UIColor whiteColor];
    desclbl.numberOfLines = 0;
    desclbl.font=[UIFont boldSystemFontOfSize:14];
    desclbl.adjustsFontSizeToFitWidth = YES;
    desclbl.text=@"Please enter the Shop Code for this store. Ask staff for the code, or look for a sign on the wall.";
    desclbl.frame = [self height:desclbl.text labelObj:desclbl];
    [sheetView addSubview:desclbl];


    UILabel *shopcodelbl=[[UILabel alloc] initWithFrame:CGRectMake(20, desclbl.frame.origin.y+desclbl.frame.size.height+10, 320-40, 40)];
    shopcodelbl.backgroundColor=[UIColor clearColor];
    shopcodelbl.textColor=[UIColor whiteColor];
    shopcodelbl.numberOfLines = 0;
    shopcodelbl.font=[UIFont boldSystemFontOfSize:20];
    shopcodelbl.text=@"Shop Code:";
    [sheetView addSubview:shopcodelbl];


    UITextField *fakeTextField = [[UITextField alloc] initWithFrame:CGRectMake(160, desclbl.frame.origin.y+desclbl.frame.size.height+15, 100.f, 30.f)];
    fakeTextField.borderStyle=UITextBorderStyleRoundedRect;
    fakeTextField.backgroundColor = [UIColor whiteColor];
    [sheetView addSubview:fakeTextField];
    
     [sheetView setFrame:CGRectMake(0, 0, 320, shopcodelbl.frame.origin.y+shopcodelbl.frame.size.height+10)];
     [sheetAlter addSubview:sheetView];

    sheetAlter.tag=ACTION_SHEET_TAG;

    shopCodeText = [[UITextField alloc] initWithFrame:CGRectMake(160.f,250.f, 100.f, 30.f)];
    [shopCodeText setBackgroundColor:[UIColor clearColor]];
    shopCodeText.delegate= self;
    shopCodeText.keyboardAppearance= UIKeyboardAppearanceDefault;
    shopCodeText.tag=TEXT_FIELD_TAG;
    //shopCodeText.borderStyle=UITextBorderStyleRoundedRect;
    shopCodeText.borderStyle = UITextBorderStyleNone;
    [sheetAlter addSubview:shopCodeText];
    
    UIWindow* appWindow = [UIApplication sharedApplication].keyWindow;
    

    [sheetAlter showInView:appWindow];

    [self performSelector: @selector(acceptInput:) withObject: sheetAlter];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{

        if(textField.tag == TEXT_FIELD_TAG)
        {
            [self showShopCodeTextField];
            sheetAlterHeight = sheetAlter.frame.origin.y;
            sheetAlter.frame = CGRectMake(0, 50, sheetAlter.frame.size.width, sheetAlter.frame.size.height);
            shopCodeText.frame = CGRectMake(160.f,181.f, 100.f, 30.f);
        }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   // [self hideShopCodeTextField];
    shopCodeText.frame =CGRectMake(160.f,310.f, 100.f, 30.f);
    [shopCodeText resignFirstResponder];

    sheetAlter.frame = CGRectMake(0, 180, sheetAlter.frame.size.width, sheetAlter.frame.size.height);
    return  NO;
}


-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
        [self hideShopCodeTextField];
    
    switch (buttonIndex) {
        case 0:
            //Redeem button click
     
            NSLog(@"ShopCode is %@",shopCodeText.text);
            
            break;
        case 1:
            //Cancel button click

            break;
            
        default:
            break;
    }
}

-(void)hideShopCodeTextField
{
    [shopCodeText setAlpha:0];
    [shopCodeText setBackgroundColor:[UIColor clearColor]];
    shopCodeText.borderStyle = UITextBorderStyleNone;
}

-(void)showShopCodeTextField
{
    [shopCodeText setAlpha:1];
    [shopCodeText setBackgroundColor:[UIColor whiteColor]];
    shopCodeText.borderStyle = UITextBorderStyleRoundedRect;
}

//- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch=[touches anyObject];
//    if ([touch tapCount] == 1) {
//        NSTimeInterval animationDuration = 0.3f;
//        [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
//        [UIView setAnimationCurve:animationDuration];
//        CGRect rect=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//        self.view.frame=rect;
//        [UIView commitAnimations];
//        [shopCodeText resignFirstResponder];
//    }
//}

-(void)acceptInput: (UIActionSheet*)actionSheet
{

    UITextField*    textField = (UITextField*)[actionSheet viewWithTag:TEXT_FIELD_TAG];
    
    UIWindow* appWindow = [UIApplication sharedApplication].keyWindow;

    CGRect   frame     = textField.frame;

    [appWindow insertSubview:textField aboveSubview:actionSheet];

    frame.origin.y += 60.0; // move text field to same position as on action sheet

    textField.frame = frame;
}


- (CGRect) height:(NSString *) string labelObj:(UILabel *) labelName {
    //CGSize maximumLabelSize = CGSizeMake(353,9999);
    CGSize maximumLabelSize = CGSizeMake(labelName.frame.size.width,MAXFLOAT);
    CGSize expectedLabelSize = [string sizeWithFont:labelName.font constrainedToSize:maximumLabelSize lineBreakMode:labelName.lineBreakMode];
    //adjust the label the the new height.
    CGRect newFrame = labelName.frame;
    newFrame.size.height = expectedLabelSize.height;
    return newFrame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
