// Created by EonZeNx
#pragma once

#include <std/mem.pat>
#include <std/string.pat>

struct TocEntry {
  std::string::SizedString<u32> FilePath;
  u32 DataOffset;
  u32 Size;
};

struct TocFile {
  TocEntry Entries [while(!std::mem::eof())];
};

TocFile File @ 0x00;