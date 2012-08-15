//
// cooocoa - Copyright 2012 Three Rings Design

/// A string interning implementation.
/// There only exists a single OOOKey instance for any given string,
/// so OOOKey instances can be compared for equality in constant-time, with ==
/// (which makes them good for use as keys in dictionaries, for example).
///
/// If you have a string that's known at compile time, it's best to use the
/// OOO_KEY(MyString) macro to retrieve an OOOInterned instance for it.
///
/// If you need an OOOKey for a runtime-defined string, use the class's
/// factory functions. These functions are expensive (they require a dictionary lookup),
/// so they should be avoided when possible.
///
/// Note that while OOOKey and its factory functions are thread-safe, the
/// OOO_KEY macro is *not*. It should only be used in your application's main thread.
@interface OOOKey : NSObject <NSCopying>

@property (readonly) NSString* string;

+ (OOOKey*)keyWithString:(NSString*)string;
+ (OOOKey*)keyWithFormat:(NSString*)format, ... NS_FORMAT_FUNCTION(1, 2);

@end

#define OOO_KEY(String) ({ \
    static OOOKey* key = nil; \
    if (key == nil) key = [OOOKey keyWithString:@#String]; \
    key; \
})
