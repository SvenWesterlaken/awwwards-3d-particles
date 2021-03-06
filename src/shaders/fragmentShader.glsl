varying vec3 vPosition;

void main() {
  vec3 color = vec3(1.0, 0.0, 0.0);

  vec3 color1 = vec3(1.0, 0.0, 0.0);
  vec3 color2 = vec3(1.0, 1.0, 0.0);

  color = mix(color1, color2, vPosition.z * 0.5 + 0.5);
  gl_FragColor = vec4(color, 1.0);
}
