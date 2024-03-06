const std = @import("std");

pub fn main() void {
    // syntax: (const|var) identifier[: type] = value
    // const indicates that identifier is a constant that stores an immutable value.
    // var indicates that identifier is a variable that stores a mutable value.
    // : type is a type annotation for identifier, and may be omitted if the data type of value can be inferred.
    const constant: i32 = 5; // signed 32-bit contant
    var variable: u32 = 5000; // unsigned 32-bit variable
    _ = constant;
    _ = variable;

    // @as performs an explicit type coercion
    const inferred_contant = @as(i32, 5);
    const inferred_variable = @as(u32, 5000);
    _ = inferred_contant;
    _ = inferred_variable;

    const a: i32 = undefined;
    const b: u32 = undefined;
    _ = a;
    _ = b;
}
