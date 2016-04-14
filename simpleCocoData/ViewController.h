//
//  ViewController.h
//  simpleCocoData
//
//  Created by tongle on 16/4/14.
//  Copyright © 2016年 tongle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)addData:(id)sender;
- (IBAction)queryData:(id)sender;
- (IBAction)deleteData:(id)sender;
@property (strong,nonatomic)AppDelegate *myDelegate;




@end

