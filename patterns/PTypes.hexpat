// Created by EonZeNx
// Patch types
// Currently only used to fix a bug in NullString
#pragma once

namespace auto PTypes {
    struct NullStringBase<DataType> {
      DataType string[while(std::mem::read_unsigned($, sizeof(DataType)) != 0x00)];
      DataType null_terminator;
    } [[sealed, format("PTypes::impl::format_null_string"), transform("PTypes::impl::format_null_string")]];

    /**
        A null-terminated ASCII string.
    */
    using NullString = NullStringBase<char>;

    /**
        A null-terminated UTF-16 string.
    */
    using NullString16 = NullStringBase<char16>;

    namespace impl {
        fn format_null_string(ref auto string) {
            return string.string;
        };
    }
}