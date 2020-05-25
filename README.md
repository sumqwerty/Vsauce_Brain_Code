# Vsauce_Brain_Code
Program to show how human brain detects digits with layers of neurons.(Not machine learning)

This is a project to show how human brain identifies digits, its NOT machine learning or genetic coding, its sort of a already trained human brain which detects single digits. In this project i am trying to convert the Stilwell Brain project Vsauce did in a mind field video.(https://www.youtube.com/watch?v=rA5qnZUXcqo)

This "Brain" has 4 layers as follows:

## Retina Layer
This layer acts as eyes and take input from the pixels, its the first layer.

## V1 Layer
This layer collects the data from retina and look for horizontal and vertical lines.

## V2 Layer
This layer collects the data from V1 and look for combinations of vertical and horzontal lines making angles.

## V4 Layer
This is the layer which combines the angles from V2 to form rough shapes of the digits

## IT Layer(which i haven't used but is resposible for deciding what the digit is by looking at V4)
### In the code IT layer is not in the form of an array like the other layers, but its a function which outputs the final digit that the "Brain" has detected.
This layer is not in the code,although it can be added. The IT layer is responsible for detecting the final digit from V4.

![Demo](https://github.com/sumqwerty/Vsauce_Brain_Code/blob/master/demo.gif)
