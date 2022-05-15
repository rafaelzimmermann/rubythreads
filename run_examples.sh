#!/bin/bash

pull_images () {
    docker pull -q jonwood/ruby-1.8 
    docker pull -q ruby:1.9.3
    docker pull -q ruby:2.4.1
    docker pull -q ruby:2.7.6
    docker pull -q ruby:3.0.4
    docker pull -q ruby:3.1.2
    docker pull -q ruby:3.2-rc-buster
}

run_file () {
    file=$1

    ruby_1_8=$(docker run -v $(pwd):/app jonwood/ruby-1.8 ruby $file 2>/dev/null)
    ruby_1_9=$(docker run -v $(pwd):/app ruby:1.9.3 ruby $file 2>/dev/null)
    ruby_2_4=$(docker run -v $(pwd):/app ruby:2.4.1 ruby $file 2>/dev/null)
    ruby_2_7=$(docker run -v $(pwd):/app ruby:2.7.6 ruby $file 2>/dev/null)
    ruby_3_0=$(docker run -v $(pwd):/app ruby:3.0.4 ruby $file 2>/dev/null)
    ruby_3_1=$(docker run -v $(pwd):/app ruby:3.1.2 ruby $file 2>/dev/null)
    ruby_3_2=$(docker run -v $(pwd):/app ruby:3.2-rc-buster ruby $file 2>/dev/null)

    printf "%16s\t%08s\t%08s\t%08s\t%08s\t%08s\t%08s\t%08s\n" "${file}" "${ruby_1_8}" "${ruby_1_9}" "${ruby_2_4}" "${ruby_2_7}" "${ruby_3_0}" "${ruby_3_1}" "${ruby_3_2}"

}

# pull_images

printf "%16s\t%06s\t%06s\t%06s\t%06s\t%06s\t%06s\t%06s\n" "File" "Ruby 1.8" "Ruby 1.9" "Ruby 2.4" "Ruby 2.7" "Ruby 3.0" "Ruby 3.1" "Ruby 3.2"

run_file /app/example1.rb
run_file /app/example2.rb
run_file /app/example3.rb
run_file /app/example4.rb
run_file /app/example5.rb
run_file /app/example6.rb
run_file /app/example7.rb
