//
//  NotesViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 16/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "NotesViewController.h"
#import "DBManager.h"

@interface NotesViewController ()

@end

@implementation NotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    
    self.dogCareNoteAry = [[NSMutableArray alloc]init];
    
    self.dogsCareNotes.layer.cornerRadius = 5.0f;
    self.dogsCareNotes.layer.borderWidth = 1.0f;
    self.dogsCareNotes.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    DBManager *dbManager = [[DBManager alloc]init];
    
    if([[defaults objectForKey:@"NotesWork"] isEqualToString:@"notesEdit"])
    {
        NSMutableArray *resltsAry = [dbManager fetchNotesDetails:[defaults integerForKey:@"dogInfoId"]];
        
        NSLog(@"%@",resltsAry);
        self.dogCareNoteAry = [resltsAry objectAtIndex:[defaults integerForKey:@"indexNumber"]];
        
        self.dogsCareNotes.text = [self.dogCareNoteAry objectAtIndex:1];
    }
    
}

#pragma mark - HIDING KEYBOARD

-(void)dismissKeyboard
{
    for (UIView *view in self.view.subviews)
        [view resignFirstResponder];
    [self.view endEditing:YES];
}





-(void)doneAction
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    DBManager *dbManager = [[DBManager alloc]init];
    
    if([self.dogsCareNotes.text isEqualToString:@""])
    {
        UIAlertView *alrtView = [[UIAlertView alloc]initWithTitle:@"Enter Memo Details" message:@"Please fill the empty fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrtView show];
    }
    else
    {
        if([[defaults objectForKey:@"NotesWork"] isEqualToString:@"notesAdd"])
        {
            [dbManager createNotesTable];
            [dbManager saveNotesDetails:self.dogsCareNotes.text :[defaults integerForKey:@"dogInfoId"]];
        }
        else
        {
            
            NSLog(@"%d",[(NSNumber*)[self.dogCareNoteAry objectAtIndex:0]intValue]);
            [dbManager updateNotesDetails:self.dogsCareNotes.text :[(NSNumber*)[self.dogCareNoteAry objectAtIndex:0]intValue]];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
