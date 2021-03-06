//
//  Video.swift
//  youtube
//
//  Created by Dilyana Yankova on 7/4/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import UIKit
//to represent the video - each video...what to render
class Video: SafeJsonValue {
   @objc var thumbnail_image_name: String?
   @objc var title: String?
   @objc var number_of_views: NSNumber?
   @objc var uploadDate: NSDate?
   @objc var duration: NSNumber?
    //each video belongs to channel
   @objc var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            self.channel = Channel()
            let channelDict = value as! [String: Any]
            //set to video the channel from the json
            self.channel?.setValuesForKeys(channelDict)
        } else {
           super.setValue(value, forKey: key)
        }
    }
    //every time the video object is created it will call init and setValues
  init(dictionary: [String: Any]){
      super.init()
      setValuesForKeys(dictionary)
    }
}
