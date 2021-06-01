# Image locators vs. keyboard navigation and OCR

This project contains two robots that create new robots(!) using [VS Code](https://code.visualstudio.com/).

One robot uses image locators - basically screenshots of the UI elements - to find things to click on. The other use keyboard navigation and OCR.

All of the strategies have their strengths and weaknesses.

## Image locators

### Strengths

- Can target any visual element on all platforms.

### Weaknesses

- Will fail if the visuals change too much (graphics, colors, resolution).

## Keyboard navigation

### Strengths

- Quite robust: keyboard shortcuts change less often than visual user interfaces.

### Weaknesses

- Need to be used together with either image or OCR locators to assert the completion of slow operations.

## OCR

### Strengths

- Somewhat more resilient against visual UI changes than image locators.

### Weaknesses

- Require unique matches: if there are no unique texts on the screen, requires targeting specific parts of the screen to narrow down the results.

## Which strategy to choose?

In practice, a combination of all the strategies might be the best compromise. Use the strengths, be mindful of the weaknesses, and combine all the strategies to build a robot that does what it's supposed to do and is quite resilient against moderate changes in the UI.
