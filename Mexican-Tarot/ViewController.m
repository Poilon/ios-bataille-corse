//
//  ViewController.m
//  Mexican-Tarot
//
//  Created by Poilon on 09/05/13.
//  Copyright (c) 2013 Poilon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

Stack *gameOfPlayer1;
Stack *gameOfPlayer2;
Stack *centerStack;
Boolean player1turn;

UIImage *btnGreyImage;

int counter;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    player1turn = true;
    
    Stack *cardGame = [[Stack alloc] initComplete];
    [cardGame shakeCardGame];
    
    gameOfPlayer1 = [[Stack alloc] init];
    gameOfPlayer2 = [[Stack alloc] init];

    centerStack = [[Stack alloc] init];
    [cardGame dealInGame1:gameOfPlayer1 andGame2:gameOfPlayer2];

    
    UIImage *btnImage = [UIImage imageNamed:@"100px-Card_back.png"];

    
    [_btnCard setImage:btnImage forState:UIControlStateNormal];
    [_btnP2 setImage:btnImage forState:UIControlStateNormal];
    
    btnGreyImage = [UIImage imageNamed:@"grey-card.png"];

    _player2Turn.text = @"";
    _player1Turn.text = @"Your Turn !";

    counter = 5;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reagir:(id)sender
{

    [gameOfPlayer1 printCards];
    NSLog(@"---------------");
    [gameOfPlayer2 printCards];
    NSLog(@"---------------");

    
    if (player1turn == true)
    {
        [centerStack addCard:[gameOfPlayer1 dealCard]];
        
        int cardValue = [[centerStack lastCard] Value];
        
        if (cardValue == 1)
            cardValue = 14;
        
        if (cardValue > 10)
        {
            counter = cardValue - 10;
            _player1Turn.text = @"";
            _player2Turn.text = @"Your Turn !";
            player1turn = false;
        }
        
        if (counter == 5)
        {
            _player1Turn.text = @"";
            _player2Turn.text = @"Your Turn !";
            player1turn = false;
        }
        
        if (counter == 0)
        {
            [gameOfPlayer2 winCards:centerStack];
            _player1Turn.text = @"";
            _player2Turn.text = @"Your Turn !";
            player1turn = false;
            counter = 5;
        }
        
        
        
        if ([centerStack lastCard] != Nil)
        {
            [self setImageToImageView:_centerStack ofStack:centerStack];

            
        }
        else
            [_centerStack setImage:btnGreyImage];
        
        
        if ([gameOfPlayer1 lastCard] == Nil)
            [_btnCard setImage:btnGreyImage forState:UIControlStateNormal];

        if (counter != 5)
            counter --;

    }
}

- (IBAction)reactP2:(id)sender
{
    [gameOfPlayer1 printCards];
    NSLog(@"---------------");
    [gameOfPlayer2 printCards];
    NSLog(@"---------------");

    
    if (player1turn == false)
    {
        [centerStack addCard:[gameOfPlayer2 dealCard]];
        
        int cardValue = [[centerStack lastCard] Value];
        
        if (cardValue == 1)
            cardValue = 14;
        
        if (cardValue > 10)
        {
            counter = cardValue - 10;
            _player2Turn.text = @"";
            _player1Turn.text = @"Your Turn !";
            player1turn = true;
        }
        
        if (counter == 5)
        {
            _player2Turn.text = @"";
            _player1Turn.text = @"Your Turn !";
            player1turn = true;
        }
        
        if (counter == 0)
        {
            [gameOfPlayer1 winCards:centerStack];
            _player2Turn.text = @"";
            _player1Turn.text = @"Your Turn !";
            player1turn = true;
            counter = 5;
        }
        
        if ([centerStack lastCard] != Nil)
        {
            [self setImageToImageView:_centerStack ofStack:centerStack];
        }
        else
            [_centerStack setImage:btnGreyImage];
        
        if ([gameOfPlayer2 lastCard] == Nil)
            [_btnCard setImage:btnGreyImage forState:UIControlStateNormal];

        if (counter != 5)
            counter --;
        
    }
}

- (IBAction)reactTapP1:(id)sender {
    if ([centerStack cardBeforeLastCard] != Nil)
        if ([[centerStack lastCard] cardValEqualToCard:[centerStack cardBeforeLastCard]])
        {
            [gameOfPlayer1 winCards:centerStack];
            _player2Turn.text = @"";
            _player1Turn.text = @"Your Turn !";
            player1turn = true;
            counter = 5;
            [_centerStack setImage:btnGreyImage];
            if ([gameOfPlayer2 lastCard] == Nil)
                [_btnCard setImage:btnGreyImage forState:UIControlStateNormal];

        }
        else
        {
            [gameOfPlayer2 winCards:centerStack];
            _player1Turn.text = @"";
            _player2Turn.text = @"Your Turn !";
            player1turn = false;
            counter = 5;
            [_centerStack setImage:btnGreyImage];
            if ([gameOfPlayer1 lastCard] == Nil)
                [_btnCard setImage:btnGreyImage forState:UIControlStateNormal];

        }
    else
    {
        [gameOfPlayer2 winCards:centerStack];
        _player1Turn.text = @"";
        _player2Turn.text = @"Your Turn !";
        player1turn = false;
        counter = 5;
        [_centerStack setImage:btnGreyImage];
        if ([gameOfPlayer1 lastCard] == Nil)
            [_btnCard setImage:btnGreyImage forState:UIControlStateNormal];
   
    }
}

- (IBAction)reactTapP2:(id)sender {
    if ([centerStack cardBeforeLastCard] != Nil)
        if ([[centerStack lastCard] cardValEqualToCard:[centerStack cardBeforeLastCard]])
        {
            [gameOfPlayer2 winCards:centerStack];
            _player1Turn.text = @"";
            _player2Turn.text = @"Your Turn !";
            player1turn = false;
            counter = 5;
            [_centerStack setImage:btnGreyImage];
            if ([gameOfPlayer1 lastCard] == Nil)
                [_btnCard setImage:btnGreyImage forState:UIControlStateNormal];
            
        }
        else
        {
            [gameOfPlayer1 winCards:centerStack];
            _player2Turn.text = @"";
            _player1Turn.text = @"Your Turn !";
            player1turn = true;
            counter = 5;
            [_centerStack setImage:btnGreyImage];
            if ([gameOfPlayer2 lastCard] == Nil)
                [_btnCard setImage:btnGreyImage forState:UIControlStateNormal];
            
        }
        else
        {
            [gameOfPlayer1 winCards:centerStack];
            _player2Turn.text = @"";
            _player1Turn.text = @"Your Turn !";
            player1turn = true;
            counter = 5;
            [_centerStack setImage:btnGreyImage];
            if ([gameOfPlayer2 lastCard] == Nil)
                [_btnCard setImage:btnGreyImage forState:UIControlStateNormal];
            
        }
    
    
}

- (void)setImageToImageView:(UIImageView *)imgView ofStack:(Stack *)stack
{
    [[stack lastCard] printCard];
    
    int val = [[stack lastCard] Value];
    
    if ([[[stack lastCard] Color] isEqualToString:@"Trefle"])
        val += 13;
    if ([[[stack lastCard] Color] isEqualToString:@"Carreau"])
        val += 26;
    if ([[[stack lastCard] Color] isEqualToString:@"Pique"])
        val += 39;
    
    NSString *CardImageName = [NSString stringWithFormat:@"%i.png", val];
    UIImage *CardImage = [UIImage imageNamed:CardImageName];
    
    [imgView setImage:CardImage];
}
@end









