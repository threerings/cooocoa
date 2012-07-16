//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOMath.h"

#define PI       3.14159265359f
#define PI_HALF  1.57079632679f
#define TWO_PI   6.28318530718f

float OOOMirrorAngle (float a) {
    return (a > 0 ? PI : -PI) - a;
}

float OOOAngularDistance (float a1, float a2) {
    float ma1 = OOOMirrorAngle(a1), ma2 = OOOMirrorAngle(a2);
    return MIN(fabsf(a1 - a2), fabsf(ma1 - ma2));
}

float OOOAngularDifference (float a1, float a2) {
    float ma1 = OOOMirrorAngle(a1), ma2 = OOOMirrorAngle(a2);
    float diff = a1 - a2, mdiff = ma2 - ma1;
    return (fabsf(diff) < fabsf(mdiff)) ? diff : mdiff;
}

float OOONormalizeAngle (float a) {
    while (a < -PI) {
        a += TWO_PI;
    }
    while (a >= PI) {
        a -= TWO_PI;
    }
    return a;
}

float OOONormalizeAnglePositive (float a) {
    while (a < 0) {
        a += TWO_PI;
    }
    while (a >= TWO_PI) {
        a -= TWO_PI;
    }
    return a;
}
