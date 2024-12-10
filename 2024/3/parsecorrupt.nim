import std/nre

proc parse *(input: string): seq[string] =
    return findAll(input, re(r"mul\((\d+),(\d+)\)"))


when isMainModule:
    let input = readFile("test.txt")
    doAssert parse(input) == @["mul(2,4)", "mul(5,5)", "mul(11,8)", "mul(8,5)"]
