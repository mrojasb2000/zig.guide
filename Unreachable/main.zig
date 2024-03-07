const std = @import("std");
const expect = std.testing.expect;

test "unreachable" {
    //const x: i32 = 1;
    //const y: u32 = if (x == 2) 5 else unreachable; // panic: reached unreachable code
    //_ = y;
}

fn asciiToUpper(x: u8) u8 {
    return switch (x) {
        'a'...'z' => x + 'A' - 'a',
        'A'...'Z' => x,
        else => unreachable,
    };
}

test "unreachable switch" {
    try expect(asciiToUpper('a') == 'A');
    try expect(asciiToUpper('A') == 'A');
}
