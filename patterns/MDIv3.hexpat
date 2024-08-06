// Created by PredatorCZ, Brooen, AxCut
#pragma magic [ 4D 44 49 ] @ 0x00
import std.core;
import std.mem;
import std.io;

struct CString {
    char name[];
};

struct Matrix {
    float tm[16];
};

struct Header {
  u32 id;
  u32 version;
  u32 numPaths;
  u32 numInstances;
  u32 tmOffset;
  u32 unk;
  u32 null0[2];
};

struct bboxes
{
float Min[3];
float Max[3];
};

fn format_ithIndices(auto val) {
    return std::format("{}",Filepaths[val].name);
};

struct Combined { 
    u64 index = std::core::array_index();
    Matrix CoordinateMatrix @ addressof(tms[std::core::array_index()]);
    u16 LinkedPath @ addressof(indices[std::core::array_index()])[[format("format_ithIndices")]];
    u16 ithUnk0 @ addressof(unk0[std::core::array_index()]);
    u96 ithNull0 @ addressof(null0[std::core::array_index()]);
    float ithUnk1 @ addressof(unk1[std::core::array_index()]);
    bboxes BoundingBoxes @ addressof(bbox[std::core::array_index()]);
};

Header Header @0;
CString Filepaths[Header.numPaths] @$;
Matrix tms[Header.numInstances] @ Header.tmOffset + sizeof(Header)[[hidden]] ;
u16 indices[Header.numInstances]@$ [[hidden]] ; // links instances to paths
u16 unk0[Header.numInstances]@$ [[hidden]] ; // bunch of 3s and 2s
u96 null0[Header.numInstances]@$ [[hidden]] ; //empty
float unk1[Header.numInstances]@$ [[hidden]] ; //bunch of -1s
bboxes bbox[Header.numInstances]@$ [[hidden]] ; // bboxes
Combined combined[Header.numInstances]@$;