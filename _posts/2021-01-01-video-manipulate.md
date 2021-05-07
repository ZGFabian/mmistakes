---
layout: single
title: Video manipulating from the command line
subtitle: Linux examples
categories: [linux]
tags: [CLI, subtitles, ffmpeg, ytdl, youtube-dl, slideshow]
toc: true
lang: en
# image: hu-mortality-w36-small.png
# comments: true
date: 2021-01-01
---
There are several applications and online tools that can be used to convert, extract, resize, etc video content under GNU/Linux desktops. The following post focuses on some command line utilities aka CLI tools.

{% include video id="tlgBgZGDmYs" provider="youtube" %}

## Download video from the web (ytdl)

The `ytdl` CLI tool is part of the [`pafy` python package](). Install with `pip install pafy` command from a terminal. With `ytdl` one can download a video from Youtube. Checkout available options with `ytdl -h` (help).

1. Search for available formats with `-s` option:

{: .full}
```
λ pepin ~ → ytdl https://youtu.be/tlgBgZGDmYs -s
Stream Type    Format Quality         Size
------ ----    ------ -------         ----
1      normal  mp4    [640x360]       12 MB
2      normal  mp4    [1280x720]      25 MB
3      audio   webm   [160k]           3 MB
4      audio   m4a    [128k]           3 MB
5      audio   webm   [70k]            2 MB
6      audio   webm   [50k]            1 MB
```

2. Download the chosen format (`-n N`) to folder of your choice (`-o O`). `O` is a path string like `~/Downloads` or whatever. In the example below I have downloaded a video mp4 (640x360) stream to `jimmy.mp4` file that is located in `~/Downloads/jimmy/` directory. 

```
λ pepin ~ → ytdl https://youtu.be/tlgBgZGDmYs -n 1 -o ~/Downloads/jimmy/jimmy.mp4
-Downloading 'Jimmy Takes a Wild Ride | Yellowstone Season 1 | Paramount Network.mp4' [13,001,347 Bytes]
-Quality: 640x360; Format: mp4

Done
```

## `youtube-dl`, the Big Gun

`youtube-dl` is a more general and much more complex tool compared to `ytdl`. It is available from package managers of major Linux distros. On Arch based systems you can use `sudo pacman -S youtube-dl` command to install. Visit [project page](https://ytdl-org.github.io/youtube-dl/index.html) for alternative install methods and detailed documentation.

## Download subtitles from Youtube with youtube-dl

There is a `--list-subs` option that is used to list available languages and formats. After you found your preferred language with  `youtube-dl --list-subs URL` command, you can proceed like this. 

```
youtube-dl --write-sub --sub-lang en --skip-download https://youtu.be/tlgBgZGDmYs
```

The above command downloads an (English) plain text file in [vtt format](https://developer.mozilla.org/en-US/docs/Web/API/WebVTT_API) and skipping the video download. You can add this vtt file to video players (such as mpv) to show subtitles or edit/analyse the text itself.

### Cut out part of a video
You have to download the whole video (either with ytdl or youtube-dl) and use ffmpeg.
However, there is an easy to use [bash script](https://www.dropbox.com/s/o88mgp2jznpywt3/vcp?dl=0) based on [`ffmpeg`](https://ffmpeg.org/). The script was written by a [reddit user](https://www.reddit.com/r/youtubedl/comments/cf4fzu/download_time_range/eu7smeb?utm_source=share&utm_medium=web2x&context=3). Download it from Dropbox to a folder at your `$PATH` (e.g.  ~/.local/bin) and give executable permission with `chmod +x`. 

```
usage: vcp [ --scale WIDTH:HEIGHT ] [ --aspect X:Y ] START END INFILE OUTFILE

Copies part of video file INFILE to OUTFILE, starting at time START, and ending
at time END.  Only one video and one audio stream is copied (see the ffmpeg
docs for how it chooses the streams, but ffmpeg defaults to the highest quality
streams).

START/END have the format [HH:][MM:]SS[.s...], where HH is hours, MM is
minutes, SS is seconds, and s is a decimal fraction of a second.  If
STARTTIME/ENDTIME is '-', the actual start/end (respectively) time of the
video is used.

--aspect  =>  Sets the aspect ratio at the container level.  Does not
              transcode video.

--scale   =>  Scales video to new WIDTH and HEIGHT (in pixels) without
              changing the aspect ratio.  NOTE: This transcodes the video!

```
The next example cut out 7 seconds from jimmy.mp4 that I have downloaded previously. 

```
vcp 1:03 1:10 jimmy.mp4 jimmy-out1.mp4
```
However, for some reasons I couldn't use `aspect` and `scale` options.

## Create a slideshow-like video

This is how Luke Smith does with `imagemagick` and `ffmpeg`.
{% include video id="4wM2VzubQoM" provider="youtube" %}
 
<!-- 
### Create gif


Once you have a (short) video you can use `gifski` to create gif. (Gifski is a tool written in rust programming language.) Note if you do not compile the program with video support, you need to convert the clip to picture frames first with ffmpeg.

1. To compile gifski with video support you must run: `cargo install gifski --features=video`. However it is not an easy task, as it may sounds. I am not going to encourage you to do so. Just follow the developer's [instructions](https://github.com/ImageOptim/gifski/blob/main/README.md#with-built-in-video-support):

> "You must have ffmpeg and libclang installed, both with their C headers intalled in default system include paths. Details depend on the platform and version, but you usually need to install packages such as libavformat-dev, libavfilter-dev, libavdevice-dev, libclang-dev, clang. Please note that installation of these dependencies may be quite difficult. Especially on macOS and Windows it takes expert knowledge to just get them installed without wasting several hours on endless stupid installation and compilation errors, which I can't help with."

If you are willing to face difficulties than you will need to install `cargo`. Use your package manager to do so. On Arch (and other Arch-based distros, like Manjaro) you can always consult with [ArchWiki](https://wiki.archlinux.org/index.php/rust). This is the end of my current knowledge. Here be dragons afterwards. 

2. Create picture frames



3. Convert frames to gif
-->

## Related CLI projects 

 - [you-get](https://github.com/soimort/you-get) - a python based command-line utility to download media contents (videos, audios, images) from the Web.
 - [ytdl-npm](https://www.npmjs.com/package/ytdl) - is a youtube downloader written in Javascript. Browse source at [Github](https://github.com/fent/node-ytdl).
Naming is somewhat confusing. This is different from aforementioned [python's pafy library](https://pypi.org/project/pafy/), that also provides a command line tool (ytdl) for downloading Youtube content.

## GUI video recording apps

- OBS
- simplescreenrecorder (lightweight qt app)