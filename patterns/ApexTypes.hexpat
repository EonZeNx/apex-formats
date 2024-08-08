// Created by EonZeNx
// Apex types
#pragma once

// Extras > Settings > Folders > Add > MY_FOLDER > Confirm
// Should look like: MY_FOLDER/patterns/*.hexpat
import TTypes;

namespace Apex {
  struct ObjectId {
    u16 a [[export]];
    u16 b [[export]];
    u16 c [[export]];
    u16 userData [[export]];
  };
  
  using Event  = TTypes::Pair<u32, u32>;
  using Events = TTypes::Array<u32, Apex::Event>;
}
