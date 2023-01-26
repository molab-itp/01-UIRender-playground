
// save an image to a file

import UIKit


let image = UIImage(systemName: "trash.circle.fill")!

let data = image.pngData()

let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
let filePath = folder!.appendingPathComponent("trash.png");

let err: ()? = try? data?.write(to: filePath)
print("err \(String(describing: err))\nfilePath \(filePath)")

// open filepath
// cp --filePath-- ~/Downloads/.
