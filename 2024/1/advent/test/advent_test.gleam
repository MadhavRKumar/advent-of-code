import advent
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn get_distance_example_test() {
  let numbers = [3, 4, 4, 3, 2, 5, 1, 3, 3, 9, 3, 3]
  advent.get_distance(numbers)
  |> should.equal(11)
}

pub fn get_similarity_example_test() {
  let numbers = [3, 4, 4, 3, 2, 5, 1, 3, 3, 9, 3, 3]
  advent.get_similarity(numbers)
  |> should.equal(31)
}

pub fn get_distance_test() {
  let numbers = [4, 3, 9, 1, 5, 3, 3, 4, 3, 2, 3, 3, 10, 8]

  advent.get_distance(numbers)
  |> should.equal(13)
}
