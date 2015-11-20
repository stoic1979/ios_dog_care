//
//  AddVisitsSurgeriesDetailsViewController.m
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddVisitsSurgeriesDetailsViewController.h"

@interface AddVisitsSurgeriesDetailsViewController ()

@end

@implementation AddVisitsSurgeriesDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.visitsScrollView.showsVerticalScrollIndicator = YES;
    self.visitsScrollView.showsHorizontalScrollIndicator = YES;
    self.visitsScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 650);
    [self.view addSubview:self.visitsScrollView];

    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    // Do any additional setup after loading the view.
}

-(void)doneAction
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
