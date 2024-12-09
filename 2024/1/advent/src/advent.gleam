import gleam/dict.{type Dict}
import gleam/int
import gleam/io
import gleam/list
import gleam/pair
import gleam/regexp
import gleam/result
import simplifile

pub fn main() {
  let filepath = "./input.txt"
  let assert Ok(input) = simplifile.read(filepath)

  let assert Ok(re) = regexp.from_string("\\s+")
  let parse_int = fn(number) {
    number
    |> int.parse
    |> result.unwrap(0)
  }

  let clean_input =
    input
    |> regexp.split(with: re)
    |> list.map(parse_int)

  io.print("Distance: ")
  clean_input
  |> get_distance
  |> io.debug

  io.print("Similarity: ")
  clean_input
  |> get_similarity
  |> io.debug
}

pub fn get_distance(numbers: List(Int)) -> Int {
  numbers
  |> split_into_lists(pair.new([], []))
  |> pair.map_first(list.sort(_, int.compare))
  |> pair.map_second(list.sort(_, int.compare))
  |> pair_map2(calculate_distance)
  |> list.fold(0, int.add)
}

fn pair_map2(p: #(List(a), List(b)), f: fn(a, b) -> c) -> List(c) {
  list.map2(pair.first(p), pair.second(p), f)
}

fn calculate_distance(a: Int, b: Int) -> Int {
  a
  |> int.subtract(b)
  |> int.absolute_value
}

pub fn get_similarity(numbers: List(Int)) -> Int {
  let #(first, second) = split_into_lists(numbers, pair.new([], []))

  let number_count =
    second
    |> count_entries(dict.new())

  first
  |> list.fold(0, fn(acc, cur) {
    number_count
    |> dict.get(cur)
    |> result.unwrap(0)
    |> int.multiply(cur)
    |> int.add(acc)
  })
}

fn count_entries(numbers: List(Int), acc: Dict(Int, Int)) -> Dict(Int, Int) {
  case numbers {
    [] -> acc
    [first, ..rest] -> {
      dict.new()
      |> dict.insert(first, 1)
      |> dict.combine(acc, int.add)
      |> count_entries(rest, _)
    }
  }
}

fn split_into_lists(
  numbers: List(Int),
  acc: #(List(Int), List(Int)),
) -> #(List(Int), List(Int)) {
  case numbers {
    [] -> acc
    [_] -> acc
    [a, b, ..tail] -> {
      let #(first, second) = acc
      split_into_lists(tail, #([a, ..first], [b, ..second]))
    }
  }
}
