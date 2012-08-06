//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOEnum.h"
#import "OOOMacros.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface OOOEnum () {
@protected
    NSString* _name;
}
+ (NSMutableDictionary*)enums;
+ (NSMutableSet*)blocked;
@end

@implementation OOOEnum

@synthesize name = _name;

+ (id)valueOf:(NSString*)name {
    for (OOOEnum* theEnum in [self values]) {
        if ([theEnum.name isEqualToString:name]) {
            return theEnum;
        }
    }
    return nil;
}

+ (NSArray*)values {
    return [[OOOEnum enums] objectForKey:[self class]];
}

- (id)init {
    if ((self = [super init])) {
        if ([[OOOEnum blocked] containsObject:[self class]]) {
            [NSException raise:NSGenericException format:@"You may not just construct an enum!"];
        }

        NSMutableArray* array = [[OOOEnum enums] objectForKey:[self class]];
        if (array == nil) {
            array = [NSMutableArray array];
            // 'Class' is opaque, but we know it conforms to NSCopying because the docs tell us so:
            // http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html#//apple_ref/doc/uid/20000050-copyWithZone_
            [[OOOEnum enums] setObject:array forKey:(id<NSCopying>)[self class]];
        }
        [array addObject:self];
    }
    return self;
}

- (void)setName:(NSString*)name {
    NSAssert(_name == nil, @"name already set");
    _name = name;
}

- (BOOL)isEqual:(id)object {
    return object == self;
}

- (NSUInteger)hash {
    return _name.hash;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"%@.%@", [self class].description, self.name];
}

- (id)copyWithZone:(NSZone*)zone {
    return self;
}

+ (NSMutableDictionary*)enums {
    return OOO_SINGLETON([NSMutableDictionary dictionary]);
}

+ (NSMutableSet*)blocked {
    static NSMutableSet* blocked = nil;
    @synchronized(self) {
        if (blocked == nil) {
            blocked = [NSMutableSet set];
        }
    }
    return blocked;
}

+ (void)initialize {
    static NSString* PREFIX = @"OOOEnum_Init";

    if (self != [OOOEnum class]) {
        // walk the class methods
        unsigned int methodCount = 0;
        Method* mlist = class_copyMethodList(object_getClass(self), &methodCount);
        for (unsigned int ii = 0; ii < methodCount; ++ii) {
            NSString* mname = NSStringFromSelector(method_getName(mlist[ii]));
            if (mname.length > PREFIX.length && [[mname substringToIndex:PREFIX.length] isEqualToString:PREFIX]) {
                //[self performSelector:method_getName(mlist[ii])];
                // Equivalent to the above, but doesn't produce an ARC warning
                objc_msgSend(self, method_getName(mlist[ii]));
            }
        }
        free(mlist);
    }

    [[OOOEnum blocked] addObject:self];
}

@end

