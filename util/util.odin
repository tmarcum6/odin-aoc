package util

import "core:fmt"
import "core:mem"
import "core:os"
import "core:strconv"
import "core:strings"

TupleRep :: struct {
	x: int,
	y: int,
}

read_file :: proc(filename: string) -> string {
	file, err := os.open(filename)
	if err != nil {
		fmt.println("Failed to open file:", err)
	}
	defer os.close(file)

	size: i64
	size, err = os.file_size(file)
	if err != nil {
		fmt.println("Failed to get file size:", err)
	}

	buffer := make([]u8, size)
	defer delete(buffer)

	_, err = os.read(file, buffer)
	if err != nil {
		fmt.println("Failed to read file:", err)
	}

	data := string(buffer)

	return data
}

parse_numbers :: proc(
	str: string,
) -> (
	left: [dynamic]int,
	right: [dynamic]int,
) {
	lines := strings.split(str, "\r\n", context.temp_allocator)

	for line in lines {
		if line == "" {
			continue
		}

		nums := strings.split(line, " ", context.temp_allocator)

		append(&left, strconv.atoi(nums[0]))
	}

	return
}
