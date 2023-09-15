
// define function to load an image from a url

import UIKit

// Read in an image from a url string
func imageFor(_ str: String) -> UIImage {
    let url = URL(string: str)
    let imgData = try? Data(contentsOf: url!)
    let uiImage = UIImage(data:imgData!)
    return uiImage!
}

// profile image
let u1 = "https://lh3.googleusercontent.com/a/AEdFTp6gdANzhWmT2dZ69WP2UB5edH-_ZitKIkD0Cwks=s280"
imageFor(u1)

// itp staff
let u2 = "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/dan-osullivan1.jpg.preset.square.jpeg"
imageFor(u2)





