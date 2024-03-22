import random

def generate_imem_file(filename, num_values):
   # array_7bits = [0110011, 0010011, 0000011, 0100011, 1100011, 1100111, 0110111, 0010111, 0110111]
    array_7bits = [51, 19, 3, 35, 99, 103, 111, 23, 55]
    with open(filename, 'w') as file:
        for _ in range(num_values):
            first_7_bits = random.choice(array_7bits)
            remaining_bits = random.randint(0, 0xFFFFFFF8)  # Random value for bits [31:7]
            hex_value = format(remaining_bits, '08X' |(first_7_bits << 7) )
            file.write(hex_value + '\n')

if __name__ == "__main__":
    generate_imem_file("imem1_ini.mem", 32)