// Created by Brooen
#pragma magic [ 50 46 49 ] @ 0x00
#include <std/string.pat>

struct Matrix {
    float tm[16];
};

struct Header {
  u32 Magic;
  u32 Version;
  u32 unk;
  u32 NumInstances;
  Matrix Matrix;
  padding[48];
};

struct file
{
padding [4];
std::string::SizedString<u32> FilePath;
Matrix Matrix;
};
struct final
{
Header Header;
file File[Header.NumInstances];
};
final Final @0;