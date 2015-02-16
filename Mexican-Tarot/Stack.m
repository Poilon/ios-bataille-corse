//
//  stack.m
//  Mexican-Tarot
//
//  Created by Poilon on 17/05/13.
//  Copyright (c) 2013 Poilon. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (NSMutableArray*) cardGame { return cardGame; }
- (void) setCards:(NSMutableArray *)newCardGame { cardGame = newCardGame; }

- (id) initComplete
{
    if ( self = [super init] )
    {
        
        NSMutableArray *newCardGame = [[NSMutableArray alloc] initWithCapacity:52];
        NSString *Color = @"Coeur";
        int Value = 0;

        
        for (int i = 1; i <= 52; ++i)
        {
            Value = 1 + i % 13;
            if (i > 13 && i <= 26)
                Color = @"Trefle";
            if (i > 26 && i <= 39)
                Color = @"Carreau";
            if (i > 39)
                Color = @"Pique";
            [newCardGame addObject:[[Card alloc] initWithValue:Value andColor:Color]];
        }
        cardGame = newCardGame;
    }
    return self;
}

- (id) init
{
    if (self = [super init])
    {
        cardGame = [[NSMutableArray alloc] initWithCapacity:52];
    }
    return self;
}

- (Card *) dealCard
{
    Card * card = [cardGame lastObject];
    [cardGame removeLastObject];
    return card;
}

- (void) shakeCardGame
{
    for (int i = 0; i < [cardGame count]; ++i)
    {
        [cardGame exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i + 1)];
    }
}

- (void) printCards
{
    if (cardGame != Nil)
    {
        for (int i = 0; i < [cardGame count]; ++i)
            [[cardGame objectAtIndex:i] printCard];
    }
}

- (void) addCard: (Card *)card
{
    if (card != Nil)
        [cardGame addObject:card];
}

- (void) dealInGame1:(Stack *)game1 andGame2:(Stack *)game2
{
    Card* card;
    NSUInteger count = [cardGame count];
    
    for (int i = 0; i < (count / 2); ++i)
    {
        card = [self dealCard];
        [game1 addCard:card];
        card = [self dealCard];
        [game2 addCard:card];
        
    }
}

- (Card *) lastCard
{
    Card * card = [cardGame lastObject];
    return card;
}

- (Card *) cardBeforeLastCard
{
    
    if ([cardGame count] > 2)
        return [cardGame objectAtIndex:([cardGame count] - 1)];
    else
        return Nil;
}

- (void) winCards: (Stack *)cards
{
    NSMutableArray *tempStack = [[NSMutableArray alloc] init];
    
    [tempStack addObjectsFromArray:[cards cardGame]];
    [tempStack addObjectsFromArray:cardGame];
    
    [cardGame removeAllObjects];
    
    [cardGame addObjectsFromArray:tempStack];
    [tempStack removeAllObjects];
    [[cards cardGame] removeAllObjects];
}



@end
