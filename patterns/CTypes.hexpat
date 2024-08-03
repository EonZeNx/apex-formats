// Created by EonZeNx, Brooen
// Common types
#pragma once

// Extras > Settings > Folders > Add > MY_FOLDER > Confirm
// Should look like: MY_FOLDER/patterns/*.hexpat
#include <TTypes.hexpat>
#include "std/math.pat"

namespace CTypes {
  struct FVector2 : TTypes::Vector2<float> {};
  struct FVector3 : TTypes::Vector3<float> {};
  struct FVector4 : TTypes::Vector4<float> {};
  
  struct FMatrix3x3 : TTypes::Vector3<FVector3> {};
  struct FMatrix3x4 : TTypes::Vector3<FVector4> {};
  struct FMatrix4x3 : TTypes::Vector4<FVector3> {};
  struct FMatrix4x4 : TTypes::Vector4<FVector4> {};
  
    
  struct UVector2 : TTypes::Vector2<u32> {};
  struct UVector3 : TTypes::Vector3<u32> {};
  struct UVector4 : TTypes::Vector4<u32> {};
  
  struct UMatrix3x3 : TTypes::Vector3<UVector3> {};
  struct UMatrix3x4 : TTypes::Vector3<UVector4> {};
  struct UMatrix4x3 : TTypes::Vector4<UVector3> {};
  struct UMatrix4x4 : TTypes::Vector4<UVector4> {};
  
  
  struct SVector2 : TTypes::Vector2<s32> {};
  struct SVector3 : TTypes::Vector3<s32> {};
  struct SVector4 : TTypes::Vector4<s32> {};
  
  struct SMatrix3x3 : TTypes::Vector3<SVector3> {};
  struct SMatrix3x4 : TTypes::Vector3<SVector4> {};
  struct SMatrix4x3 : TTypes::Vector4<SVector3> {};
  struct SMatrix4x4 : TTypes::Vector4<SVector4> {};
  
  
  struct FBox {
    FVector3 Min, Max;
  };
  
  struct FBoxR {
    FVector3 Max, Min;
  };
  
  namespace Colour {
    struct RGB {
      float r, g, b;
    };
	
    struct RGBA : RGB {
      float a;
    };
	
    struct HSL {
      float h, s, l;
    };
	
	using HSV = HSL;
	using HSB = HSL;
  }
  struct NormalTangent {
    float CompressedData;
    float f = (CompressedData);

    float xt = CompressedData / 1.0;
    float x = (xt - std::math::floor(xt)) * 2.0 - 1.0 [[export]]; 

    float yt = CompressedData / 256.0;
    float y = (yt - std::math::floor(yt)) * 2.0 - 1.0 [[export]]; 

    float zt = CompressedData / 65535.0;
    float z = (zt - std::math::floor(zt)) * 2.0 - 1.0 [[export]]; 

    float w = std::math::sign(f) [[export]];
  }; // credit SK83RJOSH for their help on this
}
