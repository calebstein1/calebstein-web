import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera( 30, window.innerWidth / window.innerHeight, 0.1, 1000 );
const loader = new GLTFLoader();

const renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.getElementById("threejs-bg").appendChild( renderer.domElement );

loader.load( '/app/assets/models/galaxy.glb', function ( gltf ) {
  scene.add( gltf.scene );
}, undefined, function ( error ) {
  console.error( error );
});

scene.rotation.x = 0.15;
camera.position.z = 3;

function animate() {
	requestAnimationFrame( animate );

  scene.rotation.x += 0.001;
	scene.rotation.y += 0.001;

	renderer.render( scene, camera );
}

export default animate;
