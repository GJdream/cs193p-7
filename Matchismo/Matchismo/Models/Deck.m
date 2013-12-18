//
//  Deck.m
//  Matchismo
//
//  Created by Sean Coleman on 12/18/13.
//  Copyright (c) 2013 Sean G. Coleman. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@end

@implementation Deck

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{

}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard
{
    return nil;
}

@end
