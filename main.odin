package main

import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"

main :: proc() {
	day_one_part_one()

	free_all(context.temp_allocator)
}

day_one_part_two :: proc() {
	input_string := #load("./input/day_one_one.txt", string)
	lines := strings.split(input_string, "\n", context.temp_allocator)
	similarity := get_similarity_score(lines)
	fmt.printf("Total distance between pairs: %d\n", similarity)
}

get_similarity_score :: proc(lines: []string) -> int {
	for line in lines {

	}
}

day_one_part_one :: proc() {
	input_string := #load("./input/day_one_one.txt", string)
	lines := strings.split(input_string, "\n", context.temp_allocator)

	total_distance := get_total_distance_between_pairs(lines)
	fmt.printf("Total distance between pairs: %d\n", total_distance)
}

get_total_distance_between_pairs :: proc(lines: []string) -> int {
	left, right := parse_number_pairs(lines)
	defer delete(left)
	defer delete(right)

	slice.sort(left[:])
	slice.sort(right[:])

	sum_distances := 0
	for num, i in left {
		sum_distances += abs(num - right[i])
	}

	return sum_distances
}

parse_number_pairs :: proc(
	lines: []string,
) -> (
	left: [dynamic]int,
	right: [dynamic]int,
) {
	for line in lines {
		if line == "" {
			continue
		}

		parts := strings.split(line, " ", context.temp_allocator)

		append(&left, strconv.atoi(parts[0]))
		append(&right, strconv.atoi(parts[3]))
	}

	return
}
