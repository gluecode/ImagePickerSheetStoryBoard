//
//  ViewController.swift
//  photoSheetTest
//
//  Created by Sunil Karkera on 5/22/15.
//

import UIKit
import Photos
import ImagePickerSheet

class ViewController: UIViewController, ImagePickerSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPhotoButton(sender: AnyObject) {
        let sheet = ImagePickerSheet()
        sheet.numberOfButtons = 3
        sheet.delegate = self
        sheet.showInView(view)
    }

    func imagePickerSheet(imagePickerSheet: ImagePickerSheet, titleForButtonAtIndex buttonIndex: Int) -> String {
        let photosSelected = (imagePickerSheet.selectedPhotos.count > 0)
        
        if (buttonIndex == 0) {
            if photosSelected {
                return NSLocalizedString("Add comment", comment: "Add comment")
            }
            else {
                return NSLocalizedString("Take Photo Or Video", comment: "Take Photo Or Video")
            }
        }
        else {
            if photosSelected {
                return NSString.localizedStringWithFormat(NSLocalizedString("ImagePickerSheet.button1.Send %lu Photo", comment: "The secondary title of the image picker sheet to send the photos"), imagePickerSheet.selectedPhotos.count)
            }
            else {
                return NSLocalizedString("Photo Library", comment: "Photo Library")
            }
        }
    }
    
    func imagePickerSheet(imagePickerSheet: ImagePickerSheet, willDismissWithButtonIndex buttonIndex: Int) {
        if buttonIndex != imagePickerSheet.cancelButtonIndex {
            if imagePickerSheet.selectedPhotos.count > 0 {
                println(imagePickerSheet.selectedPhotos)
            }
            else {
                let controller = UIImagePickerController()
                controller.delegate = self
                controller.sourceType = (buttonIndex == 2) ? .PhotoLibrary : .Camera
                presentViewController(controller, animated: true, completion: nil)
            }
        }
    }
}

