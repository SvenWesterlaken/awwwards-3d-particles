// v prefix is convention for varying variables, 
// it is used to pass variables between the vertex & fragment shader.
// In this case the position of the vertex
varying vec3 vPosition;

uniform vec3 uColor1;
uniform vec3 uColor2;

void main() {
  vec3 color = vec3(1.0, 0.0, 0.0);

  vec3 color1 = vec3(10.0/255.0, 30.0/255.0, 100.0/255.0); // rgb(10, 30, 100)
  vec3 color2 = vec3(1.0, 1.0, 0.0);

  float depth = vPosition.z * 0.5 + 0.5;

  color = mix(uColor1, uColor2, vPosition.z * 0.5 + 0.5);
  gl_FragColor = vec4(color, depth * 0.3 + 0.2);
}
