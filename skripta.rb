require 'json'

data = []

4.upto(550) do |n|
  date = `curl -s http://asotarchive.org/episode/a-state-of-trance-#{n}/ | grep -o '[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'`
  data.push(
    {
      id: n,
      title: "A State Of Trance #{n}",
      date: date.chomp,
      link: "http://asotarchive.org/episode/a-state-of-trance-#{n}/",
      checked: false
    }
  )
  puts n
end

File.open("qwe.txt", "a+") do |file|
  file.write(data.to_json)
end
