Android Screen Recorder
Copyright (C) 2014  Jake Kinsella

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
    

Operating Systems that are compatible with this script:  
Mac OS X  
All operating systems with a linux kernal (UNTESTED)  
All operating systems with a unix-based kernal?  
NOT WINDOWS (Sorry!)

How To Run:  

Run the command:
```
chmod +x install.sh
```

Execute the scriptL
```
./install.sh
```
  
Install ADB from http://developer.android.com/sdk/index.html?hl=sk and follow the instructions to install it  
ADB MUST be added to your path for this program to execute  

After you have completed the steps above just run the command:  
```
ruby AndroidRecorder.rb
```

Things to keep in mind:  
	- You CANNOT rotate your screen  
	- You must record for at least one second  
	- This program do not record audio  

Future Updates (Updates are listed in order of importance):  
	- A way to record sound coming from your Android device  
	- A way to specify where your Android ADT Bundle is  
	- Extra options for recording  
	- Decreasing glitches when recording restarts  
	- Code cleanup  


BUGS:  
	- You cannot rotate your Android device during the recording  
	- The outputed media file will be upside down  
	- There are slight glitches every 3 minutes do to recording restarting  
	- You must record for at least 1 second for it to work  

This program uses ADB distributed under Apache2.0 and is created Google Inc.  
Find the license for ADB online here http://www.apache.org/licenses/LICENSE-2.0.html  