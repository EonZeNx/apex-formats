// Created by PredatorCZ, Brooen, AxCut, EonZeNx

#include <std/mem.pat>
#include <std/core.pat>
#include <std/io.pat>

// Extras > Settings > Folders > Add > MY_FOLDER > Confirm
// Should look like: MY_FOLDER/patterns/*.hexpat
#include <TTypes.hexpat>
#include <CTypes.hexpat>
#include <PTypes.hexpat>

#pragma pattern_limit 0x1000000

// Includes magic and version
#pragma magic [ 4D 44 49 00 0C ] @ 0x00

using FBox = CTypes::FBox;
using FMat4x4 = CTypes::FMatrix4x4;
using NullString = PTypes::NullString;

struct MdiV12Header {
  u32 Id;
  u32 Version;
  u32 PathCount;
  u32 InstanceCount;
  u32 TmOffset;
  u32;
  u32;
  u32;
};

fn index_to_file_path(auto i) {
    return std::format("{}", File.Paths[i]);
};

struct MdiV12Instance { 
  u64 i = std::core::array_index();
  
  FMat4x4 Coords @ addressof(File.Tms[i]);
  u16 PathIndex @ addressof(File.PathIndices[i]) [[format("index_to_file_path")]];
  u16 Unk0 @ addressof(File.Unk0Array[i]);
  u96 Null0 @ addressof(File.Null0Array[i]);
  float Unk1 @ addressof(File.Unk1Array[i]);
  FBox BoundingBox @ addressof(File.BoundingBoxes[i]);
};

struct MdiV12File {
  MdiV12Header Header;
  NullString Paths [Header.PathCount];
  
  $ = Header.TmOffset + sizeof(Header);
  
  FMat4x4 Tms [Header.InstanceCount];;
  u16 PathIndices [Header.InstanceCount];
  u16 Unk0Array [Header.InstanceCount];
  u96 Null0Array [Header.InstanceCount];
  float Unk1Array [Header.InstanceCount];
  FBox BoundingBoxes [Header.InstanceCount];
};

MdiV12File File @ 0x00;
MdiV12Instance Instances [File.Header.InstanceCount] @ $;