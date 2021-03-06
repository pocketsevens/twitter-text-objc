//
//  TwitterTextEntity.m
//
//  Copyright 2012-2014 Twitter, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//

#import "TwitterTextEntity.h"

@implementation TwitterTextEntity

- (id)initWithType:(TwitterTextEntityType)aType range:(NSRange)aRange shortenedText:(NSString *)shortText representedString:(NSString *)repString
{
    self = [super init];
    if (self) {
        _type = aType;
        _range = aRange;
		_representedString = repString;
		_shortenedText = shortText;
    }
    return self;
}

+ (id)entityWithType:(TwitterTextEntityType)type range:(NSRange)range representedString:(NSString *)repString {
    return [self entityWithType:type range:range shortenedText:nil representedString:repString];
}

+ (id)entityWithType:(TwitterTextEntityType)type range:(NSRange)range shortenedText:(NSString *)shortText representedString:(NSString *)repString
{
    TwitterTextEntity *entity = [[self alloc] initWithType:type range:range shortenedText:shortText representedString:repString];
#if !__has_feature(objc_arc)
    [entity autorelease];
#endif
    return entity;
}

- (NSComparisonResult)compare:(TwitterTextEntity*)right
{
    NSInteger leftLocation = _range.location;
    NSInteger leftLength = _range.length;
    NSRange rightRange = right.range;
    NSInteger rightLocation = rightRange.location;
    NSInteger rightLength = rightRange.length;
    
    if (leftLocation < rightLocation) {
        return NSOrderedAscending;
    } else if (leftLocation > rightLocation) {
        return NSOrderedDescending;
    } else if (leftLength < rightLength) {
        return NSOrderedAscending;
    } else if (leftLength > rightLength) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

- (NSString*)description
{
    NSString *typeString = nil;
    switch (_type) {
        case TwitterTextEntityURL:
            typeString = @"URL";
            break;
        case TwitterTextEntityScreenName:
            typeString = @"ScreenName";
            break;
        case TwitterTextEntityHashtag:
            typeString = @"Hashtag";
            break;
        case TwitterTextEntityListName:
            typeString = @"ListName";
            break;
        case TwitterTextEntitySymbol:
            typeString = @"Symbol";
            break;
    }
    return [NSString stringWithFormat:@"<%@: %@ %@> %@", NSStringFromClass([self class]), typeString, NSStringFromRange(_range), _representedString];
}

@end
