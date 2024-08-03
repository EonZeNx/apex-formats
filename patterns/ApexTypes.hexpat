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
  
  struct Event : TTypes::Pair::Same<u32> {};
}
