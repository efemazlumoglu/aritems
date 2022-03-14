//
//  Model.swift
//  ARItems
//
//  Created by Efe Mazlumoğlu on 14.03.2022.
//

import Foundation
import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String){
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: {loadCompletion in
            
            }, receiveValue: {modelEntity in
                self.modelEntity = modelEntity
            })
    }
}
