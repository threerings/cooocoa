//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOKey.h"
#import "OOOMacros.h"

@interface OOOKeyImpl : OOOKey {
@protected
    NSString* _string;
}
- (id)initWithString:(NSString*)string;
@end

@implementation OOOKeyImpl
@synthesize string = _string;
- (id)initWithString:(NSString*)string {
    if ((self = [super init])) {
        _string = string;
    }
    return self;
}
@end

@implementation OOOKey

@dynamic string;

static NSMutableDictionary* keyDict () {
    return OOO_SINGLETON([[NSMutableDictionary alloc] init]);
}

+ (OOOKey*)keyWithString:(NSString*)string {
    NSMutableDictionary* dict = keyDict();
    OOOKey* key = nil;
    @synchronized (dict) {
        key = [dict objectForKey:string];
        if (key == nil) {
            key = [[OOOKeyImpl alloc] initWithString:string];
            dict[string] = key;
        }
    }
    return key;
}

+ (OOOKey*)keyWithFormat:(NSString*)format, ... {
    return [OOOKey keyWithString:OOO_FORMAT_TO_NSSTRING(format)];
}

- (id)init {
    // prevent subclassing and direct instantiation.
    self = [super init];
    if (![self isMemberOfClass:[OOOKeyImpl class]]) {
        [NSException raise:NSGenericException format:@"You may not directly create an OOOKey instance"];
    }
    return self;
}

- (id)copyWithZone:(NSZone*)zone {
    return self;
}

@end
