const std = @import("std");
const expect = std.testing.expect;

// Pointer in Zig can't have 0 or null value
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

test "naughty pointer" {
    // var x: u16 = 0;
    // var y: *u8 = @ptrFromInt(x); //panic: cast causes pointer to be null
    // _ = y;
}

// Zig also has const pointers, which can't be used to
// modify the referenced data.
test "const pointers" {
    const x: u8 = 1;
    var y = &x;
    _ = y;
    //y.* += 1; //error: cannot assign to constant
}
