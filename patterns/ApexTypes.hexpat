// Created by EonZeNx
// Apex types
#pragma once

// Extras > Settings > Folders > Add > MY_FOLDER > Confirm
// Should look like: MY_FOLDER/patterns/*.hexpat
#include <TTypes.hexpat>

namespace Apex {
  struct ObjectId {
    u16 a, b, c, userData;
  };
  
  using Event  = TTypes::Pair<u32, u32>;
  using Events = TTypes::Array<u32, Apex::Event>;
}
