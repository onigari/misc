@echo off
set /p url="Enter video/playlist URL: "
set path="E:\\Downloads"
set /p path="Where to save files? (Press ENTER for default): "
set /p s="(leave empty to download all) Playlist start from?: "
set /p e="(leave empty to download all) Playlist end at?: "
echo Which quality do you want?
echo Press 1 for 480p
echo Press 2 for 720p
echo Press 3 for 1080p
echo Press 4 for audio
set /p quality=
if %quality%==1 (set qid=135+139)
if %quality%==2 (set qid=136+139)
if %quality%==3 (set qid=137+139)
if %quality%==4 (set qid=140)
C:\\Users\\fbgta\\yt-dlp.exe %url% -f %qid% --ffmpeg-location "C:\\ffmpeg\\bin" -P "%path%" -o "%%(playlist_index)s - %%(title).200B.%%(ext)s" -I %s%:%e% 
pause