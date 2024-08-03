// Created by PredatorCZ, Brooen
#pragma magic [ 4D 44 49 ] @ 0x00
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

Header hdr @0;
CString paths[hdr.numPaths] @$;
Matrix tms[hdr.numInstances] @ hdr.tmOffset + sizeof(Header);
u16 indices[hdr.numInstances] @$;
u16 unk0[hdr.numInstances] @$;
u96 null0[hdr.numInstances] @$;
float unk1[hdr.numInstances] @$;
float unk2[hdr.numInstances * 6] @$; // bboxes?