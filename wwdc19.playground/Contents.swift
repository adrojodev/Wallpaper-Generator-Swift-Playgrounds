
/*:
 # THE WALLPAPER GENERATOR
 
 This a wallpaper random generator that you can customize >:)

 The options you have are:
 
 * Edit the background color
 
 * Edit the color of the color of stroke and fill
 
 * Choose the number of each element
 
 * Select the device you want your wallpaper be for.
 
 If you want to download the wallpaper, you must:
 
 1. Create the folder “Shared Playground Data” in the “~Documents” folder.
 
 2. Remove the following comments “/*” “*/“ located at the end of the code on the lines 239 and 257.

 Have fun!
 
 */
//:---

import UIKit
import PlaygroundSupport
import Foundation

var numberOfMandalas = <#T##Number of mandalas...##Int#>
var numberOfCurves = <#T##Number of curves...##Int#>
var numberOfCircles  = <#T##Number of circles...##Int#>

var backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
var strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
var circleColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)

/*:
Type the device you want your wallpaper for. The device options are:
 
 * iPhoneX
 
 * iPhoneSE
 
 * iPhone
 
 * iPad
 
 You must write the value as shown on the options.
 */
var device = "<#T##Select your device...##String#>"

/*:
 
 Here's the code or 'non-editable' area
 
 */

//Variables for the fuctions
var maxValueX = 500
var maxValueY = 500

if device == "iPhoneX" {
    maxValueX = 375
    maxValueY = 812
} else if device == "iPhoneSE" {
    maxValueX = 320
    maxValueY = 568
} else if device == "iPhone" {
    maxValueX = 414
    maxValueY = 736
} else if device == "iPad" {
    maxValueX = 1024
    maxValueY = 1366
}
//UI variables
let size = CGSize(width: maxValueX, height: maxValueY)
let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))

//Parameters variables
let times = [1,2,3,4]
var lineTimes = [Int]()
var lineTimesY = [Int]()
var lineTimesX = [Int]()
var positionX = [Int]()
var positionY = [Int]()
var positionCircleX = [Int]()
var positionCircleY = [Int]()
var positionCircle2X = [Int]()
var positionCircle2Y = [Int]()
var xCos = [Int]()
var ySen = [Int]()
var xRepeat = 0
var yRepeat = 0
var circleDifference = [Double]()
var valueForPi = [Double]()

//This for loop
for theNumberOfTimes in stride(from: 20, to: 50, by: 1) {
    lineTimes.append(theNumberOfTimes)
}
for lineTimeYRandom in stride(from: 0, to: 50, by: 1) {
    lineTimesY.append(lineTimeYRandom)
}
for lineTimeXRandom in stride(from: 0, to: 50, by: 1) {
    lineTimesX.append(lineTimeXRandom)
}
for positionXRandom in stride(from: 0, to: maxValueX, by: 1) {
    positionX.append(positionXRandom)
}
for positionYRandom in stride(from: 0, to: maxValueY, by: 1) {
    positionY.append(positionYRandom)
}
for xCosRandom in stride(from: 0, to: maxValueX/5, by: 1) {
    xCos.append(xCosRandom)
}
for ySenRandom in stride(from: 0, to: maxValueY/5, by: 1) {
    ySen.append(ySenRandom)
}

var sizeCircleRandom = Int.random(in: 10...maxValueX/8)
var sizeCircle2Random = Int.random(in: 10...maxValueX/8)

for positionCircleYRandom in stride(from: 0, to: maxValueY - sizeCircleRandom, by: 1) {
    positionCircleY.append(positionCircleYRandom)
}
for positionCircleXRandom in stride(from: 0, to: maxValueX - sizeCircleRandom, by: 1) {
    positionCircleX.append(positionCircleXRandom)
}
for positionCircle2YRandom in stride(from: 0, to: maxValueY - sizeCircleRandom, by: 1) {
    positionCircle2Y.append(positionCircle2YRandom)
}
for positionCircle2XRandom in stride(from: 0, to: maxValueX - sizeCircleRandom, by: 1) {
    positionCircle2X.append(positionCircle2XRandom)
}
for circleDifferenceRandom in stride(from: 0.1, to: 1.0, by: 0.1) {
    circleDifference.append(circleDifferenceRandom)
}
for randomValueForPi in stride(from: 0, to: 5.0, by: 1.0) {
    valueForPi.append(randomValueForPi)
}

//Parameters random creation
var timesRandom = times.randomElement()!
var lineTimesRandom = lineTimes.randomElement()!
var lineTimesYRandom = lineTimesY.randomElement()!
var lineTimesXRandom = lineTimesX.randomElement()!
var positionXRandom = positionX.randomElement()!
var positionYRandom = positionY.randomElement()!

var positionCircleXRandom = positionCircleX.randomElement()!
var positionCircleYRandom = positionCircleY.randomElement()!
var xCosRandom = xCos.randomElement()
var ySenRandom = ySen.randomElement()
var circlceDifferenceRandom = circleDifference.randomElement()
var randomValueForPi = valueForPi.randomElement()

var positionCircle2XRandom = positionCircleX.randomElement()!
var positionCircle2YRandom = positionCircleY.randomElement()!

//PREPARE ALL THE VIEW AND STUFF :)
PlaygroundPage.current.liveView = view

UIGraphicsBeginImageContextWithOptions(size, false, 0)

let path = UIBezierPath()

//LINES ALGORYTHM

func drawTheLine(xStart:Int, yStart:Int, xFinal:Int, yFinal:Int) {
    path.move(to: CGPoint(x: xStart, y: yStart))
    path.addLine(to: CGPoint(x: xFinal, y: xFinal))
    strokeColor.setStroke()
    path.stroke()
}

func drawCircle(positionOfCircleInX:Double, positionOfCircleInY:Double, sizeOfCircle:Int) {
    let circle = UIBezierPath(ovalIn: CGRect(x:Int(positionOfCircleInX), y:Int(positionOfCircleInY), width: sizeOfCircle, height: sizeOfCircle))
        strokeColor.setStroke()
    circle.stroke()
}

func drawCircle2(positionOfCircleInX:Int, positionOfCircleInY:Int, sizeOfCircle:Int) {
    let circle2 = UIBezierPath(ovalIn: CGRect(x:Int(positionOfCircleInX), y:Int(positionOfCircleInY), width: sizeOfCircle, height: sizeOfCircle))
    circleColor.setFill()
    circle2.fill()
}
//END OF LINES ALGORYTHM
//THE RUN FUNCTIONS
var repeatTimes = 0
while repeatTimes <= numberOfCurves - 1 {
    lineTimesRandom = lineTimes.randomElement()!
    lineTimesYRandom = lineTimesY.randomElement()!
    lineTimesXRandom = lineTimesX.randomElement()!
    positionXRandom = positionX.randomElement()!
    positionYRandom = positionY.randomElement()!
    for finalNumberOfLineTimes in stride(from: 0, to: lineTimesRandom, by: 1) {
        xRepeat = lineTimesXRandom * finalNumberOfLineTimes
        yRepeat = lineTimesYRandom * (finalNumberOfLineTimes+finalNumberOfLineTimes)
        drawTheLine(xStart: positionXRandom, yStart: yRepeat, xFinal: xRepeat, yFinal: positionYRandom)
    }
    repeatTimes = repeatTimes + 1
}
repeatTimes = 0
while repeatTimes <= numberOfMandalas - 1 {
    sizeCircleRandom = Int.random(in: 10...maxValueX/8)
    positionCircleXRandom = positionCircleX.randomElement()!
    positionCircleYRandom = positionCircleY.randomElement()!
    xCosRandom = xCos.randomElement()
    ySenRandom = ySen.randomElement()
    circlceDifferenceRandom = circleDifference.randomElement()
    randomValueForPi = valueForPi.randomElement()
    for someSizeAndPosition in stride(from: 0, to: Double.pi*randomValueForPi!, by: circlceDifferenceRandom!) {
        let cx = Double(positionCircleXRandom) + Double(xCosRandom!)*cos(Double(someSizeAndPosition))
        let cy = Double(positionCircleYRandom) + Double(ySenRandom!)*sin(someSizeAndPosition)
        drawCircle(positionOfCircleInX: cx, positionOfCircleInY: cy, sizeOfCircle: sizeCircleRandom)
    }
    repeatTimes = repeatTimes + 1
}
repeatTimes = 0
while repeatTimes <= numberOfCircles - 1 {
    positionCircle2XRandom = positionCircleX.randomElement()!
    positionCircle2YRandom = positionCircleY.randomElement()!
    sizeCircle2Random = Int.random(in: 10...maxValueX/8)
    
    drawCircle2(positionOfCircleInX: positionCircle2XRandom, positionOfCircleInY: positionCircle2YRandom, sizeOfCircle: sizeCircle2Random)
    repeatTimes = repeatTimes + 1
}

//Style variables

view.backgroundColor = backgroundColor

//END OF RUN FUNCTIONS
view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage

UIGraphicsEndImageContext()

let preview = view

/*

public extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}

let myPath = playgroundSharedDataDirectory.appendingPathComponent("export.png") //You set path of image (you can change name of image, from export.png to anythingElse.png or .jpg).

let thisImage = UIImage(view: view) //Here you convert View to Image
let data = thisImage.jpegData(compressionQuality: 1.0)
try data?.write(to: myPath)
 
 */
