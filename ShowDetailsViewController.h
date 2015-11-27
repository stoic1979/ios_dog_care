//
//  ShowDetailsViewController.h
//  DogCare
//
//  Created by Weave Bytes Infotech on 26/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *dogImgVw;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *chipCodeLabel;
- (IBAction)editDtlsBtn:(id)sender;


@end
