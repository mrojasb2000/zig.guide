const std = @import("std");
const expect = std.testing.expect;

// Defer is used to execute a statement while existing the current block.
test "defer" {
    var x: u16 = 5;
    {
        defer x += 2;
        try expect(x == 5);
    }
    try expect(x == 7);
}

// When there are multiple defers in a single block, they are executed in reverse order.
test "multi defer" {
    var x: f32 = 5;
    {
        defer x += 2;
        defer x /= 2;
    }
    try expect(x == 4.5);
}
