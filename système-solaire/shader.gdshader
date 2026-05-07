shader_type sky;

void sky() {
    vec2 uv = SKY_COORDS;

    float star = fract(sin(dot(uv * 500.0, vec2(12.9898,78.233))) * 43758.5453);

    if (star > 0.997) {
        COLOR = vec3(1.0); // étoile blanche
    } else {
        COLOR = vec3(0.0); // fond noir pur
    }
}