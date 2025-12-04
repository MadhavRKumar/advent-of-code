import "io" for File

var banks = File.read("input.txt").split("\n")
banks.removeAt(-1)

var answer = 0

for (bank in banks) {
    var tens = 0
    var ones = 0
    var bankLen = bank.count
    var maxI = 0

    for (i in 0..bankLen-2) {
        var val = Num.fromString(bank[i])

        if (val > tens) {
            tens = val        
            maxI = i
        }
    }

    for (j in bankLen-1..maxI+1) {
        var val = Num.fromString(bank[j])
        if (val > ones) {
            ones = val 
        }
    }

    answer = answer + (tens*10) + ones
}

System.print(answer)

