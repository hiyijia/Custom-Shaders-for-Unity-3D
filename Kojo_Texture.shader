
Shader "Custom/Kojo_Texture"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white"{}  // Diffuse Map
		_BumpMap("Bumpmap", 2D) = "bump"{}   // Bump Material
	}
	
	SubShader 
	{
		Tags {"RenderType" = "Opaque"}
		
		CGPROGRAM
		#pragma surface surf Lambert
		
		struct Input
		{
			float2 uv_MainTex;  // (1.0, 1.0) U, V
			float2 uv_BumpMap;
			//float4 color: COLOR; // (1.0, 1.0, 1.0, 1.0) R,G,B,A
		};
		
		sampler2D _MainTex; // In order for it to be editable in the Unity Inspector
		sampler2D _BumpMap;
		
		void surf (Input IN, inout SurfaceOutput o) 
		{
			//o.Albedo = 1;
			
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
			o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
		}
		
		ENDCG 
	
	}
	
	Fallback "Diffuse"

}