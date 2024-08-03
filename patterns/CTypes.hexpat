// Created by EonZeNx, Brooen
// Common types
#pragma once

// Extras > Settings > Folders > Add > MY_FOLDER > Confirm
// Should look like: MY_FOLDER/patterns/*.hexpat
#include <TTypes.hexpat>

namespace CTypes {
  using FVector2 = TTypes::Vector2<float>;
  using FVector3 = TTypes::Vector3<float>;
  using FVector4 = TTypes::Vector4<float>;
  
  using FMatrix3x3 = TTypes::Matrix3x3<float>;
  using FMatrix3x4 = TTypes::Matrix3x4<float>;
  using FMatrix4x3 = TTypes::Matrix4x3<float>;
  using FMatrix4x4 = TTypes::Matrix4x4<float>;
  
    
  using UVector2 = TTypes::Vector2<u32>;
  using UVector3 = TTypes::Vector3<u32>;
  using UVector4 = TTypes::Vector4<u32>;
  
  using UMatrix3x3 = TTypes::Matrix3x3<u32>;
  using UMatrix3x4 = TTypes::Matrix3x4<u32>;
  using UMatrix4x3 = TTypes::Matrix4x3<u32>;
  using UMatrix4x4 = TTypes::Matrix4x4<u32>;
  
  
  using SVector2 = TTypes::Vector2<s32>;
  using SVector3 = TTypes::Vector3<s32>;
  using SVector4 = TTypes::Vector4<s32>;
  
  using SMatrix3x3 = TTypes::Matrix3x3<s32>;
  using SMatrix3x4 = TTypes::Matrix3x4<s32>;
  using SMatrix4x3 = TTypes::Matrix4x3<s32>;
  using SMatrix4x4 = TTypes::Matrix4x4<s32>;
  
  
  struct UV : TTypes::Vector2<float> {
    float u = x;
    float v = y;
  };
  using Position = TTypes::Vector3<float>;
  namespace Rotation {
    struct PYR : TTypes::Vector3<float> {
      float pitch = x;
      float yaw   = y;
      float roll  = z;
    };
    
    using Quat = TTypes::Vector4<float>;
  }
  using Scale = TTypes::Vector3<float>;
  
  
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
	
    struct HSV : HSL {
      float v = l;
    };
    struct HSB : HSL {
      float b = l;
    };
  }
  
  struct NormalTangent {
    s32 CompressedData;
    float x = (CompressedData & 0x3ff) / 1023.0 [[export]];
    float y = ((CompressedData >> 10) & 0x3ff) / 1023.0 [[export]];
    float z = ((CompressedData >> 20) & 0x3ff) / 1023.0 [[export]];
    float w = ((CompressedData >> 30) & 3) / 1023.0 [[export]];
  };
}
