import {
  AmbientLight,
  BoxGeometry,
  DirectionalLight,
  MathUtils,
  Mesh,
  MeshPhongMaterial,
  PerspectiveCamera,
  Scene,
  SphereGeometry,
  Vector3,
  WebGLRenderer,
} from "three";

const width = 960;
const height = 600;
const side = 10;
const border = 100;
const velocity = new Vector3(0, -0.5, 0);

// シーンを作る
const scene = new Scene();
// ライトの設定
const light = new DirectionalLight(0xffffff, 1.0);
//light = new PointLight(0xFFFFFF, 2, 100, 1.0);
light.position.set(-1, 1, 1); // ライトの向きを変更
scene.add(light);
const amb_light = new AmbientLight(0xffffff, 0.5);
scene.add(amb_light);

// モデリング（球を作成）
const geometry = new SphereGeometry(side, 10, 10);
const material = new MeshPhongMaterial({
  color: 0x0000ff,
  shininess: 90,
});
const mesh = new Mesh(geometry, material);
// シーンにオブジェクトを追加
scene.add(mesh);

const geometry1 = new BoxGeometry(border, border, border);
const material1 = new MeshPhongMaterial({
  color: 0xff0000,
  wireframe: true,
});
const mesh1 = new Mesh(geometry1, material1);
//	mesh1.position.set(-0, 0, 0);
// シーンにオブジェクトを追加
scene.add(mesh1);

// カメラを設定
const camera = new PerspectiveCamera(90, width / height, 1, 1000);
camera.position.set(0, 0, 110);
camera.lookAt(scene.position);

const canvas = document.getElementById("canvas1");

if (!(canvas instanceof HTMLCanvasElement)) {
  throw new Error(`canvas1 is ${canvas}`);
}

//レンダラを作成
const renderer = new WebGLRenderer({ canvas });
renderer.setSize(width, height);

update();

function update() {
  if (mesh.position.x < -border / 2) {
    velocity.set(
      MathUtils.randFloat(0, 0.5),
      MathUtils.randFloat(-0.5, 0.5),
      MathUtils.randFloat(-0.5, 0.5)
    );
  }

  if (border / 2 - side < mesh.position.x) {
    velocity.set(
      MathUtils.randFloat(-0.5, 0),
      MathUtils.randFloat(-0.5, 0.5),
      MathUtils.randFloat(-0.5, 0.5)
    );
  }

  if (mesh.position.y < -border / 2) {
    velocity.set(
      MathUtils.randFloat(-0.5, 0.5),
      MathUtils.randFloat(0, 0.5),
      MathUtils.randFloat(-0.5, 0.5)
    );
  }

  if (border / 2 - side < mesh.position.y) {
    velocity.set(
      MathUtils.randFloat(-0.5, 0.5),
      MathUtils.randFloat(-0.5, 0),
      MathUtils.randFloat(-0.5, 0.5)
    );
  }

  if (mesh.position.z < -border / 2) {
    velocity.set(
      MathUtils.randFloat(-0.5, 0.5),
      MathUtils.randFloat(-0.5, 0.5),
      MathUtils.randFloat(0, 0.5)
    );
  }

  if (border / 2 - side < mesh.position.z) {
    velocity.set(
      MathUtils.randFloat(-0.5, 0.5),
      MathUtils.randFloat(-0.5, 0.5),
      MathUtils.randFloat(-0.5, 0)
    );
  }

  mesh.position.add(velocity);

  renderer.render(scene, camera); // レンダラーに描画することを命令する
  requestAnimationFrame(update);
}
