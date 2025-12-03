# read test.txt and print its contents
import os
import strutils
import re

proc main() =
  let filePath = "input.txt"
  let content = readFile(filePath)
  let arr = content.split(",")

  var ans = 0

  for bounds in arr:
    let b = bounds.split("-")
    let lower_bound = b[0].strip().parseInt()
    let upper_bound = b[1].strip().parseInt()

    for i in lower_bound..upper_bound:
        let s = i.intToStr()
        if contains(s, re"\b(\d+?)(\1{1})\b"):
            ans = ans+i
  echo ans


when isMainModule:
    main()
