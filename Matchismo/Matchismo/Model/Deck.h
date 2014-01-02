//
//  Deck.h
//  Matchismo
//
//  Created by Sean Coleman on 12/18/13.
//  Copyright (c) 2013 Sean G. Coleman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
