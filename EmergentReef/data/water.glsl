#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform float look;


void main() {
	vec4 color = texture2D(texture, vertTexCoord.st) * vertColor;


	float top = mix(0.1, 2.0, look);
	float bot = mix(0.1, 1.0, look);
	float dark = mix(bot, top, vertTexCoord.y);
	// gradient:
	// 1 : 1 to 1
	// 0 : 1 to .5
	// -1 : .5 to 0
	color.rgb *= vec3(dark);

 	gl_FragColor = color;
}