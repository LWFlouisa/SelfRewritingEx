old_description = File.read("_feed/old_description.txt").to_s.strip

new_description = "<description>
      <process_name>#{pname}</process_name>
      <technical_description>#{tdesc}</technical_description>
      <laymans>#{lmans}</laymans>
    </description>"

screen = "<screen>
  <container>
    #{old_description}

    #{new_description}
  </container>
</screen>"

# Creates the feed.
File.open("_feed/feed.xml", "w") { |f|
  f.puts screen
}

# Saves copy of old feed.
File.open("_feed/old_description.txt", "w") { |f|
  f.puts new_description
}
