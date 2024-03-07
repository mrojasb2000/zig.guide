const std = @import("std");
const expect = std.testing.expect;

test "defer" {
    var x: u16 = 5;
    {
        defer x += 2;
        try expect(x == 5);
    }
    try expect(x == 7);
}
