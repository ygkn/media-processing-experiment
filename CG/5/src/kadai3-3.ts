import {
  AmbientLight,
  BoxGeometry,
  DirectionalLight,
  Mesh,
  MeshPhongMaterial,
  PerspectiveCamera,
  Scene,
  TorusGeometry,
  WebGLRenderer,
} from "three";

const width = 960;
const height = 600;
const side = 20;

// シーンを作る
const scene = new Scene();
// ライトの設定
const light = new DirectionalLight(0xffffff, 1.0);
light.position.set(-1, 1, 1); // ライトの向きを変更
scene.add(light);
const amb_light = new AmbientLight(0xffffff, 0.5);
scene.add(amb_light);

// モデリング（トーラスを作成）
const geometry = new TorusGeometry(side, side / 3, 64, 100);
const material = new MeshPhongMaterial({
  color: 0x0000ff,
  shininess: 90,
});
const mesh = new Mesh(geometry, material);
mesh.position.set(-30, 0, 0); // x軸方向に-30移動

// シーンにオブジェクトを追加
scene.add(mesh);

const cubeMesh = new Mesh(
  new BoxGeometry(side / 10, side / 10, side / 10),
  new MeshPhongMaterial({
    color: 0xff0000,
    shininess: 90,
  })
);

scene.add(cubeMesh);

// カメラを設定
const camera = new PerspectiveCamera(90, width / height, 1, 1000);
camera.position.set(0, 0, 100);

const canvas = document.getElementById("canvas1");

if (!(canvas instanceof HTMLCanvasElement)) {
  throw new Error(`canvas1 is ${canvas}`);
}

//レンダラを作成
const renderer = new WebGLRenderer({
  canvas,
});
renderer.setSize(width, height);

update();

function update() {
  mesh.rotation.x += 0.01; // 1コマで0.1づつ回転角度を増やす
  mesh.rotation.y += 0.01;
  camera.rotation.z += 0.01;

  renderer.render(scene, camera);
  requestAnimationFrame(update);
}
