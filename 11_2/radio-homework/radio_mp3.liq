set("log.stdout", true)

# Загружаем плейлист. mksafe гарантирует, что поток не прервется, 
# даже если в музыке возникнет пауза.
stream = mksafe(playlist(mode="normal", "/music/playlist.m3u"))

output.icecast(%mp3,
  host = "icecast", 
  port = 8000,
  password = "hackme", 
  mount = "radio",
  name = "My MP3 Radio",
  stream)