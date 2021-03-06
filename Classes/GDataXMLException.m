//
// cooocoa - Copyright 2012 Three Rings Design

#import "GDataXMLException.h"
#import "GDataXMLNode.h"
#import "OOOMacros.h"

static NSString * const NAME = @"XMLException";

@implementation GDataXMLException

+ (GDataXMLException*)withReason:(NSString*)format, ... {
    return [[GDataXMLException alloc] initWithReason:OOO_FORMAT_TO_NSSTRING(format)];
}

+ (GDataXMLException*)withElement:(GDataXMLElement*)badElement reason:(NSString*)format, ... {
    NSString* reason = OOO_FORMAT_TO_NSSTRING(format);

    if (badElement != nil) {
        reason = [NSString stringWithFormat:@"%@\b%@", reason, [badElement description]];
    }

    return [[GDataXMLException alloc] initWithReason:reason];
}

- (id)initWithReason:(NSString*)reason
{
    return [super initWithName:NAME reason:reason userInfo:nil];
}

@end
