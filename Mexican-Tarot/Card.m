//
//  Card.m
//  Mexican-Tarot
//
//  Created by Poilon on 26/05/13.
//  Copyright (c) 2013 Poilon. All rights reserved.
//

#import "Card.h"

@implementation Card

- (NSString*) Color { return Color; }
- (int) Value { return Value; }
- (void) setValue: (int)input { Value = input; }
- (void) setColor: (NSString *)input { Color = input; }

- (id) init
{
    if (self = [super init])
    {
        [self setValue:12];
        [self setColor:@"Coeur"];
    }
    return self;

}

- (id)initWithValue: (int)Val andColor: (NSString*)Col
{
    if (self = [super init])
    {
        Value = Val;
        Color = Col;
    }
    return self;
}

- (void) printCard
{
    NSString *stringToPrint = [self toString];

    NSLog(@"%@", stringToPrint);
}

- (NSString *) toString
{
    NSString *retString;
    NSString *stringValue;
    NSString *string = @" de ";
    NSString *stringColor = Color;
    
    if (Value == 1)
        stringValue = @"As";
    else if (Value == 11)
        stringValue = @"Valet";
    else if (Value == 12)
        stringValue = @"Dame";
    else if (Value == 13)
        stringValue = @"Roi";
    else
        stringValue = [NSString stringWithFormat:@"%i", Value];
    
    retString = [NSString stringWithFormat:@"%@%@%@", stringValue, string, stringColor];
    
    return retString;
}
- (Boolean) cardValEqualToCard:(Card *)card
{
    if ([self Value] == [card Value])
        return true;
    else
        return false;
}


@end
