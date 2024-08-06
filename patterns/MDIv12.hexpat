// Created by PredatorCZ, Brooen, AxCut

import std.core;
import std.mem;
import std.string;
import std.io;

// Extras > Settings > Folders > Add > MY_FOLDER > Confirm
// Should look like: MY_FOLDER/patterns/*.hexpat
#include <TTypes.hexpat>
#include <CTypes.hexpat>
#include <ApexTypes.hexpat>

#pragma pattern_limit 0x1000000

// Includes magic and version
#pragma magic [ 4D 44 49 00 0C ] @ 0x00

using FBox = CTypes::FBox;
using FMat4x4 = CTypes::FMatrix4x4;

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
    return std::format("{}", Paths[i]);
};

struct MdiV12Instance { 
  u64 i = std::core::array_index();
  
  FMat4x4 Coords @ addressof(Tms[i]);
  u16 PathIndex @ addressof(PathIndices[i]) [[format("index_to_file_path")]];
  u16 Unk0 @ addressof(Unk0Array[i]);
  u96 Null0 @ addressof(Null0Array[i]);
  float Unk1 @ addressof(Unk1Array[i]);
  FBox BoundingBox @ addressof(BoundingBoxes[i]);
};

struct MdiV12File {
  MdiV12Header Header;
  std::string::NullString Paths [Header.PathCount];
  
  FMat4x4 Tms [Header.InstanceCount] @ Header.TmOffset + sizeof(Header) [[hidden]];
  u16 PathIndices [Header.InstanceCount] [[hidden]];
  u16 Unk0 [Header.InstanceCount] [[hidden]];
  u96 Null0 [Header.InstanceCount] [[hidden]];
  float Unk1 [Header.InstanceCount] [[hidden]];
  FBox BoundingBoxes [Header.InstanceCount] [[hidden]];
};

MdiV12Header Header @ 0x00;
std::string::NullString Paths [Header.PathCount] @ $;

FMat4x4 Tms [Header.InstanceCount] @ sizeof(Header) + Header.TmOffset [[hidden]];
u16 PathIndices [Header.InstanceCount] @ $ [[hidden]];
u16 Unk0Array [Header.InstanceCount] @ $ [[hidden]];
u96 Null0Array [Header.InstanceCount] @ $ [[hidden]];
float Unk1Array [Header.InstanceCount] @ $ [[hidden]];
FBox BoundingBoxes [Header.InstanceCount] @ $ [[hidden]];
  
MdiV12Instance Instances [Header.InstanceCount];
