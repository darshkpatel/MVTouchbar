const { time } = require('console');
const { app, BrowserWindow, TouchBar } = require('electron')
const { TouchBarLabel, TouchBarButton} = TouchBar

let spinning = false


const bars = Array.from({length:30}, _=>new TouchBarLabel());
// Spin result label
const result = new TouchBarLabel()

// Spin button
const randomize = new TouchBarButton({
  label: 'Randomize',
  backgroundColor: '#7851A9',
  click: () => {
    // Ignore clicks if already running
    if (spinning) {
      return
    }

    spinning = true
    result.label = ''

    let timeout = 100
    const spinLength = 10 * 1000 // 10 seconds
    const startTime = Date.now()

    const spinReels = () => {
      updateReels()

      if ((Date.now() - startTime) >= spinLength) {
        finishSpin()
      } else {
        // Slow down a bit on each spin
        // timeout *= 1.1
        setTimeout(spinReels, timeout)
      }
    }

    spinReels()
  }
})

const getRandomValue = () => {
  const values = ['▆', '▄', '▁']
  return values[Math.floor(Math.random() * values.length)]
}
const getRandomColor = () => {
  const values = ["#7400b8","#6930c3","#5e60ce","#5390d9","#4ea8de","#48bfe3","#56cfe1","#64dfdf","#72efdd","#80ffdb"]
  return values[Math.floor(Math.random() * values.length)]
}

const updateReels = () => {

// Update Random Bar and Color
  bars.forEach(bar => {
    bar.label = getRandomValue()
    bar.textColor = getRandomColor()
  })
}

const finishSpin = () => {
  spinning = false
}


updateReels();

const touchBar = new TouchBar({
  items: [
    randomize,
    ...bars
  ]
})

let window

app.whenReady().then(() => {
  window = new BrowserWindow({
    frame: false,
    titleBarStyle: 'hiddenInset',
    width: 200,
    height: 200,
    backgroundColor: '#000'
  })
  window.loadURL('about:blank')
  window.setTouchBar(touchBar)
})
