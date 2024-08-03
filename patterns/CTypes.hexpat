// Created by EonZeNx, Brooen
// Common types
#pragma once

// Extras > Settings > Folders > Add > MY_FOLDER > Confirm
// Should look like: MY_FOLDER/patterns/*.hexpat
#include <TTypes.hexpat>

namespace CTypes {
  struct FVector2 : TTypes::Vector2<float> {};
  struct FVector3 : TTypes::Vector3<float> {};
  struct FVector4 : TTypes::Vector4<float> {};
  
  struct FMatrix3x3 : TTypes::Matrix3x3<float> {};
  struct FMatrix3x4 : TTypes::Matrix3x4<float> {};
  struct FMatrix4x3 : TTypes::Matrix4x3<float> {};
  struct FMatrix4x4 : TTypes::Matrix4x4<float> {};
  
    
  struct UVector2 : TTypes::Vector2<u32> {};
  struct UVector3 : TTypes::Vector3<u32> {};
  struct UVector4 : TTypes::Vector4<u32> {};
  
  struct UMatrix3x3 : TTypes::Matrix3x3<u32> {};
  struct UMatrix3x4 : TTypes::Matrix3x4<u32> {};
  struct UMatrix4x3 : TTypes::Matrix4x3<u32> {};
  struct UMatrix4x4 : TTypes::Matrix4x4<u32> {};
  
  
  struct SVector2 : TTypes::Vector2<s32> {};
  struct SVector3 : TTypes::Vector3<s32> {};
  struct SVector4 : TTypes::Vector4<s32> {};
  
  struct SMatrix3x3 : TTypes::Matrix3x3<s32> {};
  struct SMatrix3x4 : TTypes::Matrix3x4<s32> {};
  struct SMatrix4x3 : TTypes::Matrix4x3<s32> {};
  struct SMatrix4x4 : TTypes::Matrix4x4<s32> {};
  
  
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
    s32 CompressedData;
    float x = (CompressedData & 0x3ff) / 1023.0 [[export]];
    float y = ((CompressedData >> 10) & 0x3ff) / 1023.0 [[export]];
    float z = ((CompressedData >> 20) & 0x3ff) / 1023.0 [[export]];
    float w = ((CompressedData >> 30) & 3) / 1023.0 [[export]];
  };
}
