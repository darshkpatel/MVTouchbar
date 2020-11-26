![MVTouchbar](https://socialify.git.ci/TouchbarApps/MVTouchbar/image?description=1&descriptionEditable=An%20OpenSource%20Audio%20Visualisation%20tool%20for%20the%20Mac%27s%20TouchBar&font=Source%20Code%20Pro&forks=1&issues=1&logo=https%3A%2F%2Fgithub.com%2FTouchbarApps%2FMVTouchbar%2Fblob%2Fmain%2Fassets%2Flogo.png%3Fraw%3Dtrue&owner=1&pattern=Floating%20Cogs&pulls=1&stargazers=1&theme=Light)

### Features

**Note:** Currently a PoC Application, Major changes need to be done to this application. ( This is also my first Swift Project so it's in no way testament to best programming practices )

-  Music Visualizer (Duh!)
-  Visualize audio from system microphone

In Progress
- Visualize system audio directly without microphone
- Aggregate Audio Device Setup
- Visualization Customization
- Support for Gradients
### Usage
Download the latest application from the releases page. If Gatekeeper throws an error, right-click and then open the app.

Press Allow to the Microphone Permission Prompt (Plans to make it optional after system audio source is supported)

Currently the application starts up as an extra Button in the touchbar, press the button to view the visualizer ( This visualizer is persistent across applications and won't close automatically when you switch applications, thanks to [touch-baer](https://github.com/a2/touch-baer)) 

**Note:** Might be incompatible with tools like Pock or Better Touch Tool, since they use similar methods to override the touchbar switching
### Screenshots

#### Touchbar
![](./assets/screenshots/s4.png)
![](./assets/screenshots/s5.png)
![](./assets/screenshots/s6.png)
![](./assets/screenshots/s7.png)


#### Menu Bar
![](./assets/screenshots/s2.png)



### License
MVTouchBar is available under the GNU General Public License v3.0. See the [LICENSE file](LICENSE).

Note: This is derived from [Touch-Bar-Visualizer](https://github.com/supersimple33/Touch-Bar-Visualizer/) with additional features and changes.