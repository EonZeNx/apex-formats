// Created by EonZeNx
// Template types
#pragma once

namespace TTypes {
  struct Vector2<T> {
    T x, y;
  };
  
  struct Vector3<T> {
    T x, y, z;
  };
  
  struct Vector4<T> {
    T x, y, z, w;
  };
  
  
  struct Matrix3x3<T> {
    Vector3<t> a, b, c;
  };
  
  struct Matrix3x4<T> {
    Vector3<T> a, b, c, d;
  };
  
  struct Matrix4x3<T> {
    Vector4<T> a, b, c;
  };
  
  struct Matrix4x4<T> {
    Vector4<T> a, b, c, d;
  };
  
  
  namespace Pair {
    struct Same<T> {
      T a, b;
    };
    
    struct Diff<T, U> {
      T a;
      U b;
    };
  }
  
  
  struct Array<T, U> {
    T Count;
    U Data [Count];
  };
  
  
  union Either<T, U> {
    T a;
    U b;
  };
}
