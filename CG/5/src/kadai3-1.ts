import renderMathInElement from "katex/dist/contrib/auto-render";
import "katex/dist/katex.min.css";
import {
  AmbientLight,
  DirectionalLight,
  Mesh,
  MeshLambertMaterial,
  PerspectiveCamera,
  Scene,
  TorusGeometry,
  WebGLRenderer,
} from "three";

renderMathInElement(document.body);

const width = 960;
const height = 600;
const side = 20;

// シーンを作る
const scene = new Scene();

// 環境光の設定
const amb_light = new AmbientLight(0xffffff, 0.5);
scene.add(amb_light);

const light = new DirectionalLight(0xffffff, 1);
scene.add(light);

// モデリング（トーラスを作成）
const geometry = new TorusGeometry(side, side / 3, 64, 100);
//const material = new MeshNormalMaterial();　　//<-- これは今までの材質設定
const material = new MeshLambertMaterial({ color: 0x0000ff });
const mesh = new Mesh(geometry, material);
// トーラスをx軸，y軸中心にそれぞれ30度(PI/6)回転
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
