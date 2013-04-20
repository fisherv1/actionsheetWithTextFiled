//
//  ViewController.h
//  testActionsheet
//
//  Created by Matthew Lu on 11/04/13.
//  Copyright (c) 2013 Matthew Lu. All rights reserved.
//

#import <UIKit/UIKit.h>


#define TEXT_FIELD_TAG 9999

#define ACTION_SHEET_TAG 8888


@interface ViewController : UIViewController<UIActionSheetDelegate,UITextFieldDelegate>
{

    UITextField *shopCodeText;
    UIActionSheet *sheetAlter;
     float sheetAlterHeight;
}
@end
