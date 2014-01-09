//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Sean Coleman on 1/3/14.
//  Copyright (c) 2014 Sean G. Coleman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;  // Game sets the score

// Designated Initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
