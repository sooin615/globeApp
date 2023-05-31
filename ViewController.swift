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
        
        let star = SCNNode()
                
//        sceneView.showsStatistics = true
//        sceneView.autoenablesDefaultLighting = true
        
        sceneView.allowsCameraControl = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
