//
//  PlayingCard.h
//  Matchismo
//
//  Created by Sean Coleman on 12/19/13.
//  Copyright (c) 2013 Sean G. Coleman. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

@end
