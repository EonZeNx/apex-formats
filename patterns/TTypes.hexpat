// Created by EonZeNx
// Template types
#pragma once

namespace TTypes {
  struct Vector2<T> {
    T x [[export]];
    T y [[export]];
  };
  
  struct Vector3<T> {
    T x [[export]];
    T y [[export]];
    T z [[export]];
  };
  
  struct Vector4<T> {
    T x [[export]];
    T y [[export]];
    T z [[export]];
    T w [[export]];
  };
  
  
  struct Matrix3x3<T> {
    Vector3<T> a [[export]];
    Vector3<T> b [[export]];
    Vector3<T> c [[export]];
  };
  
  struct Matrix3x4<T> {
    Vector3<T> a [[export]];
    Vector3<T> b [[export]];
    Vector3<T> c [[export]];
    Vector3<T> d [[export]];
  };
  
  struct Matrix4x3<T> {
    Vector4<T> a [[export]];
    Vector4<T> b [[export]];
    Vector4<T> c [[export]];
  };
  
  struct Matrix4x4<T> {
    Vector4<T> a [[export]];
    Vector4<T> b [[export]];
    Vector4<T> c [[export]];
    Vector4<T> d [[export]];
  };
  
  
  struct Pair<T, U> {
    T a [[export]];
    U b [[export]];
  };
  
  struct Array<T, U> {
    T Count [[export]];
    U Data [Count] [[export]];
  };
  
  union Either<T, U> {
    T a [[export]];
    U b [[export]];
  };
}
