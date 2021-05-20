import {
  BoxGeometry,
  FogExp2,
  Mesh,
  MeshNormalMaterial,
  PerspectiveCamera,
  Scene,
  SphereGeometry,
  WebGLRenderer,
  PointsMaterial,
  BufferGeometry,
  Points,
  MathUtils,
  Float32BufferAttribute,
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

const sphere1 = new Mesh(
  new SphereGeometry(side, 20, 20),
  new MeshNormalMaterial({ wireframe: true })
);

sphere1.position.set(side * 2, 0, 0);

scene.add(sphere1);

const sphere2 = new Mesh(
  new SphereGeometry(side, 20, 20),
  new MeshNormalMaterial()
);

sphere2.position.set(-2 * side, 0, 0);

scene.add(sphere2);

const vertices = [];

for (let i = 0; i < 1000; i++) {
  const x = MathUtils.randFloatSpread(150);
  const y = MathUtils.randFloatSpread(150);
  const z = MathUtils.randFloatSpread(150);

  vertices.push(x, y, z);
}

const geometry = new BufferGeometry();
geometry.setAttribute("position", new Float32BufferAttribute(vertices, 3));

const material = new PointsMaterial({
  size: 2,
  color: 0xffffff,
});

const points = new Points(geometry, material);

scene.add(points);

const camera = new PerspectiveCamera(45, width / height, 1, 1000);
camera.position.set(20, 20, 100);
camera.lookAt(scene.position);

const renderer = new WebGLRenderer({
  canvas,
});
renderer.setSize(width, height);

renderer.render(scene, camera);

const animation = (timestamp: number) => {
  points.rotation.set(0, points.rotation.y + 0.001, points.rotation.z + 0.001);

  renderer.render(scene, camera);

  points.material.color.setHSL(
    (360 * ((timestamp / (10 * 1000)) % 360)) / 360,
    1,
    0.5
  );

  requestAnimationFrame(animation);
};

requestAnimationFrame(animation);
