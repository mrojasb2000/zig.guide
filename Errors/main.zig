const std = @import("std");
const expect = std.testing.expect;

const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};

const AllocationError = error{OutOfMemory};

test "coerce error from a subset to a superset" {
    const err: FileOpenError = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
}

// Union error set type and another type, union operator: !
// Catch which is followed by an expression which is evaludated when the value
// preceding it is error. The catch here is used to provide a fallback value.

test "error union" {
    const maybe_error: AllocationError!u16 = 10;
    const no_error = maybe_error catch 0;

    try expect(@TypeOf(no_error) == u16);
    try expect(no_error == 10);
}

fn failingFunction() error{Oops}!void {
    return error.Oops;
}

// Functions often return error unions.
test "returning an error" {
    failingFunction() catch |err| {
        try expect(err == error.Oops);
        return;
    };
}

// try x is a shortcut for x catch |err| return err.
fn failFn() error{Oops}!u32 {
    try failingFunction();
    return 32;
}

test "try" {
    var v = failFn() catch |err| {
        try expect(err == error.Oops);
        return;
    };
    try expect(v == 12);
}

// errdefer works like defer, but only executing when the function is
// returned from with error inside of the errdefer's block.
var problems: u32 = 98;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1;
    try failingFunction();
}

test "errdefer" {
    failFnCounter() catch |err| {
        try expect(err == error.Oops);
        try expect(problems == 99);
        return;
    };
}

// Error union returned from a function can have their error sets inferred.

fn createFile() !void {
    return error.AccessDenied;
}

test "inferred error set" {
    // type coercion successfully takes place
    const x: error{AccessDenied}!void = createFile();

    // Zig does not let ud ignore error unions via _ = x;
    // we must unwrap it with "try", "catch", or "if" by any means
    _ = x catch {};
}

// Erros sets can be merged
const A = error{ NoDir, PathNotFound };
const B = error{ OutOfMemory, PathNotFound };
const C = A || B;

// anyerror is the global error set, which due to being the superset of all sets,
// can have an error from any set coerced to it.
