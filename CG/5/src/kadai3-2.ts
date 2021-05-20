import {
  AmbientLight,
  DirectionalLight,
  Mesh,
  MeshLambertMaterial,
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
// 平行光源の設定
const light = new DirectionalLight(0xffffff, 1.0);
scene.add(light);
//環境光の設定
const amb_light = new AmbientLight(0xffffff, 0.5);
scene.add(amb_light);

// モデリング（トーラスを作成）
const geometry = new TorusGeometry(side, side / 3, 64, 100);
const material = new MeshPhongMaterial({
  color: 0x0000ff,
  shininess: 90,
  specular: 0xff0000,
});
const mesh = new Mesh(geometry, material); // トーラスをx軸，y軸中心にそれぞれ30度(PI/6)回転
mesh.rotation.x = -Math.PI / 6.0;
mesh.rotation.y = -Math.PI / 6.0;
// シーンにオブジェクトを追加
scene.add(mesh);

// カメラを設定
const camera = new PerspectiveCamera(45, width / height, 1, 1000);
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

renderer.render(scene, camera); // レンダラーに描画することを命令する
