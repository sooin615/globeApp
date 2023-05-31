//
//  ViewController.swift
//  earthApp
//
//  Created by 손민 on 2023/05/02.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    override func loadView() {
        
        self.view = SCNView()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let scene = SCNScene()
        
        let camera = SCNNode()
        camera.camera = SCNCamera()
        camera.position = SCNVector3(x: 0, y: 0, z: 5)
        
        scene.rootNode.addChildNode(camera)
        
        
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 1)
        earth.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth")
        scene.rootNode.addChildNode(earth);
        
        let sceneView = self.view as! SCNView
        sceneView.scene = scene
        
        _ = SCNNode()
        
                sceneView.showsStatistics = true
                sceneView.autoenablesDefaultLighting = true
        
        sceneView.allowsCameraControl = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
               // check what nodes are tapped
                let p = gestureRecognize.location(in: view)
                let hitResults = view.hitTest(p, with: [:])
               
               // check that we clicked on at least one object
               if hitResults.count > 0 {
                   
                   // retrieved the first clicked object
                   let result = hitResults[0]
            
                   // get material for selected geometry element
                   let material = result.node.geometry!.materials[(result.geometryIndex)]
                   
                   // highlight it
                   SCNTransaction.begin()
                   SCNTransaction.animationDuration = 0.5
                   
                   // on completion - unhighlight
                   SCNTransaction.completionBlock = {
                       SCNTransaction.begin()
                       SCNTransaction.animationDuration = 0.5
                       
                       material.emission.contents = UIColor.black
                     
                       SCNTransaction.commit()
                   }
                   material.emission.contents = UIColor.green
                   SCNTransaction.commit()
               }
           }
}



