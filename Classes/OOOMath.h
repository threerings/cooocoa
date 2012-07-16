//
// cooocoa - Copyright 2012 Three Rings Design

/// Returns the mirror angle of the specified angle (assumed to be in [-pi, +pi]).
float OOOMirrorAngle (float a);

/// Returns the (shortest) distance between two angles, assuming that both angles are in [-pi, +pi]
float OOOAngularDistance (float a1, float a2);

/// Returns the (shortest) difference between two angles, assuming that both angles are in [-pi, +pi]
float OOOAngularDifference (float a1, float a2);

/// Returns an angle in the range [-pi, pi)
float OOONormalizeAngle (float a);

/// Returns an angle in the range [0, 2pi)
float OOONormalizeAnglePositive (float a);
