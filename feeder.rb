print "What is the process name? << "; pname = gets.chomp.strip # Process name
print "What is the technical description? << "; tdesc = gets.chomp.strip # Technical description
print "What is the laymans explanation? << "; lmans = gets.chomp.strip # Laymans explanation

old_description = File.read("_feed/old_description.txt").to_s.strip

new_description = "<description>
      <process_name>#{pname}</process_name>
      <technical_description>#{tdesc}</technical_description>
      <laymans>#{lmans}</laymans>
    </description>"

screen = "
<?xml version='1.0' encoding='UTF-8'?>
<?xml-stylesheet type='text/css' href='styles.css'?>

<screen>
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
