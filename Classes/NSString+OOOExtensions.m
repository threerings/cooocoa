//
// cooocoa - Copyright 2012 Three Rings Design

#import "NSString+OOOExtensions.h"

@implementation NSString (OOOExtensions)

- (BOOL)startsWith:(NSString*)substring {
    return ([self rangeOfString:substring].location == 0);
}

- (BOOL)endsWith:(NSString*)substring {
    if (substring.length > self.length) {
        return NO;
    }
    return ([self rangeOfString:substring].location == self.length - substring.length);
}

- (double)requireDoubleValue {
    NSScanner* scanner = [[NSScanner alloc] initWithString:self];
    double retVal;
    if (![scanner scanDouble:&retVal] || !scanner.isAtEnd) {
        [NSException raise:NSGenericException format:@"'%@' could not be converted to a double", self];
    }

    return retVal;
}

- (float)requireFloatValue {
    NSScanner* scanner = [[NSScanner alloc] initWithString:self];
    float retVal;
    if (![scanner scanFloat:&retVal] || !scanner.isAtEnd) {
        [NSException raise:NSGenericException format:@"'%@' could not be converted to a float", self];
    }

    return retVal;
}

- (int)requireIntValue {
    NSScanner* scanner = [[NSScanner alloc] initWithString:self];
    int retVal;
    if (![scanner scanInt:&retVal] || !scanner.isAtEnd) {
        [NSException raise:NSGenericException format:@"'%@' could not be converted to a int", self];
    }

    return retVal;
}

- (BOOL)requireBoolValue {
    NSString* lowercase = [self lowercaseString];
    if ([lowercase isEqualToString:@"true"] || [lowercase isEqualToString:@"yes"]) {
        return YES;
    } else if ([lowercase isEqualToString:@"false"] || [lowercase isEqualToString:@"no"]) {
        return NO;
    } else {
        [NSException raise:NSGenericException format:@"'%@' could not be converted to a BOOL", self];
    }

    return NO;
}

@end
