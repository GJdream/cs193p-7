//
//  Deck.m
//  Matchismo
//
//  Created by Sean Coleman on 12/18/13.
//  Copyright (c) 2013 Sean G. Coleman. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation Deck

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;

    // We need to make sure cards are available.
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];  // 0 to count-1
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }

    return randomCard;  // nil if no cards
}

@end
