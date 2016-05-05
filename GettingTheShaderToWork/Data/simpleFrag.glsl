#define PROCESSING_TEXTURE_SHADER

// properties set automatically by processing:
uniform sampler2D texture;
uniform vec2 texOffset;

// properties set by vertex shader:
varying vec4 vertTexCoord;
varying vec4 vertColor;

// my properties
uniform float time;

// this function is executed for every pixel.
// within the function, vertTexCoord contains the coordinates of the pixel
void main(){

	// given a sampler2D (a texture) and a vec2 (a position), this function returns a vec4 (the pixel color at position)
	vec2 uvs1 = vertTexCoord.xy + vec2(time * .1, time * -.15);
	vec2 uvs2 = vertTexCoord.xy + vec2(time * -.15, time * .25);
	float r = texture2D(texture, uvs1).r;
	float g = texture2D(texture, uvs2).g;
	

	vec2 uvs3 = vertTexCoord.xy + vec2(r - .5, g - .5) * .5;
	float b = texture2D(texture, uvs3 + vec2(time * .2, 0)).b;

	vec4 color = vec4(0.5, 0.4, 0.3, 1.0);

	float offset = sin(time) * .2;
	float threshold = .5 + offset;


	if(b > threshold && b < threshold + .05) {
		color.r += b;//max(color.r, b);
		color.g += b;//max(color.g, b);
		color.b += b;//max(color.b, b);
	}
	//color.r = 0;
	//color.g = 0; 
	
	// set the pixel color to use:
	gl_FragColor = color;
}
