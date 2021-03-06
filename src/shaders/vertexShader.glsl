// v prefix is convention for varying variables, 
// it is used to pass variables between the vertex & fragment shader.
// In this case the position of the vertex
varying vec3 vPosition;

// position is kind of a default for glsl so doesn't have a prefix and 
// doesn't need a attribute assigned (this is already done by ThreeJS).
// However, custom values should be prefixed with an 'a' by convention.
attribute vec3 aRandom;

uniform float uTime; // u prefix by convention
uniform float uScale;

void main() {
  vPosition = position; // position is a variable automatically set by ThreeJS

  float time = uTime * 4.; // increase speed with 4x

  vec3 pos = position;
  pos.x += sin(time * aRandom.x) * 0.01;
  pos.y += cos(time * aRandom.y) * 0.01;
  pos.z += cos(time * aRandom.z) * 0.01;

  pos *= uScale;

  vec4 mvPosition = modelViewMatrix * vec4( pos, 1.0 );
  gl_Position = projectionMatrix * mvPosition;
  gl_PointSize = 8.0 / -mvPosition.z;
}
