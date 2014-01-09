//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Sean Coleman on 1/3/14.
//  Copyright (c) 2014 Sean G. Coleman. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
// Redefine score as readwrite so setter can be called in implementation.
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;  // of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];

    if (self) {
        // Pull cards out of deck and put into our internal data structure.
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                // If we run out of cards we fail to initialize.
                self = nil;
                break;
            }
        }
    }

    return self;
}

// Typed, so maybe advantageous vs. #define.
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

// Most of our game logic goes here. We begin with a two-card matching game.
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];

    // Try to match only to non-matched cards.
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;  // Un-choose it if it's already chosen.
        } else {
            // Match card against another card.
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {  // Two-card game, so we found it.
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score = matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    // We have found a match, so in a two-card game we can break out.
                    break;
                }
            }
            // If the card isn't previously chosen, it costs a point to choose it.
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }

}

- (Card *)cardAtIndex:(NSUInteger)index
{
    // Return nil rather than crashing if index is out of bounds.
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (instancetype)init
{
    return nil;
}

@end
