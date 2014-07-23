//
//  TwitterTextEntity.h
//
//  Copyright 2012-2014 Twitter, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//

#import <Foundation/Foundation.h>

typedef enum {
    TwitterTextEntityURL,
    TwitterTextEntityScreenName,
    TwitterTextEntityHashtag,
    TwitterTextEntityListName,
    TwitterTextEntitySymbol,
} TwitterTextEntityType;

@interface TwitterTextEntity : NSObject

@property (nonatomic) TwitterTextEntityType type;
@property (nonatomic) NSRange range;
@property (nonatomic, strong) NSString *representedString;
@property (nonatomic, strong) NSString *shortenedText;

+ (id)entityWithType:(TwitterTextEntityType)type range:(NSRange)range shortenedText:(NSString *)shortText representedString:(NSString *)repString;
+ (id)entityWithType:(TwitterTextEntityType)type range:(NSRange)range representedString:(NSString *)repString;

@end
