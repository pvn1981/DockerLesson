set("log.stdout", true)

# Чистый тон 440Гц (нота Ля)
stream = mksafe(sine(duration=10.0))

output.icecast(%mp3,
  host = "icecast", 
  port = 8000,
  password = "qwerty", 
  mount = "radio",
  stream)