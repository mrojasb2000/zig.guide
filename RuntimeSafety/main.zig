const std = @import("std");
const expect = std.testing.expect;

test "out of bounds" {
    @setRuntimeSafety(true);
    //const a = [3]u8{ 1, 2, 3 };
    //var index: u8 = 5;
    //const b = a[index]; //panic: index out of bounds: index 5, len 3
    //_ = b;
}

test "out of bounds, no safety" {
    @setRuntimeSafety(false);
    const a = [3]u8{ 1, 2, 3 };
    var index: u8 = 5;
    const b = a[index];
    _ = b;
}
