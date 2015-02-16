//
//  Card.h
//  Mexican-Tarot
//
//  Created by Poilon on 26/05/13.
//  Copyright (c) 2013 Poilon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Card : NSObject
{
    int Value;
    NSString* Color;
}
- (NSString*) Color;
- (int) Value;
- (void) setValue:(int)input;
- (void) setColor:(NSString*)input;

- (id)initWithValue: (int)Val andColor: (NSString*)Col;

- (void) printCard;

- (NSString *) toString;
- (Boolean) cardValEqualToCard:(Card *)card;

@end
