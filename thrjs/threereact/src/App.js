import React,{ Component } from "react";
import "./App.css";
import * as THREE from "three";

let scene, camera, renderer, cube;

class App extends Component {
  constructor(props) {
    super(props);
    this.animate = this.animate.bind(this);
  }
  init() {
    // Scene
    scene = new THREE.Scene();
    scene.background = new THREE.Color(0x000000);

    // Camera
    camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight
    );

    // Renderer
    renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    //document.body.appendChild(renderer.domElement);

    // Cube
    const geometry = new THREE.BoxGeometry();
    const material = new THREE.MeshBasicMaterial({
      color: 0x00ff00,
      wireframe: true,
    });
    cube = new THREE.Mesh(geometry, material);
    scene.add(cube);

    camera.position.z = 5;
    return renderer.domElement;
  }

  // Animation
  animate() {
    requestAnimationFrame(this.animate);

    cube.rotation.x += 0.01;
    cube.rotation.y += 0.01;

    renderer.render(scene, camera);
  }
  componentDidMount() {
    document.getElementById("Render").appendChild(this.init());
    this.animate();
  }

  render() {
    return <div id="Render" className="App"></div>;
  }
}

export default App;
