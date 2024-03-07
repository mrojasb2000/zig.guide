const std = @import("std");
const expect = std.testing.expect;

// usize and isize are given as unsigned and signed integer which are the same size as pointers.
test "usize" {
    try expect(@sizeOf(usize) == @sizeOf(*u8));
    try expect(@sizeOf(isize) == @sizeOf(*u8));
}
