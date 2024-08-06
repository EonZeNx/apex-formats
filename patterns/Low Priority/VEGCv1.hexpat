// Created by Brooen


struct Header {
  u32 Version;
  u32 unk;
  u32 NumInstances;
};

struct file
{
float data[5]; // i got no clue
};
struct final
{
Header Header;
file File[Header.NumInstances];
};
final Final @0;