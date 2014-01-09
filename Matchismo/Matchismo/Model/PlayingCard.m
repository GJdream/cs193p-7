//
//  PlayingCard.m
//  Matchismo
//
//  Created by Sean Coleman on 12/19/13.
//  Copyright (c) 2013 Sean G. Coleman. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// From Card, and we won't put this in our .h file.
- (int)match:(NSArray *)otherCards
{
    // In lecture, one card is matched. Assignment 1 will
    // require matching more than one.
    
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];

        // Rank matches are worth more than suit matches:
        // We choose 1 and 4 because if you some suit, there are
        // 12 possible matches while a rank only has 3 possible matches.
        if ([self.suit isEqualToString:otherCard.suit]) {
            score = 1;
        } else if (self.rank == otherCard.rank) {
            score = 4;
        }
    }

    return score;
}

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank { return [[self rankStrings] count] - 1; }

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@end
