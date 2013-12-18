//
//  Card.h
//  Matchismo
//
//  Created by Sean Coleman on 12/18/13.
//  Copyright (c) 2013 Sean G. Coleman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
