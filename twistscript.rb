require "digest/md5";

$code = File.open(ARGV.pop).read();
$seed = Digest::MD5.hexdigest($code).to_i(16);
$pipe = IO.pipe;
$input = $stdin.read;
$stdin.reopen($pipe[0]);
$pipe[1] << ";" + $input;
$programs = Array.new;
srand($seed);

for i in 0..127 do
  $program = "";
  for c in 0..rand(11) do
    $program << rand(128).chr;
  end
  $programs[i] = $program;
end

while not $code.empty?
  $index = rand($code.length);
  $char = $code[$index].ord;
  $code.slice!($index);
  $pipe[1] << $programs[$char];
end

$pipe[1].close;
require_relative "golfscript"
