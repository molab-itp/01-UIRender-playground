
// Draw 10print style maze using UIGraphic and CGContext drawPath
// Write created image to local file
// https://developer.apple.com/documentation/coregraphics/cgcontext
//

import UIKit

let dim = 1024.0
let backLevel = 0.0
let lineLen = 1 / 10.0
let strokeLen = 4 / 10.0

let renderer = UIGraphicsImageRenderer(size: CGSize(width: dim, height: dim))

var image = renderer.image { (context) in
    let ctx = context.cgContext
    let box = renderer.format.bounds
    UIColor.white.setFill();
    context.fill(box)
    let xlen = box.width * lineLen
    let ylen = box.height * lineLen
    ctx.setLineCap(.round)
    ctx.setStrokeColor(UIColor.black.cgColor)
    ctx.setLineWidth(xlen * strokeLen)
    var x = 0.0
    var y = 0.0
    while y < box.height {
        if Bool.random() {
            // Draw line top left to bottom right
            ctx.move(to: CGPoint(x: x, y: y))
            ctx.addLine(to: CGPoint(x: x+xlen, y: y+ylen))
        }
        else {
            // Draw line top right to bottom left
            ctx.move(to: CGPoint(x: x+xlen, y: y))
            ctx.addLine(to: CGPoint(x: x, y: y+ylen))
        }
        ctx.drawPath(using: .fillStroke)
        x += xlen
        if x > box.width {
            x = 0
            y += ylen
        }
    }
}

image

// get the bag of bits that represent the image as a png file
let data = image.pngData()

let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

// Output path for the file in the Documents folder
// Use a different file name here to have file appear as most recently added
let filePath = folder!.appendingPathComponent("10print2024-09.png");

let err: ()? = try? data?.write(to: filePath)
print("err \(String(describing: err))\nfilePath \(filePath)")

// Terminal command 'cp' to copy output file to Downloads folder
// The trailing period means use the same file name as the source
print("cp \(filePath.absoluteString.dropFirst(7)) ~/Downloads/." )

