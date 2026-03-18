#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#ifdef useColor
#undef useColor
#endif
#ifdef pressLight
#undef pressLight
#endif
#ifdef hoverLight
#undef hoverLight
#endif
#ifdef constantStretch
#undef constantStretch
#endif
#ifdef useTex
#undef useTex
#endif
#ifdef chromaticAbbrOnSurface
#undef chromaticAbbrOnSurface
#endif
#ifdef topLighting
#undef topLighting
#endif
#ifdef useColorAlt
#undef useColorAlt
#endif
#ifdef useAlt
#undef useAlt
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
return 0;
}
}
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAG_DISABLE_FRUSTUM_CULLING
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 sc_FragData0 0
//sampler sampler extraTexSmpSC 0:20
//sampler sampler icon0SmpSC 0:21
//sampler sampler icon1SmpSC 0:22
//sampler sampler intensityTextureSmpSC 0:23
//sampler sampler sc_ScreenTextureSmpSC 0:28
//sampler sampler screenSmpSC 0:31
//texture texture2D extraTex 0:1:0:20
//texture texture2D icon0 0:2:0:21
//texture texture2D icon1 0:3:0:22
//texture texture2D intensityTexture 0:4:0:23
//texture texture2D sc_ScreenTexture 0:16:0:28
//texture texture2D screen 0:19:0:31
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:32:5120 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float2 sc_TAAJitterOffset 3704
//float4 voxelization_params_0 3824
//float4 voxelization_params_frustum_lrbt 3840
//float4 voxelization_params_frustum_nf 3856
//float3 voxelization_params_camera_pos 3872
//float4x4 sc_ModelMatrixVoxelization 3888
//float correctedIntensity 3952
//float3x3 intensityTextureTransform 4016
//float4 intensityTextureUvMinMax 4064
//float4 intensityTextureBorderColor 4080
//int PreviewEnabled 4244
//float alphaTestThreshold 4252
//float _scaleMult_ 4256
//float4 icon0Size 4272
//float3x3 icon0Transform 4320
//float4 icon0UvMinMax 4368
//float4 icon0BorderColor 4384
//float maxBlur 4400
//bool useColor 4404
//float3 iconColor 4416
//int colorChannel 4432
//float iconScale 4436
//float2 iconPosition 4440
//float2 p0 4448
//float2 p1 4456
//float2 touchInput 4464
//float pressure 4472
//float thumbSize 4476
//float stretchStrength 4480
//float pressDownStrength 4484
//float nudgeStrength 4488
//bool pressLight 4492
//bool hoverLight 4496
//bool constantStretch 4500
//float2 shapePosition 4504
//float4 screenSize 4512
//float3x3 screenTransform 4560
//float4 screenUvMinMax 4608
//float4 screenBorderColor 4624
//float4 baseColor 4640
//float shapeSoftness 4656
//float4 cornerRadius 4672
//float2 shapeScale 4688
//bool useTex 4696
//float3x3 extraTexTransform 4752
//float4 extraTexUvMinMax 4800
//float4 extraTexBorderColor 4816
//float thickness 4832
//float frost 4836
//float quality 4840
//float material 4844
//float chromaticAbbr 4848
//bool chromaticAbbrOnSurface 4852
//bool topLighting 4856
//float lightAngle 4860
//float bleed 4864
//float transparency 4868
//float magnification 4872
//float4 icon1Size 4880
//float3x3 icon1Transform 4928
//float4 icon1UvMinMax 4976
//float4 icon1BorderColor 4992
//bool useColorAlt 5008
//float3 iconColorAlt 5024
//int colorChannelAlt 5040
//bool useAlt 5044
//float2 Port_Stretch_N053 5048
//float2 Port_Scale_N005 5056
//float2 Port_Stretch_N061 5064
//float Port_Default_N080 5072
//float4 Port_Input1_N045 5088
//float4 Port_Input2_N045 5104
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR_BURN 2 0
//spec_const bool BLEND_MODE_COLOR_DODGE 3 0
//spec_const bool BLEND_MODE_COLOR 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_extraTex 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_icon0 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_icon1 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screen 35 0
//spec_const bool SC_USE_UV_MIN_MAX_extraTex 36 0
//spec_const bool SC_USE_UV_MIN_MAX_icon0 37 0
//spec_const bool SC_USE_UV_MIN_MAX_icon1 38 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 39 0
//spec_const bool SC_USE_UV_MIN_MAX_screen 40 0
//spec_const bool SC_USE_UV_TRANSFORM_extraTex 41 0
//spec_const bool SC_USE_UV_TRANSFORM_icon0 42 0
//spec_const bool SC_USE_UV_TRANSFORM_icon1 43 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 44 0
//spec_const bool SC_USE_UV_TRANSFORM_screen 45 0
//spec_const bool UseViewSpaceDepthVariant 46 1
//spec_const bool extraTexHasSwappedViews 47 0
//spec_const bool icon0HasSwappedViews 48 0
//spec_const bool icon1HasSwappedViews 49 0
//spec_const bool intensityTextureHasSwappedViews 50 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 51 0
//spec_const bool sc_BlendMode_Add 52 0
//spec_const bool sc_BlendMode_AlphaTest 53 0
//spec_const bool sc_BlendMode_AlphaToCoverage 54 0
//spec_const bool sc_BlendMode_ColoredGlass 55 0
//spec_const bool sc_BlendMode_Custom 56 0
//spec_const bool sc_BlendMode_Max 57 0
//spec_const bool sc_BlendMode_Min 58 0
//spec_const bool sc_BlendMode_MultiplyOriginal 59 0
//spec_const bool sc_BlendMode_Multiply 60 0
//spec_const bool sc_BlendMode_Normal 61 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 62 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 63 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 64 0
//spec_const bool sc_BlendMode_Screen 65 0
//spec_const bool sc_DepthOnly 66 0
//spec_const bool sc_FramebufferFetch 67 0
//spec_const bool sc_MotionVectorsPass 68 0
//spec_const bool sc_OITCompositingPass 69 0
//spec_const bool sc_OITDepthBoundsPass 70 0
//spec_const bool sc_OITDepthGatherPass 71 0
//spec_const bool sc_OutputBounds 72 0
//spec_const bool sc_ProjectiveShadowsCaster 73 0
//spec_const bool sc_ProjectiveShadowsReceiver 74 0
//spec_const bool sc_RenderAlphaToColor 75 0
//spec_const bool sc_ScreenTextureHasSwappedViews 76 0
//spec_const bool sc_TAAEnabled 77 0
//spec_const bool sc_VertexBlendingUseNormals 78 0
//spec_const bool sc_VertexBlending 79 0
//spec_const bool sc_Voxelization 80 0
//spec_const bool screenHasSwappedViews 81 0
//spec_const int SC_DEVICE_CLASS 82 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_extraTex 83 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_icon0 84 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_icon1 85 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 86 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screen 87 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_extraTex 88 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_icon0 89 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_icon1 90 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 91 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screen 92 -1
//spec_const int extraTexLayout 93 0
//spec_const int icon0Layout 94 0
//spec_const int icon1Layout 95 0
//spec_const int intensityTextureLayout 96 0
//spec_const int sc_DepthBufferMode 97 0
//spec_const int sc_RenderingSpace 98 -1
//spec_const int sc_ScreenTextureLayout 99 0
//spec_const int sc_ShaderCacheConstant 100 0
//spec_const int sc_SkinBonesCount 101 0
//spec_const int sc_StereoRenderingMode 102 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 103 0
//spec_const int screenLayout 104 0
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_extraTex [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_extraTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_extraTex) ? SC_USE_CLAMP_TO_BORDER_extraTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_icon0 [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_icon0_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_icon0) ? SC_USE_CLAMP_TO_BORDER_icon0 : false;
constant bool SC_USE_CLAMP_TO_BORDER_icon1 [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_icon1_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_icon1) ? SC_USE_CLAMP_TO_BORDER_icon1 : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_screen [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_screen_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_screen) ? SC_USE_CLAMP_TO_BORDER_screen : false;
constant bool SC_USE_UV_MIN_MAX_extraTex [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_extraTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_extraTex) ? SC_USE_UV_MIN_MAX_extraTex : false;
constant bool SC_USE_UV_MIN_MAX_icon0 [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_icon0_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_icon0) ? SC_USE_UV_MIN_MAX_icon0 : false;
constant bool SC_USE_UV_MIN_MAX_icon1 [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_icon1_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_icon1) ? SC_USE_UV_MIN_MAX_icon1 : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_screen [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_screen_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_screen) ? SC_USE_UV_MIN_MAX_screen : false;
constant bool SC_USE_UV_TRANSFORM_extraTex [[function_constant(41)]];
constant bool SC_USE_UV_TRANSFORM_extraTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_extraTex) ? SC_USE_UV_TRANSFORM_extraTex : false;
constant bool SC_USE_UV_TRANSFORM_icon0 [[function_constant(42)]];
constant bool SC_USE_UV_TRANSFORM_icon0_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_icon0) ? SC_USE_UV_TRANSFORM_icon0 : false;
constant bool SC_USE_UV_TRANSFORM_icon1 [[function_constant(43)]];
constant bool SC_USE_UV_TRANSFORM_icon1_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_icon1) ? SC_USE_UV_TRANSFORM_icon1 : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(44)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_screen [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_screen_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_screen) ? SC_USE_UV_TRANSFORM_screen : false;
constant bool UseViewSpaceDepthVariant [[function_constant(46)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool extraTexHasSwappedViews [[function_constant(47)]];
constant bool extraTexHasSwappedViews_tmp = is_function_constant_defined(extraTexHasSwappedViews) ? extraTexHasSwappedViews : false;
constant bool icon0HasSwappedViews [[function_constant(48)]];
constant bool icon0HasSwappedViews_tmp = is_function_constant_defined(icon0HasSwappedViews) ? icon0HasSwappedViews : false;
constant bool icon1HasSwappedViews [[function_constant(49)]];
constant bool icon1HasSwappedViews_tmp = is_function_constant_defined(icon1HasSwappedViews) ? icon1HasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(50)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(51)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(52)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(53)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(54)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(55)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(56)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(57)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(58)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(59)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(60)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(61)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(62)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(63)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(64)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(65)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(66)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(67)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(68)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(69)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(70)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(71)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(72)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(73)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(74)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(75)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(76)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(77)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(78)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(79)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(80)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant bool screenHasSwappedViews [[function_constant(81)]];
constant bool screenHasSwappedViews_tmp = is_function_constant_defined(screenHasSwappedViews) ? screenHasSwappedViews : false;
constant int SC_DEVICE_CLASS [[function_constant(82)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_extraTex [[function_constant(83)]];
constant int SC_SOFTWARE_WRAP_MODE_U_extraTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_extraTex) ? SC_SOFTWARE_WRAP_MODE_U_extraTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_icon0 [[function_constant(84)]];
constant int SC_SOFTWARE_WRAP_MODE_U_icon0_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_icon0) ? SC_SOFTWARE_WRAP_MODE_U_icon0 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_icon1 [[function_constant(85)]];
constant int SC_SOFTWARE_WRAP_MODE_U_icon1_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_icon1) ? SC_SOFTWARE_WRAP_MODE_U_icon1 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(86)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_screen [[function_constant(87)]];
constant int SC_SOFTWARE_WRAP_MODE_U_screen_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_screen) ? SC_SOFTWARE_WRAP_MODE_U_screen : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_extraTex [[function_constant(88)]];
constant int SC_SOFTWARE_WRAP_MODE_V_extraTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_extraTex) ? SC_SOFTWARE_WRAP_MODE_V_extraTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_icon0 [[function_constant(89)]];
constant int SC_SOFTWARE_WRAP_MODE_V_icon0_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_icon0) ? SC_SOFTWARE_WRAP_MODE_V_icon0 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_icon1 [[function_constant(90)]];
constant int SC_SOFTWARE_WRAP_MODE_V_icon1_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_icon1) ? SC_SOFTWARE_WRAP_MODE_V_icon1 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(91)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_screen [[function_constant(92)]];
constant int SC_SOFTWARE_WRAP_MODE_V_screen_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_screen) ? SC_SOFTWARE_WRAP_MODE_V_screen : -1;
constant int extraTexLayout [[function_constant(93)]];
constant int extraTexLayout_tmp = is_function_constant_defined(extraTexLayout) ? extraTexLayout : 0;
constant int icon0Layout [[function_constant(94)]];
constant int icon0Layout_tmp = is_function_constant_defined(icon0Layout) ? icon0Layout : 0;
constant int icon1Layout [[function_constant(95)]];
constant int icon1Layout_tmp = is_function_constant_defined(icon1Layout) ? icon1Layout : 0;
constant int intensityTextureLayout [[function_constant(96)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(97)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(98)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(99)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(100)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(101)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(102)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(103)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int screenLayout [[function_constant(104)]];
constant int screenLayout_tmp = is_function_constant_defined(screenLayout) ? screenLayout : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 N7_UV;
float3 SurfacePosition_ObjectSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float _scaleMult_;
float4 icon0Size;
float4 icon0Dims;
float4 icon0View;
float3x3 icon0Transform;
float4 icon0UvMinMax;
float4 icon0BorderColor;
float maxBlur;
int useColor;
float3 iconColor;
int colorChannel;
float iconScale;
float2 iconPosition;
float2 p0;
float2 p1;
float2 touchInput;
float pressure;
float thumbSize;
float stretchStrength;
float pressDownStrength;
float nudgeStrength;
int pressLight;
int hoverLight;
int constantStretch;
float2 shapePosition;
float4 screenSize;
float4 screenDims;
float4 screenView;
float3x3 screenTransform;
float4 screenUvMinMax;
float4 screenBorderColor;
float4 baseColor;
float shapeSoftness;
float4 cornerRadius;
float2 shapeScale;
int useTex;
float4 extraTexSize;
float4 extraTexDims;
float4 extraTexView;
float3x3 extraTexTransform;
float4 extraTexUvMinMax;
float4 extraTexBorderColor;
float thickness;
float frost;
float quality;
float material;
float chromaticAbbr;
int chromaticAbbrOnSurface;
int topLighting;
float lightAngle;
float bleed;
float transparency;
float magnification;
float4 icon1Size;
float4 icon1Dims;
float4 icon1View;
float3x3 icon1Transform;
float4 icon1UvMinMax;
float4 icon1BorderColor;
int useColorAlt;
float3 iconColorAlt;
int colorChannelAlt;
int useAlt;
float2 Port_Stretch_N053;
float2 Port_Scale_N005;
float2 Port_Stretch_N061;
float Port_Default_N080;
float4 Port_Input1_N045;
float4 Port_Input2_N045;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> extraTex [[id(1)]];
texture2d<float> icon0 [[id(2)]];
texture2d<float> icon1 [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> screen [[id(19)]];
sampler extraTexSmpSC [[id(20)]];
sampler icon0SmpSC [[id(21)]];
sampler icon1SmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler screenSmpSC [[id(31)]];
constant userUniformsObj* UserUniforms [[id(32)]];
};
struct main_vert_out
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
float3 N52_Value1=float3(0.0);
float N52_ScaleM=0.0;
float3 N52_Result=float3(0.0);
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_2=param;
param=l9_2;
}
sc_Vertex_t l9_3=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_4=l9_3;
float3 l9_5=in.blendShape0Pos;
float3 l9_6=in.blendShape0Normal;
float l9_7=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_8=l9_4;
float3 l9_9=l9_5;
float l9_10=l9_7;
float3 l9_11=l9_8.position.xyz+(l9_9*l9_10);
l9_8.position=float4(l9_11.x,l9_11.y,l9_11.z,l9_8.position.w);
l9_4=l9_8;
l9_4.normal+=(l9_6*l9_7);
l9_3=l9_4;
sc_Vertex_t l9_12=l9_3;
float3 l9_13=in.blendShape1Pos;
float3 l9_14=in.blendShape1Normal;
float l9_15=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_16=l9_12;
float3 l9_17=l9_13;
float l9_18=l9_15;
float3 l9_19=l9_16.position.xyz+(l9_17*l9_18);
l9_16.position=float4(l9_19.x,l9_19.y,l9_19.z,l9_16.position.w);
l9_12=l9_16;
l9_12.normal+=(l9_14*l9_15);
l9_3=l9_12;
sc_Vertex_t l9_20=l9_3;
float3 l9_21=in.blendShape2Pos;
float3 l9_22=in.blendShape2Normal;
float l9_23=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_24=l9_20;
float3 l9_25=l9_21;
float l9_26=l9_23;
float3 l9_27=l9_24.position.xyz+(l9_25*l9_26);
l9_24.position=float4(l9_27.x,l9_27.y,l9_27.z,l9_24.position.w);
l9_20=l9_24;
l9_20.normal+=(l9_22*l9_23);
l9_3=l9_20;
}
else
{
sc_Vertex_t l9_28=l9_3;
float3 l9_29=in.blendShape0Pos;
float l9_30=(*sc_set0.UserUniforms).weights0.x;
float3 l9_31=l9_28.position.xyz+(l9_29*l9_30);
l9_28.position=float4(l9_31.x,l9_31.y,l9_31.z,l9_28.position.w);
l9_3=l9_28;
sc_Vertex_t l9_32=l9_3;
float3 l9_33=in.blendShape1Pos;
float l9_34=(*sc_set0.UserUniforms).weights0.y;
float3 l9_35=l9_32.position.xyz+(l9_33*l9_34);
l9_32.position=float4(l9_35.x,l9_35.y,l9_35.z,l9_32.position.w);
l9_3=l9_32;
sc_Vertex_t l9_36=l9_3;
float3 l9_37=in.blendShape2Pos;
float l9_38=(*sc_set0.UserUniforms).weights0.z;
float3 l9_39=l9_36.position.xyz+(l9_37*l9_38);
l9_36.position=float4(l9_39.x,l9_39.y,l9_39.z,l9_36.position.w);
l9_3=l9_36;
sc_Vertex_t l9_40=l9_3;
float3 l9_41=in.blendShape3Pos;
float l9_42=(*sc_set0.UserUniforms).weights0.w;
float3 l9_43=l9_40.position.xyz+(l9_41*l9_42);
l9_40.position=float4(l9_43.x,l9_43.y,l9_43.z,l9_40.position.w);
l9_3=l9_40;
sc_Vertex_t l9_44=l9_3;
float3 l9_45=in.blendShape4Pos;
float l9_46=(*sc_set0.UserUniforms).weights1.x;
float3 l9_47=l9_44.position.xyz+(l9_45*l9_46);
l9_44.position=float4(l9_47.x,l9_47.y,l9_47.z,l9_44.position.w);
l9_3=l9_44;
sc_Vertex_t l9_48=l9_3;
float3 l9_49=in.blendShape5Pos;
float l9_50=(*sc_set0.UserUniforms).weights1.y;
float3 l9_51=l9_48.position.xyz+(l9_49*l9_50);
l9_48.position=float4(l9_51.x,l9_51.y,l9_51.z,l9_48.position.w);
l9_3=l9_48;
}
}
param=l9_3;
sc_Vertex_t l9_52=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_53=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_53=float4(1.0,fract(in.boneData.yzw));
l9_53.x-=dot(l9_53.yzw,float3(1.0));
}
float4 l9_54=l9_53;
float4 l9_55=l9_54;
int l9_56=int(in.boneData.x);
int l9_57=int(in.boneData.y);
int l9_58=int(in.boneData.z);
int l9_59=int(in.boneData.w);
int l9_60=l9_56;
float4 l9_61=l9_52.position;
float3 l9_62=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_63=l9_60;
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[0];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[1];
float4 l9_66=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[2];
float4 l9_67[3];
l9_67[0]=l9_64;
l9_67[1]=l9_65;
l9_67[2]=l9_66;
l9_62=float3(dot(l9_61,l9_67[0]),dot(l9_61,l9_67[1]),dot(l9_61,l9_67[2]));
}
else
{
l9_62=l9_61.xyz;
}
float3 l9_68=l9_62;
float3 l9_69=l9_68;
float l9_70=l9_55.x;
int l9_71=l9_57;
float4 l9_72=l9_52.position;
float3 l9_73=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4 l9_78[3];
l9_78[0]=l9_75;
l9_78[1]=l9_76;
l9_78[2]=l9_77;
l9_73=float3(dot(l9_72,l9_78[0]),dot(l9_72,l9_78[1]),dot(l9_72,l9_78[2]));
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_55.y;
int l9_82=l9_58;
float4 l9_83=l9_52.position;
float3 l9_84=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4 l9_89[3];
l9_89[0]=l9_86;
l9_89[1]=l9_87;
l9_89[2]=l9_88;
l9_84=float3(dot(l9_83,l9_89[0]),dot(l9_83,l9_89[1]),dot(l9_83,l9_89[2]));
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_55.z;
int l9_93=l9_59;
float4 l9_94=l9_52.position;
float3 l9_95=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4 l9_100[3];
l9_100[0]=l9_97;
l9_100[1]=l9_98;
l9_100[2]=l9_99;
l9_95=float3(dot(l9_94,l9_100[0]),dot(l9_94,l9_100[1]),dot(l9_94,l9_100[2]));
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=(((l9_69*l9_70)+(l9_80*l9_81))+(l9_91*l9_92))+(l9_101*l9_55.w);
l9_52.position=float4(l9_102.x,l9_102.y,l9_102.z,l9_52.position.w);
int l9_103=l9_56;
float3x3 l9_104=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[2].xyz));
float3x3 l9_105=l9_104;
float3x3 l9_106=l9_105;
int l9_107=l9_57;
float3x3 l9_108=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[2].xyz));
float3x3 l9_109=l9_108;
float3x3 l9_110=l9_109;
int l9_111=l9_58;
float3x3 l9_112=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[2].xyz));
float3x3 l9_113=l9_112;
float3x3 l9_114=l9_113;
int l9_115=l9_59;
float3x3 l9_116=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[2].xyz));
float3x3 l9_117=l9_116;
float3x3 l9_118=l9_117;
l9_52.normal=((((l9_106*l9_52.normal)*l9_55.x)+((l9_110*l9_52.normal)*l9_55.y))+((l9_114*l9_52.normal)*l9_55.z))+((l9_118*l9_52.normal)*l9_55.w);
l9_52.tangent=((((l9_106*l9_52.tangent)*l9_55.x)+((l9_110*l9_52.tangent)*l9_55.y))+((l9_114*l9_52.tangent)*l9_55.z))+((l9_118*l9_52.tangent)*l9_55.w);
}
param=l9_52;
if (sc_RenderingSpace_tmp==3)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPosAndMotion=float4(param.position.xyz.x,param.position.xyz.y,param.position.xyz.z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
float3 l9_119=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varPosAndMotion=float4(l9_119.x,l9_119.y,l9_119.z,out.varPosAndMotion.w);
float3 l9_120=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
out.varNormalAndMotion=float4(l9_120.x,l9_120.y,l9_120.z,out.varNormalAndMotion.w);
float3 l9_121=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_121.x,l9_121.y,l9_121.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPosAndMotion.xyz,1.0)).xyz;
float3 WorldPosition=out.varPosAndMotion.xyz;
float3 WorldNormal=out.varNormalAndMotion.xyz;
float3 WorldTangent=out.varTangent.xyz;
float3 Position_N49=float3(0.0);
Position_N49=Globals.SurfacePosition_ObjectSpace;
float Output_N56=0.0;
float param_1=(*sc_set0.UserUniforms)._scaleMult_;
Output_N56=param_1;
float3 Result_N52=float3(0.0);
float3 param_2=Position_N49;
float param_3=Output_N56;
float3 param_4=float3(0.0);
N52_Value1=param_2;
N52_ScaleM=param_3;
float3 l9_122=N52_Value1*N52_ScaleM;
N52_Result=l9_122;
param_4=N52_Result;
Result_N52=param_4;
float3 VectorOut_N54=float3(0.0);
VectorOut_N54=((*sc_set0.UserUniforms).sc_ModelMatrix*float4(Result_N52,1.0)).xyz;
WorldPosition=VectorOut_N54;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPosAndMotion.xyz;
WorldNormal=out.varNormalAndMotion.xyz;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_5=v;
float3 param_6=WorldPosition;
float3 param_7=WorldNormal;
float3 param_8=WorldTangent;
float4 param_9=v.position;
out.varPosAndMotion=float4(param_6.x,param_6.y,param_6.z,out.varPosAndMotion.w);
float3 l9_123=normalize(param_7);
out.varNormalAndMotion=float4(l9_123.x,l9_123.y,l9_123.z,out.varNormalAndMotion.w);
float3 l9_124=normalize(param_8);
out.varTangent=float4(l9_124.x,l9_124.y,l9_124.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_125=param_5.position;
float4 l9_126=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_127=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_127=0;
}
else
{
l9_127=gl_InstanceIndex%2;
}
int l9_128=l9_127;
l9_126=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_128]*l9_125;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_129=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_129=0;
}
else
{
l9_129=gl_InstanceIndex%2;
}
int l9_130=l9_129;
l9_126=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_130]*l9_125;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_131=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_131=0;
}
else
{
l9_131=gl_InstanceIndex%2;
}
int l9_132=l9_131;
l9_126=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_132]*l9_125;
}
else
{
l9_126=l9_125;
}
}
}
float4 l9_133=l9_126;
out.varViewSpaceDepth=-l9_133.z;
}
float4 l9_134=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_134=param_9;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_135=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_135=0;
}
else
{
l9_135=gl_InstanceIndex%2;
}
int l9_136=l9_135;
l9_134=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_136]*param_5.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_137=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_137=0;
}
else
{
l9_137=gl_InstanceIndex%2;
}
int l9_138=l9_137;
l9_134=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_138]*float4(out.varPosAndMotion.xyz,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_139=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_139=0;
}
else
{
l9_139=gl_InstanceIndex%2;
}
int l9_140=l9_139;
l9_134=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_140]*float4(out.varPosAndMotion.xyz,1.0);
}
}
}
}
out.varTex01=float4(param_5.texture0,param_5.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_141=param_5.position;
float4 l9_142=l9_141;
if (sc_RenderingSpace_tmp==1)
{
l9_142=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_141;
}
float4 l9_143=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_142;
float2 l9_144=((l9_143.xy/float2(l9_143.w))*0.5)+float2(0.5);
out.varShadowTex=l9_144;
}
float4 l9_145=l9_134;
if (sc_DepthBufferMode_tmp==1)
{
int l9_146=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_146=0;
}
else
{
l9_146=gl_InstanceIndex%2;
}
int l9_147=l9_146;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_147][2].w!=0.0)
{
float l9_148=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_145.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_145.w))*l9_148)-1.0)*l9_145.w;
}
}
float4 l9_149=l9_145;
l9_134=l9_149;
float4 l9_150=l9_134;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_151=l9_150.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_150.w);
l9_150=float4(l9_151.x,l9_151.y,l9_150.z,l9_150.w);
}
float4 l9_152=l9_150;
l9_134=l9_152;
float4 l9_153=l9_134;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_153.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_154=l9_153;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_155=dot(l9_154,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_156=l9_155;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_156;
}
}
float4 l9_157=float4(l9_153.x,-l9_153.y,(l9_153.z*0.5)+(l9_153.w*0.5),l9_153.w);
out.gl_Position=l9_157;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_159=param_5;
sc_Vertex_t l9_160=l9_159;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_161=l9_160;
float3 l9_162=in.blendShape0Pos;
float3 l9_163=in.blendShape0Normal;
float l9_164=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_165=l9_161;
float3 l9_166=l9_162;
float l9_167=l9_164;
float3 l9_168=l9_165.position.xyz+(l9_166*l9_167);
l9_165.position=float4(l9_168.x,l9_168.y,l9_168.z,l9_165.position.w);
l9_161=l9_165;
l9_161.normal+=(l9_163*l9_164);
l9_160=l9_161;
sc_Vertex_t l9_169=l9_160;
float3 l9_170=in.blendShape1Pos;
float3 l9_171=in.blendShape1Normal;
float l9_172=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_173=l9_169;
float3 l9_174=l9_170;
float l9_175=l9_172;
float3 l9_176=l9_173.position.xyz+(l9_174*l9_175);
l9_173.position=float4(l9_176.x,l9_176.y,l9_176.z,l9_173.position.w);
l9_169=l9_173;
l9_169.normal+=(l9_171*l9_172);
l9_160=l9_169;
sc_Vertex_t l9_177=l9_160;
float3 l9_178=in.blendShape2Pos;
float3 l9_179=in.blendShape2Normal;
float l9_180=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_181=l9_177;
float3 l9_182=l9_178;
float l9_183=l9_180;
float3 l9_184=l9_181.position.xyz+(l9_182*l9_183);
l9_181.position=float4(l9_184.x,l9_184.y,l9_184.z,l9_181.position.w);
l9_177=l9_181;
l9_177.normal+=(l9_179*l9_180);
l9_160=l9_177;
}
else
{
sc_Vertex_t l9_185=l9_160;
float3 l9_186=in.blendShape0Pos;
float l9_187=(*sc_set0.UserUniforms).weights0.x;
float3 l9_188=l9_185.position.xyz+(l9_186*l9_187);
l9_185.position=float4(l9_188.x,l9_188.y,l9_188.z,l9_185.position.w);
l9_160=l9_185;
sc_Vertex_t l9_189=l9_160;
float3 l9_190=in.blendShape1Pos;
float l9_191=(*sc_set0.UserUniforms).weights0.y;
float3 l9_192=l9_189.position.xyz+(l9_190*l9_191);
l9_189.position=float4(l9_192.x,l9_192.y,l9_192.z,l9_189.position.w);
l9_160=l9_189;
sc_Vertex_t l9_193=l9_160;
float3 l9_194=in.blendShape2Pos;
float l9_195=(*sc_set0.UserUniforms).weights0.z;
float3 l9_196=l9_193.position.xyz+(l9_194*l9_195);
l9_193.position=float4(l9_196.x,l9_196.y,l9_196.z,l9_193.position.w);
l9_160=l9_193;
sc_Vertex_t l9_197=l9_160;
float3 l9_198=in.blendShape3Pos;
float l9_199=(*sc_set0.UserUniforms).weights0.w;
float3 l9_200=l9_197.position.xyz+(l9_198*l9_199);
l9_197.position=float4(l9_200.x,l9_200.y,l9_200.z,l9_197.position.w);
l9_160=l9_197;
sc_Vertex_t l9_201=l9_160;
float3 l9_202=in.blendShape4Pos;
float l9_203=(*sc_set0.UserUniforms).weights1.x;
float3 l9_204=l9_201.position.xyz+(l9_202*l9_203);
l9_201.position=float4(l9_204.x,l9_204.y,l9_204.z,l9_201.position.w);
l9_160=l9_201;
sc_Vertex_t l9_205=l9_160;
float3 l9_206=in.blendShape5Pos;
float l9_207=(*sc_set0.UserUniforms).weights1.y;
float3 l9_208=l9_205.position.xyz+(l9_206*l9_207);
l9_205.position=float4(l9_208.x,l9_208.y,l9_208.z,l9_205.position.w);
l9_160=l9_205;
}
}
l9_159=l9_160;
sc_Vertex_t l9_209=l9_159;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_210=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_210=float4(1.0,fract(in.boneData.yzw));
l9_210.x-=dot(l9_210.yzw,float3(1.0));
}
float4 l9_211=l9_210;
float4 l9_212=l9_211;
int l9_213=int(in.boneData.x);
int l9_214=int(in.boneData.y);
int l9_215=int(in.boneData.z);
int l9_216=int(in.boneData.w);
int l9_217=l9_213;
float4 l9_218=l9_209.position;
float3 l9_219=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_220=l9_217;
float4 l9_221=(*sc_set0.sc_BonesUBO).sc_Bones[l9_220].boneMatrix[0];
float4 l9_222=(*sc_set0.sc_BonesUBO).sc_Bones[l9_220].boneMatrix[1];
float4 l9_223=(*sc_set0.sc_BonesUBO).sc_Bones[l9_220].boneMatrix[2];
float4 l9_224[3];
l9_224[0]=l9_221;
l9_224[1]=l9_222;
l9_224[2]=l9_223;
l9_219=float3(dot(l9_218,l9_224[0]),dot(l9_218,l9_224[1]),dot(l9_218,l9_224[2]));
}
else
{
l9_219=l9_218.xyz;
}
float3 l9_225=l9_219;
float3 l9_226=l9_225;
float l9_227=l9_212.x;
int l9_228=l9_214;
float4 l9_229=l9_209.position;
float3 l9_230=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_231=l9_228;
float4 l9_232=(*sc_set0.sc_BonesUBO).sc_Bones[l9_231].boneMatrix[0];
float4 l9_233=(*sc_set0.sc_BonesUBO).sc_Bones[l9_231].boneMatrix[1];
float4 l9_234=(*sc_set0.sc_BonesUBO).sc_Bones[l9_231].boneMatrix[2];
float4 l9_235[3];
l9_235[0]=l9_232;
l9_235[1]=l9_233;
l9_235[2]=l9_234;
l9_230=float3(dot(l9_229,l9_235[0]),dot(l9_229,l9_235[1]),dot(l9_229,l9_235[2]));
}
else
{
l9_230=l9_229.xyz;
}
float3 l9_236=l9_230;
float3 l9_237=l9_236;
float l9_238=l9_212.y;
int l9_239=l9_215;
float4 l9_240=l9_209.position;
float3 l9_241=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_242=l9_239;
float4 l9_243=(*sc_set0.sc_BonesUBO).sc_Bones[l9_242].boneMatrix[0];
float4 l9_244=(*sc_set0.sc_BonesUBO).sc_Bones[l9_242].boneMatrix[1];
float4 l9_245=(*sc_set0.sc_BonesUBO).sc_Bones[l9_242].boneMatrix[2];
float4 l9_246[3];
l9_246[0]=l9_243;
l9_246[1]=l9_244;
l9_246[2]=l9_245;
l9_241=float3(dot(l9_240,l9_246[0]),dot(l9_240,l9_246[1]),dot(l9_240,l9_246[2]));
}
else
{
l9_241=l9_240.xyz;
}
float3 l9_247=l9_241;
float3 l9_248=l9_247;
float l9_249=l9_212.z;
int l9_250=l9_216;
float4 l9_251=l9_209.position;
float3 l9_252=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_253=l9_250;
float4 l9_254=(*sc_set0.sc_BonesUBO).sc_Bones[l9_253].boneMatrix[0];
float4 l9_255=(*sc_set0.sc_BonesUBO).sc_Bones[l9_253].boneMatrix[1];
float4 l9_256=(*sc_set0.sc_BonesUBO).sc_Bones[l9_253].boneMatrix[2];
float4 l9_257[3];
l9_257[0]=l9_254;
l9_257[1]=l9_255;
l9_257[2]=l9_256;
l9_252=float3(dot(l9_251,l9_257[0]),dot(l9_251,l9_257[1]),dot(l9_251,l9_257[2]));
}
else
{
l9_252=l9_251.xyz;
}
float3 l9_258=l9_252;
float3 l9_259=(((l9_226*l9_227)+(l9_237*l9_238))+(l9_248*l9_249))+(l9_258*l9_212.w);
l9_209.position=float4(l9_259.x,l9_259.y,l9_259.z,l9_209.position.w);
int l9_260=l9_213;
float3x3 l9_261=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_260].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_260].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_260].normalMatrix[2].xyz));
float3x3 l9_262=l9_261;
float3x3 l9_263=l9_262;
int l9_264=l9_214;
float3x3 l9_265=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_264].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_264].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_264].normalMatrix[2].xyz));
float3x3 l9_266=l9_265;
float3x3 l9_267=l9_266;
int l9_268=l9_215;
float3x3 l9_269=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_268].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_268].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_268].normalMatrix[2].xyz));
float3x3 l9_270=l9_269;
float3x3 l9_271=l9_270;
int l9_272=l9_216;
float3x3 l9_273=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_272].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_272].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_272].normalMatrix[2].xyz));
float3x3 l9_274=l9_273;
float3x3 l9_275=l9_274;
l9_209.normal=((((l9_263*l9_209.normal)*l9_212.x)+((l9_267*l9_209.normal)*l9_212.y))+((l9_271*l9_209.normal)*l9_212.z))+((l9_275*l9_209.normal)*l9_212.w);
l9_209.tangent=((((l9_263*l9_209.tangent)*l9_212.x)+((l9_267*l9_209.tangent)*l9_212.y))+((l9_271*l9_209.tangent)*l9_212.z))+((l9_275*l9_209.tangent)*l9_212.w);
}
l9_159=l9_209;
float l9_276=(*sc_set0.UserUniforms).voxelization_params_0.y;
float l9_277=(*sc_set0.UserUniforms).voxelization_params_0.z;
float l9_278=(*sc_set0.UserUniforms).voxelization_params_0.w;
float l9_279=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_280=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_281=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_282=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_283=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_284=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float3 l9_285=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float l9_286=l9_276/l9_277;
int l9_287=gl_InstanceIndex;
int l9_288=l9_287;
l9_159.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_159.position;
float3 l9_289=l9_159.position.xyz;
float3 l9_290=float3(float(l9_288%int(l9_278))*l9_276,float(l9_288/int(l9_278))*l9_276,(float(l9_288)*l9_286)+l9_283);
float3 l9_291=l9_289+l9_290;
float4 l9_292=float4(l9_291-l9_285,1.0);
float l9_293=l9_279;
float l9_294=l9_280;
float l9_295=l9_281;
float l9_296=l9_282;
float l9_297=l9_283;
float l9_298=l9_284;
float4x4 l9_299=float4x4(float4(2.0/(l9_294-l9_293),0.0,0.0,(-(l9_294+l9_293))/(l9_294-l9_293)),float4(0.0,2.0/(l9_296-l9_295),0.0,(-(l9_296+l9_295))/(l9_296-l9_295)),float4(0.0,0.0,(-2.0)/(l9_298-l9_297),(-(l9_298+l9_297))/(l9_298-l9_297)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_300=l9_299;
float4 l9_301=l9_300*l9_292;
l9_301.w=1.0;
out.varScreenPos=l9_301;
float4 l9_302=l9_301*1.0;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_302.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_303=l9_302;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_304=dot(l9_303,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_305=l9_304;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_305;
}
}
float4 l9_306=float4(l9_302.x,-l9_302.y,(l9_302.z*0.5)+(l9_302.w*0.5),l9_302.w);
out.gl_Position=l9_306;
param_5=l9_159;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
sc_Vertex_t l9_307=param_5;
sc_Vertex_t l9_308=l9_307;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_309=l9_308;
float3 l9_310=in.blendShape0Pos;
float3 l9_311=in.blendShape0Normal;
float l9_312=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_313=l9_309;
float3 l9_314=l9_310;
float l9_315=l9_312;
float3 l9_316=l9_313.position.xyz+(l9_314*l9_315);
l9_313.position=float4(l9_316.x,l9_316.y,l9_316.z,l9_313.position.w);
l9_309=l9_313;
l9_309.normal+=(l9_311*l9_312);
l9_308=l9_309;
sc_Vertex_t l9_317=l9_308;
float3 l9_318=in.blendShape1Pos;
float3 l9_319=in.blendShape1Normal;
float l9_320=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_321=l9_317;
float3 l9_322=l9_318;
float l9_323=l9_320;
float3 l9_324=l9_321.position.xyz+(l9_322*l9_323);
l9_321.position=float4(l9_324.x,l9_324.y,l9_324.z,l9_321.position.w);
l9_317=l9_321;
l9_317.normal+=(l9_319*l9_320);
l9_308=l9_317;
sc_Vertex_t l9_325=l9_308;
float3 l9_326=in.blendShape2Pos;
float3 l9_327=in.blendShape2Normal;
float l9_328=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_329=l9_325;
float3 l9_330=l9_326;
float l9_331=l9_328;
float3 l9_332=l9_329.position.xyz+(l9_330*l9_331);
l9_329.position=float4(l9_332.x,l9_332.y,l9_332.z,l9_329.position.w);
l9_325=l9_329;
l9_325.normal+=(l9_327*l9_328);
l9_308=l9_325;
}
else
{
sc_Vertex_t l9_333=l9_308;
float3 l9_334=in.blendShape0Pos;
float l9_335=(*sc_set0.UserUniforms).weights0.x;
float3 l9_336=l9_333.position.xyz+(l9_334*l9_335);
l9_333.position=float4(l9_336.x,l9_336.y,l9_336.z,l9_333.position.w);
l9_308=l9_333;
sc_Vertex_t l9_337=l9_308;
float3 l9_338=in.blendShape1Pos;
float l9_339=(*sc_set0.UserUniforms).weights0.y;
float3 l9_340=l9_337.position.xyz+(l9_338*l9_339);
l9_337.position=float4(l9_340.x,l9_340.y,l9_340.z,l9_337.position.w);
l9_308=l9_337;
sc_Vertex_t l9_341=l9_308;
float3 l9_342=in.blendShape2Pos;
float l9_343=(*sc_set0.UserUniforms).weights0.z;
float3 l9_344=l9_341.position.xyz+(l9_342*l9_343);
l9_341.position=float4(l9_344.x,l9_344.y,l9_344.z,l9_341.position.w);
l9_308=l9_341;
sc_Vertex_t l9_345=l9_308;
float3 l9_346=in.blendShape3Pos;
float l9_347=(*sc_set0.UserUniforms).weights0.w;
float3 l9_348=l9_345.position.xyz+(l9_346*l9_347);
l9_345.position=float4(l9_348.x,l9_348.y,l9_348.z,l9_345.position.w);
l9_308=l9_345;
sc_Vertex_t l9_349=l9_308;
float3 l9_350=in.blendShape4Pos;
float l9_351=(*sc_set0.UserUniforms).weights1.x;
float3 l9_352=l9_349.position.xyz+(l9_350*l9_351);
l9_349.position=float4(l9_352.x,l9_352.y,l9_352.z,l9_349.position.w);
l9_308=l9_349;
sc_Vertex_t l9_353=l9_308;
float3 l9_354=in.blendShape5Pos;
float l9_355=(*sc_set0.UserUniforms).weights1.y;
float3 l9_356=l9_353.position.xyz+(l9_354*l9_355);
l9_353.position=float4(l9_356.x,l9_356.y,l9_356.z,l9_353.position.w);
l9_308=l9_353;
}
}
l9_307=l9_308;
sc_Vertex_t l9_357=l9_307;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_358=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_358=float4(1.0,fract(in.boneData.yzw));
l9_358.x-=dot(l9_358.yzw,float3(1.0));
}
float4 l9_359=l9_358;
float4 l9_360=l9_359;
int l9_361=int(in.boneData.x);
int l9_362=int(in.boneData.y);
int l9_363=int(in.boneData.z);
int l9_364=int(in.boneData.w);
int l9_365=l9_361;
float4 l9_366=l9_357.position;
float3 l9_367=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_368=l9_365;
float4 l9_369=(*sc_set0.sc_BonesUBO).sc_Bones[l9_368].boneMatrix[0];
float4 l9_370=(*sc_set0.sc_BonesUBO).sc_Bones[l9_368].boneMatrix[1];
float4 l9_371=(*sc_set0.sc_BonesUBO).sc_Bones[l9_368].boneMatrix[2];
float4 l9_372[3];
l9_372[0]=l9_369;
l9_372[1]=l9_370;
l9_372[2]=l9_371;
l9_367=float3(dot(l9_366,l9_372[0]),dot(l9_366,l9_372[1]),dot(l9_366,l9_372[2]));
}
else
{
l9_367=l9_366.xyz;
}
float3 l9_373=l9_367;
float3 l9_374=l9_373;
float l9_375=l9_360.x;
int l9_376=l9_362;
float4 l9_377=l9_357.position;
float3 l9_378=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_379=l9_376;
float4 l9_380=(*sc_set0.sc_BonesUBO).sc_Bones[l9_379].boneMatrix[0];
float4 l9_381=(*sc_set0.sc_BonesUBO).sc_Bones[l9_379].boneMatrix[1];
float4 l9_382=(*sc_set0.sc_BonesUBO).sc_Bones[l9_379].boneMatrix[2];
float4 l9_383[3];
l9_383[0]=l9_380;
l9_383[1]=l9_381;
l9_383[2]=l9_382;
l9_378=float3(dot(l9_377,l9_383[0]),dot(l9_377,l9_383[1]),dot(l9_377,l9_383[2]));
}
else
{
l9_378=l9_377.xyz;
}
float3 l9_384=l9_378;
float3 l9_385=l9_384;
float l9_386=l9_360.y;
int l9_387=l9_363;
float4 l9_388=l9_357.position;
float3 l9_389=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_390=l9_387;
float4 l9_391=(*sc_set0.sc_BonesUBO).sc_Bones[l9_390].boneMatrix[0];
float4 l9_392=(*sc_set0.sc_BonesUBO).sc_Bones[l9_390].boneMatrix[1];
float4 l9_393=(*sc_set0.sc_BonesUBO).sc_Bones[l9_390].boneMatrix[2];
float4 l9_394[3];
l9_394[0]=l9_391;
l9_394[1]=l9_392;
l9_394[2]=l9_393;
l9_389=float3(dot(l9_388,l9_394[0]),dot(l9_388,l9_394[1]),dot(l9_388,l9_394[2]));
}
else
{
l9_389=l9_388.xyz;
}
float3 l9_395=l9_389;
float3 l9_396=l9_395;
float l9_397=l9_360.z;
int l9_398=l9_364;
float4 l9_399=l9_357.position;
float3 l9_400=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_401=l9_398;
float4 l9_402=(*sc_set0.sc_BonesUBO).sc_Bones[l9_401].boneMatrix[0];
float4 l9_403=(*sc_set0.sc_BonesUBO).sc_Bones[l9_401].boneMatrix[1];
float4 l9_404=(*sc_set0.sc_BonesUBO).sc_Bones[l9_401].boneMatrix[2];
float4 l9_405[3];
l9_405[0]=l9_402;
l9_405[1]=l9_403;
l9_405[2]=l9_404;
l9_400=float3(dot(l9_399,l9_405[0]),dot(l9_399,l9_405[1]),dot(l9_399,l9_405[2]));
}
else
{
l9_400=l9_399.xyz;
}
float3 l9_406=l9_400;
float3 l9_407=(((l9_374*l9_375)+(l9_385*l9_386))+(l9_396*l9_397))+(l9_406*l9_360.w);
l9_357.position=float4(l9_407.x,l9_407.y,l9_407.z,l9_357.position.w);
int l9_408=l9_361;
float3x3 l9_409=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_408].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_408].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_408].normalMatrix[2].xyz));
float3x3 l9_410=l9_409;
float3x3 l9_411=l9_410;
int l9_412=l9_362;
float3x3 l9_413=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_412].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_412].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_412].normalMatrix[2].xyz));
float3x3 l9_414=l9_413;
float3x3 l9_415=l9_414;
int l9_416=l9_363;
float3x3 l9_417=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_416].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_416].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_416].normalMatrix[2].xyz));
float3x3 l9_418=l9_417;
float3x3 l9_419=l9_418;
int l9_420=l9_364;
float3x3 l9_421=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_420].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_420].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_420].normalMatrix[2].xyz));
float3x3 l9_422=l9_421;
float3x3 l9_423=l9_422;
l9_357.normal=((((l9_411*l9_357.normal)*l9_360.x)+((l9_415*l9_357.normal)*l9_360.y))+((l9_419*l9_357.normal)*l9_360.z))+((l9_423*l9_357.normal)*l9_360.w);
l9_357.tangent=((((l9_411*l9_357.tangent)*l9_360.x)+((l9_415*l9_357.tangent)*l9_360.y))+((l9_419*l9_357.tangent)*l9_360.z))+((l9_423*l9_357.tangent)*l9_360.w);
}
l9_307=l9_357;
float3 l9_424=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float2 l9_425=((l9_307.position.xy/float2(l9_307.position.w))*0.5)+float2(0.5);
out.varTex01=float4(l9_425.x,l9_425.y,out.varTex01.z,out.varTex01.w);
l9_307.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_307.position;
float3 l9_426=l9_307.position.xyz-l9_424;
l9_307.position=float4(l9_426.x,l9_426.y,l9_426.z,l9_307.position.w);
out.varPosAndMotion=float4(l9_307.position.xyz.x,l9_307.position.xyz.y,l9_307.position.xyz.z,out.varPosAndMotion.w);
float3 l9_427=normalize(l9_307.normal);
out.varNormalAndMotion=float4(l9_427.x,l9_427.y,l9_427.z,out.varNormalAndMotion.w);
float l9_428=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_429=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_430=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_431=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_432=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_433=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float l9_434=l9_428;
float l9_435=l9_429;
float l9_436=l9_430;
float l9_437=l9_431;
float l9_438=l9_432;
float l9_439=l9_433;
float4x4 l9_440=float4x4(float4(2.0/(l9_435-l9_434),0.0,0.0,(-(l9_435+l9_434))/(l9_435-l9_434)),float4(0.0,2.0/(l9_437-l9_436),0.0,(-(l9_437+l9_436))/(l9_437-l9_436)),float4(0.0,0.0,(-2.0)/(l9_439-l9_438),(-(l9_439+l9_438))/(l9_439-l9_438)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_441=l9_440;
float4 l9_442=float4(0.0);
float3 l9_443=(l9_441*l9_307.position).xyz;
l9_442=float4(l9_443.x,l9_443.y,l9_443.z,l9_442.w);
l9_442.w=1.0;
out.varScreenPos=l9_442;
float4 l9_444=l9_442*1.0;
float4 l9_445=l9_444;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_445.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_446=l9_445;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_447=dot(l9_446,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_448=l9_447;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_448;
}
}
float4 l9_449=float4(l9_445.x,-l9_445.y,(l9_445.z*0.5)+(l9_445.w*0.5),l9_445.w);
out.gl_Position=l9_449;
param_5=l9_307;
}
}
v=param_5;
float3 param_10=out.varPosAndMotion.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float4 l9_450=((*sc_set0.UserUniforms).sc_PrevFrameModelMatrix*(*sc_set0.UserUniforms).sc_ModelMatrixInverse)*float4(param_10,1.0);
float3 l9_451=param_10;
float3 l9_452=l9_450.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
int l9_453=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_453=0;
}
else
{
l9_453=gl_InstanceIndex%2;
}
int l9_454=l9_453;
float4 l9_455=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_454]*float4(l9_451,1.0);
float2 l9_456=l9_455.xy/float2(l9_455.w);
l9_455=float4(l9_456.x,l9_456.y,l9_455.z,l9_455.w);
int l9_457=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_457=0;
}
else
{
l9_457=gl_InstanceIndex%2;
}
int l9_458=l9_457;
float4 l9_459=(*sc_set0.UserUniforms).sc_PrevFrameViewProjectionMatrixArray[l9_458]*float4(l9_452,1.0);
float2 l9_460=l9_459.xy/float2(l9_459.w);
l9_459=float4(l9_460.x,l9_460.y,l9_459.z,l9_459.w);
float2 l9_461=(l9_455.xy-l9_459.xy)*0.5;
out.varPosAndMotion.w=l9_461.x;
out.varNormalAndMotion.w=l9_461.y;
}
}
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 N7_UV;
float2 Surface_UVCoord0;
float2 gScreenCoord;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float _scaleMult_;
float4 icon0Size;
float4 icon0Dims;
float4 icon0View;
float3x3 icon0Transform;
float4 icon0UvMinMax;
float4 icon0BorderColor;
float maxBlur;
int useColor;
float3 iconColor;
int colorChannel;
float iconScale;
float2 iconPosition;
float2 p0;
float2 p1;
float2 touchInput;
float pressure;
float thumbSize;
float stretchStrength;
float pressDownStrength;
float nudgeStrength;
int pressLight;
int hoverLight;
int constantStretch;
float2 shapePosition;
float4 screenSize;
float4 screenDims;
float4 screenView;
float3x3 screenTransform;
float4 screenUvMinMax;
float4 screenBorderColor;
float4 baseColor;
float shapeSoftness;
float4 cornerRadius;
float2 shapeScale;
int useTex;
float4 extraTexSize;
float4 extraTexDims;
float4 extraTexView;
float3x3 extraTexTransform;
float4 extraTexUvMinMax;
float4 extraTexBorderColor;
float thickness;
float frost;
float quality;
float material;
float chromaticAbbr;
int chromaticAbbrOnSurface;
int topLighting;
float lightAngle;
float bleed;
float transparency;
float magnification;
float4 icon1Size;
float4 icon1Dims;
float4 icon1View;
float3x3 icon1Transform;
float4 icon1UvMinMax;
float4 icon1BorderColor;
int useColorAlt;
float3 iconColorAlt;
int colorChannelAlt;
int useAlt;
float2 Port_Stretch_N053;
float2 Port_Scale_N005;
float2 Port_Stretch_N061;
float Port_Default_N080;
float4 Port_Input1_N045;
float4 Port_Input2_N045;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> extraTex [[id(1)]];
texture2d<float> icon0 [[id(2)]];
texture2d<float> icon1 [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> screen [[id(19)]];
sampler extraTexSmpSC [[id(20)]];
sampler icon0SmpSC [[id(21)]];
sampler icon1SmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler screenSmpSC [[id(31)]];
constant userUniformsObj* UserUniforms [[id(32)]];
};
constant float2 g9_43[8]={ float2(1.0161999),float2(0.42089999,1.0161999),float2(-0.42089999,1.0161999),float2(-1.0161999,0.42089999),float2(-1.0161999,-0.42089999),float2(-0.42089999,-1.0161999),float2(0.42089999,-1.0161999),float2(1.0161999,-0.42089999) };
struct main_frag_out
{
float4 sc_FragData0 [[color(0)]];
};
struct main_frag_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float snoise(thread const float2& v)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 i=floor(v+float2(dot(v,float2(0.36602542))));
float2 x0=(v-i)+float2(dot(i,float2(0.21132487)));
float2 i1=float2(0.0);
bool2 l9_0=bool2(x0.x>x0.y);
i1=float2(l9_0.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_0.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float2 x1=(x0+float2(0.21132487))-i1;
float2 x2=x0+float2(-0.57735026);
float2 param=i;
float2 l9_1=param-(floor(param*0.0034602077)*289.0);
i=l9_1;
float3 param_1=float3(i.y)+float3(0.0,i1.y,1.0);
float3 l9_2=((param_1*34.0)+float3(1.0))*param_1;
float3 l9_3=l9_2-(floor(l9_2*0.0034602077)*289.0);
float3 l9_4=l9_3;
float3 param_2=(l9_4+float3(i.x))+float3(0.0,i1.x,1.0);
float3 l9_5=((param_2*34.0)+float3(1.0))*param_2;
float3 l9_6=l9_5-(floor(l9_5*0.0034602077)*289.0);
float3 l9_7=l9_6;
float3 p=l9_7;
float3 m=fast::max(float3(0.5)-float3(dot(x0,x0),dot(x1,x1),dot(x2,x2)),float3(0.0));
m*=m;
m*=m;
float3 x=(fract(p*float3(0.024390243))*2.0)-float3(1.0);
float3 h=abs(x)-float3(0.5);
float3 ox=floor(x+float3(0.5));
float3 a0=x-ox;
m*=(float3(1.7928429)-(((a0*a0)+(h*h))*0.85373473));
float3 g=float3(0.0);
g.x=(a0.x*x0.x)+(h.x*x0.y);
float2 l9_8=(a0.yz*float2(x1.x,x2.x))+(h.yz*float2(x1.y,x2.y));
g=float3(g.x,l9_8.x,l9_8.y);
return 130.0*dot(m,g);
}
else
{
return 0.0;
}
}
float2 N51_refractOffset(thread const float& sdf)
{
if (sdf<0.1)
{
return float2(0.0);
}
float2 grad=normalize(float2(dfdx(sdf),dfdy(sdf)));
float param=abs(sdf);
float param_1=12.0;
float l9_0;
if (param<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(param,param_1);
}
float l9_1=l9_0;
float offsetAmount=l9_1*(-0.1);
return grad*offsetAmount;
}
float3 N51_hashedTexSample(thread const float2& uv,thread const float& offset,thread const float& lod,thread bool& N51_ChorAbrrOnSurface,thread float& N51_Sdf,thread float& N51_Frost,thread float& N51_ChromaticAberration,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread ssGlobals& tempGlobals,thread texture2d<float> screen,thread sampler screenSmpSC)
{
float l9_0=tempGlobals.gTimeElapsed;
float l9_1=tempGlobals.gTimeElapsed;
float l9_2=tempGlobals.gTimeElapsed;
float2 time=float2(sin(l9_0*2.0),cos((l9_1*3.0)+cos(l9_2*0.5)))*0.0049999999;
float2 param=uv+float2(time+float2(offset));
float2 l9_3=fract(sin(float2(dot(param,float2(127.1,311.70001)),dot(param,float2(269.5,183.3))))*43758.547);
float2 l9_4=float2(0.0);
l9_4=UserUniforms.screenSize.zw;
float2 l9_5=l9_4;
float2 shift=(l9_3*l9_5)*N51_Frost;
if (N51_ChromaticAberration>0.0)
{
float cA=N51_ChromaticAberration*0.001;
float sF=N51_ChorAbrrOnSurface ? 1.0 : N51_Sdf;
float2 l9_6=uv;
float l9_7=cA;
float l9_8=sF;
float2 l9_9=shift;
float param_1=2.0;
float param_2=lod;
float l9_10;
if (param_1<=0.0)
{
l9_10=0.0;
}
else
{
l9_10=pow(param_1,param_2);
}
float l9_11=l9_10;
float2 param_3=(l9_6+float2(l9_7*l9_8))+(l9_9*l9_11);
float param_4=lod-1.0;
float4 l9_12=float4(0.0);
int l9_13;
if ((int(screenHasSwappedViews_tmp)!=0))
{
int l9_14=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_14=0;
}
else
{
l9_14=varStereoViewID;
}
int l9_15=l9_14;
l9_13=1-l9_15;
}
else
{
int l9_16=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_16=0;
}
else
{
l9_16=varStereoViewID;
}
int l9_17=l9_16;
l9_13=l9_17;
}
int l9_18=l9_13;
int l9_19=screenLayout_tmp;
int l9_20=l9_18;
float2 l9_21=param_3;
bool l9_22=(int(SC_USE_UV_TRANSFORM_screen_tmp)!=0);
float3x3 l9_23=UserUniforms.screenTransform;
int2 l9_24=int2(SC_SOFTWARE_WRAP_MODE_U_screen_tmp,SC_SOFTWARE_WRAP_MODE_V_screen_tmp);
bool l9_25=(int(SC_USE_UV_MIN_MAX_screen_tmp)!=0);
float4 l9_26=UserUniforms.screenUvMinMax;
bool l9_27=(int(SC_USE_CLAMP_TO_BORDER_screen_tmp)!=0);
float4 l9_28=UserUniforms.screenBorderColor;
float l9_29=param_4;
bool l9_30=l9_27&&(!l9_25);
float l9_31=1.0;
float l9_32=l9_21.x;
int l9_33=l9_24.x;
if (l9_33==1)
{
l9_32=fract(l9_32);
}
else
{
if (l9_33==2)
{
float l9_34=fract(l9_32);
float l9_35=l9_32-l9_34;
float l9_36=step(0.25,fract(l9_35*0.5));
l9_32=mix(l9_34,1.0-l9_34,fast::clamp(l9_36,0.0,1.0));
}
}
l9_21.x=l9_32;
float l9_37=l9_21.y;
int l9_38=l9_24.y;
if (l9_38==1)
{
l9_37=fract(l9_37);
}
else
{
if (l9_38==2)
{
float l9_39=fract(l9_37);
float l9_40=l9_37-l9_39;
float l9_41=step(0.25,fract(l9_40*0.5));
l9_37=mix(l9_39,1.0-l9_39,fast::clamp(l9_41,0.0,1.0));
}
}
l9_21.y=l9_37;
if (l9_25)
{
bool l9_42=l9_27;
bool l9_43;
if (l9_42)
{
l9_43=l9_24.x==3;
}
else
{
l9_43=l9_42;
}
float l9_44=l9_21.x;
float l9_45=l9_26.x;
float l9_46=l9_26.z;
bool l9_47=l9_43;
float l9_48=l9_31;
float l9_49=fast::clamp(l9_44,l9_45,l9_46);
float l9_50=step(abs(l9_44-l9_49),9.9999997e-06);
l9_48*=(l9_50+((1.0-float(l9_47))*(1.0-l9_50)));
l9_44=l9_49;
l9_21.x=l9_44;
l9_31=l9_48;
bool l9_51=l9_27;
bool l9_52;
if (l9_51)
{
l9_52=l9_24.y==3;
}
else
{
l9_52=l9_51;
}
float l9_53=l9_21.y;
float l9_54=l9_26.y;
float l9_55=l9_26.w;
bool l9_56=l9_52;
float l9_57=l9_31;
float l9_58=fast::clamp(l9_53,l9_54,l9_55);
float l9_59=step(abs(l9_53-l9_58),9.9999997e-06);
l9_57*=(l9_59+((1.0-float(l9_56))*(1.0-l9_59)));
l9_53=l9_58;
l9_21.y=l9_53;
l9_31=l9_57;
}
float2 l9_60=l9_21;
bool l9_61=l9_22;
float3x3 l9_62=l9_23;
if (l9_61)
{
l9_60=float2((l9_62*float3(l9_60,1.0)).xy);
}
float2 l9_63=l9_60;
l9_21=l9_63;
float l9_64=l9_21.x;
int l9_65=l9_24.x;
bool l9_66=l9_30;
float l9_67=l9_31;
if ((l9_65==0)||(l9_65==3))
{
float l9_68=l9_64;
float l9_69=0.0;
float l9_70=1.0;
bool l9_71=l9_66;
float l9_72=l9_67;
float l9_73=fast::clamp(l9_68,l9_69,l9_70);
float l9_74=step(abs(l9_68-l9_73),9.9999997e-06);
l9_72*=(l9_74+((1.0-float(l9_71))*(1.0-l9_74)));
l9_68=l9_73;
l9_64=l9_68;
l9_67=l9_72;
}
l9_21.x=l9_64;
l9_31=l9_67;
float l9_75=l9_21.y;
int l9_76=l9_24.y;
bool l9_77=l9_30;
float l9_78=l9_31;
if ((l9_76==0)||(l9_76==3))
{
float l9_79=l9_75;
float l9_80=0.0;
float l9_81=1.0;
bool l9_82=l9_77;
float l9_83=l9_78;
float l9_84=fast::clamp(l9_79,l9_80,l9_81);
float l9_85=step(abs(l9_79-l9_84),9.9999997e-06);
l9_83*=(l9_85+((1.0-float(l9_82))*(1.0-l9_85)));
l9_79=l9_84;
l9_75=l9_79;
l9_78=l9_83;
}
l9_21.y=l9_75;
l9_31=l9_78;
float2 l9_86=l9_21;
int l9_87=l9_19;
int l9_88=l9_20;
float l9_89=l9_29;
float2 l9_90=l9_86;
int l9_91=l9_87;
int l9_92=l9_88;
float3 l9_93=float3(0.0);
if (l9_91==0)
{
l9_93=float3(l9_90,0.0);
}
else
{
if (l9_91==1)
{
l9_93=float3(l9_90.x,(l9_90.y*0.5)+(0.5-(float(l9_92)*0.5)),0.0);
}
else
{
l9_93=float3(l9_90,float(l9_92));
}
}
float3 l9_94=l9_93;
float3 l9_95=l9_94;
float4 l9_96=screen.sample(screenSmpSC,l9_95.xy,level(l9_89));
float4 l9_97=l9_96;
if (l9_27)
{
l9_97=mix(l9_28,l9_97,float4(l9_31));
}
float4 l9_98=l9_97;
l9_12=l9_98;
float4 l9_99=l9_12;
float r=l9_99.x;
float2 l9_100=uv;
float l9_101=cA;
float l9_102=sF;
float2 l9_103=shift;
float param_5=2.0;
float param_6=lod;
float l9_104;
if (param_5<=0.0)
{
l9_104=0.0;
}
else
{
l9_104=pow(param_5,param_6);
}
float l9_105=l9_104;
float2 param_7=(l9_100-float2(l9_101*l9_102))+(l9_103*l9_105);
float param_8=lod-1.0;
float4 l9_106=float4(0.0);
int l9_107;
if ((int(screenHasSwappedViews_tmp)!=0))
{
int l9_108=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_108=0;
}
else
{
l9_108=varStereoViewID;
}
int l9_109=l9_108;
l9_107=1-l9_109;
}
else
{
int l9_110=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_110=0;
}
else
{
l9_110=varStereoViewID;
}
int l9_111=l9_110;
l9_107=l9_111;
}
int l9_112=l9_107;
int l9_113=screenLayout_tmp;
int l9_114=l9_112;
float2 l9_115=param_7;
bool l9_116=(int(SC_USE_UV_TRANSFORM_screen_tmp)!=0);
float3x3 l9_117=UserUniforms.screenTransform;
int2 l9_118=int2(SC_SOFTWARE_WRAP_MODE_U_screen_tmp,SC_SOFTWARE_WRAP_MODE_V_screen_tmp);
bool l9_119=(int(SC_USE_UV_MIN_MAX_screen_tmp)!=0);
float4 l9_120=UserUniforms.screenUvMinMax;
bool l9_121=(int(SC_USE_CLAMP_TO_BORDER_screen_tmp)!=0);
float4 l9_122=UserUniforms.screenBorderColor;
float l9_123=param_8;
bool l9_124=l9_121&&(!l9_119);
float l9_125=1.0;
float l9_126=l9_115.x;
int l9_127=l9_118.x;
if (l9_127==1)
{
l9_126=fract(l9_126);
}
else
{
if (l9_127==2)
{
float l9_128=fract(l9_126);
float l9_129=l9_126-l9_128;
float l9_130=step(0.25,fract(l9_129*0.5));
l9_126=mix(l9_128,1.0-l9_128,fast::clamp(l9_130,0.0,1.0));
}
}
l9_115.x=l9_126;
float l9_131=l9_115.y;
int l9_132=l9_118.y;
if (l9_132==1)
{
l9_131=fract(l9_131);
}
else
{
if (l9_132==2)
{
float l9_133=fract(l9_131);
float l9_134=l9_131-l9_133;
float l9_135=step(0.25,fract(l9_134*0.5));
l9_131=mix(l9_133,1.0-l9_133,fast::clamp(l9_135,0.0,1.0));
}
}
l9_115.y=l9_131;
if (l9_119)
{
bool l9_136=l9_121;
bool l9_137;
if (l9_136)
{
l9_137=l9_118.x==3;
}
else
{
l9_137=l9_136;
}
float l9_138=l9_115.x;
float l9_139=l9_120.x;
float l9_140=l9_120.z;
bool l9_141=l9_137;
float l9_142=l9_125;
float l9_143=fast::clamp(l9_138,l9_139,l9_140);
float l9_144=step(abs(l9_138-l9_143),9.9999997e-06);
l9_142*=(l9_144+((1.0-float(l9_141))*(1.0-l9_144)));
l9_138=l9_143;
l9_115.x=l9_138;
l9_125=l9_142;
bool l9_145=l9_121;
bool l9_146;
if (l9_145)
{
l9_146=l9_118.y==3;
}
else
{
l9_146=l9_145;
}
float l9_147=l9_115.y;
float l9_148=l9_120.y;
float l9_149=l9_120.w;
bool l9_150=l9_146;
float l9_151=l9_125;
float l9_152=fast::clamp(l9_147,l9_148,l9_149);
float l9_153=step(abs(l9_147-l9_152),9.9999997e-06);
l9_151*=(l9_153+((1.0-float(l9_150))*(1.0-l9_153)));
l9_147=l9_152;
l9_115.y=l9_147;
l9_125=l9_151;
}
float2 l9_154=l9_115;
bool l9_155=l9_116;
float3x3 l9_156=l9_117;
if (l9_155)
{
l9_154=float2((l9_156*float3(l9_154,1.0)).xy);
}
float2 l9_157=l9_154;
l9_115=l9_157;
float l9_158=l9_115.x;
int l9_159=l9_118.x;
bool l9_160=l9_124;
float l9_161=l9_125;
if ((l9_159==0)||(l9_159==3))
{
float l9_162=l9_158;
float l9_163=0.0;
float l9_164=1.0;
bool l9_165=l9_160;
float l9_166=l9_161;
float l9_167=fast::clamp(l9_162,l9_163,l9_164);
float l9_168=step(abs(l9_162-l9_167),9.9999997e-06);
l9_166*=(l9_168+((1.0-float(l9_165))*(1.0-l9_168)));
l9_162=l9_167;
l9_158=l9_162;
l9_161=l9_166;
}
l9_115.x=l9_158;
l9_125=l9_161;
float l9_169=l9_115.y;
int l9_170=l9_118.y;
bool l9_171=l9_124;
float l9_172=l9_125;
if ((l9_170==0)||(l9_170==3))
{
float l9_173=l9_169;
float l9_174=0.0;
float l9_175=1.0;
bool l9_176=l9_171;
float l9_177=l9_172;
float l9_178=fast::clamp(l9_173,l9_174,l9_175);
float l9_179=step(abs(l9_173-l9_178),9.9999997e-06);
l9_177*=(l9_179+((1.0-float(l9_176))*(1.0-l9_179)));
l9_173=l9_178;
l9_169=l9_173;
l9_172=l9_177;
}
l9_115.y=l9_169;
l9_125=l9_172;
float2 l9_180=l9_115;
int l9_181=l9_113;
int l9_182=l9_114;
float l9_183=l9_123;
float2 l9_184=l9_180;
int l9_185=l9_181;
int l9_186=l9_182;
float3 l9_187=float3(0.0);
if (l9_185==0)
{
l9_187=float3(l9_184,0.0);
}
else
{
if (l9_185==1)
{
l9_187=float3(l9_184.x,(l9_184.y*0.5)+(0.5-(float(l9_186)*0.5)),0.0);
}
else
{
l9_187=float3(l9_184,float(l9_186));
}
}
float3 l9_188=l9_187;
float3 l9_189=l9_188;
float4 l9_190=screen.sample(screenSmpSC,l9_189.xy,level(l9_183));
float4 l9_191=l9_190;
if (l9_121)
{
l9_191=mix(l9_122,l9_191,float4(l9_125));
}
float4 l9_192=l9_191;
l9_106=l9_192;
float4 l9_193=l9_106;
float g=l9_193.y;
float2 l9_194=uv;
float l9_195=cA;
float l9_196=cA;
float l9_197=sF;
float2 l9_198=shift;
float param_9=2.0;
float param_10=lod;
float l9_199;
if (param_9<=0.0)
{
l9_199=0.0;
}
else
{
l9_199=pow(param_9,param_10);
}
float l9_200=l9_199;
float2 param_11=(l9_194+(float2(l9_195,-l9_196)*l9_197))+(l9_198*l9_200);
float param_12=lod-1.0;
float4 l9_201=float4(0.0);
int l9_202;
if ((int(screenHasSwappedViews_tmp)!=0))
{
int l9_203=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_203=0;
}
else
{
l9_203=varStereoViewID;
}
int l9_204=l9_203;
l9_202=1-l9_204;
}
else
{
int l9_205=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_205=0;
}
else
{
l9_205=varStereoViewID;
}
int l9_206=l9_205;
l9_202=l9_206;
}
int l9_207=l9_202;
int l9_208=screenLayout_tmp;
int l9_209=l9_207;
float2 l9_210=param_11;
bool l9_211=(int(SC_USE_UV_TRANSFORM_screen_tmp)!=0);
float3x3 l9_212=UserUniforms.screenTransform;
int2 l9_213=int2(SC_SOFTWARE_WRAP_MODE_U_screen_tmp,SC_SOFTWARE_WRAP_MODE_V_screen_tmp);
bool l9_214=(int(SC_USE_UV_MIN_MAX_screen_tmp)!=0);
float4 l9_215=UserUniforms.screenUvMinMax;
bool l9_216=(int(SC_USE_CLAMP_TO_BORDER_screen_tmp)!=0);
float4 l9_217=UserUniforms.screenBorderColor;
float l9_218=param_12;
bool l9_219=l9_216&&(!l9_214);
float l9_220=1.0;
float l9_221=l9_210.x;
int l9_222=l9_213.x;
if (l9_222==1)
{
l9_221=fract(l9_221);
}
else
{
if (l9_222==2)
{
float l9_223=fract(l9_221);
float l9_224=l9_221-l9_223;
float l9_225=step(0.25,fract(l9_224*0.5));
l9_221=mix(l9_223,1.0-l9_223,fast::clamp(l9_225,0.0,1.0));
}
}
l9_210.x=l9_221;
float l9_226=l9_210.y;
int l9_227=l9_213.y;
if (l9_227==1)
{
l9_226=fract(l9_226);
}
else
{
if (l9_227==2)
{
float l9_228=fract(l9_226);
float l9_229=l9_226-l9_228;
float l9_230=step(0.25,fract(l9_229*0.5));
l9_226=mix(l9_228,1.0-l9_228,fast::clamp(l9_230,0.0,1.0));
}
}
l9_210.y=l9_226;
if (l9_214)
{
bool l9_231=l9_216;
bool l9_232;
if (l9_231)
{
l9_232=l9_213.x==3;
}
else
{
l9_232=l9_231;
}
float l9_233=l9_210.x;
float l9_234=l9_215.x;
float l9_235=l9_215.z;
bool l9_236=l9_232;
float l9_237=l9_220;
float l9_238=fast::clamp(l9_233,l9_234,l9_235);
float l9_239=step(abs(l9_233-l9_238),9.9999997e-06);
l9_237*=(l9_239+((1.0-float(l9_236))*(1.0-l9_239)));
l9_233=l9_238;
l9_210.x=l9_233;
l9_220=l9_237;
bool l9_240=l9_216;
bool l9_241;
if (l9_240)
{
l9_241=l9_213.y==3;
}
else
{
l9_241=l9_240;
}
float l9_242=l9_210.y;
float l9_243=l9_215.y;
float l9_244=l9_215.w;
bool l9_245=l9_241;
float l9_246=l9_220;
float l9_247=fast::clamp(l9_242,l9_243,l9_244);
float l9_248=step(abs(l9_242-l9_247),9.9999997e-06);
l9_246*=(l9_248+((1.0-float(l9_245))*(1.0-l9_248)));
l9_242=l9_247;
l9_210.y=l9_242;
l9_220=l9_246;
}
float2 l9_249=l9_210;
bool l9_250=l9_211;
float3x3 l9_251=l9_212;
if (l9_250)
{
l9_249=float2((l9_251*float3(l9_249,1.0)).xy);
}
float2 l9_252=l9_249;
l9_210=l9_252;
float l9_253=l9_210.x;
int l9_254=l9_213.x;
bool l9_255=l9_219;
float l9_256=l9_220;
if ((l9_254==0)||(l9_254==3))
{
float l9_257=l9_253;
float l9_258=0.0;
float l9_259=1.0;
bool l9_260=l9_255;
float l9_261=l9_256;
float l9_262=fast::clamp(l9_257,l9_258,l9_259);
float l9_263=step(abs(l9_257-l9_262),9.9999997e-06);
l9_261*=(l9_263+((1.0-float(l9_260))*(1.0-l9_263)));
l9_257=l9_262;
l9_253=l9_257;
l9_256=l9_261;
}
l9_210.x=l9_253;
l9_220=l9_256;
float l9_264=l9_210.y;
int l9_265=l9_213.y;
bool l9_266=l9_219;
float l9_267=l9_220;
if ((l9_265==0)||(l9_265==3))
{
float l9_268=l9_264;
float l9_269=0.0;
float l9_270=1.0;
bool l9_271=l9_266;
float l9_272=l9_267;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_264=l9_268;
l9_267=l9_272;
}
l9_210.y=l9_264;
l9_220=l9_267;
float2 l9_275=l9_210;
int l9_276=l9_208;
int l9_277=l9_209;
float l9_278=l9_218;
float2 l9_279=l9_275;
int l9_280=l9_276;
int l9_281=l9_277;
float3 l9_282=float3(0.0);
if (l9_280==0)
{
l9_282=float3(l9_279,0.0);
}
else
{
if (l9_280==1)
{
l9_282=float3(l9_279.x,(l9_279.y*0.5)+(0.5-(float(l9_281)*0.5)),0.0);
}
else
{
l9_282=float3(l9_279,float(l9_281));
}
}
float3 l9_283=l9_282;
float3 l9_284=l9_283;
float4 l9_285=screen.sample(screenSmpSC,l9_284.xy,level(l9_278));
float4 l9_286=l9_285;
if (l9_216)
{
l9_286=mix(l9_217,l9_286,float4(l9_220));
}
float4 l9_287=l9_286;
l9_201=l9_287;
float4 l9_288=l9_201;
float b=l9_288.z;
return float3(r,g,b);
}
else
{
float2 l9_289=uv;
float2 l9_290=shift;
float param_13=2.0;
float param_14=lod;
float l9_291;
if (param_13<=0.0)
{
l9_291=0.0;
}
else
{
l9_291=pow(param_13,param_14);
}
float l9_292=l9_291;
float2 param_15=(l9_289+float2(0.001))+(l9_290*l9_292);
float param_16=lod-1.0;
float4 l9_293=float4(0.0);
int l9_294;
if ((int(screenHasSwappedViews_tmp)!=0))
{
int l9_295=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_295=0;
}
else
{
l9_295=varStereoViewID;
}
int l9_296=l9_295;
l9_294=1-l9_296;
}
else
{
int l9_297=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_297=0;
}
else
{
l9_297=varStereoViewID;
}
int l9_298=l9_297;
l9_294=l9_298;
}
int l9_299=l9_294;
int l9_300=screenLayout_tmp;
int l9_301=l9_299;
float2 l9_302=param_15;
bool l9_303=(int(SC_USE_UV_TRANSFORM_screen_tmp)!=0);
float3x3 l9_304=UserUniforms.screenTransform;
int2 l9_305=int2(SC_SOFTWARE_WRAP_MODE_U_screen_tmp,SC_SOFTWARE_WRAP_MODE_V_screen_tmp);
bool l9_306=(int(SC_USE_UV_MIN_MAX_screen_tmp)!=0);
float4 l9_307=UserUniforms.screenUvMinMax;
bool l9_308=(int(SC_USE_CLAMP_TO_BORDER_screen_tmp)!=0);
float4 l9_309=UserUniforms.screenBorderColor;
float l9_310=param_16;
bool l9_311=l9_308&&(!l9_306);
float l9_312=1.0;
float l9_313=l9_302.x;
int l9_314=l9_305.x;
if (l9_314==1)
{
l9_313=fract(l9_313);
}
else
{
if (l9_314==2)
{
float l9_315=fract(l9_313);
float l9_316=l9_313-l9_315;
float l9_317=step(0.25,fract(l9_316*0.5));
l9_313=mix(l9_315,1.0-l9_315,fast::clamp(l9_317,0.0,1.0));
}
}
l9_302.x=l9_313;
float l9_318=l9_302.y;
int l9_319=l9_305.y;
if (l9_319==1)
{
l9_318=fract(l9_318);
}
else
{
if (l9_319==2)
{
float l9_320=fract(l9_318);
float l9_321=l9_318-l9_320;
float l9_322=step(0.25,fract(l9_321*0.5));
l9_318=mix(l9_320,1.0-l9_320,fast::clamp(l9_322,0.0,1.0));
}
}
l9_302.y=l9_318;
if (l9_306)
{
bool l9_323=l9_308;
bool l9_324;
if (l9_323)
{
l9_324=l9_305.x==3;
}
else
{
l9_324=l9_323;
}
float l9_325=l9_302.x;
float l9_326=l9_307.x;
float l9_327=l9_307.z;
bool l9_328=l9_324;
float l9_329=l9_312;
float l9_330=fast::clamp(l9_325,l9_326,l9_327);
float l9_331=step(abs(l9_325-l9_330),9.9999997e-06);
l9_329*=(l9_331+((1.0-float(l9_328))*(1.0-l9_331)));
l9_325=l9_330;
l9_302.x=l9_325;
l9_312=l9_329;
bool l9_332=l9_308;
bool l9_333;
if (l9_332)
{
l9_333=l9_305.y==3;
}
else
{
l9_333=l9_332;
}
float l9_334=l9_302.y;
float l9_335=l9_307.y;
float l9_336=l9_307.w;
bool l9_337=l9_333;
float l9_338=l9_312;
float l9_339=fast::clamp(l9_334,l9_335,l9_336);
float l9_340=step(abs(l9_334-l9_339),9.9999997e-06);
l9_338*=(l9_340+((1.0-float(l9_337))*(1.0-l9_340)));
l9_334=l9_339;
l9_302.y=l9_334;
l9_312=l9_338;
}
float2 l9_341=l9_302;
bool l9_342=l9_303;
float3x3 l9_343=l9_304;
if (l9_342)
{
l9_341=float2((l9_343*float3(l9_341,1.0)).xy);
}
float2 l9_344=l9_341;
l9_302=l9_344;
float l9_345=l9_302.x;
int l9_346=l9_305.x;
bool l9_347=l9_311;
float l9_348=l9_312;
if ((l9_346==0)||(l9_346==3))
{
float l9_349=l9_345;
float l9_350=0.0;
float l9_351=1.0;
bool l9_352=l9_347;
float l9_353=l9_348;
float l9_354=fast::clamp(l9_349,l9_350,l9_351);
float l9_355=step(abs(l9_349-l9_354),9.9999997e-06);
l9_353*=(l9_355+((1.0-float(l9_352))*(1.0-l9_355)));
l9_349=l9_354;
l9_345=l9_349;
l9_348=l9_353;
}
l9_302.x=l9_345;
l9_312=l9_348;
float l9_356=l9_302.y;
int l9_357=l9_305.y;
bool l9_358=l9_311;
float l9_359=l9_312;
if ((l9_357==0)||(l9_357==3))
{
float l9_360=l9_356;
float l9_361=0.0;
float l9_362=1.0;
bool l9_363=l9_358;
float l9_364=l9_359;
float l9_365=fast::clamp(l9_360,l9_361,l9_362);
float l9_366=step(abs(l9_360-l9_365),9.9999997e-06);
l9_364*=(l9_366+((1.0-float(l9_363))*(1.0-l9_366)));
l9_360=l9_365;
l9_356=l9_360;
l9_359=l9_364;
}
l9_302.y=l9_356;
l9_312=l9_359;
float2 l9_367=l9_302;
int l9_368=l9_300;
int l9_369=l9_301;
float l9_370=l9_310;
float2 l9_371=l9_367;
int l9_372=l9_368;
int l9_373=l9_369;
float3 l9_374=float3(0.0);
if (l9_372==0)
{
l9_374=float3(l9_371,0.0);
}
else
{
if (l9_372==1)
{
l9_374=float3(l9_371.x,(l9_371.y*0.5)+(0.5-(float(l9_373)*0.5)),0.0);
}
else
{
l9_374=float3(l9_371,float(l9_373));
}
}
float3 l9_375=l9_374;
float3 l9_376=l9_375;
float4 l9_377=screen.sample(screenSmpSC,l9_376.xy,level(l9_370));
float4 l9_378=l9_377;
if (l9_308)
{
l9_378=mix(l9_309,l9_378,float4(l9_312));
}
float4 l9_379=l9_378;
l9_293=l9_379;
float4 l9_380=l9_293;
return l9_380.xyz;
}
}
float4 N53_blur(thread const float& amount,thread const float2& uv,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> icon0,thread sampler icon0SmpSC)
{
float2 l9_0=float2(0.0);
l9_0=UserUniforms.icon0Size.zw;
float2 l9_1=l9_0;
float2 pS=l9_1;
if (amount<=1.0)
{
float2 param=uv;
float4 l9_2=float4(0.0);
int l9_3;
if ((int(icon0HasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
int l9_9=icon0Layout_tmp;
int l9_10=l9_8;
float2 l9_11=param;
bool l9_12=(int(SC_USE_UV_TRANSFORM_icon0_tmp)!=0);
float3x3 l9_13=UserUniforms.icon0Transform;
int2 l9_14=int2(SC_SOFTWARE_WRAP_MODE_U_icon0_tmp,SC_SOFTWARE_WRAP_MODE_V_icon0_tmp);
bool l9_15=(int(SC_USE_UV_MIN_MAX_icon0_tmp)!=0);
float4 l9_16=UserUniforms.icon0UvMinMax;
bool l9_17=(int(SC_USE_CLAMP_TO_BORDER_icon0_tmp)!=0);
float4 l9_18=UserUniforms.icon0BorderColor;
float l9_19=0.0;
bool l9_20=l9_17&&(!l9_15);
float l9_21=1.0;
float l9_22=l9_11.x;
int l9_23=l9_14.x;
if (l9_23==1)
{
l9_22=fract(l9_22);
}
else
{
if (l9_23==2)
{
float l9_24=fract(l9_22);
float l9_25=l9_22-l9_24;
float l9_26=step(0.25,fract(l9_25*0.5));
l9_22=mix(l9_24,1.0-l9_24,fast::clamp(l9_26,0.0,1.0));
}
}
l9_11.x=l9_22;
float l9_27=l9_11.y;
int l9_28=l9_14.y;
if (l9_28==1)
{
l9_27=fract(l9_27);
}
else
{
if (l9_28==2)
{
float l9_29=fract(l9_27);
float l9_30=l9_27-l9_29;
float l9_31=step(0.25,fract(l9_30*0.5));
l9_27=mix(l9_29,1.0-l9_29,fast::clamp(l9_31,0.0,1.0));
}
}
l9_11.y=l9_27;
if (l9_15)
{
bool l9_32=l9_17;
bool l9_33;
if (l9_32)
{
l9_33=l9_14.x==3;
}
else
{
l9_33=l9_32;
}
float l9_34=l9_11.x;
float l9_35=l9_16.x;
float l9_36=l9_16.z;
bool l9_37=l9_33;
float l9_38=l9_21;
float l9_39=fast::clamp(l9_34,l9_35,l9_36);
float l9_40=step(abs(l9_34-l9_39),9.9999997e-06);
l9_38*=(l9_40+((1.0-float(l9_37))*(1.0-l9_40)));
l9_34=l9_39;
l9_11.x=l9_34;
l9_21=l9_38;
bool l9_41=l9_17;
bool l9_42;
if (l9_41)
{
l9_42=l9_14.y==3;
}
else
{
l9_42=l9_41;
}
float l9_43=l9_11.y;
float l9_44=l9_16.y;
float l9_45=l9_16.w;
bool l9_46=l9_42;
float l9_47=l9_21;
float l9_48=fast::clamp(l9_43,l9_44,l9_45);
float l9_49=step(abs(l9_43-l9_48),9.9999997e-06);
l9_47*=(l9_49+((1.0-float(l9_46))*(1.0-l9_49)));
l9_43=l9_48;
l9_11.y=l9_43;
l9_21=l9_47;
}
float2 l9_50=l9_11;
bool l9_51=l9_12;
float3x3 l9_52=l9_13;
if (l9_51)
{
l9_50=float2((l9_52*float3(l9_50,1.0)).xy);
}
float2 l9_53=l9_50;
l9_11=l9_53;
float l9_54=l9_11.x;
int l9_55=l9_14.x;
bool l9_56=l9_20;
float l9_57=l9_21;
if ((l9_55==0)||(l9_55==3))
{
float l9_58=l9_54;
float l9_59=0.0;
float l9_60=1.0;
bool l9_61=l9_56;
float l9_62=l9_57;
float l9_63=fast::clamp(l9_58,l9_59,l9_60);
float l9_64=step(abs(l9_58-l9_63),9.9999997e-06);
l9_62*=(l9_64+((1.0-float(l9_61))*(1.0-l9_64)));
l9_58=l9_63;
l9_54=l9_58;
l9_57=l9_62;
}
l9_11.x=l9_54;
l9_21=l9_57;
float l9_65=l9_11.y;
int l9_66=l9_14.y;
bool l9_67=l9_20;
float l9_68=l9_21;
if ((l9_66==0)||(l9_66==3))
{
float l9_69=l9_65;
float l9_70=0.0;
float l9_71=1.0;
bool l9_72=l9_67;
float l9_73=l9_68;
float l9_74=fast::clamp(l9_69,l9_70,l9_71);
float l9_75=step(abs(l9_69-l9_74),9.9999997e-06);
l9_73*=(l9_75+((1.0-float(l9_72))*(1.0-l9_75)));
l9_69=l9_74;
l9_65=l9_69;
l9_68=l9_73;
}
l9_11.y=l9_65;
l9_21=l9_68;
float2 l9_76=l9_11;
int l9_77=l9_9;
int l9_78=l9_10;
float l9_79=l9_19;
float2 l9_80=l9_76;
int l9_81=l9_77;
int l9_82=l9_78;
float3 l9_83=float3(0.0);
if (l9_81==0)
{
l9_83=float3(l9_80,0.0);
}
else
{
if (l9_81==1)
{
l9_83=float3(l9_80.x,(l9_80.y*0.5)+(0.5-(float(l9_82)*0.5)),0.0);
}
else
{
l9_83=float3(l9_80,float(l9_82));
}
}
float3 l9_84=l9_83;
float3 l9_85=l9_84;
float4 l9_86=icon0.sample(icon0SmpSC,l9_85.xy,bias(l9_79));
float4 l9_87=l9_86;
if (l9_17)
{
l9_87=mix(l9_18,l9_87,float4(l9_21));
}
float4 l9_88=l9_87;
l9_2=l9_88;
float4 l9_89=l9_2;
return l9_89;
}
else
{
float4 blurredTex=float4(0.0);
float lod=amount+0.69999999;
float2 arr[8];
arr[0]=g9_43[0];
arr[1]=g9_43[1];
arr[2]=g9_43[2];
arr[3]=g9_43[3];
arr[4]=g9_43[4];
arr[5]=g9_43[5];
arr[6]=g9_43[6];
arr[7]=g9_43[7];
int l9_90;
int i=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (i<8)
{
float2 uvIter=((arr[i]*pS)*exp2(amount))+uv;
float2 param_1=uvIter;
float param_2=lod;
float4 l9_91=float4(0.0);
if ((int(icon0HasSwappedViews_tmp)!=0))
{
int l9_92=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_92=0;
}
else
{
l9_92=varStereoViewID;
}
int l9_93=l9_92;
l9_90=1-l9_93;
}
else
{
int l9_94=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_94=0;
}
else
{
l9_94=varStereoViewID;
}
int l9_95=l9_94;
l9_90=l9_95;
}
int l9_96=l9_90;
int l9_97=icon0Layout_tmp;
int l9_98=l9_96;
float2 l9_99=param_1;
bool l9_100=(int(SC_USE_UV_TRANSFORM_icon0_tmp)!=0);
float3x3 l9_101=UserUniforms.icon0Transform;
int2 l9_102=int2(SC_SOFTWARE_WRAP_MODE_U_icon0_tmp,SC_SOFTWARE_WRAP_MODE_V_icon0_tmp);
bool l9_103=(int(SC_USE_UV_MIN_MAX_icon0_tmp)!=0);
float4 l9_104=UserUniforms.icon0UvMinMax;
bool l9_105=(int(SC_USE_CLAMP_TO_BORDER_icon0_tmp)!=0);
float4 l9_106=UserUniforms.icon0BorderColor;
float l9_107=param_2;
bool l9_108=l9_105&&(!l9_103);
float l9_109=1.0;
float l9_110=l9_99.x;
int l9_111=l9_102.x;
if (l9_111==1)
{
l9_110=fract(l9_110);
}
else
{
if (l9_111==2)
{
float l9_112=fract(l9_110);
float l9_113=l9_110-l9_112;
float l9_114=step(0.25,fract(l9_113*0.5));
l9_110=mix(l9_112,1.0-l9_112,fast::clamp(l9_114,0.0,1.0));
}
}
l9_99.x=l9_110;
float l9_115=l9_99.y;
int l9_116=l9_102.y;
if (l9_116==1)
{
l9_115=fract(l9_115);
}
else
{
if (l9_116==2)
{
float l9_117=fract(l9_115);
float l9_118=l9_115-l9_117;
float l9_119=step(0.25,fract(l9_118*0.5));
l9_115=mix(l9_117,1.0-l9_117,fast::clamp(l9_119,0.0,1.0));
}
}
l9_99.y=l9_115;
if (l9_103)
{
bool l9_120=l9_105;
bool l9_121;
if (l9_120)
{
l9_121=l9_102.x==3;
}
else
{
l9_121=l9_120;
}
float l9_122=l9_99.x;
float l9_123=l9_104.x;
float l9_124=l9_104.z;
bool l9_125=l9_121;
float l9_126=l9_109;
float l9_127=fast::clamp(l9_122,l9_123,l9_124);
float l9_128=step(abs(l9_122-l9_127),9.9999997e-06);
l9_126*=(l9_128+((1.0-float(l9_125))*(1.0-l9_128)));
l9_122=l9_127;
l9_99.x=l9_122;
l9_109=l9_126;
bool l9_129=l9_105;
bool l9_130;
if (l9_129)
{
l9_130=l9_102.y==3;
}
else
{
l9_130=l9_129;
}
float l9_131=l9_99.y;
float l9_132=l9_104.y;
float l9_133=l9_104.w;
bool l9_134=l9_130;
float l9_135=l9_109;
float l9_136=fast::clamp(l9_131,l9_132,l9_133);
float l9_137=step(abs(l9_131-l9_136),9.9999997e-06);
l9_135*=(l9_137+((1.0-float(l9_134))*(1.0-l9_137)));
l9_131=l9_136;
l9_99.y=l9_131;
l9_109=l9_135;
}
float2 l9_138=l9_99;
bool l9_139=l9_100;
float3x3 l9_140=l9_101;
if (l9_139)
{
l9_138=float2((l9_140*float3(l9_138,1.0)).xy);
}
float2 l9_141=l9_138;
l9_99=l9_141;
float l9_142=l9_99.x;
int l9_143=l9_102.x;
bool l9_144=l9_108;
float l9_145=l9_109;
if ((l9_143==0)||(l9_143==3))
{
float l9_146=l9_142;
float l9_147=0.0;
float l9_148=1.0;
bool l9_149=l9_144;
float l9_150=l9_145;
float l9_151=fast::clamp(l9_146,l9_147,l9_148);
float l9_152=step(abs(l9_146-l9_151),9.9999997e-06);
l9_150*=(l9_152+((1.0-float(l9_149))*(1.0-l9_152)));
l9_146=l9_151;
l9_142=l9_146;
l9_145=l9_150;
}
l9_99.x=l9_142;
l9_109=l9_145;
float l9_153=l9_99.y;
int l9_154=l9_102.y;
bool l9_155=l9_108;
float l9_156=l9_109;
if ((l9_154==0)||(l9_154==3))
{
float l9_157=l9_153;
float l9_158=0.0;
float l9_159=1.0;
bool l9_160=l9_155;
float l9_161=l9_156;
float l9_162=fast::clamp(l9_157,l9_158,l9_159);
float l9_163=step(abs(l9_157-l9_162),9.9999997e-06);
l9_161*=(l9_163+((1.0-float(l9_160))*(1.0-l9_163)));
l9_157=l9_162;
l9_153=l9_157;
l9_156=l9_161;
}
l9_99.y=l9_153;
l9_109=l9_156;
float2 l9_164=l9_99;
int l9_165=l9_97;
int l9_166=l9_98;
float l9_167=l9_107;
float2 l9_168=l9_164;
int l9_169=l9_165;
int l9_170=l9_166;
float3 l9_171=float3(0.0);
if (l9_169==0)
{
l9_171=float3(l9_168,0.0);
}
else
{
if (l9_169==1)
{
l9_171=float3(l9_168.x,(l9_168.y*0.5)+(0.5-(float(l9_170)*0.5)),0.0);
}
else
{
l9_171=float3(l9_168,float(l9_170));
}
}
float3 l9_172=l9_171;
float3 l9_173=l9_172;
float4 l9_174=icon0.sample(icon0SmpSC,l9_173.xy,level(l9_167));
float4 l9_175=l9_174;
if (l9_105)
{
l9_175=mix(l9_106,l9_175,float4(l9_109));
}
float4 l9_176=l9_175;
l9_91=l9_176;
float4 l9_177=l9_91;
blurredTex+=(l9_177*0.125);
i++;
continue;
}
else
{
break;
}
}
float fadeOutBlur=fast::min(amount,1.0);
float2 param_3=uv;
float param_4=lod*fadeOutBlur;
float4 l9_178=float4(0.0);
int l9_179;
if ((int(icon0HasSwappedViews_tmp)!=0))
{
int l9_180=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_180=0;
}
else
{
l9_180=varStereoViewID;
}
int l9_181=l9_180;
l9_179=1-l9_181;
}
else
{
int l9_182=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_182=0;
}
else
{
l9_182=varStereoViewID;
}
int l9_183=l9_182;
l9_179=l9_183;
}
int l9_184=l9_179;
int l9_185=icon0Layout_tmp;
int l9_186=l9_184;
float2 l9_187=param_3;
bool l9_188=(int(SC_USE_UV_TRANSFORM_icon0_tmp)!=0);
float3x3 l9_189=UserUniforms.icon0Transform;
int2 l9_190=int2(SC_SOFTWARE_WRAP_MODE_U_icon0_tmp,SC_SOFTWARE_WRAP_MODE_V_icon0_tmp);
bool l9_191=(int(SC_USE_UV_MIN_MAX_icon0_tmp)!=0);
float4 l9_192=UserUniforms.icon0UvMinMax;
bool l9_193=(int(SC_USE_CLAMP_TO_BORDER_icon0_tmp)!=0);
float4 l9_194=UserUniforms.icon0BorderColor;
float l9_195=param_4;
bool l9_196=l9_193&&(!l9_191);
float l9_197=1.0;
float l9_198=l9_187.x;
int l9_199=l9_190.x;
if (l9_199==1)
{
l9_198=fract(l9_198);
}
else
{
if (l9_199==2)
{
float l9_200=fract(l9_198);
float l9_201=l9_198-l9_200;
float l9_202=step(0.25,fract(l9_201*0.5));
l9_198=mix(l9_200,1.0-l9_200,fast::clamp(l9_202,0.0,1.0));
}
}
l9_187.x=l9_198;
float l9_203=l9_187.y;
int l9_204=l9_190.y;
if (l9_204==1)
{
l9_203=fract(l9_203);
}
else
{
if (l9_204==2)
{
float l9_205=fract(l9_203);
float l9_206=l9_203-l9_205;
float l9_207=step(0.25,fract(l9_206*0.5));
l9_203=mix(l9_205,1.0-l9_205,fast::clamp(l9_207,0.0,1.0));
}
}
l9_187.y=l9_203;
if (l9_191)
{
bool l9_208=l9_193;
bool l9_209;
if (l9_208)
{
l9_209=l9_190.x==3;
}
else
{
l9_209=l9_208;
}
float l9_210=l9_187.x;
float l9_211=l9_192.x;
float l9_212=l9_192.z;
bool l9_213=l9_209;
float l9_214=l9_197;
float l9_215=fast::clamp(l9_210,l9_211,l9_212);
float l9_216=step(abs(l9_210-l9_215),9.9999997e-06);
l9_214*=(l9_216+((1.0-float(l9_213))*(1.0-l9_216)));
l9_210=l9_215;
l9_187.x=l9_210;
l9_197=l9_214;
bool l9_217=l9_193;
bool l9_218;
if (l9_217)
{
l9_218=l9_190.y==3;
}
else
{
l9_218=l9_217;
}
float l9_219=l9_187.y;
float l9_220=l9_192.y;
float l9_221=l9_192.w;
bool l9_222=l9_218;
float l9_223=l9_197;
float l9_224=fast::clamp(l9_219,l9_220,l9_221);
float l9_225=step(abs(l9_219-l9_224),9.9999997e-06);
l9_223*=(l9_225+((1.0-float(l9_222))*(1.0-l9_225)));
l9_219=l9_224;
l9_187.y=l9_219;
l9_197=l9_223;
}
float2 l9_226=l9_187;
bool l9_227=l9_188;
float3x3 l9_228=l9_189;
if (l9_227)
{
l9_226=float2((l9_228*float3(l9_226,1.0)).xy);
}
float2 l9_229=l9_226;
l9_187=l9_229;
float l9_230=l9_187.x;
int l9_231=l9_190.x;
bool l9_232=l9_196;
float l9_233=l9_197;
if ((l9_231==0)||(l9_231==3))
{
float l9_234=l9_230;
float l9_235=0.0;
float l9_236=1.0;
bool l9_237=l9_232;
float l9_238=l9_233;
float l9_239=fast::clamp(l9_234,l9_235,l9_236);
float l9_240=step(abs(l9_234-l9_239),9.9999997e-06);
l9_238*=(l9_240+((1.0-float(l9_237))*(1.0-l9_240)));
l9_234=l9_239;
l9_230=l9_234;
l9_233=l9_238;
}
l9_187.x=l9_230;
l9_197=l9_233;
float l9_241=l9_187.y;
int l9_242=l9_190.y;
bool l9_243=l9_196;
float l9_244=l9_197;
if ((l9_242==0)||(l9_242==3))
{
float l9_245=l9_241;
float l9_246=0.0;
float l9_247=1.0;
bool l9_248=l9_243;
float l9_249=l9_244;
float l9_250=fast::clamp(l9_245,l9_246,l9_247);
float l9_251=step(abs(l9_245-l9_250),9.9999997e-06);
l9_249*=(l9_251+((1.0-float(l9_248))*(1.0-l9_251)));
l9_245=l9_250;
l9_241=l9_245;
l9_244=l9_249;
}
l9_187.y=l9_241;
l9_197=l9_244;
float2 l9_252=l9_187;
int l9_253=l9_185;
int l9_254=l9_186;
float l9_255=l9_195;
float2 l9_256=l9_252;
int l9_257=l9_253;
int l9_258=l9_254;
float3 l9_259=float3(0.0);
if (l9_257==0)
{
l9_259=float3(l9_256,0.0);
}
else
{
if (l9_257==1)
{
l9_259=float3(l9_256.x,(l9_256.y*0.5)+(0.5-(float(l9_258)*0.5)),0.0);
}
else
{
l9_259=float3(l9_256,float(l9_258));
}
}
float3 l9_260=l9_259;
float3 l9_261=l9_260;
float4 l9_262=icon0.sample(icon0SmpSC,l9_261.xy,level(l9_255));
float4 l9_263=l9_262;
if (l9_193)
{
l9_263=mix(l9_194,l9_263,float4(l9_197));
}
float4 l9_264=l9_263;
l9_178=l9_264;
float4 l9_265=l9_178;
float4 baseTex=l9_265;
return mix(baseTex,blurredTex,float4(0.83999997*fadeOutBlur));
}
}
float4 N61_blur(thread const float& amount,thread const float2& uv,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> icon1,thread sampler icon1SmpSC)
{
float2 l9_0=float2(0.0);
l9_0=UserUniforms.icon1Size.zw;
float2 l9_1=l9_0;
float2 pS=l9_1;
if (amount<=1.0)
{
float2 param=uv;
float4 l9_2=float4(0.0);
int l9_3;
if ((int(icon1HasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
int l9_9=icon1Layout_tmp;
int l9_10=l9_8;
float2 l9_11=param;
bool l9_12=(int(SC_USE_UV_TRANSFORM_icon1_tmp)!=0);
float3x3 l9_13=UserUniforms.icon1Transform;
int2 l9_14=int2(SC_SOFTWARE_WRAP_MODE_U_icon1_tmp,SC_SOFTWARE_WRAP_MODE_V_icon1_tmp);
bool l9_15=(int(SC_USE_UV_MIN_MAX_icon1_tmp)!=0);
float4 l9_16=UserUniforms.icon1UvMinMax;
bool l9_17=(int(SC_USE_CLAMP_TO_BORDER_icon1_tmp)!=0);
float4 l9_18=UserUniforms.icon1BorderColor;
float l9_19=0.0;
bool l9_20=l9_17&&(!l9_15);
float l9_21=1.0;
float l9_22=l9_11.x;
int l9_23=l9_14.x;
if (l9_23==1)
{
l9_22=fract(l9_22);
}
else
{
if (l9_23==2)
{
float l9_24=fract(l9_22);
float l9_25=l9_22-l9_24;
float l9_26=step(0.25,fract(l9_25*0.5));
l9_22=mix(l9_24,1.0-l9_24,fast::clamp(l9_26,0.0,1.0));
}
}
l9_11.x=l9_22;
float l9_27=l9_11.y;
int l9_28=l9_14.y;
if (l9_28==1)
{
l9_27=fract(l9_27);
}
else
{
if (l9_28==2)
{
float l9_29=fract(l9_27);
float l9_30=l9_27-l9_29;
float l9_31=step(0.25,fract(l9_30*0.5));
l9_27=mix(l9_29,1.0-l9_29,fast::clamp(l9_31,0.0,1.0));
}
}
l9_11.y=l9_27;
if (l9_15)
{
bool l9_32=l9_17;
bool l9_33;
if (l9_32)
{
l9_33=l9_14.x==3;
}
else
{
l9_33=l9_32;
}
float l9_34=l9_11.x;
float l9_35=l9_16.x;
float l9_36=l9_16.z;
bool l9_37=l9_33;
float l9_38=l9_21;
float l9_39=fast::clamp(l9_34,l9_35,l9_36);
float l9_40=step(abs(l9_34-l9_39),9.9999997e-06);
l9_38*=(l9_40+((1.0-float(l9_37))*(1.0-l9_40)));
l9_34=l9_39;
l9_11.x=l9_34;
l9_21=l9_38;
bool l9_41=l9_17;
bool l9_42;
if (l9_41)
{
l9_42=l9_14.y==3;
}
else
{
l9_42=l9_41;
}
float l9_43=l9_11.y;
float l9_44=l9_16.y;
float l9_45=l9_16.w;
bool l9_46=l9_42;
float l9_47=l9_21;
float l9_48=fast::clamp(l9_43,l9_44,l9_45);
float l9_49=step(abs(l9_43-l9_48),9.9999997e-06);
l9_47*=(l9_49+((1.0-float(l9_46))*(1.0-l9_49)));
l9_43=l9_48;
l9_11.y=l9_43;
l9_21=l9_47;
}
float2 l9_50=l9_11;
bool l9_51=l9_12;
float3x3 l9_52=l9_13;
if (l9_51)
{
l9_50=float2((l9_52*float3(l9_50,1.0)).xy);
}
float2 l9_53=l9_50;
l9_11=l9_53;
float l9_54=l9_11.x;
int l9_55=l9_14.x;
bool l9_56=l9_20;
float l9_57=l9_21;
if ((l9_55==0)||(l9_55==3))
{
float l9_58=l9_54;
float l9_59=0.0;
float l9_60=1.0;
bool l9_61=l9_56;
float l9_62=l9_57;
float l9_63=fast::clamp(l9_58,l9_59,l9_60);
float l9_64=step(abs(l9_58-l9_63),9.9999997e-06);
l9_62*=(l9_64+((1.0-float(l9_61))*(1.0-l9_64)));
l9_58=l9_63;
l9_54=l9_58;
l9_57=l9_62;
}
l9_11.x=l9_54;
l9_21=l9_57;
float l9_65=l9_11.y;
int l9_66=l9_14.y;
bool l9_67=l9_20;
float l9_68=l9_21;
if ((l9_66==0)||(l9_66==3))
{
float l9_69=l9_65;
float l9_70=0.0;
float l9_71=1.0;
bool l9_72=l9_67;
float l9_73=l9_68;
float l9_74=fast::clamp(l9_69,l9_70,l9_71);
float l9_75=step(abs(l9_69-l9_74),9.9999997e-06);
l9_73*=(l9_75+((1.0-float(l9_72))*(1.0-l9_75)));
l9_69=l9_74;
l9_65=l9_69;
l9_68=l9_73;
}
l9_11.y=l9_65;
l9_21=l9_68;
float2 l9_76=l9_11;
int l9_77=l9_9;
int l9_78=l9_10;
float l9_79=l9_19;
float2 l9_80=l9_76;
int l9_81=l9_77;
int l9_82=l9_78;
float3 l9_83=float3(0.0);
if (l9_81==0)
{
l9_83=float3(l9_80,0.0);
}
else
{
if (l9_81==1)
{
l9_83=float3(l9_80.x,(l9_80.y*0.5)+(0.5-(float(l9_82)*0.5)),0.0);
}
else
{
l9_83=float3(l9_80,float(l9_82));
}
}
float3 l9_84=l9_83;
float3 l9_85=l9_84;
float4 l9_86=icon1.sample(icon1SmpSC,l9_85.xy,bias(l9_79));
float4 l9_87=l9_86;
if (l9_17)
{
l9_87=mix(l9_18,l9_87,float4(l9_21));
}
float4 l9_88=l9_87;
l9_2=l9_88;
float4 l9_89=l9_2;
return l9_89;
}
else
{
float4 blurredTex=float4(0.0);
float lod=amount+0.69999999;
float2 arr[8];
arr[0]=g9_43[0];
arr[1]=g9_43[1];
arr[2]=g9_43[2];
arr[3]=g9_43[3];
arr[4]=g9_43[4];
arr[5]=g9_43[5];
arr[6]=g9_43[6];
arr[7]=g9_43[7];
int l9_90;
int i=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (i<8)
{
float2 uvIter=((arr[i]*pS)*exp2(amount))+uv;
float2 param_1=uvIter;
float param_2=lod;
float4 l9_91=float4(0.0);
if ((int(icon1HasSwappedViews_tmp)!=0))
{
int l9_92=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_92=0;
}
else
{
l9_92=varStereoViewID;
}
int l9_93=l9_92;
l9_90=1-l9_93;
}
else
{
int l9_94=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_94=0;
}
else
{
l9_94=varStereoViewID;
}
int l9_95=l9_94;
l9_90=l9_95;
}
int l9_96=l9_90;
int l9_97=icon1Layout_tmp;
int l9_98=l9_96;
float2 l9_99=param_1;
bool l9_100=(int(SC_USE_UV_TRANSFORM_icon1_tmp)!=0);
float3x3 l9_101=UserUniforms.icon1Transform;
int2 l9_102=int2(SC_SOFTWARE_WRAP_MODE_U_icon1_tmp,SC_SOFTWARE_WRAP_MODE_V_icon1_tmp);
bool l9_103=(int(SC_USE_UV_MIN_MAX_icon1_tmp)!=0);
float4 l9_104=UserUniforms.icon1UvMinMax;
bool l9_105=(int(SC_USE_CLAMP_TO_BORDER_icon1_tmp)!=0);
float4 l9_106=UserUniforms.icon1BorderColor;
float l9_107=param_2;
bool l9_108=l9_105&&(!l9_103);
float l9_109=1.0;
float l9_110=l9_99.x;
int l9_111=l9_102.x;
if (l9_111==1)
{
l9_110=fract(l9_110);
}
else
{
if (l9_111==2)
{
float l9_112=fract(l9_110);
float l9_113=l9_110-l9_112;
float l9_114=step(0.25,fract(l9_113*0.5));
l9_110=mix(l9_112,1.0-l9_112,fast::clamp(l9_114,0.0,1.0));
}
}
l9_99.x=l9_110;
float l9_115=l9_99.y;
int l9_116=l9_102.y;
if (l9_116==1)
{
l9_115=fract(l9_115);
}
else
{
if (l9_116==2)
{
float l9_117=fract(l9_115);
float l9_118=l9_115-l9_117;
float l9_119=step(0.25,fract(l9_118*0.5));
l9_115=mix(l9_117,1.0-l9_117,fast::clamp(l9_119,0.0,1.0));
}
}
l9_99.y=l9_115;
if (l9_103)
{
bool l9_120=l9_105;
bool l9_121;
if (l9_120)
{
l9_121=l9_102.x==3;
}
else
{
l9_121=l9_120;
}
float l9_122=l9_99.x;
float l9_123=l9_104.x;
float l9_124=l9_104.z;
bool l9_125=l9_121;
float l9_126=l9_109;
float l9_127=fast::clamp(l9_122,l9_123,l9_124);
float l9_128=step(abs(l9_122-l9_127),9.9999997e-06);
l9_126*=(l9_128+((1.0-float(l9_125))*(1.0-l9_128)));
l9_122=l9_127;
l9_99.x=l9_122;
l9_109=l9_126;
bool l9_129=l9_105;
bool l9_130;
if (l9_129)
{
l9_130=l9_102.y==3;
}
else
{
l9_130=l9_129;
}
float l9_131=l9_99.y;
float l9_132=l9_104.y;
float l9_133=l9_104.w;
bool l9_134=l9_130;
float l9_135=l9_109;
float l9_136=fast::clamp(l9_131,l9_132,l9_133);
float l9_137=step(abs(l9_131-l9_136),9.9999997e-06);
l9_135*=(l9_137+((1.0-float(l9_134))*(1.0-l9_137)));
l9_131=l9_136;
l9_99.y=l9_131;
l9_109=l9_135;
}
float2 l9_138=l9_99;
bool l9_139=l9_100;
float3x3 l9_140=l9_101;
if (l9_139)
{
l9_138=float2((l9_140*float3(l9_138,1.0)).xy);
}
float2 l9_141=l9_138;
l9_99=l9_141;
float l9_142=l9_99.x;
int l9_143=l9_102.x;
bool l9_144=l9_108;
float l9_145=l9_109;
if ((l9_143==0)||(l9_143==3))
{
float l9_146=l9_142;
float l9_147=0.0;
float l9_148=1.0;
bool l9_149=l9_144;
float l9_150=l9_145;
float l9_151=fast::clamp(l9_146,l9_147,l9_148);
float l9_152=step(abs(l9_146-l9_151),9.9999997e-06);
l9_150*=(l9_152+((1.0-float(l9_149))*(1.0-l9_152)));
l9_146=l9_151;
l9_142=l9_146;
l9_145=l9_150;
}
l9_99.x=l9_142;
l9_109=l9_145;
float l9_153=l9_99.y;
int l9_154=l9_102.y;
bool l9_155=l9_108;
float l9_156=l9_109;
if ((l9_154==0)||(l9_154==3))
{
float l9_157=l9_153;
float l9_158=0.0;
float l9_159=1.0;
bool l9_160=l9_155;
float l9_161=l9_156;
float l9_162=fast::clamp(l9_157,l9_158,l9_159);
float l9_163=step(abs(l9_157-l9_162),9.9999997e-06);
l9_161*=(l9_163+((1.0-float(l9_160))*(1.0-l9_163)));
l9_157=l9_162;
l9_153=l9_157;
l9_156=l9_161;
}
l9_99.y=l9_153;
l9_109=l9_156;
float2 l9_164=l9_99;
int l9_165=l9_97;
int l9_166=l9_98;
float l9_167=l9_107;
float2 l9_168=l9_164;
int l9_169=l9_165;
int l9_170=l9_166;
float3 l9_171=float3(0.0);
if (l9_169==0)
{
l9_171=float3(l9_168,0.0);
}
else
{
if (l9_169==1)
{
l9_171=float3(l9_168.x,(l9_168.y*0.5)+(0.5-(float(l9_170)*0.5)),0.0);
}
else
{
l9_171=float3(l9_168,float(l9_170));
}
}
float3 l9_172=l9_171;
float3 l9_173=l9_172;
float4 l9_174=icon1.sample(icon1SmpSC,l9_173.xy,level(l9_167));
float4 l9_175=l9_174;
if (l9_105)
{
l9_175=mix(l9_106,l9_175,float4(l9_109));
}
float4 l9_176=l9_175;
l9_91=l9_176;
float4 l9_177=l9_91;
blurredTex+=(l9_177*0.125);
i++;
continue;
}
else
{
break;
}
}
float fadeOutBlur=fast::min(amount,1.0);
float2 param_3=uv;
float param_4=lod*fadeOutBlur;
float4 l9_178=float4(0.0);
int l9_179;
if ((int(icon1HasSwappedViews_tmp)!=0))
{
int l9_180=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_180=0;
}
else
{
l9_180=varStereoViewID;
}
int l9_181=l9_180;
l9_179=1-l9_181;
}
else
{
int l9_182=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_182=0;
}
else
{
l9_182=varStereoViewID;
}
int l9_183=l9_182;
l9_179=l9_183;
}
int l9_184=l9_179;
int l9_185=icon1Layout_tmp;
int l9_186=l9_184;
float2 l9_187=param_3;
bool l9_188=(int(SC_USE_UV_TRANSFORM_icon1_tmp)!=0);
float3x3 l9_189=UserUniforms.icon1Transform;
int2 l9_190=int2(SC_SOFTWARE_WRAP_MODE_U_icon1_tmp,SC_SOFTWARE_WRAP_MODE_V_icon1_tmp);
bool l9_191=(int(SC_USE_UV_MIN_MAX_icon1_tmp)!=0);
float4 l9_192=UserUniforms.icon1UvMinMax;
bool l9_193=(int(SC_USE_CLAMP_TO_BORDER_icon1_tmp)!=0);
float4 l9_194=UserUniforms.icon1BorderColor;
float l9_195=param_4;
bool l9_196=l9_193&&(!l9_191);
float l9_197=1.0;
float l9_198=l9_187.x;
int l9_199=l9_190.x;
if (l9_199==1)
{
l9_198=fract(l9_198);
}
else
{
if (l9_199==2)
{
float l9_200=fract(l9_198);
float l9_201=l9_198-l9_200;
float l9_202=step(0.25,fract(l9_201*0.5));
l9_198=mix(l9_200,1.0-l9_200,fast::clamp(l9_202,0.0,1.0));
}
}
l9_187.x=l9_198;
float l9_203=l9_187.y;
int l9_204=l9_190.y;
if (l9_204==1)
{
l9_203=fract(l9_203);
}
else
{
if (l9_204==2)
{
float l9_205=fract(l9_203);
float l9_206=l9_203-l9_205;
float l9_207=step(0.25,fract(l9_206*0.5));
l9_203=mix(l9_205,1.0-l9_205,fast::clamp(l9_207,0.0,1.0));
}
}
l9_187.y=l9_203;
if (l9_191)
{
bool l9_208=l9_193;
bool l9_209;
if (l9_208)
{
l9_209=l9_190.x==3;
}
else
{
l9_209=l9_208;
}
float l9_210=l9_187.x;
float l9_211=l9_192.x;
float l9_212=l9_192.z;
bool l9_213=l9_209;
float l9_214=l9_197;
float l9_215=fast::clamp(l9_210,l9_211,l9_212);
float l9_216=step(abs(l9_210-l9_215),9.9999997e-06);
l9_214*=(l9_216+((1.0-float(l9_213))*(1.0-l9_216)));
l9_210=l9_215;
l9_187.x=l9_210;
l9_197=l9_214;
bool l9_217=l9_193;
bool l9_218;
if (l9_217)
{
l9_218=l9_190.y==3;
}
else
{
l9_218=l9_217;
}
float l9_219=l9_187.y;
float l9_220=l9_192.y;
float l9_221=l9_192.w;
bool l9_222=l9_218;
float l9_223=l9_197;
float l9_224=fast::clamp(l9_219,l9_220,l9_221);
float l9_225=step(abs(l9_219-l9_224),9.9999997e-06);
l9_223*=(l9_225+((1.0-float(l9_222))*(1.0-l9_225)));
l9_219=l9_224;
l9_187.y=l9_219;
l9_197=l9_223;
}
float2 l9_226=l9_187;
bool l9_227=l9_188;
float3x3 l9_228=l9_189;
if (l9_227)
{
l9_226=float2((l9_228*float3(l9_226,1.0)).xy);
}
float2 l9_229=l9_226;
l9_187=l9_229;
float l9_230=l9_187.x;
int l9_231=l9_190.x;
bool l9_232=l9_196;
float l9_233=l9_197;
if ((l9_231==0)||(l9_231==3))
{
float l9_234=l9_230;
float l9_235=0.0;
float l9_236=1.0;
bool l9_237=l9_232;
float l9_238=l9_233;
float l9_239=fast::clamp(l9_234,l9_235,l9_236);
float l9_240=step(abs(l9_234-l9_239),9.9999997e-06);
l9_238*=(l9_240+((1.0-float(l9_237))*(1.0-l9_240)));
l9_234=l9_239;
l9_230=l9_234;
l9_233=l9_238;
}
l9_187.x=l9_230;
l9_197=l9_233;
float l9_241=l9_187.y;
int l9_242=l9_190.y;
bool l9_243=l9_196;
float l9_244=l9_197;
if ((l9_242==0)||(l9_242==3))
{
float l9_245=l9_241;
float l9_246=0.0;
float l9_247=1.0;
bool l9_248=l9_243;
float l9_249=l9_244;
float l9_250=fast::clamp(l9_245,l9_246,l9_247);
float l9_251=step(abs(l9_245-l9_250),9.9999997e-06);
l9_249*=(l9_251+((1.0-float(l9_248))*(1.0-l9_251)));
l9_245=l9_250;
l9_241=l9_245;
l9_244=l9_249;
}
l9_187.y=l9_241;
l9_197=l9_244;
float2 l9_252=l9_187;
int l9_253=l9_185;
int l9_254=l9_186;
float l9_255=l9_195;
float2 l9_256=l9_252;
int l9_257=l9_253;
int l9_258=l9_254;
float3 l9_259=float3(0.0);
if (l9_257==0)
{
l9_259=float3(l9_256,0.0);
}
else
{
if (l9_257==1)
{
l9_259=float3(l9_256.x,(l9_256.y*0.5)+(0.5-(float(l9_258)*0.5)),0.0);
}
else
{
l9_259=float3(l9_256,float(l9_258));
}
}
float3 l9_260=l9_259;
float3 l9_261=l9_260;
float4 l9_262=icon1.sample(icon1SmpSC,l9_261.xy,level(l9_255));
float4 l9_263=l9_262;
if (l9_193)
{
l9_263=mix(l9_194,l9_263,float4(l9_197));
}
float4 l9_264=l9_263;
l9_178=l9_264;
float4 l9_265=l9_178;
float4 baseTex=l9_265;
return mix(baseTex,blurredTex,float4(0.83999997*fadeOutBlur));
}
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
l9_236=l9_278;
float l9_279=l9_236.x;
int l9_280=l9_239.x;
bool l9_281=l9_245;
float l9_282=l9_246;
if ((l9_280==0)||(l9_280==3))
{
float l9_283=l9_279;
float l9_284=0.0;
float l9_285=1.0;
bool l9_286=l9_281;
float l9_287=l9_282;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_279=l9_283;
l9_282=l9_287;
}
l9_236.x=l9_279;
l9_246=l9_282;
float l9_290=l9_236.y;
int l9_291=l9_239.y;
bool l9_292=l9_245;
float l9_293=l9_246;
if ((l9_291==0)||(l9_291==3))
{
float l9_294=l9_290;
float l9_295=0.0;
float l9_296=1.0;
bool l9_297=l9_292;
float l9_298=l9_293;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_290=l9_294;
l9_293=l9_298;
}
l9_236.y=l9_290;
l9_246=l9_293;
float2 l9_301=l9_236;
int l9_302=l9_234;
int l9_303=l9_235;
float l9_304=l9_244;
float2 l9_305=l9_301;
int l9_306=l9_302;
int l9_307=l9_303;
float3 l9_308=float3(0.0);
if (l9_306==0)
{
l9_308=float3(l9_305,0.0);
}
else
{
if (l9_306==1)
{
l9_308=float3(l9_305.x,(l9_305.y*0.5)+(0.5-(float(l9_307)*0.5)),0.0);
}
else
{
l9_308=float3(l9_305,float(l9_307));
}
}
float3 l9_309=l9_308;
float3 l9_310=l9_309;
float4 l9_311=intensityTexture.sample(intensityTextureSmpSC,l9_310.xy,bias(l9_304));
float4 l9_312=l9_311;
if (l9_242)
{
l9_312=mix(l9_243,l9_312,float4(l9_246));
}
float4 l9_313=l9_312;
float3 l9_314=l9_313.xyz;
float3 l9_315=l9_314;
float l9_316=16.0;
float l9_317=((((l9_315.x*256.0)+l9_315.y)+(l9_315.z/256.0))/257.00391)*l9_316;
float l9_318=l9_317;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_318=fast::max(l9_318,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_318=fast::min(l9_318,1.0);
}
float l9_319=l9_225;
float3 l9_320=param_8;
float3 l9_321=param_9;
float l9_322=l9_226;
float l9_323=l9_318;
float3 l9_324=transformColor(l9_319,l9_320,l9_321,l9_322,l9_323);
return l9_324;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 sc_OutputMotionVectorIfNeeded(thread const float4& finalColor,thread float4& varPosAndMotion,thread float4& varNormalAndMotion)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float2 param=float2(varPosAndMotion.w,varNormalAndMotion.w);
float l9_0=(param.x*5.0)+0.5;
float l9_1=floor(l9_0*65535.0);
float l9_2=floor(l9_1*0.00390625);
float2 l9_3=float2(l9_2/255.0,(l9_1-(l9_2*256.0))/255.0);
float l9_4=(param.y*5.0)+0.5;
float l9_5=floor(l9_4*65535.0);
float l9_6=floor(l9_5*0.00390625);
float2 l9_7=float2(l9_6/255.0,(l9_5-(l9_6*256.0))/255.0);
float4 l9_8=float4(l9_3,l9_7);
return l9_8;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
bool N53_UseColor=false;
int N53_AlphaChannel=0;
float4 N53_Result=float4(0.0);
float N53_BlurAmount=0.0;
float3 N53_Color=float3(0.0);
float2 N53_TexSize=float2(0.0);
float N53_Scale=0.0;
float2 N53_Position=float2(0.0);
float2 N53_Stretch=float2(0.0);
float2 N53_Nudge=float2(0.0);
float2 N53_Center=float2(0.0);
float2 N53_Refraction=float2(0.0);
float N53_Pressure=0.0;
float N53_PressureMult=0.0;
float N53_ButtonAlpha=0.0;
float N53_PlaneScale=0.0;
bool N7_PressBool=false;
bool N7_HoverBool=false;
bool N7_ConstStretchBool=false;
float2 N7_P0=float2(0.0);
float2 N7_P1=float2(0.0);
float2 N7_TouchInput=float2(0.0);
float N7_PressureInput=0.0;
float N7_ThumbSize=0.0;
float N7_StretchStrength=0.0;
float N7_PressDownStrength=0.0;
float N7_NudgeStrength=0.0;
float2 N7_Stretch=float2(0.0);
float2 N7_Nudge=float2(0.0);
float N7_Pressure=0.0;
float N7_Highlight=0.0;
bool N51_UseTex=false;
bool N51_ChorAbrrOnSurface=false;
bool N51_TopLight=false;
float N51_Sdf=0.0;
float3 N51_TextureOp=float3(0.0);
float N51_Thickness=0.0;
float N51_Frost=0.0;
float N51_Quality=0.0;
float N51_Material=0.0;
float N51_Pressure=0.0;
float N51_Softness=0.0;
float4 N51_Colorize=float4(0.0);
float N51_Highlight=0.0;
float N51_ChromaticAberration=0.0;
float N51_Angle=0.0;
float N51_Bleed=0.0;
float N51_Transparency=0.0;
float4 N51_Result=float4(0.0);
float N51_EdgeMask=0.0;
float2 N51_Uv=float2(0.0);
float N50_Result=0.0;
float2 N50_UV=float2(0.0);
float N50_Softness=0.0;
float4 N50_Radius=float4(0.0);
float2 N50_Scale=float2(0.0);
float2 N50_Position=float2(0.0);
float2 N50_Stretch=float2(0.0);
float2 N50_Nudge=float2(0.0);
float N50_Pressure=0.0;
float4 N38_BaseColorInput=float4(0.0);
float4 N38_ColorOutput=float4(0.0);
float N38_Softness=0.0;
float N38_SoftnessMod=0.0;
float4 N38_Radius=float4(0.0);
float4 N38_RadiusOutput=float4(0.0);
float2 N38_Scale=float2(0.0);
float2 N38_ScaleMod=float2(0.0);
bool N61_UseColor=false;
int N61_AlphaChannel=0;
float4 N61_Result=float4(0.0);
float N61_BlurAmount=0.0;
float3 N61_Color=float3(0.0);
float2 N61_TexSize=float2(0.0);
float N61_Scale=0.0;
float2 N61_Position=float2(0.0);
float2 N61_Stretch=float2(0.0);
float2 N61_Nudge=float2(0.0);
float2 N61_Center=float2(0.0);
float2 N61_Refraction=float2(0.0);
float N61_Pressure=0.0;
float N61_PressureMult=0.0;
float N61_ButtonAlpha=0.0;
float N61_PlaneScale=0.0;
ssGlobals tempGlobals;
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
discard_fragment();
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.Surface_UVCoord0=in.varTex01.xy;
float4 l9_0=gl_FragCoord;
float2 l9_1=l9_0.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2=l9_1;
float2 l9_3=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_4=1;
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
int l9_7=l9_6;
float3 l9_8=float3(l9_2,0.0);
int l9_9=l9_4;
int l9_10=l9_7;
if (l9_9==1)
{
l9_8.y=((2.0*l9_8.y)+float(l9_10))-1.0;
}
float2 l9_11=l9_8.xy;
l9_3=l9_11;
}
else
{
l9_3=l9_2;
}
float2 l9_12=l9_3;
float2 l9_13=l9_12;
Globals.gScreenCoord=l9_13;
float2 TextureSize_N17=float2(0.0);
float2 param=(*sc_set0.UserUniforms).icon0Size.xy;
TextureSize_N17=param;
float Output_N26=0.0;
float param_1=(*sc_set0.UserUniforms).maxBlur;
Output_N26=param_1;
float Output_N28=0.0;
float param_2=float((*sc_set0.UserUniforms).useColor!=0);
Output_N28=param_2;
float3 Output_N27=float3(0.0);
float3 param_3=(*sc_set0.UserUniforms).iconColor;
Output_N27=param_3;
float Output_N29=0.0;
float param_4=float((*sc_set0.UserUniforms).colorChannel);
Output_N29=param_4;
float Output_N30=0.0;
float param_5=(*sc_set0.UserUniforms).iconScale;
Output_N30=param_5;
float2 Output_N31=float2(0.0);
float2 param_6=(*sc_set0.UserUniforms).iconPosition;
Output_N31=param_6;
float2 Stretch_N7=float2(0.0);
float2 Nudge_N7=float2(0.0);
float Pressure_N7=0.0;
float Highlight_N7=0.0;
ssGlobals param_11=Globals;
tempGlobals=param_11;
float2 param_7=float2(0.0);
float2 param_8=float2(0.0);
float param_9=0.0;
float param_10=0.0;
float2 l9_14=float2(0.0);
float2 l9_15=float2(0.0);
float2 l9_16=(*sc_set0.UserUniforms).p0;
l9_15=l9_16;
l9_14=l9_15;
float2 l9_17=l9_14;
N7_P0=l9_17;
float2 l9_18=float2(0.0);
float2 l9_19=float2(0.0);
float2 l9_20=(*sc_set0.UserUniforms).p1;
l9_19=l9_20;
l9_18=l9_19;
float2 l9_21=l9_18;
N7_P1=l9_21;
float2 l9_22=float2(0.0);
float2 l9_23=float2(0.0);
float2 l9_24=(*sc_set0.UserUniforms).touchInput;
l9_23=l9_24;
l9_22=l9_23;
float2 l9_25=l9_22;
N7_TouchInput=l9_25;
float l9_26=0.0;
float l9_27=0.0;
float l9_28=(*sc_set0.UserUniforms).pressure;
l9_27=l9_28;
l9_26=l9_27;
float l9_29=l9_26;
N7_PressureInput=l9_29;
float l9_30=0.0;
float l9_31=0.0;
float l9_32=(*sc_set0.UserUniforms).thumbSize;
l9_31=l9_32;
l9_30=l9_31;
float l9_33=l9_30;
N7_ThumbSize=l9_33;
float l9_34=0.0;
float l9_35=0.0;
float l9_36=(*sc_set0.UserUniforms).stretchStrength;
l9_35=l9_36;
l9_34=l9_35;
float l9_37=l9_34;
N7_StretchStrength=l9_37;
float l9_38=0.0;
float l9_39=0.0;
float l9_40=(*sc_set0.UserUniforms).pressDownStrength;
l9_39=l9_40;
l9_38=l9_39;
float l9_41=l9_38;
N7_PressDownStrength=l9_41;
float l9_42=0.0;
float l9_43=0.0;
float l9_44=(*sc_set0.UserUniforms).nudgeStrength;
l9_43=l9_44;
l9_42=l9_43;
float l9_45=l9_42;
N7_NudgeStrength=l9_45;
float l9_46=0.0;
float l9_47=0.0;
float l9_48=float((*sc_set0.UserUniforms).pressLight!=0);
l9_47=l9_48;
l9_46=l9_47;
bool l9_49=l9_46!=0.0;
N7_PressBool=l9_49;
float l9_50=0.0;
float l9_51=0.0;
float l9_52=float((*sc_set0.UserUniforms).hoverLight!=0);
l9_51=l9_52;
l9_50=l9_51;
bool l9_53=l9_50!=0.0;
N7_HoverBool=l9_53;
float l9_54=0.0;
float l9_55=0.0;
float l9_56=float((*sc_set0.UserUniforms).constantStretch!=0);
l9_55=l9_56;
l9_54=l9_55;
bool l9_57=l9_54!=0.0;
N7_ConstStretchBool=l9_57;
float2 l9_58=float2(0.0);
l9_58=tempGlobals.N7_UV;
float2 l9_59=l9_58;
float2 l9_60=(*sc_set0.UserUniforms).Port_Scale_N005;
l9_59.x=floor(l9_59.x*10000.0)*9.9999997e-05;
l9_59.y=floor(l9_59.y*10000.0)*9.9999997e-05;
l9_59*=(l9_60*0.5);
float2 l9_61=l9_59;
float l9_62=tempGlobals.gTimeElapsed;
float l9_63=l9_62;
float2 l9_64=float2(0.0);
tempGlobals.N7_UV=l9_64;
float l9_65=0.0;
float2 l9_66=N7_P0;
float2 l9_67=N7_P1;
l9_66.y=1.0-l9_66.y;
l9_67.y=1.0-l9_67.y;
float2 l9_68=l9_66-l9_67;
float2 l9_69=(l9_68*N7_NudgeStrength)*N7_PressureInput;
float2 l9_70=tempGlobals.gScreenCoord;
float2 l9_71=l9_70+l9_69;
float l9_72=mix(-smoothstep(l9_67.x,0.0,l9_71.x),-smoothstep(l9_67.x,1.0,l9_71.x),l9_66.x);
float l9_73=mix(-smoothstep(l9_67.y,0.0,l9_71.y),-smoothstep(l9_67.y,1.0,l9_71.y),l9_66.y);
float2 l9_74=N7_TouchInput;
l9_74.y=1.0-l9_74.y;
float2 l9_75=tempGlobals.Surface_UVCoord0;
l9_64=l9_75;
tempGlobals.N7_UV=l9_64;
l9_64-=float2(0.5);
l9_64*=(1.0/N7_ThumbSize);
if (N7_HoverBool)
{
float2 l9_76=tempGlobals.gScreenCoord;
l9_64=l9_76;
l9_64-=l9_74;
float l9_77=(*sc_set0.UserUniforms).sc_Camera.aspect;
l9_64.x*=l9_77;
l9_64*=(2.0/N7_ThumbSize);
}
tempGlobals.N7_UV+=float2(l9_63*0.050000001);
float l9_78=0.0;
float2 l9_79=float2(0.0);
l9_79=tempGlobals.N7_UV;
float l9_80=0.0;
float2 l9_81=l9_79;
float2 l9_82=(*sc_set0.UserUniforms).Port_Scale_N005;
l9_81.x=floor(l9_81.x*10000.0)*9.9999997e-05;
l9_81.y=floor(l9_81.y*10000.0)*9.9999997e-05;
l9_81*=(l9_82*0.5);
float2 l9_83=l9_81;
float l9_84=(snoise(l9_83)*0.5)+0.5;
l9_84=floor(l9_84*10000.0)*9.9999997e-05;
l9_80=l9_84;
l9_78=l9_80;
float l9_85=l9_78;
l9_64+=float2((l9_85-0.5)*0.050000001);
if (N7_PressBool||N7_HoverBool)
{
float2 l9_86=l9_64;
float l9_87=N7_PressureInput;
float l9_88=0.1;
float l9_89;
if (l9_87<=0.0)
{
l9_89=0.0;
}
else
{
l9_89=pow(l9_87,l9_88);
}
float l9_90=l9_89;
l9_65=((smoothstep(0.69999999,1.0,((1.0-length(l9_86))+l9_90)-1.0)*N7_PressureInput)*N7_PressureInput)*2.0;
}
N7_Highlight=l9_65;
N7_Pressure=(N7_PressureInput*N7_PressDownStrength)*0.5;
float2 l9_91;
if (N7_PressBool)
{
l9_91=float2(1.0);
}
else
{
l9_91=mix(float2(1.0),float2(1.0)-float2(l9_73,l9_72),float2((N7_ConstStretchBool ? N7_StretchStrength : (length(l9_68)*N7_StretchStrength))*N7_PressureInput));
}
N7_Stretch=l9_91;
N7_Nudge=l9_69;
param_7=N7_Stretch;
param_8=N7_Nudge;
param_9=N7_Pressure;
param_10=N7_Highlight;
Stretch_N7=param_7;
Nudge_N7=param_8;
Pressure_N7=param_9;
Highlight_N7=param_10;
float2 Output_N22=float2(0.0);
float2 param_12=(*sc_set0.UserUniforms).shapePosition;
Output_N22=param_12;
float4 Output_N32=float4(0.0);
float4 param_13=(*sc_set0.UserUniforms).baseColor;
Output_N32=param_13;
float Output_N24=0.0;
float param_14=(*sc_set0.UserUniforms).shapeSoftness;
Output_N24=param_14;
float4 Output_N23=float4(0.0);
float4 param_15=(*sc_set0.UserUniforms).cornerRadius;
Output_N23=param_15;
float Output_N56=0.0;
float param_16=(*sc_set0.UserUniforms)._scaleMult_;
Output_N56=param_16;
float4 Output_N58=float4(0.0);
Output_N58=Output_N23/(float4(Output_N56)+float4(1.234e-06));
float2 Output_N21=float2(0.0);
float2 param_17=(*sc_set0.UserUniforms).shapeScale;
Output_N21=param_17;
float2 Output_N55=float2(0.0);
Output_N55=Output_N21/(float2(Output_N56)+float2(1.234e-06));
float4 ColorOutput_N38=float4(0.0);
float SoftnessMod_N38=0.0;
float4 RadiusOutput_N38=float4(0.0);
float2 ScaleMod_N38=float2(0.0);
float4 param_18=Output_N32;
float param_20=Output_N24;
float4 param_22=Output_N58;
float2 param_24=Output_N55;
ssGlobals param_26=Globals;
tempGlobals=param_26;
float4 param_19=float4(0.0);
float param_21=0.0;
float4 param_23=float4(0.0);
float2 param_25=float2(0.0);
N38_BaseColorInput=param_18;
N38_Softness=param_20;
N38_Radius=param_22;
N38_Scale=param_24;
float l9_92=N38_BaseColorInput.w;
float l9_93;
if (l9_92<0.5)
{
l9_93=2.0*l9_92;
}
else
{
l9_93=1.0-((2.0*l9_92)-1.0);
}
float l9_94=l9_93;
float l9_95=l9_94;
float l9_96=2.0;
float l9_97;
if (l9_95<=0.0)
{
l9_97=0.0;
}
else
{
l9_97=pow(l9_95,l9_96);
}
float l9_98=l9_97;
float l9_99=3.1415927;
float l9_100=l9_98-(l9_94*sin(l9_94*l9_99));
float l9_101;
if (l9_92<0.5)
{
l9_101=0.5*l9_100;
}
else
{
l9_101=(0.5*(1.0-l9_100))+0.5;
}
float l9_102=l9_101;
float l9_103=l9_102;
N38_ColorOutput=float4(N38_BaseColorInput.xyz,l9_103);
N38_RadiusOutput=N38_Radius*l9_103;
N38_ScaleMod=N38_Scale*l9_103;
N38_SoftnessMod=fast::clamp(1.0-l9_103,N38_Softness,1.0);
param_19=N38_ColorOutput;
param_21=N38_SoftnessMod;
param_23=N38_RadiusOutput;
param_25=N38_ScaleMod;
ColorOutput_N38=param_19;
SoftnessMod_N38=param_21;
RadiusOutput_N38=param_23;
ScaleMod_N38=param_25;
float Result_N50=0.0;
float2 UV_N50=float2(0.0);
float param_29=SoftnessMod_N38;
float4 param_30=RadiusOutput_N38;
float2 param_31=ScaleMod_N38;
float2 param_32=Output_N22;
float2 param_33=Stretch_N7;
float2 param_34=Nudge_N7;
float param_35=Pressure_N7;
ssGlobals param_36=Globals;
tempGlobals=param_36;
float param_27=0.0;
float2 param_28=float2(0.0);
N50_Softness=param_29;
N50_Radius=param_30;
N50_Scale=param_31;
N50_Position=param_32;
N50_Stretch=param_33;
N50_Nudge=param_34;
N50_Pressure=param_35;
float2 l9_104=tempGlobals.Surface_UVCoord0;
float2 l9_105=((l9_104-N50_Position)-float2(0.5))*2.0;
l9_105*=N50_Stretch;
l9_105*=(1.0-N50_Pressure);
l9_105+=N50_Nudge;
float2 l9_106=tempGlobals.Surface_UVCoord0;
float2 l9_107=float2(1.0)/N50_Scale;
float2 l9_108=l9_106;
l9_108-=float2(0.5);
l9_108*=l9_107;
l9_108+=float2(0.5);
float2 l9_109=l9_108;
float2 l9_110=l9_109;
l9_110*=N50_Stretch;
l9_110*=(1.0-N50_Pressure);
l9_110+=(N50_Nudge*1.5);
float2 l9_111=l9_105;
float2 l9_112=N50_Scale;
float4 l9_113=N50_Radius;
float2 l9_114;
if (l9_111.x>0.0)
{
l9_114=l9_113.xy;
}
else
{
l9_114=l9_113.zw;
}
l9_113=float4(l9_114.x,l9_114.y,l9_113.z,l9_113.w);
float l9_115;
if (l9_111.y>0.0)
{
l9_115=l9_113.x;
}
else
{
l9_115=l9_113.y;
}
l9_113.x=l9_115;
float2 l9_116=(abs(l9_111)-l9_112)+float2(l9_113.x);
float l9_117=(fast::min(fast::max(l9_116.x,l9_116.y),0.0)+length(fast::max(l9_116,float2(0.0))))-l9_113.x;
float l9_118=l9_117;
float l9_119=fwidth(l9_118);
l9_118=smoothstep((0.0-l9_119)-N50_Softness,(0.0+l9_119)+N50_Softness,l9_118);
N50_Result=l9_118;
N50_UV=l9_110;
param_27=N50_Result;
param_28=N50_UV;
Result_N50=param_27;
UV_N50=param_28;
float Output_N83=0.0;
float param_37=float((*sc_set0.UserUniforms).useTex!=0);
Output_N83=param_37;
float4 Color_N84=float4(0.0);
int l9_120;
if ((int(extraTexHasSwappedViews_tmp)!=0))
{
int l9_121=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_121=0;
}
else
{
l9_121=in.varStereoViewID;
}
int l9_122=l9_121;
l9_120=1-l9_122;
}
else
{
int l9_123=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_123=0;
}
else
{
l9_123=in.varStereoViewID;
}
int l9_124=l9_123;
l9_120=l9_124;
}
int l9_125=l9_120;
int param_38=extraTexLayout_tmp;
int param_39=l9_125;
float2 param_40=UV_N50;
bool param_41=(int(SC_USE_UV_TRANSFORM_extraTex_tmp)!=0);
float3x3 param_42=(*sc_set0.UserUniforms).extraTexTransform;
int2 param_43=int2(SC_SOFTWARE_WRAP_MODE_U_extraTex_tmp,SC_SOFTWARE_WRAP_MODE_V_extraTex_tmp);
bool param_44=(int(SC_USE_UV_MIN_MAX_extraTex_tmp)!=0);
float4 param_45=(*sc_set0.UserUniforms).extraTexUvMinMax;
bool param_46=(int(SC_USE_CLAMP_TO_BORDER_extraTex_tmp)!=0);
float4 param_47=(*sc_set0.UserUniforms).extraTexBorderColor;
float param_48=0.0;
bool l9_126=param_46&&(!param_44);
float l9_127=1.0;
float l9_128=param_40.x;
int l9_129=param_43.x;
if (l9_129==1)
{
l9_128=fract(l9_128);
}
else
{
if (l9_129==2)
{
float l9_130=fract(l9_128);
float l9_131=l9_128-l9_130;
float l9_132=step(0.25,fract(l9_131*0.5));
l9_128=mix(l9_130,1.0-l9_130,fast::clamp(l9_132,0.0,1.0));
}
}
param_40.x=l9_128;
float l9_133=param_40.y;
int l9_134=param_43.y;
if (l9_134==1)
{
l9_133=fract(l9_133);
}
else
{
if (l9_134==2)
{
float l9_135=fract(l9_133);
float l9_136=l9_133-l9_135;
float l9_137=step(0.25,fract(l9_136*0.5));
l9_133=mix(l9_135,1.0-l9_135,fast::clamp(l9_137,0.0,1.0));
}
}
param_40.y=l9_133;
if (param_44)
{
bool l9_138=param_46;
bool l9_139;
if (l9_138)
{
l9_139=param_43.x==3;
}
else
{
l9_139=l9_138;
}
float l9_140=param_40.x;
float l9_141=param_45.x;
float l9_142=param_45.z;
bool l9_143=l9_139;
float l9_144=l9_127;
float l9_145=fast::clamp(l9_140,l9_141,l9_142);
float l9_146=step(abs(l9_140-l9_145),9.9999997e-06);
l9_144*=(l9_146+((1.0-float(l9_143))*(1.0-l9_146)));
l9_140=l9_145;
param_40.x=l9_140;
l9_127=l9_144;
bool l9_147=param_46;
bool l9_148;
if (l9_147)
{
l9_148=param_43.y==3;
}
else
{
l9_148=l9_147;
}
float l9_149=param_40.y;
float l9_150=param_45.y;
float l9_151=param_45.w;
bool l9_152=l9_148;
float l9_153=l9_127;
float l9_154=fast::clamp(l9_149,l9_150,l9_151);
float l9_155=step(abs(l9_149-l9_154),9.9999997e-06);
l9_153*=(l9_155+((1.0-float(l9_152))*(1.0-l9_155)));
l9_149=l9_154;
param_40.y=l9_149;
l9_127=l9_153;
}
float2 l9_156=param_40;
bool l9_157=param_41;
float3x3 l9_158=param_42;
if (l9_157)
{
l9_156=float2((l9_158*float3(l9_156,1.0)).xy);
}
float2 l9_159=l9_156;
param_40=l9_159;
float l9_160=param_40.x;
int l9_161=param_43.x;
bool l9_162=l9_126;
float l9_163=l9_127;
if ((l9_161==0)||(l9_161==3))
{
float l9_164=l9_160;
float l9_165=0.0;
float l9_166=1.0;
bool l9_167=l9_162;
float l9_168=l9_163;
float l9_169=fast::clamp(l9_164,l9_165,l9_166);
float l9_170=step(abs(l9_164-l9_169),9.9999997e-06);
l9_168*=(l9_170+((1.0-float(l9_167))*(1.0-l9_170)));
l9_164=l9_169;
l9_160=l9_164;
l9_163=l9_168;
}
param_40.x=l9_160;
l9_127=l9_163;
float l9_171=param_40.y;
int l9_172=param_43.y;
bool l9_173=l9_126;
float l9_174=l9_127;
if ((l9_172==0)||(l9_172==3))
{
float l9_175=l9_171;
float l9_176=0.0;
float l9_177=1.0;
bool l9_178=l9_173;
float l9_179=l9_174;
float l9_180=fast::clamp(l9_175,l9_176,l9_177);
float l9_181=step(abs(l9_175-l9_180),9.9999997e-06);
l9_179*=(l9_181+((1.0-float(l9_178))*(1.0-l9_181)));
l9_175=l9_180;
l9_171=l9_175;
l9_174=l9_179;
}
param_40.y=l9_171;
l9_127=l9_174;
float2 l9_182=param_40;
int l9_183=param_38;
int l9_184=param_39;
float l9_185=param_48;
float2 l9_186=l9_182;
int l9_187=l9_183;
int l9_188=l9_184;
float3 l9_189=float3(0.0);
if (l9_187==0)
{
l9_189=float3(l9_186,0.0);
}
else
{
if (l9_187==1)
{
l9_189=float3(l9_186.x,(l9_186.y*0.5)+(0.5-(float(l9_188)*0.5)),0.0);
}
else
{
l9_189=float3(l9_186,float(l9_188));
}
}
float3 l9_190=l9_189;
float3 l9_191=l9_190;
float4 l9_192=sc_set0.extraTex.sample(sc_set0.extraTexSmpSC,l9_191.xy,bias(l9_185));
float4 l9_193=l9_192;
if (param_46)
{
l9_193=mix(param_47,l9_193,float4(l9_127));
}
float4 l9_194=l9_193;
Color_N84=l9_194;
float Output_N33=0.0;
float param_49=(*sc_set0.UserUniforms).thickness;
Output_N33=param_49;
float Output_N34=0.0;
float param_50=(*sc_set0.UserUniforms).frost;
Output_N34=param_50;
float Output_N35=0.0;
float param_51=(*sc_set0.UserUniforms).quality;
Output_N35=param_51;
float Output_N40=0.0;
float param_52=(*sc_set0.UserUniforms).material;
Output_N40=param_52;
float Output_N42=0.0;
float param_53=(*sc_set0.UserUniforms).chromaticAbbr;
Output_N42=param_53;
float Output_N43=0.0;
float param_54=float((*sc_set0.UserUniforms).chromaticAbbrOnSurface!=0);
Output_N43=param_54;
float Output_N46=0.0;
float param_55=float((*sc_set0.UserUniforms).topLighting!=0);
Output_N46=param_55;
float Output_N47=0.0;
float param_56=(*sc_set0.UserUniforms).lightAngle;
Output_N47=param_56;
float Output_N48=0.0;
float param_57=(*sc_set0.UserUniforms).bleed;
Output_N48=param_57;
float Output_N60=0.0;
float param_58=(*sc_set0.UserUniforms).transparency;
Output_N60=param_58;
float4 Result_N51=float4(0.0);
float EdgeMask_N51=0.0;
float2 Uv_N51=float2(0.0);
float param_59=Result_N50;
float param_60=Output_N83;
float3 param_61=Color_N84.xyz;
float param_62=Output_N33;
float param_63=Output_N34;
float param_64=Output_N35;
float param_65=Output_N40;
float param_66=Pressure_N7;
float param_67=Output_N24;
float4 param_68=ColorOutput_N38;
float param_69=Highlight_N7;
float param_70=Output_N42;
float param_71=Output_N43;
float param_72=Output_N46;
float param_73=Output_N47;
float param_74=Output_N48;
float param_75=Output_N60;
ssGlobals param_79=Globals;
tempGlobals=param_79;
float4 param_76=float4(0.0);
float param_77=0.0;
float2 param_78=float2(0.0);
N51_Sdf=param_59;
N51_UseTex=param_60!=0.0;
N51_TextureOp=param_61;
N51_Thickness=param_62;
N51_Frost=param_63;
N51_Quality=param_64;
N51_Material=param_65;
N51_Pressure=param_66;
N51_Softness=param_67;
N51_Colorize=param_68;
N51_Highlight=param_69;
N51_ChromaticAberration=param_70;
N51_ChorAbrrOnSurface=param_71!=0.0;
N51_TopLight=param_72!=0.0;
N51_Angle=param_73;
N51_Bleed=param_74;
N51_Transparency=param_75;
float l9_195=(N51_Sdf*2.0)-1.0;
float2 l9_196=tempGlobals.gScreenCoord;
float2 l9_197=l9_196;
float l9_198=200.0;
float4 l9_199=float4(0.0);
int l9_200;
if ((int(screenHasSwappedViews_tmp)!=0))
{
int l9_201=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_201=0;
}
else
{
l9_201=in.varStereoViewID;
}
int l9_202=l9_201;
l9_200=1-l9_202;
}
else
{
int l9_203=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_203=0;
}
else
{
l9_203=in.varStereoViewID;
}
int l9_204=l9_203;
l9_200=l9_204;
}
int l9_205=l9_200;
int l9_206=screenLayout_tmp;
int l9_207=l9_205;
float2 l9_208=l9_197;
bool l9_209=(int(SC_USE_UV_TRANSFORM_screen_tmp)!=0);
float3x3 l9_210=(*sc_set0.UserUniforms).screenTransform;
int2 l9_211=int2(SC_SOFTWARE_WRAP_MODE_U_screen_tmp,SC_SOFTWARE_WRAP_MODE_V_screen_tmp);
bool l9_212=(int(SC_USE_UV_MIN_MAX_screen_tmp)!=0);
float4 l9_213=(*sc_set0.UserUniforms).screenUvMinMax;
bool l9_214=(int(SC_USE_CLAMP_TO_BORDER_screen_tmp)!=0);
float4 l9_215=(*sc_set0.UserUniforms).screenBorderColor;
float l9_216=l9_198;
bool l9_217=l9_214&&(!l9_212);
float l9_218=1.0;
float l9_219=l9_208.x;
int l9_220=l9_211.x;
if (l9_220==1)
{
l9_219=fract(l9_219);
}
else
{
if (l9_220==2)
{
float l9_221=fract(l9_219);
float l9_222=l9_219-l9_221;
float l9_223=step(0.25,fract(l9_222*0.5));
l9_219=mix(l9_221,1.0-l9_221,fast::clamp(l9_223,0.0,1.0));
}
}
l9_208.x=l9_219;
float l9_224=l9_208.y;
int l9_225=l9_211.y;
if (l9_225==1)
{
l9_224=fract(l9_224);
}
else
{
if (l9_225==2)
{
float l9_226=fract(l9_224);
float l9_227=l9_224-l9_226;
float l9_228=step(0.25,fract(l9_227*0.5));
l9_224=mix(l9_226,1.0-l9_226,fast::clamp(l9_228,0.0,1.0));
}
}
l9_208.y=l9_224;
if (l9_212)
{
bool l9_229=l9_214;
bool l9_230;
if (l9_229)
{
l9_230=l9_211.x==3;
}
else
{
l9_230=l9_229;
}
float l9_231=l9_208.x;
float l9_232=l9_213.x;
float l9_233=l9_213.z;
bool l9_234=l9_230;
float l9_235=l9_218;
float l9_236=fast::clamp(l9_231,l9_232,l9_233);
float l9_237=step(abs(l9_231-l9_236),9.9999997e-06);
l9_235*=(l9_237+((1.0-float(l9_234))*(1.0-l9_237)));
l9_231=l9_236;
l9_208.x=l9_231;
l9_218=l9_235;
bool l9_238=l9_214;
bool l9_239;
if (l9_238)
{
l9_239=l9_211.y==3;
}
else
{
l9_239=l9_238;
}
float l9_240=l9_208.y;
float l9_241=l9_213.y;
float l9_242=l9_213.w;
bool l9_243=l9_239;
float l9_244=l9_218;
float l9_245=fast::clamp(l9_240,l9_241,l9_242);
float l9_246=step(abs(l9_240-l9_245),9.9999997e-06);
l9_244*=(l9_246+((1.0-float(l9_243))*(1.0-l9_246)));
l9_240=l9_245;
l9_208.y=l9_240;
l9_218=l9_244;
}
float2 l9_247=l9_208;
bool l9_248=l9_209;
float3x3 l9_249=l9_210;
if (l9_248)
{
l9_247=float2((l9_249*float3(l9_247,1.0)).xy);
}
float2 l9_250=l9_247;
l9_208=l9_250;
float l9_251=l9_208.x;
int l9_252=l9_211.x;
bool l9_253=l9_217;
float l9_254=l9_218;
if ((l9_252==0)||(l9_252==3))
{
float l9_255=l9_251;
float l9_256=0.0;
float l9_257=1.0;
bool l9_258=l9_253;
float l9_259=l9_254;
float l9_260=fast::clamp(l9_255,l9_256,l9_257);
float l9_261=step(abs(l9_255-l9_260),9.9999997e-06);
l9_259*=(l9_261+((1.0-float(l9_258))*(1.0-l9_261)));
l9_255=l9_260;
l9_251=l9_255;
l9_254=l9_259;
}
l9_208.x=l9_251;
l9_218=l9_254;
float l9_262=l9_208.y;
int l9_263=l9_211.y;
bool l9_264=l9_217;
float l9_265=l9_218;
if ((l9_263==0)||(l9_263==3))
{
float l9_266=l9_262;
float l9_267=0.0;
float l9_268=1.0;
bool l9_269=l9_264;
float l9_270=l9_265;
float l9_271=fast::clamp(l9_266,l9_267,l9_268);
float l9_272=step(abs(l9_266-l9_271),9.9999997e-06);
l9_270*=(l9_272+((1.0-float(l9_269))*(1.0-l9_272)));
l9_266=l9_271;
l9_262=l9_266;
l9_265=l9_270;
}
l9_208.y=l9_262;
l9_218=l9_265;
float2 l9_273=l9_208;
int l9_274=l9_206;
int l9_275=l9_207;
float l9_276=l9_216;
float2 l9_277=l9_273;
int l9_278=l9_274;
int l9_279=l9_275;
float3 l9_280=float3(0.0);
if (l9_278==0)
{
l9_280=float3(l9_277,0.0);
}
else
{
if (l9_278==1)
{
l9_280=float3(l9_277.x,(l9_277.y*0.5)+(0.5-(float(l9_279)*0.5)),0.0);
}
else
{
l9_280=float3(l9_277,float(l9_279));
}
}
float3 l9_281=l9_280;
float3 l9_282=l9_281;
float4 l9_283=sc_set0.screen.sample(sc_set0.screenSmpSC,l9_282.xy,level(l9_276));
float4 l9_284=l9_283;
if (l9_214)
{
l9_284=mix(l9_215,l9_284,float4(l9_218));
}
float4 l9_285=l9_284;
l9_199=l9_285;
float4 l9_286=l9_199;
float l9_287=l9_286.x;
float2 l9_288=normalize(float2(dfdx(l9_195),dfdy(l9_195)));
float l9_289=fwidth(l9_195);
float l9_290=smoothstep(0.0+l9_289,0.0-l9_289,l9_195);
float l9_291=l9_195+1.0;
float l9_292=l9_291;
float l9_293=mix(N51_Bleed,fast::max(N51_Bleed-5.0,1.0),smoothstep(0.1,0.89999998,l9_287));
float l9_294;
if (l9_292<=0.0)
{
l9_294=0.0;
}
else
{
l9_294=pow(l9_292,l9_293);
}
float l9_295=l9_294;
float l9_296=l9_295;
float l9_297=N51_Angle;
float l9_298=3.1415927;
l9_297=(l9_297/180.0)*l9_298;
float2x2 l9_299;
l9_299[0]=float2(cos(l9_297),sin(l9_297));
l9_299[1]=float2(-sin(l9_297),cos(l9_297));
float2x2 l9_300=l9_299;
float2 l9_301=l9_288*l9_300;
float l9_302;
if (l9_291<0.1)
{
l9_302=0.0;
}
else
{
float l9_303;
if (N51_TopLight)
{
l9_303=abs(l9_301.x);
}
else
{
l9_303=l9_301.x;
}
l9_302=l9_303;
}
float l9_304=l9_302;
float l9_305=l9_291;
float2 l9_306=N51_refractOffset(l9_305);
float2 l9_307=tempGlobals.gScreenCoord;
float2 l9_308=(l9_307+((l9_306*N51_Pressure)*2.0))+(l9_306*0.30000001);
float l9_309=mix(N51_Thickness,1.5,l9_296);
float3 l9_310;
if (N51_Transparency>0.0)
{
float2 l9_311=l9_308;
float l9_312=l9_309;
float l9_313=N51_Quality;
float3 l9_314=float3(0.0);
float l9_315=0.0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_315<l9_313)
{
float2 l9_316=l9_311;
float l9_317=l9_315*0.25;
float l9_318=l9_312;
l9_314+=N51_hashedTexSample(l9_316,l9_317,l9_318,N51_ChorAbrrOnSurface,N51_Sdf,N51_Frost,N51_ChromaticAberration,in.varStereoViewID,(*sc_set0.UserUniforms),tempGlobals,sc_set0.screen,sc_set0.screenSmpSC);
l9_315+=1.0;
continue;
}
else
{
break;
}
}
float3 l9_319=l9_314/float3(l9_313);
l9_310=l9_319;
}
else
{
l9_310=float3(0.0);
}
float3 l9_320=l9_310;
float l9_321=l9_304;
float l9_322=l9_296;
float l9_323=5.0;
float l9_324;
if (l9_322<=0.0)
{
l9_324=0.0;
}
else
{
l9_324=pow(l9_322,l9_323);
}
float l9_325=l9_324;
float l9_326=mix(0.0,0.5,fast::clamp(l9_321*l9_325,0.0,1.0));
float3 l9_327=((l9_320*N51_Material)+float3(1.0))-float3(N51_Material);
if (N51_Transparency==1.0)
{
l9_327+=N51_Colorize.xyz;
}
else
{
float3 l9_328=l9_327;
float3 l9_329;
if (N51_UseTex)
{
l9_329=N51_TextureOp;
}
else
{
l9_329=N51_Colorize.xyz;
}
l9_327=mix(l9_328,l9_329,float3(1.0-N51_Transparency));
}
l9_327+=float3(N51_Highlight);
if (N51_Softness>0.0)
{
float3 l9_330=l9_327;
float3 l9_331=l9_327;
float l9_332=2.0;
float l9_333=dot(l9_331,float3(0.29899999,0.58700001,0.114));
float3 l9_334=mix(float3(l9_333),l9_331,float3(l9_332));
float3 l9_335=l9_334;
float3 l9_336=float3(0.5);
float l9_337;
if (l9_335.x<=0.0)
{
l9_337=0.0;
}
else
{
l9_337=pow(l9_335.x,l9_336.x);
}
float l9_338=l9_337;
float l9_339;
if (l9_335.y<=0.0)
{
l9_339=0.0;
}
else
{
l9_339=pow(l9_335.y,l9_336.y);
}
float l9_340=l9_339;
float l9_341;
if (l9_335.z<=0.0)
{
l9_341=0.0;
}
else
{
l9_341=pow(l9_335.z,l9_336.z);
}
float3 l9_342=float3(l9_338,l9_340,l9_341);
l9_327=mix(l9_330,l9_342,float3(l9_296));
l9_327=mix(l9_327+float3(l9_326),mix(l9_327,float3(0.0),float3(l9_326)),float3(smoothstep(0.2,0.69999999,l9_287)));
}
N51_Result=float4(l9_327,fast::clamp(l9_290,0.0,1.0)*N51_Colorize.w);
N51_EdgeMask=l9_290;
N51_Uv=(l9_306*N51_Pressure)*0.5;
param_76=N51_Result;
param_77=N51_EdgeMask;
param_78=N51_Uv;
Result_N51=param_76;
EdgeMask_N51=param_77;
Uv_N51=param_78;
float Output_N74=0.0;
float param_80=(*sc_set0.UserUniforms).magnification;
Output_N74=param_80;
float4 Result_N53=float4(0.0);
float param_82=Output_N26;
float param_83=Output_N28;
float3 param_84=Output_N27;
float param_85=Output_N29;
float2 param_86=TextureSize_N17;
float param_87=Output_N30;
float2 param_88=Output_N31;
float2 param_89=(*sc_set0.UserUniforms).Port_Stretch_N053;
float2 param_90=Nudge_N7;
float2 param_91=Output_N22;
float2 param_92=Uv_N51;
float param_93=Pressure_N7;
float param_94=Output_N74;
float param_95=EdgeMask_N51;
float param_96=Output_N56;
ssGlobals param_97=Globals;
tempGlobals=param_97;
float4 param_81=float4(0.0);
N53_BlurAmount=param_82;
N53_UseColor=param_83!=0.0;
N53_Color=param_84;
N53_AlphaChannel=int(param_85);
N53_TexSize=param_86;
N53_Scale=param_87;
N53_Position=param_88;
N53_Stretch=param_89;
N53_Nudge=param_90;
N53_Center=param_91;
N53_Refraction=param_92;
N53_Pressure=param_93;
N53_PressureMult=param_94;
N53_ButtonAlpha=param_95;
N53_PlaneScale=param_96;
float2 l9_343=tempGlobals.Surface_UVCoord0;
float2 l9_344=l9_343;
l9_344-=(float2(0.5)+N53_Center);
l9_344*=2.0;
l9_344*=N53_Stretch;
l9_344*=(1.0-((N53_Pressure*N53_PressureMult)*N53_ButtonAlpha));
l9_344+=(N53_Nudge*0.5);
l9_344*=0.5;
l9_344+=(float2(0.5)+N53_Center);
if (N53_ButtonAlpha==1.0)
{
l9_344+=(N53_Refraction*N53_PressureMult);
}
float2 l9_345;
if ((N53_TexSize.x/N53_TexSize.y)>1.0)
{
l9_345=float2(1.0,N53_TexSize.x/N53_TexSize.y);
}
else
{
l9_345=float2(N53_TexSize.y/N53_TexSize.x,1.0);
}
float2 l9_346=l9_345;
float2 l9_347=l9_346*(N53_Scale*N53_PlaneScale);
float2 l9_348=l9_344;
l9_348-=float2(0.5);
l9_348*=l9_347;
l9_348+=float2(0.5);
float2 l9_349=l9_348;
float l9_350=(N53_BlurAmount*abs(length(N53_Nudge)))*3.0;
float2 l9_351=l9_349-N53_Position;
float4 l9_352=N53_blur(l9_350,l9_351,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.icon0,sc_set0.icon0SmpSC);
float l9_353=l9_352[N53_AlphaChannel];
float4 l9_354;
if (N53_UseColor)
{
l9_354=float4(N53_Color,l9_353);
}
else
{
l9_354=l9_352;
}
N53_Result=l9_354;
param_81=N53_Result;
Result_N53=param_81;
float2 TextureSize_N73=float2(0.0);
float2 param_98=(*sc_set0.UserUniforms).icon1Size.xy;
TextureSize_N73=param_98;
float Output_N77=0.0;
float param_99=float((*sc_set0.UserUniforms).useColorAlt!=0);
Output_N77=param_99;
float3 Output_N79=float3(0.0);
float3 param_100=(*sc_set0.UserUniforms).iconColorAlt;
Output_N79=param_100;
float Output_N78=0.0;
float param_101=float((*sc_set0.UserUniforms).colorChannelAlt);
Output_N78=param_101;
float4 Result_N61=float4(0.0);
float param_103=Output_N26;
float param_104=Output_N77;
float3 param_105=Output_N79;
float param_106=Output_N78;
float2 param_107=TextureSize_N73;
float param_108=Output_N30;
float2 param_109=Output_N31;
float2 param_110=(*sc_set0.UserUniforms).Port_Stretch_N061;
float2 param_111=Nudge_N7;
float2 param_112=Output_N22;
float2 param_113=Uv_N51;
float param_114=Pressure_N7;
float param_115=Output_N74;
float param_116=EdgeMask_N51;
float param_117=Output_N56;
ssGlobals param_118=Globals;
tempGlobals=param_118;
float4 param_102=float4(0.0);
N61_BlurAmount=param_103;
N61_UseColor=param_104!=0.0;
N61_Color=param_105;
N61_AlphaChannel=int(param_106);
N61_TexSize=param_107;
N61_Scale=param_108;
N61_Position=param_109;
N61_Stretch=param_110;
N61_Nudge=param_111;
N61_Center=param_112;
N61_Refraction=param_113;
N61_Pressure=param_114;
N61_PressureMult=param_115;
N61_ButtonAlpha=param_116;
N61_PlaneScale=param_117;
float2 l9_355=tempGlobals.Surface_UVCoord0;
float2 l9_356=l9_355;
l9_356-=(float2(0.5)+N61_Center);
l9_356*=2.0;
l9_356*=N61_Stretch;
l9_356*=(1.0-((N61_Pressure*N61_PressureMult)*N61_ButtonAlpha));
l9_356+=(N61_Nudge*0.5);
l9_356*=0.5;
l9_356+=(float2(0.5)+N61_Center);
if (N61_ButtonAlpha==1.0)
{
l9_356+=(N61_Refraction*N61_PressureMult);
}
float2 l9_357;
if ((N61_TexSize.x/N61_TexSize.y)>1.0)
{
l9_357=float2(1.0,N61_TexSize.x/N61_TexSize.y);
}
else
{
l9_357=float2(N61_TexSize.y/N61_TexSize.x,1.0);
}
float2 l9_358=l9_357;
float2 l9_359=l9_358*(N61_Scale*N61_PlaneScale);
float2 l9_360=l9_356;
l9_360-=float2(0.5);
l9_360*=l9_359;
l9_360+=float2(0.5);
float2 l9_361=l9_360;
float l9_362=(N61_BlurAmount*abs(length(N61_Nudge)))*3.0;
float2 l9_363=l9_361-N61_Position;
float4 l9_364=N61_blur(l9_362,l9_363,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.icon1,sc_set0.icon1SmpSC);
float l9_365=l9_364[N61_AlphaChannel];
float4 l9_366;
if (N61_UseColor)
{
l9_366=float4(N61_Color,l9_365);
}
else
{
l9_366=l9_364;
}
N61_Result=l9_366;
param_102=N61_Result;
Result_N61=param_102;
float Result_N80=0.0;
float param_119=0.0;
float param_120=0.0;
float param_121=(*sc_set0.UserUniforms).Port_Default_N080;
ssGlobals param_123=Globals;
float l9_367=0.0;
float l9_368=float((*sc_set0.UserUniforms).useAlt!=0);
l9_367=l9_368;
param_119=l9_367;
float param_122;
if ((param_119*1.0)!=0.0)
{
float4 l9_369=float4(0.0);
float4 l9_370=(*sc_set0.UserUniforms).baseColor;
l9_369=l9_370;
float l9_371=0.0;
float l9_372=(*sc_set0.UserUniforms).shapeSoftness;
l9_371=l9_372;
float4 l9_373=float4(0.0);
float4 l9_374=(*sc_set0.UserUniforms).cornerRadius;
l9_373=l9_374;
float l9_375=0.0;
float l9_376=(*sc_set0.UserUniforms)._scaleMult_;
l9_375=l9_376;
float4 l9_377=float4(0.0);
l9_377=l9_373/(float4(l9_375)+float4(1.234e-06));
float2 l9_378=float2(0.0);
float2 l9_379=(*sc_set0.UserUniforms).shapeScale;
l9_378=l9_379;
float2 l9_380=float2(0.0);
l9_380=l9_378/(float2(l9_375)+float2(1.234e-06));
float4 l9_381=float4(0.0);
float l9_382=0.0;
float4 l9_383=float4(0.0);
float2 l9_384=float2(0.0);
float4 l9_385=l9_369;
float l9_386=l9_371;
float4 l9_387=l9_377;
float2 l9_388=l9_380;
ssGlobals l9_389=param_123;
tempGlobals=l9_389;
float4 l9_390=float4(0.0);
float l9_391=0.0;
float4 l9_392=float4(0.0);
float2 l9_393=float2(0.0);
N38_BaseColorInput=l9_385;
N38_Softness=l9_386;
N38_Radius=l9_387;
N38_Scale=l9_388;
float l9_394=N38_BaseColorInput.w;
float l9_395;
if (l9_394<0.5)
{
l9_395=2.0*l9_394;
}
else
{
l9_395=1.0-((2.0*l9_394)-1.0);
}
float l9_396=l9_395;
float l9_397=l9_396;
float l9_398=2.0;
float l9_399;
if (l9_397<=0.0)
{
l9_399=0.0;
}
else
{
l9_399=pow(l9_397,l9_398);
}
float l9_400=l9_399;
float l9_401=3.1415927;
float l9_402=l9_400-(l9_396*sin(l9_396*l9_401));
float l9_403;
if (l9_394<0.5)
{
l9_403=0.5*l9_402;
}
else
{
l9_403=(0.5*(1.0-l9_402))+0.5;
}
float l9_404=l9_403;
float l9_405=l9_404;
N38_ColorOutput=float4(N38_BaseColorInput.xyz,l9_405);
N38_RadiusOutput=N38_Radius*l9_405;
N38_ScaleMod=N38_Scale*l9_405;
N38_SoftnessMod=fast::clamp(1.0-l9_405,N38_Softness,1.0);
l9_390=N38_ColorOutput;
l9_391=N38_SoftnessMod;
l9_392=N38_RadiusOutput;
l9_393=N38_ScaleMod;
l9_381=l9_390;
l9_382=l9_391;
l9_383=l9_392;
l9_384=l9_393;
float2 l9_406=float2(0.0);
float2 l9_407=(*sc_set0.UserUniforms).shapePosition;
l9_406=l9_407;
float2 l9_408=float2(0.0);
float2 l9_409=float2(0.0);
float l9_410=0.0;
float l9_411=0.0;
ssGlobals l9_412=param_123;
tempGlobals=l9_412;
float2 l9_413=float2(0.0);
float2 l9_414=float2(0.0);
float l9_415=0.0;
float l9_416=0.0;
float2 l9_417=float2(0.0);
float2 l9_418=float2(0.0);
float2 l9_419=(*sc_set0.UserUniforms).p0;
l9_418=l9_419;
l9_417=l9_418;
float2 l9_420=l9_417;
N7_P0=l9_420;
float2 l9_421=float2(0.0);
float2 l9_422=float2(0.0);
float2 l9_423=(*sc_set0.UserUniforms).p1;
l9_422=l9_423;
l9_421=l9_422;
float2 l9_424=l9_421;
N7_P1=l9_424;
float2 l9_425=float2(0.0);
float2 l9_426=float2(0.0);
float2 l9_427=(*sc_set0.UserUniforms).touchInput;
l9_426=l9_427;
l9_425=l9_426;
float2 l9_428=l9_425;
N7_TouchInput=l9_428;
float l9_429=0.0;
float l9_430=0.0;
float l9_431=(*sc_set0.UserUniforms).pressure;
l9_430=l9_431;
l9_429=l9_430;
float l9_432=l9_429;
N7_PressureInput=l9_432;
float l9_433=0.0;
float l9_434=0.0;
float l9_435=(*sc_set0.UserUniforms).thumbSize;
l9_434=l9_435;
l9_433=l9_434;
float l9_436=l9_433;
N7_ThumbSize=l9_436;
float l9_437=0.0;
float l9_438=0.0;
float l9_439=(*sc_set0.UserUniforms).stretchStrength;
l9_438=l9_439;
l9_437=l9_438;
float l9_440=l9_437;
N7_StretchStrength=l9_440;
float l9_441=0.0;
float l9_442=0.0;
float l9_443=(*sc_set0.UserUniforms).pressDownStrength;
l9_442=l9_443;
l9_441=l9_442;
float l9_444=l9_441;
N7_PressDownStrength=l9_444;
float l9_445=0.0;
float l9_446=0.0;
float l9_447=(*sc_set0.UserUniforms).nudgeStrength;
l9_446=l9_447;
l9_445=l9_446;
float l9_448=l9_445;
N7_NudgeStrength=l9_448;
float l9_449=0.0;
float l9_450=0.0;
float l9_451=float((*sc_set0.UserUniforms).pressLight!=0);
l9_450=l9_451;
l9_449=l9_450;
bool l9_452=l9_449!=0.0;
N7_PressBool=l9_452;
float l9_453=0.0;
float l9_454=0.0;
float l9_455=float((*sc_set0.UserUniforms).hoverLight!=0);
l9_454=l9_455;
l9_453=l9_454;
bool l9_456=l9_453!=0.0;
N7_HoverBool=l9_456;
float l9_457=0.0;
float l9_458=0.0;
float l9_459=float((*sc_set0.UserUniforms).constantStretch!=0);
l9_458=l9_459;
l9_457=l9_458;
bool l9_460=l9_457!=0.0;
N7_ConstStretchBool=l9_460;
float2 l9_461=float2(0.0);
l9_461=tempGlobals.N7_UV;
float2 l9_462=l9_461;
float2 l9_463=(*sc_set0.UserUniforms).Port_Scale_N005;
l9_462.x=floor(l9_462.x*10000.0)*9.9999997e-05;
l9_462.y=floor(l9_462.y*10000.0)*9.9999997e-05;
l9_462*=(l9_463*0.5);
float2 l9_464=l9_462;
float l9_465=tempGlobals.gTimeElapsed;
float l9_466=l9_465;
float2 l9_467=float2(0.0);
tempGlobals.N7_UV=l9_467;
float l9_468=0.0;
float2 l9_469=N7_P0;
float2 l9_470=N7_P1;
l9_469.y=1.0-l9_469.y;
l9_470.y=1.0-l9_470.y;
float2 l9_471=l9_469-l9_470;
float2 l9_472=(l9_471*N7_NudgeStrength)*N7_PressureInput;
float2 l9_473=tempGlobals.gScreenCoord;
float2 l9_474=l9_473+l9_472;
float l9_475=mix(-smoothstep(l9_470.x,0.0,l9_474.x),-smoothstep(l9_470.x,1.0,l9_474.x),l9_469.x);
float l9_476=mix(-smoothstep(l9_470.y,0.0,l9_474.y),-smoothstep(l9_470.y,1.0,l9_474.y),l9_469.y);
float2 l9_477=N7_TouchInput;
l9_477.y=1.0-l9_477.y;
float2 l9_478=tempGlobals.Surface_UVCoord0;
l9_467=l9_478;
tempGlobals.N7_UV=l9_467;
l9_467-=float2(0.5);
l9_467*=(1.0/N7_ThumbSize);
if (N7_HoverBool)
{
float2 l9_479=tempGlobals.gScreenCoord;
l9_467=l9_479;
l9_467-=l9_477;
float l9_480=(*sc_set0.UserUniforms).sc_Camera.aspect;
l9_467.x*=l9_480;
l9_467*=(2.0/N7_ThumbSize);
}
tempGlobals.N7_UV+=float2(l9_466*0.050000001);
float l9_481=0.0;
float2 l9_482=float2(0.0);
l9_482=tempGlobals.N7_UV;
float l9_483=0.0;
float2 l9_484=l9_482;
float2 l9_485=(*sc_set0.UserUniforms).Port_Scale_N005;
l9_484.x=floor(l9_484.x*10000.0)*9.9999997e-05;
l9_484.y=floor(l9_484.y*10000.0)*9.9999997e-05;
l9_484*=(l9_485*0.5);
float2 l9_486=l9_484;
float l9_487=(snoise(l9_486)*0.5)+0.5;
l9_487=floor(l9_487*10000.0)*9.9999997e-05;
l9_483=l9_487;
l9_481=l9_483;
float l9_488=l9_481;
l9_467+=float2((l9_488-0.5)*0.050000001);
if (N7_PressBool||N7_HoverBool)
{
float2 l9_489=l9_467;
float l9_490=N7_PressureInput;
float l9_491=0.1;
float l9_492;
if (l9_490<=0.0)
{
l9_492=0.0;
}
else
{
l9_492=pow(l9_490,l9_491);
}
float l9_493=l9_492;
l9_468=((smoothstep(0.69999999,1.0,((1.0-length(l9_489))+l9_493)-1.0)*N7_PressureInput)*N7_PressureInput)*2.0;
}
N7_Highlight=l9_468;
N7_Pressure=(N7_PressureInput*N7_PressDownStrength)*0.5;
float2 l9_494;
if (N7_PressBool)
{
l9_494=float2(1.0);
}
else
{
l9_494=mix(float2(1.0),float2(1.0)-float2(l9_476,l9_475),float2((N7_ConstStretchBool ? N7_StretchStrength : (length(l9_471)*N7_StretchStrength))*N7_PressureInput));
}
N7_Stretch=l9_494;
N7_Nudge=l9_472;
l9_413=N7_Stretch;
l9_414=N7_Nudge;
l9_415=N7_Pressure;
l9_416=N7_Highlight;
l9_408=l9_413;
l9_409=l9_414;
l9_410=l9_415;
l9_411=l9_416;
float l9_495=0.0;
float2 l9_496=float2(0.0);
float l9_497=l9_382;
float4 l9_498=l9_383;
float2 l9_499=l9_384;
float2 l9_500=l9_406;
float2 l9_501=l9_408;
float2 l9_502=l9_409;
float l9_503=l9_410;
ssGlobals l9_504=param_123;
tempGlobals=l9_504;
float l9_505=0.0;
float2 l9_506=float2(0.0);
N50_Softness=l9_497;
N50_Radius=l9_498;
N50_Scale=l9_499;
N50_Position=l9_500;
N50_Stretch=l9_501;
N50_Nudge=l9_502;
N50_Pressure=l9_503;
float2 l9_507=tempGlobals.Surface_UVCoord0;
float2 l9_508=((l9_507-N50_Position)-float2(0.5))*2.0;
l9_508*=N50_Stretch;
l9_508*=(1.0-N50_Pressure);
l9_508+=N50_Nudge;
float2 l9_509=tempGlobals.Surface_UVCoord0;
float2 l9_510=float2(1.0)/N50_Scale;
float2 l9_511=l9_509;
l9_511-=float2(0.5);
l9_511*=l9_510;
l9_511+=float2(0.5);
float2 l9_512=l9_511;
float2 l9_513=l9_512;
l9_513*=N50_Stretch;
l9_513*=(1.0-N50_Pressure);
l9_513+=(N50_Nudge*1.5);
float2 l9_514=l9_508;
float2 l9_515=N50_Scale;
float4 l9_516=N50_Radius;
float2 l9_517;
if (l9_514.x>0.0)
{
l9_517=l9_516.xy;
}
else
{
l9_517=l9_516.zw;
}
l9_516=float4(l9_517.x,l9_517.y,l9_516.z,l9_516.w);
float l9_518;
if (l9_514.y>0.0)
{
l9_518=l9_516.x;
}
else
{
l9_518=l9_516.y;
}
l9_516.x=l9_518;
float2 l9_519=(abs(l9_514)-l9_515)+float2(l9_516.x);
float l9_520=(fast::min(fast::max(l9_519.x,l9_519.y),0.0)+length(fast::max(l9_519,float2(0.0))))-l9_516.x;
float l9_521=l9_520;
float l9_522=fwidth(l9_521);
l9_521=smoothstep((0.0-l9_522)-N50_Softness,(0.0+l9_522)+N50_Softness,l9_521);
N50_Result=l9_521;
N50_UV=l9_513;
l9_505=N50_Result;
l9_506=N50_UV;
l9_495=l9_505;
l9_496=l9_506;
float l9_523=0.0;
float l9_524=float((*sc_set0.UserUniforms).useTex!=0);
l9_523=l9_524;
float4 l9_525=float4(0.0);
int l9_526;
if ((int(extraTexHasSwappedViews_tmp)!=0))
{
int l9_527=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_527=0;
}
else
{
l9_527=in.varStereoViewID;
}
int l9_528=l9_527;
l9_526=1-l9_528;
}
else
{
int l9_529=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_529=0;
}
else
{
l9_529=in.varStereoViewID;
}
int l9_530=l9_529;
l9_526=l9_530;
}
int l9_531=l9_526;
int l9_532=extraTexLayout_tmp;
int l9_533=l9_531;
float2 l9_534=l9_496;
bool l9_535=(int(SC_USE_UV_TRANSFORM_extraTex_tmp)!=0);
float3x3 l9_536=(*sc_set0.UserUniforms).extraTexTransform;
int2 l9_537=int2(SC_SOFTWARE_WRAP_MODE_U_extraTex_tmp,SC_SOFTWARE_WRAP_MODE_V_extraTex_tmp);
bool l9_538=(int(SC_USE_UV_MIN_MAX_extraTex_tmp)!=0);
float4 l9_539=(*sc_set0.UserUniforms).extraTexUvMinMax;
bool l9_540=(int(SC_USE_CLAMP_TO_BORDER_extraTex_tmp)!=0);
float4 l9_541=(*sc_set0.UserUniforms).extraTexBorderColor;
float l9_542=0.0;
bool l9_543=l9_540&&(!l9_538);
float l9_544=1.0;
float l9_545=l9_534.x;
int l9_546=l9_537.x;
if (l9_546==1)
{
l9_545=fract(l9_545);
}
else
{
if (l9_546==2)
{
float l9_547=fract(l9_545);
float l9_548=l9_545-l9_547;
float l9_549=step(0.25,fract(l9_548*0.5));
l9_545=mix(l9_547,1.0-l9_547,fast::clamp(l9_549,0.0,1.0));
}
}
l9_534.x=l9_545;
float l9_550=l9_534.y;
int l9_551=l9_537.y;
if (l9_551==1)
{
l9_550=fract(l9_550);
}
else
{
if (l9_551==2)
{
float l9_552=fract(l9_550);
float l9_553=l9_550-l9_552;
float l9_554=step(0.25,fract(l9_553*0.5));
l9_550=mix(l9_552,1.0-l9_552,fast::clamp(l9_554,0.0,1.0));
}
}
l9_534.y=l9_550;
if (l9_538)
{
bool l9_555=l9_540;
bool l9_556;
if (l9_555)
{
l9_556=l9_537.x==3;
}
else
{
l9_556=l9_555;
}
float l9_557=l9_534.x;
float l9_558=l9_539.x;
float l9_559=l9_539.z;
bool l9_560=l9_556;
float l9_561=l9_544;
float l9_562=fast::clamp(l9_557,l9_558,l9_559);
float l9_563=step(abs(l9_557-l9_562),9.9999997e-06);
l9_561*=(l9_563+((1.0-float(l9_560))*(1.0-l9_563)));
l9_557=l9_562;
l9_534.x=l9_557;
l9_544=l9_561;
bool l9_564=l9_540;
bool l9_565;
if (l9_564)
{
l9_565=l9_537.y==3;
}
else
{
l9_565=l9_564;
}
float l9_566=l9_534.y;
float l9_567=l9_539.y;
float l9_568=l9_539.w;
bool l9_569=l9_565;
float l9_570=l9_544;
float l9_571=fast::clamp(l9_566,l9_567,l9_568);
float l9_572=step(abs(l9_566-l9_571),9.9999997e-06);
l9_570*=(l9_572+((1.0-float(l9_569))*(1.0-l9_572)));
l9_566=l9_571;
l9_534.y=l9_566;
l9_544=l9_570;
}
float2 l9_573=l9_534;
bool l9_574=l9_535;
float3x3 l9_575=l9_536;
if (l9_574)
{
l9_573=float2((l9_575*float3(l9_573,1.0)).xy);
}
float2 l9_576=l9_573;
l9_534=l9_576;
float l9_577=l9_534.x;
int l9_578=l9_537.x;
bool l9_579=l9_543;
float l9_580=l9_544;
if ((l9_578==0)||(l9_578==3))
{
float l9_581=l9_577;
float l9_582=0.0;
float l9_583=1.0;
bool l9_584=l9_579;
float l9_585=l9_580;
float l9_586=fast::clamp(l9_581,l9_582,l9_583);
float l9_587=step(abs(l9_581-l9_586),9.9999997e-06);
l9_585*=(l9_587+((1.0-float(l9_584))*(1.0-l9_587)));
l9_581=l9_586;
l9_577=l9_581;
l9_580=l9_585;
}
l9_534.x=l9_577;
l9_544=l9_580;
float l9_588=l9_534.y;
int l9_589=l9_537.y;
bool l9_590=l9_543;
float l9_591=l9_544;
if ((l9_589==0)||(l9_589==3))
{
float l9_592=l9_588;
float l9_593=0.0;
float l9_594=1.0;
bool l9_595=l9_590;
float l9_596=l9_591;
float l9_597=fast::clamp(l9_592,l9_593,l9_594);
float l9_598=step(abs(l9_592-l9_597),9.9999997e-06);
l9_596*=(l9_598+((1.0-float(l9_595))*(1.0-l9_598)));
l9_592=l9_597;
l9_588=l9_592;
l9_591=l9_596;
}
l9_534.y=l9_588;
l9_544=l9_591;
float2 l9_599=l9_534;
int l9_600=l9_532;
int l9_601=l9_533;
float l9_602=l9_542;
float2 l9_603=l9_599;
int l9_604=l9_600;
int l9_605=l9_601;
float3 l9_606=float3(0.0);
if (l9_604==0)
{
l9_606=float3(l9_603,0.0);
}
else
{
if (l9_604==1)
{
l9_606=float3(l9_603.x,(l9_603.y*0.5)+(0.5-(float(l9_605)*0.5)),0.0);
}
else
{
l9_606=float3(l9_603,float(l9_605));
}
}
float3 l9_607=l9_606;
float3 l9_608=l9_607;
float4 l9_609=sc_set0.extraTex.sample(sc_set0.extraTexSmpSC,l9_608.xy,bias(l9_602));
float4 l9_610=l9_609;
if (l9_540)
{
l9_610=mix(l9_541,l9_610,float4(l9_544));
}
float4 l9_611=l9_610;
l9_525=l9_611;
float l9_612=0.0;
float l9_613=(*sc_set0.UserUniforms).thickness;
l9_612=l9_613;
float l9_614=0.0;
float l9_615=(*sc_set0.UserUniforms).frost;
l9_614=l9_615;
float l9_616=0.0;
float l9_617=(*sc_set0.UserUniforms).quality;
l9_616=l9_617;
float l9_618=0.0;
float l9_619=(*sc_set0.UserUniforms).material;
l9_618=l9_619;
float l9_620=0.0;
float l9_621=(*sc_set0.UserUniforms).chromaticAbbr;
l9_620=l9_621;
float l9_622=0.0;
float l9_623=float((*sc_set0.UserUniforms).chromaticAbbrOnSurface!=0);
l9_622=l9_623;
float l9_624=0.0;
float l9_625=float((*sc_set0.UserUniforms).topLighting!=0);
l9_624=l9_625;
float l9_626=0.0;
float l9_627=(*sc_set0.UserUniforms).lightAngle;
l9_626=l9_627;
float l9_628=0.0;
float l9_629=(*sc_set0.UserUniforms).bleed;
l9_628=l9_629;
float l9_630=0.0;
float l9_631=(*sc_set0.UserUniforms).transparency;
l9_630=l9_631;
float l9_632=0.0;
float l9_633=l9_495;
float l9_634=l9_523;
float3 l9_635=l9_525.xyz;
float l9_636=l9_612;
float l9_637=l9_614;
float l9_638=l9_616;
float l9_639=l9_618;
float l9_640=l9_410;
float l9_641=l9_371;
float4 l9_642=l9_381;
float l9_643=l9_411;
float l9_644=l9_620;
float l9_645=l9_622;
float l9_646=l9_624;
float l9_647=l9_626;
float l9_648=l9_628;
float l9_649=l9_630;
ssGlobals l9_650=param_123;
tempGlobals=l9_650;
float l9_651=0.0;
N51_Sdf=l9_633;
N51_UseTex=l9_634!=0.0;
N51_TextureOp=l9_635;
N51_Thickness=l9_636;
N51_Frost=l9_637;
N51_Quality=l9_638;
N51_Material=l9_639;
N51_Pressure=l9_640;
N51_Softness=l9_641;
N51_Colorize=l9_642;
N51_Highlight=l9_643;
N51_ChromaticAberration=l9_644;
N51_ChorAbrrOnSurface=l9_645!=0.0;
N51_TopLight=l9_646!=0.0;
N51_Angle=l9_647;
N51_Bleed=l9_648;
N51_Transparency=l9_649;
float l9_652=(N51_Sdf*2.0)-1.0;
float2 l9_653=tempGlobals.gScreenCoord;
float2 l9_654=l9_653;
float l9_655=200.0;
float4 l9_656=float4(0.0);
int l9_657;
if ((int(screenHasSwappedViews_tmp)!=0))
{
int l9_658=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_658=0;
}
else
{
l9_658=in.varStereoViewID;
}
int l9_659=l9_658;
l9_657=1-l9_659;
}
else
{
int l9_660=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_660=0;
}
else
{
l9_660=in.varStereoViewID;
}
int l9_661=l9_660;
l9_657=l9_661;
}
int l9_662=l9_657;
int l9_663=screenLayout_tmp;
int l9_664=l9_662;
float2 l9_665=l9_654;
bool l9_666=(int(SC_USE_UV_TRANSFORM_screen_tmp)!=0);
float3x3 l9_667=(*sc_set0.UserUniforms).screenTransform;
int2 l9_668=int2(SC_SOFTWARE_WRAP_MODE_U_screen_tmp,SC_SOFTWARE_WRAP_MODE_V_screen_tmp);
bool l9_669=(int(SC_USE_UV_MIN_MAX_screen_tmp)!=0);
float4 l9_670=(*sc_set0.UserUniforms).screenUvMinMax;
bool l9_671=(int(SC_USE_CLAMP_TO_BORDER_screen_tmp)!=0);
float4 l9_672=(*sc_set0.UserUniforms).screenBorderColor;
float l9_673=l9_655;
bool l9_674=l9_671&&(!l9_669);
float l9_675=1.0;
float l9_676=l9_665.x;
int l9_677=l9_668.x;
if (l9_677==1)
{
l9_676=fract(l9_676);
}
else
{
if (l9_677==2)
{
float l9_678=fract(l9_676);
float l9_679=l9_676-l9_678;
float l9_680=step(0.25,fract(l9_679*0.5));
l9_676=mix(l9_678,1.0-l9_678,fast::clamp(l9_680,0.0,1.0));
}
}
l9_665.x=l9_676;
float l9_681=l9_665.y;
int l9_682=l9_668.y;
if (l9_682==1)
{
l9_681=fract(l9_681);
}
else
{
if (l9_682==2)
{
float l9_683=fract(l9_681);
float l9_684=l9_681-l9_683;
float l9_685=step(0.25,fract(l9_684*0.5));
l9_681=mix(l9_683,1.0-l9_683,fast::clamp(l9_685,0.0,1.0));
}
}
l9_665.y=l9_681;
if (l9_669)
{
bool l9_686=l9_671;
bool l9_687;
if (l9_686)
{
l9_687=l9_668.x==3;
}
else
{
l9_687=l9_686;
}
float l9_688=l9_665.x;
float l9_689=l9_670.x;
float l9_690=l9_670.z;
bool l9_691=l9_687;
float l9_692=l9_675;
float l9_693=fast::clamp(l9_688,l9_689,l9_690);
float l9_694=step(abs(l9_688-l9_693),9.9999997e-06);
l9_692*=(l9_694+((1.0-float(l9_691))*(1.0-l9_694)));
l9_688=l9_693;
l9_665.x=l9_688;
l9_675=l9_692;
bool l9_695=l9_671;
bool l9_696;
if (l9_695)
{
l9_696=l9_668.y==3;
}
else
{
l9_696=l9_695;
}
float l9_697=l9_665.y;
float l9_698=l9_670.y;
float l9_699=l9_670.w;
bool l9_700=l9_696;
float l9_701=l9_675;
float l9_702=fast::clamp(l9_697,l9_698,l9_699);
float l9_703=step(abs(l9_697-l9_702),9.9999997e-06);
l9_701*=(l9_703+((1.0-float(l9_700))*(1.0-l9_703)));
l9_697=l9_702;
l9_665.y=l9_697;
l9_675=l9_701;
}
float2 l9_704=l9_665;
bool l9_705=l9_666;
float3x3 l9_706=l9_667;
if (l9_705)
{
l9_704=float2((l9_706*float3(l9_704,1.0)).xy);
}
float2 l9_707=l9_704;
l9_665=l9_707;
float l9_708=l9_665.x;
int l9_709=l9_668.x;
bool l9_710=l9_674;
float l9_711=l9_675;
if ((l9_709==0)||(l9_709==3))
{
float l9_712=l9_708;
float l9_713=0.0;
float l9_714=1.0;
bool l9_715=l9_710;
float l9_716=l9_711;
float l9_717=fast::clamp(l9_712,l9_713,l9_714);
float l9_718=step(abs(l9_712-l9_717),9.9999997e-06);
l9_716*=(l9_718+((1.0-float(l9_715))*(1.0-l9_718)));
l9_712=l9_717;
l9_708=l9_712;
l9_711=l9_716;
}
l9_665.x=l9_708;
l9_675=l9_711;
float l9_719=l9_665.y;
int l9_720=l9_668.y;
bool l9_721=l9_674;
float l9_722=l9_675;
if ((l9_720==0)||(l9_720==3))
{
float l9_723=l9_719;
float l9_724=0.0;
float l9_725=1.0;
bool l9_726=l9_721;
float l9_727=l9_722;
float l9_728=fast::clamp(l9_723,l9_724,l9_725);
float l9_729=step(abs(l9_723-l9_728),9.9999997e-06);
l9_727*=(l9_729+((1.0-float(l9_726))*(1.0-l9_729)));
l9_723=l9_728;
l9_719=l9_723;
l9_722=l9_727;
}
l9_665.y=l9_719;
l9_675=l9_722;
float2 l9_730=l9_665;
int l9_731=l9_663;
int l9_732=l9_664;
float l9_733=l9_673;
float2 l9_734=l9_730;
int l9_735=l9_731;
int l9_736=l9_732;
float3 l9_737=float3(0.0);
if (l9_735==0)
{
l9_737=float3(l9_734,0.0);
}
else
{
if (l9_735==1)
{
l9_737=float3(l9_734.x,(l9_734.y*0.5)+(0.5-(float(l9_736)*0.5)),0.0);
}
else
{
l9_737=float3(l9_734,float(l9_736));
}
}
float3 l9_738=l9_737;
float3 l9_739=l9_738;
float4 l9_740=sc_set0.screen.sample(sc_set0.screenSmpSC,l9_739.xy,level(l9_733));
float4 l9_741=l9_740;
if (l9_671)
{
l9_741=mix(l9_672,l9_741,float4(l9_675));
}
float4 l9_742=l9_741;
l9_656=l9_742;
float4 l9_743=l9_656;
float l9_744=l9_743.x;
float2 l9_745=normalize(float2(dfdx(l9_652),dfdy(l9_652)));
float l9_746=fwidth(l9_652);
float l9_747=smoothstep(0.0+l9_746,0.0-l9_746,l9_652);
float l9_748=l9_652+1.0;
float l9_749=l9_748;
float l9_750=mix(N51_Bleed,fast::max(N51_Bleed-5.0,1.0),smoothstep(0.1,0.89999998,l9_744));
float l9_751;
if (l9_749<=0.0)
{
l9_751=0.0;
}
else
{
l9_751=pow(l9_749,l9_750);
}
float l9_752=l9_751;
float l9_753=l9_752;
float l9_754=N51_Angle;
float l9_755=3.1415927;
l9_754=(l9_754/180.0)*l9_755;
float2x2 l9_756;
l9_756[0]=float2(cos(l9_754),sin(l9_754));
l9_756[1]=float2(-sin(l9_754),cos(l9_754));
float2x2 l9_757=l9_756;
float2 l9_758=l9_745*l9_757;
float l9_759;
if (l9_748<0.1)
{
l9_759=0.0;
}
else
{
float l9_760;
if (N51_TopLight)
{
l9_760=abs(l9_758.x);
}
else
{
l9_760=l9_758.x;
}
l9_759=l9_760;
}
float l9_761=l9_759;
float l9_762=l9_748;
float2 l9_763=N51_refractOffset(l9_762);
float2 l9_764=tempGlobals.gScreenCoord;
float2 l9_765=(l9_764+((l9_763*N51_Pressure)*2.0))+(l9_763*0.30000001);
float l9_766=mix(N51_Thickness,1.5,l9_753);
float3 l9_767;
if (N51_Transparency>0.0)
{
float2 l9_768=l9_765;
float l9_769=l9_766;
float l9_770=N51_Quality;
float3 l9_771=float3(0.0);
float l9_772=0.0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_772<l9_770)
{
float2 l9_773=l9_768;
float l9_774=l9_772*0.25;
float l9_775=l9_769;
l9_771+=N51_hashedTexSample(l9_773,l9_774,l9_775,N51_ChorAbrrOnSurface,N51_Sdf,N51_Frost,N51_ChromaticAberration,in.varStereoViewID,(*sc_set0.UserUniforms),tempGlobals,sc_set0.screen,sc_set0.screenSmpSC);
l9_772+=1.0;
continue;
}
else
{
break;
}
}
float3 l9_776=l9_771/float3(l9_770);
l9_767=l9_776;
}
else
{
l9_767=float3(0.0);
}
float3 l9_777=l9_767;
float l9_778=l9_761;
float l9_779=l9_753;
float l9_780=5.0;
float l9_781;
if (l9_779<=0.0)
{
l9_781=0.0;
}
else
{
l9_781=pow(l9_779,l9_780);
}
float l9_782=l9_781;
float l9_783=mix(0.0,0.5,fast::clamp(l9_778*l9_782,0.0,1.0));
float3 l9_784=((l9_777*N51_Material)+float3(1.0))-float3(N51_Material);
if (N51_Transparency==1.0)
{
l9_784+=N51_Colorize.xyz;
}
else
{
float3 l9_785=l9_784;
float3 l9_786;
if (N51_UseTex)
{
l9_786=N51_TextureOp;
}
else
{
l9_786=N51_Colorize.xyz;
}
l9_784=mix(l9_785,l9_786,float3(1.0-N51_Transparency));
}
l9_784+=float3(N51_Highlight);
if (N51_Softness>0.0)
{
float3 l9_787=l9_784;
float3 l9_788=l9_784;
float l9_789=2.0;
float l9_790=dot(l9_788,float3(0.29899999,0.58700001,0.114));
float3 l9_791=mix(float3(l9_790),l9_788,float3(l9_789));
float3 l9_792=l9_791;
float3 l9_793=float3(0.5);
float l9_794;
if (l9_792.x<=0.0)
{
l9_794=0.0;
}
else
{
l9_794=pow(l9_792.x,l9_793.x);
}
float l9_795=l9_794;
float l9_796;
if (l9_792.y<=0.0)
{
l9_796=0.0;
}
else
{
l9_796=pow(l9_792.y,l9_793.y);
}
float l9_797=l9_796;
float l9_798;
if (l9_792.z<=0.0)
{
l9_798=0.0;
}
else
{
l9_798=pow(l9_792.z,l9_793.z);
}
float3 l9_799=float3(l9_795,l9_797,l9_798);
l9_784=mix(l9_787,l9_799,float3(l9_753));
l9_784=mix(l9_784+float3(l9_783),mix(l9_784,float3(0.0),float3(l9_783)),float3(smoothstep(0.2,0.69999999,l9_744)));
}
N51_Result=float4(l9_784,fast::clamp(l9_747,0.0,1.0)*N51_Colorize.w);
N51_EdgeMask=l9_747;
N51_Uv=(l9_763*N51_Pressure)*0.5;
l9_651=N51_EdgeMask;
l9_632=l9_651;
param_120=l9_632;
param_122=param_120;
}
else
{
param_122=param_121;
}
Result_N80=param_122;
float4 Output_N62=float4(0.0);
Output_N62=mix(Result_N53,Result_N61,float4(Result_N80));
float4 Output_N45=float4(0.0);
Output_N45=fast::clamp(Result_N51+float4(0.001),(*sc_set0.UserUniforms).Port_Input1_N045+float4(0.001),(*sc_set0.UserUniforms).Port_Input2_N045+float4(0.001))-float4(0.001);
float Output_N64=0.0;
Output_N64=Output_N62.w;
float4 Output_N87=float4(0.0);
Output_N87=mix(Output_N45,Output_N62,float4(Output_N64));
float Output_N85=0.0;
Output_N85=Output_N45.w;
float4 Output_N63=float4(0.0);
Output_N63=mix(Output_N62,Output_N87,float4(Output_N85));
FinalColor=Output_N63;
float param_124=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_124<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_800=gl_FragCoord;
float2 l9_801=floor(mod(l9_800.xy,float2(4.0)));
float l9_802=(mod(dot(l9_801,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_124<l9_802)
{
discard_fragment();
}
}
float4 param_125=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_803=param_125;
float4 l9_804=l9_803;
float l9_805=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_805=l9_804.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_805=fast::clamp(l9_804.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_805=fast::clamp(dot(l9_804.xyz,float3(l9_804.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_805=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_805=(1.0-dot(l9_804.xyz,float3(0.33333001)))*l9_804.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_805=(1.0-fast::clamp(dot(l9_804.xyz,float3(1.0)),0.0,1.0))*l9_804.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_805=fast::clamp(dot(l9_804.xyz,float3(1.0)),0.0,1.0)*l9_804.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_805=fast::clamp(dot(l9_804.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_805=fast::clamp(dot(l9_804.xyz,float3(1.0)),0.0,1.0)*l9_804.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_805=dot(l9_804.xyz,float3(0.33333001))*l9_804.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_805=1.0-fast::clamp(dot(l9_804.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_805=fast::clamp(dot(l9_804.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_806=l9_805;
float l9_807=l9_806;
float l9_808=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_807;
float3 l9_809=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_803.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_810=float4(l9_809.x,l9_809.y,l9_809.z,l9_808);
param_125=l9_810;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_125=float4(param_125.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_811=param_125;
float4 l9_812=float4(0.0);
float4 l9_813=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_814=out.sc_FragData0;
l9_813=l9_814;
}
else
{
float4 l9_815=gl_FragCoord;
float2 l9_816=l9_815.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_817=l9_816;
float2 l9_818=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_819=1;
int l9_820=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_820=0;
}
else
{
l9_820=in.varStereoViewID;
}
int l9_821=l9_820;
int l9_822=l9_821;
float3 l9_823=float3(l9_817,0.0);
int l9_824=l9_819;
int l9_825=l9_822;
if (l9_824==1)
{
l9_823.y=((2.0*l9_823.y)+float(l9_825))-1.0;
}
float2 l9_826=l9_823.xy;
l9_818=l9_826;
}
else
{
l9_818=l9_817;
}
float2 l9_827=l9_818;
float2 l9_828=l9_827;
float2 l9_829=l9_828;
float2 l9_830=l9_829;
float l9_831=0.0;
int l9_832;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_833=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_833=0;
}
else
{
l9_833=in.varStereoViewID;
}
int l9_834=l9_833;
l9_832=1-l9_834;
}
else
{
int l9_835=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_835=0;
}
else
{
l9_835=in.varStereoViewID;
}
int l9_836=l9_835;
l9_832=l9_836;
}
int l9_837=l9_832;
float2 l9_838=l9_830;
int l9_839=sc_ScreenTextureLayout_tmp;
int l9_840=l9_837;
float l9_841=l9_831;
float2 l9_842=l9_838;
int l9_843=l9_839;
int l9_844=l9_840;
float3 l9_845=float3(0.0);
if (l9_843==0)
{
l9_845=float3(l9_842,0.0);
}
else
{
if (l9_843==1)
{
l9_845=float3(l9_842.x,(l9_842.y*0.5)+(0.5-(float(l9_844)*0.5)),0.0);
}
else
{
l9_845=float3(l9_842,float(l9_844));
}
}
float3 l9_846=l9_845;
float3 l9_847=l9_846;
float4 l9_848=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_847.xy,bias(l9_841));
float4 l9_849=l9_848;
float4 l9_850=l9_849;
l9_813=l9_850;
}
float4 l9_851=l9_813;
float3 l9_852=l9_851.xyz;
float3 l9_853=l9_852;
float3 l9_854=l9_811.xyz;
float3 l9_855=definedBlend(l9_853,l9_854,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_812=float4(l9_855.x,l9_855.y,l9_855.z,l9_812.w);
float3 l9_856=mix(l9_852,l9_812.xyz,float3(l9_811.w));
l9_812=float4(l9_856.x,l9_856.y,l9_856.z,l9_812.w);
l9_812.w=1.0;
float4 l9_857=l9_812;
param_125=l9_857;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_858=float4(in.varScreenPos.xyz,1.0);
param_125=l9_858;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_859=gl_FragCoord;
float l9_860=fast::clamp(abs(l9_859.z),0.0,1.0);
float4 l9_861=float4(l9_860,1.0-l9_860,1.0,1.0);
param_125=l9_861;
}
else
{
float4 l9_862=param_125;
float4 l9_863=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_863=float4(mix(float3(1.0),l9_862.xyz,float3(l9_862.w)),l9_862.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_864=l9_862.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_864=fast::clamp(l9_864,0.0,1.0);
}
l9_863=float4(l9_862.xyz*l9_864,l9_864);
}
else
{
l9_863=l9_862;
}
}
float4 l9_865=l9_863;
param_125=l9_865;
}
}
}
}
}
float4 l9_866=param_125;
FinalColor=l9_866;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_867=float4(0.0);
l9_867=float4(0.0);
float4 l9_868=l9_867;
float4 Cost=l9_868;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_126=FinalColor;
FinalColor=sc_OutputMotionVectorIfNeeded(param_126,in.varPosAndMotion,in.varNormalAndMotion);
float4 param_127=FinalColor;
float4 l9_869=param_127;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_869.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=l9_869;
return out;
}
} // FRAGMENT SHADER
