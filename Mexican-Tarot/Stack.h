//
//  stack.h
//  Mexican-Tarot
//
//  Created by Poilon on 17/05/13.
//  Copyright (c) 2013 Poilon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Card.h"
@interface Stack : NSObject{
    NSMutableArray *cardGame;
}

- (NSMutableArray*) cardGame;
- (void) setCards: (NSMutableArray *)newCardGame;
- (Card *) dealCard;
- (void) printCards;
- (void) shakeCardGame;
- (id) initComplete;
- (void) addCard: (Card *)card;

- (void) dealInGame1: (Stack *)game1 andGame2: (Stack *)game2;
- (Card *) lastCard;

- (void) winCards: (Stack *)cards;
- (Card *) cardBeforeLastCard;



@end

