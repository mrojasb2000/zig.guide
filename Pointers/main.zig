const std = @import("std");
const expect = std.testing.expect;

// Referencing is done with &var
// Dereferencing is done with var.*

fn increment(num: *u8) void {
    num.* += 1;
}

test "pointers" {
    var x: u8 = 1;
    increment(&x);
    try expect(x == 2);
}
