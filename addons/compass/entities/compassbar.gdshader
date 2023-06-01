shader_type canvas_item;

const float ZPI = 6.28318;

uniform float north: hint_range(0.0, 6.28318, 0.05);
uniform float dir = 0.0;


void fragment() {
	vec2 uv = vec2(UV.x + (north - dir)/ZPI, UV.y);
	COLOR = texture(TEXTURE, uv);
}