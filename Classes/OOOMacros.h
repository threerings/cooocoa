//
// cooocoa - Copyright 2012 Three Rings Design

/// Helpers
#define OOO_CONCAT_TOKENS(a, b) a ## b
#define OOO_EXPAND_THEN_CONCAT(a,b) OOO_CONCAT_TOKENS(a, b)

/// Returns an NSMutableArray containing a method's varargs
/// -(NSArray*)toArray:(Foo*)obj1, ... { return OOO_VARARGS_TO_ARRAY(Foo*, obj1); }
#define OOO_VARARGS_TO_ARRAY(type, first) ({ \
    va_list ap; \
    va_start(ap, first); \
    NSMutableArray* array = [[NSMutableArray alloc] init]; \
    for (; first != nil; first = va_arg(ap, type)) [array addObject:first]; \
    va_end(ap); \
    array; \
})

/// Creates an NSString from a format string and parameters.
/// - (NSString*)getMyFormatString:(NSString*)format, ... { return OOO_FORMAT_TO_NSSTRING(format); }
#define OOO_FORMAT_TO_NSSTRING(format) ({ \
    va_list args; \
    va_start(args, format); \
    NSString* string = [[NSString alloc] initWithFormat:format arguments:args]; \
    va_end(args); \
    string; \
})

/// Creates and initializes a static object.
/// -(Foo*)getSingletonFoo { return OOO_SINGLETON([[Foo alloc] init]); }
#define OOO_SINGLETON(INIT_FUNC) ({ \
    static dispatch_once_t once; \
    static id gObject = nil; \
    dispatch_once(&once, ^{ gObject = INIT_FUNC; }); \
    gObject; \
})

/// Throws an exception indicating that the current method is abstract
#define OOO_IS_ABSTRACT() ({ \
    [NSException raise:NSInternalInconsistencyException \
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]; \
})

/// Compile-time assertion
#define OOO_STATIC_ASSERT(e) enum { OOO_EXPAND_THEN_CONCAT(ASSERT_line_,__LINE__) = 1/!!(e) }