import * as THREE from 'three'
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader'
import { DRACOLoader } from 'three/examples/jsm/loaders/DRACOLoader'

class Model {
  constructor (obj) {
    this.name = obj.name
    this.file = obj.file
    this.scene = obj.scene
    this.placeOnLoad = obj.placeOnLoad

    this.loader = new GLTFLoader()
    this.dracoLoader = new DRACOLoader()
    this.dracoLoader.setDecoderPath('./draco/')
    this.loader.setDRACOLoader(this.dracoLoader)

    this.init()
  }

  init () {
    this.loader.load(this.file, (response) => {
      /*---------------------------------
      Original Mesh
      ---------------------------------*/
      this.mesh = response.scene.children[0]

      /*---------------------------------
      Material Mesh
      ---------------------------------*/
      this.material = new THREE.MeshBasicMaterial({
        color: 'red',
        wireframe: true
      })
      this.mesh.material = this.material

      /*---------------------------------
      Geometry Mesh
      ---------------------------------*/
      this.geometry = this.mesh.geometry

      /*---------------------------------
      Place on load
      ---------------------------------*/
      if (this.placeOnLoad) {
        this.add()
      }
    })
  }

  add() {
    this.scene.add(this.mesh)
  }

  remove() {
    this.scene.remove(this.mesh)
  }
}

export default Model
