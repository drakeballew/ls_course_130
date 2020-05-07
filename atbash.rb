class Atbash
  CIPHER = {
    'a' => 'z',
    'b' => 'y',
    'c' => 'x',
    'd' => 'w',
    'e' => 'v',
    'f' => 'u',
    'g' => 't',
    'h' => 's',
    'i' => 'r',
    'j' => 'q',
    'k' => 'p',
    'l' => 'o',
    'm' => 'n',
    'n' => 'm',
    'o' => 'l',
    'p' => 'k',
    'q' => 'j',
    'r' => 'i',
    's' => 'h',
    't' => 'g',
    'u' => 'f',
    'v' => 'e',
    'w' => 'd',
    'x' => 'c',
    'y' => 'b',
    'z' => 'a',
    '1' => '1',
    '2' => '2',
    '3' => '3'
  }.freeze

  def self.encode(plaintext_string)
    first_arr = []
    second_arr = []
    plaintext_string.gsub(/\s+/, "").downcase.each_char do |char|
      if CIPHER[char]
        first_arr << CIPHER[char]
      else
        char
      end
    end
    first_arr.each_with_index do |char, idx|
      second_arr.push(' ') if idx % 5 == 0
      second_arr << char
    end
    second_arr.join.strip
  end
end
