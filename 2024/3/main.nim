import muleval
import parsecorrupt
import os

proc main(input: string) =
    let parsed = parse(input)
    var result = 0
    for mulStatement in parsed:
        result += eval(mulStatement)
    echo result

when isMainModule:
    let filename = commandLineParams()[0]
    let input = readFile(filename)
    main(input)
