import std/nre
import std/strutils

proc eval *(input: string): int =
    var mul = 1
    for i in findAll(input, re(r"(\d+)")):
        mul *= parseInt(i)

    return mul
    

when isMainModule:
    doAssert eval("mul(44,46)") == 2024
    doAssert eval("mul(123,4)") == 492


