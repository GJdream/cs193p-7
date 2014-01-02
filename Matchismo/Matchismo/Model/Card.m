//
//  Card.m
//  Matchismo
//
//  Created by Sean Coleman on 12/18/13.
//  Copyright (c) 2013 Sean G. Coleman. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;

    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }

    return score;
}

@end
