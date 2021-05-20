import {
  BoxGeometry,
  FogExp2,
  Mesh,
  MeshNormalMaterial,
  PerspectiveCamera,
  Scene,
  WebGLRenderer,
} from "three";

const width = 960;
const height = 600;
const side = 20;

const canvas = document.querySelector("#canvas1");

if (canvas === null || !(canvas instanceof HTMLCanvasElement)) {
  throw new Error("#canvas1 is not <canvas />");
}

const scene = new Scene();

scene.fog = new FogExp2(0x000000, 0.008);

const cube = new Mesh(
  new BoxGeometry(side, side, side),
  new MeshNormalMaterial()
);

scene.add(cube);

const camera = new PerspectiveCamera(45, width / height, 1, 1000);
camera.position.set(20, 20, 100);
camera.lookAt(scene.position);

const renderer = new WebGLRenderer({
  canvas,
});
renderer.setSize(width, height);

renderer.render(scene, camera);
