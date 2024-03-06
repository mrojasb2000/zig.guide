const std = @import("std");

pub fn main() void {
    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };
    _ = a;
    _ = b;
    const array = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
    const length = array.len;
    std.debug.print("Array len {d}\n", .{length});
}
