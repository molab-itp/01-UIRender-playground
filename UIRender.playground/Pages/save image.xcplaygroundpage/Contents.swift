
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
// cp /Users/jht2/Library/Developer/XCPGDevices/21C4B76E-B237-4F4E-819B-039C6127A1A6/data/Containers/Data/Application/8ACBA674-5800-46FC-AA1B-35679C770D20/Documents/trash.png ~/Downloads/.
