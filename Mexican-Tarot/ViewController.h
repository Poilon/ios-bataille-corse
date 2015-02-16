//
//  ViewController.h
//  Mexican-Tarot
//
//  Created by Poilon on 09/05/13.
//  Copyright (c) 2013 Poilon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stack.h"
#import "Card.h"

@interface ViewController : UIViewController

- (IBAction)reagir:(id)sender;
- (IBAction)reactP2:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnP2;

@property (weak, nonatomic) IBOutlet UIButton *btnCard;


@property (weak, nonatomic) IBOutlet UIButton *btnTapP1;
@property (weak, nonatomic) IBOutlet UIButton *btnTapP2;

@property (weak, nonatomic) IBOutlet UIImageView *centerStack;

@property (weak, nonatomic) IBOutlet UILabel *player1Turn;

@property (weak, nonatomic) IBOutlet UILabel *player2Turn;

- (IBAction)reactTapP1:(id)sender;
- (IBAction)reactTapP2:(id)sender;



- (void)setImageToImageView:(UIImageView *)imgView ofStack:(Stack *)stack;


@end
