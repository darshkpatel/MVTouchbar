![MVTouchbar](https://socialify.git.ci/TouchbarApps/MVTouchbar/image?description=1&descriptionEditable=An%20OpenSource%20Audio%20Visualisation%20tool%20for%20the%20Mac%27s%20TouchBar&font=Source%20Code%20Pro&forks=1&issues=1&logo=https%3A%2F%2Fgithub.com%2FTouchbarApps%2FMVTouchbar%2Fblob%2Fmain%2Fassets%2Flogo.png%3Fraw%3Dtrue&owner=1&pattern=Floating%20Cogs&pulls=1&stargazers=1&theme=Light)

### Features

**Note:** Currently a PoC Application, Major changes need to be done to this application. ( This is also my first Swift Project so it's in no way testament to best programming practices )

- Music Visualizer (Duh!)
- Visualize audio from system microphone
- Low Resource Consumption (9% utilization of a single core, ~60MB Ram )

In Progress
- Visualize system audio directly without microphone
- Visualization Customization (Change Colors, Gradient Support)
### Screenshots
#### Touchbar
![](./assets/screenshots/s4.png)
![](./assets/screenshots/s5.png)
![](./assets/screenshots/s6.png)
![](./assets/screenshots/s7.png)


#### Menu Bar
![](./assets/screenshots/s2.png)


### Usage
Download the latest application from the [releases page](https://github.com/TouchbarApps/MVTouchbar/releases). If Gatekeeper throws an error, right-click and then open the app.

Press Allow to the Microphone Permission Prompt (Plans to make it optional after system audio source is supported)

Currently the application starts up as an extra Button in the touchbar, press the button to view the visualizer ( This visualizer is persistent across applications and won't close automatically when you switch applications, thanks to [touch-baer](https://github.com/a2/touch-baer)) 

**Note:** Might be incompatible with tools like Pock or Better Touch Tool, since they use similar methods to override the touchbar switching

### Miscellaneous Screenshots
![](./assets/screenshots/s1.png)
![](./assets/screenshots/s3.png)


### License
MVTouchBar is available under the GNU General Public License v3.0. See the [LICENSE file](LICENSE).

Note: This is derived from [Touch-Bar-Visualizer](https://github.com/supersimple33/Touch-Bar-Visualizer/) with additional features and changes.
## Contributors ✨
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://www.arpitjain.tech/"><img src="https://avatars1.githubusercontent.com/u/32438047?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Arpit Jain</b></sub></a><br /><a href="https://github.com/TouchbarApps/MVTouchbar/commits?author=ArpitKotecha" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/darshkpatel"><img src="https://avatars0.githubusercontent.com/u/11258286?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Darsh Patel</b></sub></a><br /><a href="https://github.com/TouchbarApps/MVTouchbar/commits?author=darshkpatel" title="Documentation">📖</a> <a href="https://github.com/TouchbarApps/MVTouchbar/commits?author=darshkpatel" title="Code">💻</a> <a href="#infra-darshkpatel" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
