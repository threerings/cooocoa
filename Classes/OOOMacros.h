//
// cooocoa - Copyright 2012 Three Rings Design

/// Returns an NSMutableArray containing a method's varargs
/// -(NSArray*)toArray:(Foo*)obj1, ... { return OOO_VARARGS_TO_ARRAY(Foo*, obj1); }
#define OOO_VARARGS_TO_ARRAY(type, first) ({ \
    va_list ap; \
    va_start(ap, child); \
    NSMutableArray* children = [[NSMutableArray alloc] init]; \
    for (; child != nil; child = va_arg(ap, type)) [children addObject:child]; \
    va_end(ap); \
    children; \
})

/// Creates and initializes a static object.
/// -(Foo*)getSingletonFoo { return OOO_STATIC_OBJECT([[Foo alloc] init]); }

#ifdef OOO_THREAD_SAFE

    #define OOO_STATIC_OBJECT(INIT_FUNC) ({ \
        static id gObject = nil; \
        @synchronized(self) { if (gObject == nil) gObject = INIT_FUNC;  } \
        gObject; \
    })

#else

    #define OOO_STATIC_OBJECT(INIT_FUNC) ({ \
        static id gObject = nil; \
        if (gObject == nil) gObject = INIT_FUNC; \
        gObject; \
    })

#endif
