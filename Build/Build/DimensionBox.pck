GDPC                                                                                D   res://.import/dimension_box.dae-98dbb0df79c124c92cc1e36c5e78e00f.scn q      *      ��ٴ:ќ/BX!.|tD   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.s3tc.stex   0X     d      0F�
����[�Zu�k9,   res://AutoRotate.gd.remap   �p     %       ���	*�X�^�U�u   res://AutoRotate.gdc�      b      B����ު[*���S'�n   res://DimensionBox.tscn P      �      ����KPSI��a++   res://DimensionCube.gd.remap�p     (       L[�ch�7E�C�"   res://DimensionCube.gdc 	      �      g���w�J`�3�Ӗ��   res://FreeCamera.tscn         �
      ����@�>{@��5��   res://HybridCamera.gd.remap �p     '       ����n�����M   res://HybridCamera.gdc  �      �      .��s8�^�7��EV   res://Main.tscn �!      \F      �k��X�$F�U�'�    res://Meshes/Material.material  h      �      ��O��1݄���>w(   res://Meshes/dimension_box.dae.import   0�      |      H�s���5�����r��   res://MiniWorld.tscnP     /-      x&,���a ��`�S�Z   res://Player.gd.remap   q     !       ��0�F �qq��dX��   res://Player.gdc�8     �	      �*��Ɨ�f�8;�J   res://Player.tscn   �B     i
      ��`��J����   res://default_env.tres  �L     1
      �^.��WJxX�3�oe   res://dimension_box.shader  0W     �       �J±!Z�O����'   res://icon.png  @q     �      �~dg`!����I�҃   res://icon.png.import   �m     �      ���3Ne�eT%=F����   res://project.binary�~     �)      �5��@V6�#8�        GDSC            <      ������ڶ   �������������Ҷ�   ���������Ҷ�   �������Ŷ���   ����׶��   ����������ض   ���������������Ŷ���            2                                         %      &      -      4      6[[;R�  S>�  �  RT�  TSU[;R�  S>�  �  R�  TTSU[[3�  R�  SX�  �  �  �  U�  �  �  �  Ub              [gd_scene load_steps=4 format=2]

[ext_resource path="res://Meshes/dimension_box.dae" type="PackedScene" id=1]
[ext_resource path="res://dimension_box.shader" type="Shader" id=2]

[sub_resource type="ShaderMaterial" id=1]

render_priority = 0
shader = ExtResource( 2 )

[node name="DimensionBox" instance=ExtResource( 1 )]

[node name="Faces" parent="Cube" index="0"]
material/0 = SubResource( 1 )
_sections_unfolded = [ "Material" ]

             GDSC            �      �������¶���   ������������׶��   ���������¶�   �����������¶���   ���������׶�   �����׶�   �����϶�   ���Ӷ���   ������Ӷ   ����������Ӷ   ����Ŷ��   ������Ӷ   �����������   ���������������������䶶   �������Ӷ���   �������������������ڶ���   ���������������۶���   ������¶   �������Ŷ���   ����׶��   ���¶���   ����������¶   ��������۶��   ����Ŷ��   ������Ӷ   �������ض���   ����������ض   �����������Ҷ���   ���������������������Ҷ�   ���������׶�   
   Cube/Faces                  viewport_texture      size_changed      current_camera_changed                                       $      1      9   	   F   
   \      ]      ^      p      �      �      �      �      �      �      �      �      �      �      �      6[[8>�  �  RSV�  RSV�  RSU[8>�  �  RSU[[3�  RSX�  �  �  RSV�  RSV�  U�  >�  �	  RSU�  �  V�
  �  V�  #�  V�  U�  �  RSV�  RSV�  R�  SV�  R�  T�  SU�  �  �  �  RSV�  RSV�  R�  TT�  SU�  �  RSV�  RSV�  R�  TT�  SU[[3�  R�  SX�  Y�  �  V�  V�  �  RSV�  V�  V�  RSU�  �  V�  �  V�  U�  �  V�  �  V�  �  RSV�  U[[3�  RSX�  V�  �  RSV�  RSV�  U[[3�  R�  SX�  �  �  Ub  [gd_scene load_steps=2 format=2]

[sub_resource type="GDScript" id=1]

script/source = "extends Camera

# class member variables go here, for example:
# var a = 2
# var b = \"textvar\"

export var moveSpeed = 10;
export var rotateSpeed = 5;
export var maintainYAxis = true;

export var clampYLook = true;
export var maxYAngle = 89;

var rotateDelta = 0;

func _ready():
	toggle_mouse_mode();

func _process(delta):
	rotateDelta = delta;
	var moveDir = Vector3();
	var rotAmt = Vector2();

	if Input.is_action_just_pressed(\"toggle_mouse\"):
		toggle_mouse_mode();

	if(Input.get_mouse_mode() != Input.MOUSE_MODE_VISIBLE):
		if(Input.is_action_pressed(\"move_forward\")):
			moveDir += Vector3(0, 0, -1);
		if(Input.is_action_pressed(\"move_backward\")):
			moveDir += Vector3(0, 0, 1);
		if(Input.is_action_pressed(\"move_right\")):
			moveDir += Vector3(1, 0, 0);
		if(Input.is_action_pressed(\"move_left\")):
			moveDir += Vector3(-1, 0, 0);
		if(Input.is_action_pressed(\"jump\")):
			moveDir += Vector3(0, 1, 0);
		if(Input.is_action_pressed(\"crouch\")):
			moveDir += Vector3(0, -1, 0);

		rotAmt = Input.get_last_mouse_speed();
	if(maintainYAxis):
		var vert = moveDir.y;
		moveDir.y = 0;
		self.translate(moveDir * moveSpeed * delta);
		self.transform.origin.y += vert * moveSpeed * delta;
	else:
		self.translate(moveDir * moveSpeed * delta);

func toggle_mouse_mode():
	if(Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);


func mouse_is_enabled():
	return Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE;

func _input(event):
	if mouse_is_enabled(): return;

	if event is InputEventMouseMotion:
		if(maintainYAxis):
			self.rotate_y(deg2rad((event.relative.x * -1) * rotateSpeed * rotateDelta));
			if(clampYLook):
				self.rotation.x = clamp(self.rotation.x + deg2rad(((event.relative.y * -1) * rotateSpeed * rotateDelta)), -deg2rad(maxYAngle), deg2rad(maxYAngle));
			else:
				self.rotate(self.get_transform().basis.x.normalized(), deg2rad((event.relative.y * -1) * rotateSpeed * rotateDelta));
		else:
			self.rotate(self.get_transform().basis.y.normalized(), deg2rad((event.relative.x * -1) * rotateSpeed * rotateDelta));
			self.rotate(self.get_transform().basis.x.normalized(), deg2rad((event.relative.y * -1) * rotateSpeed * rotateDelta));

"

[node name="MainCamera" type="Camera"]
keep_aspect = 1
cull_mask = 1048575
environment = null
h_offset = 0.0
v_offset = 0.0
doppler_tracking = 0
projection = 0
current = false
fov = 70.0
size = 1.0
near = 0.05
far = 100.0
script = SubResource( 1 )
_sections_unfolded = [ "Transform" ]
moveSpeed = 10
rotateSpeed = 5
maintainYAxis = true
clampYLook = true
maxYAngle = 89

   GDSC   &   	   >   �     �����׶�   ���������Ӷ�   ����������ض   ����������ض   ����������Ӷ   ��������������Ӷ   ��������������Ӷ   ��������¶��   ������������Ҷ��   ������������Ҷ��   ������������Ҷ��   ������������Ҷ��   �������������϶�   �������������϶�   ����Ӷ��   ��������ݶ��   ��������۶��   �����ض�   �����϶�   �����������������Ӷ�   �������Ŷ���   ����׶��   ����¶��   ���������������������Ҷ�   �������������Ӷ�   ������������������   �������������Ӷ�   �������������������   �����¶�   ����¶��   ��������������������ض��   �����������׶���   �������Ӷ���   ζ��   ϶��   ������Ѷ   ���������¶�   ���������������Ŷ���                            �������?  ��       ��           toggle_mouse      toggle_camera_mode    Y                                                  ,      -   	   7   
   A      K      U      V      e      t      u      |      �      �      �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %     &     '     (     )     *   .  +   6  ,   7  -   =  .   C  /   G  0   Q  1   U  2   _  3   d  4   g  5   l  6   v  7   {  8   �  9   �  :   �  ;   �  <   �  =   �  >   6[[A�  P�  T�  Q[[;R�  S>�  �  <�  T�  U[[;R�  S>�  �  RTT�  SU[[;R�  S>�  �  U[;R�  S>�	  �  U[;R�  S>�
  �  U[;R�  S>�  �  U[[;R�  S>�  �  R�  T�  SU[;R�  S>�  �  R�  T�  SU[[3�  R�  SX�  �  �  U�  &�  �  X�  V�  �  U�  V�  V�  �  RTTSU�  '�  �  X�  V�  �  U�  V�  V�  �  U[[3�  RSX�  �  R�  SU[[3�  RSX�  1�  U[[3�  RSX�  �  R�  &�  �  (�  SU[[3�  R�  SX�  &�  V�  R�  SX�  �  V�  R�  V�  &�  V�  RS�  V�  (�  V�  SU�  &�  V�  R�  SX�  �  RSU[[3�  R�  SX�  &�  7�  �  V�  RS�  V�  X�  >�  �  V�   U[�  &�  �  X�  �  �  U�  &�  X�  �  V�!  �  V�!  U�  &�	  X�  �  V�"  �  V�"  U�  �  �  U�  (X�  &�
  X�  �  V�!  �  V�!  U�  &�	  X�  �  V�"  �  V�"  U�  �  �  U[�  >�#  �$  RSV�%  �  R�  V�"  T�  V�!  TSU�  �#  V�!  �.  R�#  V�!  T�  T�  SU�  �$  RSV�%  �#  U[b         [gd_scene load_steps=14 format=2]

[ext_resource path="res://FreeCamera.tscn" type="PackedScene" id=1]
[ext_resource path="res://dimension_box.shader" type="Shader" id=2]
[ext_resource path="res://DimensionBox.tscn" type="PackedScene" id=3]
[ext_resource path="res://DimensionCube.gd" type="Script" id=4]
[ext_resource path="res://MiniWorld.tscn" type="PackedScene" id=5]

[sub_resource type="GDScript" id=1]

script/source = "extends Spatial

#func _ready():
#	get_tree().paused = true;

func _input(event : InputEvent):
	if event is InputEventKey and event.pressed:
		match(event.scancode):
#			KEY_SPACE:
#				get_tree().paused = !get_tree().paused;
			KEY_R:
				get_tree().reload_current_scene();"

[sub_resource type="CubeMesh" id=2]

custom_aabb = AABB( 0, 0, 0, 0, 0, 0 )
flip_faces = false
size = Vector3( 2, 2, 2 )
subdivide_width = 0
subdivide_height = 0
subdivide_depth = 0

[sub_resource type="ViewportTexture" id=3]

resource_local_to_scene = true
flags = 20
viewport_path = NodePath("/root/EditorNode/@@5/@@6/@@14/@@16/@@20/@@24/@@25/@@26/@@42/@@43/@@52/@@53/@@5910/@@5777/@@5778/@@5779/@@5780/@@5781/Root/DimensionBox/MiniWorld")
_sections_unfolded = [ "Flags" ]

[sub_resource type="ShaderMaterial" id=4]

render_priority = 0
shader = ExtResource( 2 )
shader_param/viewport_texture = SubResource( 3 )
_sections_unfolded = [ "Shader Param", "shader_param/viewport_texture" ]

[sub_resource type="GDScript" id=5]

script/source = "extends VBoxContainer

onready var x_slider = $XSlider;
onready var y_slider = $YSlider;
onready var z_slider = $ZSlider;

onready var box = get_parent().get_node(\"DimensionBox\");

func _ready():
	x_slider.connect(\"value_changed\", self, \"set_value\", [0]);
	y_slider.connect(\"value_changed\", self, \"set_value\", [1]);
	z_slider.connect(\"value_changed\", self, \"set_value\", [2]);

func set_value(value, axis):
	box.rotation_degrees[axis] = value;"

[sub_resource type="GDScript" id=8]

script/source = "extends VBoxContainer

onready var x_slider = $XSlider;
onready var y_slider = $YSlider;
onready var z_slider = $ZSlider;

onready var box = get_parent().get_node(\"DimensionBox\");

func _ready():
	x_slider.connect(\"value_changed\", self, \"set_value\", [0]);
	y_slider.connect(\"value_changed\", self, \"set_value\", [1]);
	z_slider.connect(\"value_changed\", self, \"set_value\", [2]);

func set_value(value, axis):
	box.translation[axis] = value;"

[sub_resource type="GDScript" id=6]

script/source = "extends VBoxContainer

onready var x_slider = $XSlider;
onready var y_slider = $YSlider;
onready var z_slider = $ZSlider;

onready var box = get_parent().get_node(\"DimensionBox\");

func _process(delta):
	box.rotation_degrees += Vector3(x_slider.value, y_slider.value, z_slider.value) * delta;"

[sub_resource type="GDScript" id=7]

script/source = "extends TextureRect

onready var debug_viewport : Viewport = get_parent().find_node(\"MiniWorld\", true, false);#get_parent().find_node(\"DebugViewport\", true, false);

func _ready():
	self.texture = debug_viewport.get_texture();
	self.texture.flags = Texture.FLAG_CONVERT_TO_LINEAR | Texture.FLAG_FILTER;"

[node name="Root" type="Spatial" index="0"]
pause_mode = 2
script = SubResource( 1 )
_sections_unfolded = [ "Pause" ]

[node name="MainCamera" parent="." index="0" instance=ExtResource( 1 )]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 3.5692 )
_sections_unfolded = [ "Pause", "Transform", "environment" ]

[node name="DimensionBox_OLD" type="MeshInstance" parent="." index="1"]
visible = false
layers = 1
material_override = null
cast_shadow = 1
extra_cull_margin = 0.0
use_in_baked_light = false
lod_min_distance = 0.0
lod_min_hysteresis = 0.0
lod_max_distance = 0.0
lod_max_hysteresis = 0.0
mesh = SubResource( 2 )
skeleton = NodePath("..")
material/0 = SubResource( 4 )
_sections_unfolded = [ "Lod", "Material" ]

[node name="DimensionBox" parent="." index="2" instance=ExtResource( 3 )]
_sections_unfolded = [ "Pause", "Script", "Transform", "Visibility" ]

[node name="MiniWorld" type="Viewport" parent="DimensionBox" index="2"]
pause_mode = 1
arvr = false
size = Vector2( 512, 512 )
own_world = true
world = null
transparent_bg = false
msaa = 0
hdr = true
disable_3d = false
keep_3d_linear = true
usage = 2
debug_draw = 0
render_target_v_flip = false
render_target_clear_mode = 0
render_target_update_mode = 2
audio_listener_enable_2d = false
audio_listener_enable_3d = false
physics_object_picking = false
gui_disable_input = false
gui_snap_controls_to_pixels = true
shadow_atlas_size = 0
shadow_atlas_quad_0 = 2
shadow_atlas_quad_1 = 2
shadow_atlas_quad_2 = 3
shadow_atlas_quad_3 = 4
script = ExtResource( 4 )
_sections_unfolded = [ "Pause", "Render Target", "Rendering", "world" ]

[node name="Root" parent="DimensionBox/MiniWorld" index="0" instance=ExtResource( 5 )]

[node name="RotationOffsets" type="VBoxContainer" parent="." index="3"]
editor/display_folded = true
anchor_left = 0.0
anchor_top = 1.0
anchor_right = 0.0
anchor_bottom = 1.0
margin_top = -131.0
margin_right = 247.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
alignment = 0
script = SubResource( 5 )
_sections_unfolded = [ "Pause", "Script" ]

[node name="OffsetLabel" type="Label" parent="RotationOffsets" index="0"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 247.0
margin_bottom = 14.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Rotation Offset"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="XLabel" type="Label" parent="RotationOffsets" index="1"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 18.0
margin_right = 247.0
margin_bottom = 32.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "X"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="XSlider" type="HSlider" parent="RotationOffsets" index="2"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 36.0
margin_right = 247.0
margin_bottom = 52.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = 0.0
max_value = 359.0
step = 1.0
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="YLabel" type="Label" parent="RotationOffsets" index="3"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 56.0
margin_right = 247.0
margin_bottom = 70.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Y"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="YSlider" type="HSlider" parent="RotationOffsets" index="4"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 74.0
margin_right = 247.0
margin_bottom = 90.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = 0.0
max_value = 359.0
step = 1.0
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="ZLabel" type="Label" parent="RotationOffsets" index="5"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 94.0
margin_right = 247.0
margin_bottom = 108.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Z"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="ZSlider" type="HSlider" parent="RotationOffsets" index="6"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 112.0
margin_right = 247.0
margin_bottom = 128.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = 0.0
max_value = 359.0
step = 1.0
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="Offsets" type="VBoxContainer" parent="." index="4"]
editor/display_folded = true
anchor_left = 0.5
anchor_top = 1.0
anchor_right = 0.5
anchor_bottom = 1.0
margin_left = -123.5
margin_top = -131.0
margin_right = 123.5
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
alignment = 0
script = SubResource( 8 )
_sections_unfolded = [ "Pause", "Script" ]

[node name="OffsetLabel" type="Label" parent="Offsets" index="0"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 247.0
margin_bottom = 14.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Position Offset"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="XLabel" type="Label" parent="Offsets" index="1"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 18.0
margin_right = 247.0
margin_bottom = 32.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "X"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="XSlider" type="HSlider" parent="Offsets" index="2"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 36.0
margin_right = 247.0
margin_bottom = 52.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = -5.0
max_value = 5.0
step = 0.01
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="YLabel" type="Label" parent="Offsets" index="3"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 56.0
margin_right = 247.0
margin_bottom = 70.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Y"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="YSlider" type="HSlider" parent="Offsets" index="4"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 74.0
margin_right = 247.0
margin_bottom = 90.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = -5.0
max_value = 5.0
step = 0.01
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="ZLabel" type="Label" parent="Offsets" index="5"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 94.0
margin_right = 247.0
margin_bottom = 108.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Z"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="ZSlider" type="HSlider" parent="Offsets" index="6"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 112.0
margin_right = 247.0
margin_bottom = 128.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = -5.0
max_value = 5.0
step = 0.01
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="Speed" type="VBoxContainer" parent="." index="5"]
anchor_left = 1.0
anchor_top = 1.0
anchor_right = 1.0
anchor_bottom = 1.0
margin_left = -247.0
margin_top = -133.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
alignment = 0
script = SubResource( 6 )
_sections_unfolded = [ "Pause" ]

[node name="SpeedLabel" type="Label" parent="Speed" index="0"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 247.0
margin_bottom = 14.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Rotation Speed"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="XLabel" type="Label" parent="Speed" index="1"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 18.0
margin_right = 247.0
margin_bottom = 32.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "X"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="XSlider" type="HSlider" parent="Speed" index="2"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 36.0
margin_right = 247.0
margin_bottom = 52.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = -90.0
max_value = 90.0
step = 1.0
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="YLabel" type="Label" parent="Speed" index="3"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 56.0
margin_right = 247.0
margin_bottom = 70.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Y"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="YSlider" type="HSlider" parent="Speed" index="4"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 74.0
margin_right = 247.0
margin_bottom = 90.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = -90.0
max_value = 90.0
step = 1.0
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="ZLabel" type="Label" parent="Speed" index="5"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 94.0
margin_right = 247.0
margin_bottom = 108.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Z"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1

[node name="ZSlider" type="HSlider" parent="Speed" index="6"]
anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 112.0
margin_right = 247.0
margin_bottom = 128.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 0
min_value = -90.0
max_value = 90.0
step = 1.0
page = 0.0
value = 0.0
exp_edit = false
rounded = false
allow_greater = false
allow_lesser = false
editable = true
scrollable = true
tick_count = 10
ticks_on_borders = false
focus_mode = 2

[node name="DebugTexture" type="TextureRect" parent="." index="6"]
anchor_left = 1.0
anchor_top = 0.0
anchor_right = 1.0
anchor_bottom = 0.0
margin_left = -266.0
margin_bottom = 252.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
expand = true
stretch_mode = 6
script = SubResource( 7 )
_sections_unfolded = [ "texture" ]

[node name="DirectionalLight" type="DirectionalLight" parent="." index="7"]
layers = 1
light_color = Color( 1, 1, 1, 1 )
light_energy = 1.0
light_indirect_energy = 1.0
light_negative = false
light_specular = 0.5
light_bake_mode = 1
light_cull_mask = -1
shadow_enabled = false
shadow_color = Color( 0, 0, 0, 1 )
shadow_bias = 0.1
shadow_contact = 0.0
shadow_reverse_cull_face = false
editor_only = false
directional_shadow_mode = 2
directional_shadow_split_1 = 0.1
directional_shadow_split_2 = 0.2
directional_shadow_split_3 = 0.5
directional_shadow_blend_splits = false
directional_shadow_normal_bias = 0.8
directional_shadow_bias_split_scale = 0.25
directional_shadow_depth_range = 0
directional_shadow_max_distance = 200.0

    RSRC                    SpatialMaterial                                                                 ;      resource_local_to_scene    resource_name    render_priority 
   next_pass    flags_transparent    flags_unshaded    flags_vertex_lighting    flags_no_depth_test    flags_use_point_size    flags_world_triplanar    flags_fixed_size    flags_albedo_tex_force_srgb    flags_do_not_receive_shadows    flags_disable_ambient_light    flags_ensure_correct_normals    vertex_color_use_as_albedo    vertex_color_is_srgb    params_diffuse_mode    params_specular_mode    params_blend_mode    params_cull_mode    params_depth_draw_mode    params_line_width    params_point_size    params_billboard_mode    params_billboard_keep_scale    params_grow    params_use_alpha_scissor    albedo_color    albedo_texture 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled    normal_enabled    rim_enabled    clearcoat_enabled    anisotropy_enabled    ao_enabled    depth_enabled    subsurf_scatter_enabled    transmission_enabled    refraction_enabled    detail_enabled 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    proximity_fade_enable    distance_fade_enable    script           res://Meshes/Material.material �         SpatialMaterial 9         	   Material    (                                                                       	          
                                                                         (              (              (              (              (                   �?        �?   (                                               �#?�#?�#?  �?                   ?         ?           !   (           "      ���=#          $   (           %          &          '          (          )          *          +          ,          -          .          /          0        �?  �?  �?1                  2          3        �?4        �?  �?  �?5                  6          7        �?8          9          RSRC RSRC                    PackedScene                                                                 	      ..    resource_local_to_scene    resource_name    lightmap_size_hint    blend_shape_mode    custom_aabb    surfaces/0    script 	   _bundled    	   Material    res://Meshes/Material.material    
   local://1 ~      
   local://2 f      
   local://3 �      
   ArrayMesh             Cube    (                                                       array_data    �  eff�fff?  ��  �  �?  �?���  � nff?fff?���  � gff?fff�eff�   aff�fff� ��   aff�fff�lff�   nff?fff?^ff��   gff?fff�����   gff?fff�eff��   aff�fff�lff�   eff�fff?  ��   eff�fff?fff�   eff�fff?fff� �  nff?fff?��� �  nff?fff?^ff� �  gff?fff����  �   �?  �����  � ���  �� ��  � ��?fff�eff�     �?  ��  �?     �?  �����   ��?fff�eff�    �?  �?���    �?fff?^ff�   ��?fff?pff?     �?  ��  �?     �?fff�gff?   ��?fff?pff?    �?  �?���   ��?  �? �?   fff?fff�gff?   ��?fff�eff�   eff?fff�eff�   eff?fff�eff�    �?fff?^ff�   nff?fff?^ff�   \ff?fff?pff?  �   �?fff�gff?  � fff?fff�gff?  � ��?fff?pff? �  \ff?fff?pff? �  fff?fff�  �?    ��  ����?     �?  ��  �?   fff?fff�  �?   ��?  �? �?   \ff?fff? �?   lff�fff?��?    ��  ����?   iff�fff���?   lff�fff?��?   ��?  �? �?    ��  �?��?   iff�fff�dff?   fff?fff�  �?   fff?fff�fff?   fff?fff�fff?�   \ff?fff? �?�   \ff?fff?pff?�   lff�fff?`ff?   iff�fff���?   iff�fff�dff?   lff�fff?��? �  lff�fff?`ff? �   ��fff�cff?�   ���  �� ���    ��  ����?�    ��fff�cff?�    ��  �?��?�    ��fff?aff?�   ���fff?gff��   ���  �� ���   ���fff�lff��    ��fff?aff?�   ���  �?  ���   ���fff?gff��    ��fff�cff?   hff�fff�cff?   hff�fff�cff?  �  ��fff?aff?  � lff�fff?aff?  � eff�fff?gff�   ���fff�lff�   aff�fff�lff�   lff�fff?aff? �  ���fff?gff� �  eff�fff?gff� �  \ff?  �?pff?    �?  �?���   mff?  �?^ff�   mff?  �?^ff�   ���  �?  ��   fff�  �?fff�   \ff?  �?pff?    ��  �?��?   ��?  �? �?   fff�  �?fff�    ��  �?��?   lff�  �?aff?   \ff?�`l?pff?�   mff?  �?^ff��   mff?�`l?^ff��   mff?�`l?^ff�   fff�  �?fff�   fff��`l?fff�   lff��`l?aff?  � \ff?  �?pff?  � \ff?�`l?pff?  � fff��`l?fff�   lff�  �?aff?   lff��`l?aff?   fff?  ��fff? �    �?  ����� �    �?  ��  �? �  fff?  ��fff� �  ���  �� �� �    �?  ����� �  fff?  ��fff? �   ��  ����? �  hff�  ��dff? �  aff�  ��lff� �   ��  ����? �  ���  �� �� �  fff?fff�fff��   fff?  ��fff?�   fff?fff�fff?�   aff�fff�lff�   fff?  ��fff�   fff?fff�fff�   fff?fff�fff?  � hff�  ��dff?  � hff�fff�dff?  � hff�fff�dff?   aff�  ��lff�   aff�fff�lff�   eff�fff?  ��  � ���  �?  ��  �  �?  �?���  � gff?fff�eff�   gff?fff����   aff�fff� ��   nff?fff?^ff��   nff?fff?����   gff?fff�����   aff�fff�lff�   aff�fff� ��   eff�fff?  ��   eff�fff?fff� �  eff�fff?  �� �  nff?fff?��� �  gff?fff����  � nff?fff?���  �   �?  �����  � ���  �� ��  � ���  �?  ��  � eff�fff?  ��  � ���  �� ��  � eff�fff?  ��  � aff�fff� ��  � nff?fff?���  �  �?  �?���  �   �?  �����  � ���  �� ��  � aff�fff� ��  � gff?fff����  � ��?fff�eff�     �?fff�gff?     �?  ��  �?   ��?fff�eff�     �?  �����    �?  �?���   ��?fff?pff?   ��?  �? �?     �?  ��  �?   ��?fff?pff?~    �?fff?^ff�~    �?  �?���~     �?fff�gff?   eff?fff�eff�   ��?fff�eff�    �?fff?^ff�   \ff?fff?pff?  � ��?fff?pff?  �   �?fff�gff?  �  �?fff?^ff� �  fff?fff�  �?   iff�fff���?    ��  ����?   fff?fff�  �?     �?  ��  �?   ��?  �? �?   lff�fff?��?    ��  �?��?    ��  ����?   lff�fff?��?   \ff?fff? �?   ��?  �? �?   iff�fff�dff?   iff�fff���?   fff?fff�  �?   fff?fff�fff?�   fff?fff�  �?�   \ff?fff? �?�   lff�fff?`ff?   lff�fff?��?   iff�fff���?   \ff?fff?pff? �  \ff?fff? �? �  lff�fff?��? �   ��fff�cff?�   ���fff�lff��   ���  �� ���    ��fff�cff?�    ��  ����?�    ��  �?��?�   ���fff?gff��   ���  �?  ���   ���  �� ���    ��fff?aff?�    ��  �?��?�   ���  �?  ���   ���fff�lff�   hff�fff�cff?  �  ��fff�cff?  �  ��fff?aff?  � eff�fff?gff�   ���fff?gff�   ���fff�lff�    ��fff?aff? �   �?  �?���   lff�  �?aff?   \ff?�`l?pff?�   \ff?  �?pff?�   mff?  �?^ff��   mff?  �?^ff�   lff��`l?aff?  � lff�  �?aff?  � \ff?  �?pff?  � fff��`l?fff�   fff�  �?fff�   lff�  �?aff?   fff?  ��fff? �  fff?  ��fff� �    �?  ����� �  aff�  ��lff� �    �?  ��  �? �  aff�  ��lff� �  hff�  ��dff? �   ��  ����? �  fff?  ��fff��   aff�  ��lff�   fff?  ��fff?  � hff�fff�dff?   hff�  ��dff?   aff�  ��lff�         vertex_count (   �             array_index_data    @            	  
                       ! # " $ & %  ( ' ) + * , . - / 1 0 2 4 3 5 7 6 8 : 9 ; = < ( ? > @ B A C E D F H G I K J  M L N P O Q S R T V U W Y X Z \ [ ] _ ^ ` b a c e d f h g i k j l n m o q p r t s u w v x z y { } | ~ �  � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �   � � � � � � �  ' � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �  L � � � � � � � T U � ] � _ Z [ � ] ^ � \ ^ [ � � � f g � � � � � � � � � � r s � u v � � � � { | � ~  � � � � � � �       index_count (             
   primitive (                format (   }           aabb     ��  �� ��  @   @  @      skeleton_aabb              blend_shape_data           	   material                 name    	   Material 
   ArrayMesh          	   Cube.003    (                                                       array_data    @  gff?fff�eff�  � eff�fff?fff�  � nff?fff?^ff�  � nff?fff?^ff�   fff?fff�gff?   eff?fff�eff�   \ff?fff?pff?  ~ iff�fff�dff?  ~ fff?fff�fff?  ~ lff�fff?aff?�   aff�fff�lff��   hff�fff�cff?�   fff��`l?fff�   \ff?�`l?pff?   mff?�`l?^ff�   fff?fff�fff� �  hff�fff�dff? �  aff�fff�lff� �  gff?fff�eff�  � aff�fff�lff�  � eff�fff?fff�  � nff?fff?^ff�   \ff?fff?pff?   fff?fff�gff?   \ff?fff?pff?  ~ lff�fff?`ff?  ~ iff�fff�dff?  ~ lff�fff?aff?�   eff�fff?gff��   aff�fff�lff��   fff��`l?fff�   lff��`l?aff?   \ff?�`l?pff?   fff?fff�fff� �  fff?fff�fff? �  hff�fff�dff? �        vertex_count (   $             array_index_data    H             	  
                       ! # "       index_count (   $          
   primitive (                format (   }           aabb    lff�fff�lff��f�?�c�?nf�?      skeleton_aabb              blend_shape_data           	   material                 name    	   Material    PackedScene          	         names "         DimensionBox    Spatial    Cube    layers    material_override    cast_shadow    extra_cull_margin    use_in_baked_light    lod_min_distance    lod_min_hysteresis    lod_max_distance    lod_max_hysteresis    mesh 	   skeleton    material/0    MeshInstance    Faces    AnimationPlayer 
   root_node 	   autoplay    playback_process_mode    playback_default_blend_time    playback_speed    blend_times    	   variants    
   (                                                                      �?             node_count (                nodes     X   ��������       ����                     ����                                         	      
                                              ����                                         	      
                                               ����                                     	             conn_count (                 conns               node_paths              editable_instances              version (          RSRC      [remap]

importer="scene"
type="PackedScene"
path="res://.import/dimension_box.dae-98dbb0df79c124c92cc1e36c5e78e00f.scn"

[deps]

source_file="res://Meshes/dimension_box.dae"
dest_files=[ "res://.import/dimension_box.dae-98dbb0df79c124c92cc1e36c5e78e00f.scn" ]

[params]

nodes/root_type="Spatial"
nodes/root_name="DimensionBox"
nodes/root_scale=1.0
nodes/custom_script=""
nodes/storage=0
materials/location=1
materials/storage=1
materials/keep_on_reimport=true
meshes/compress=true
meshes/ensure_tangents=true
meshes/storage=0
meshes/light_baking=0
meshes/lightmap_texel_size=0.1
external_files/store_in_subdir=false
animation/import=true
animation/fps=15
animation/filter_script=""
animation/storage=false
animation/keep_custom_tracks=false
animation/optimizer/enabled=true
animation/optimizer/max_linear_error=0.05
animation/optimizer/max_angular_error=0.01
animation/optimizer/max_angle=22
animation/optimizer/remove_unused_tracks=true
animation/clips/amount=0
animation/clip_1/name=""
animation/clip_1/start_frame=0
animation/clip_1/end_frame=0
animation/clip_1/loops=false
animation/clip_2/name=""
animation/clip_2/start_frame=0
animation/clip_2/end_frame=0
animation/clip_2/loops=false
animation/clip_3/name=""
animation/clip_3/start_frame=0
animation/clip_3/end_frame=0
animation/clip_3/loops=false
animation/clip_4/name=""
animation/clip_4/start_frame=0
animation/clip_4/end_frame=0
animation/clip_4/loops=false
animation/clip_5/name=""
animation/clip_5/start_frame=0
animation/clip_5/end_frame=0
animation/clip_5/loops=false
animation/clip_6/name=""
animation/clip_6/start_frame=0
animation/clip_6/end_frame=0
animation/clip_6/loops=false
animation/clip_7/name=""
animation/clip_7/start_frame=0
animation/clip_7/end_frame=0
animation/clip_7/loops=false
animation/clip_8/name=""
animation/clip_8/start_frame=0
animation/clip_8/end_frame=0
animation/clip_8/loops=false
animation/clip_9/name=""
animation/clip_9/start_frame=0
animation/clip_9/end_frame=0
animation/clip_9/loops=false
animation/clip_10/name=""
animation/clip_10/start_frame=0
animation/clip_10/end_frame=0
animation/clip_10/loops=false
animation/clip_11/name=""
animation/clip_11/start_frame=0
animation/clip_11/end_frame=0
animation/clip_11/loops=false
animation/clip_12/name=""
animation/clip_12/start_frame=0
animation/clip_12/end_frame=0
animation/clip_12/loops=false
animation/clip_13/name=""
animation/clip_13/start_frame=0
animation/clip_13/end_frame=0
animation/clip_13/loops=false
animation/clip_14/name=""
animation/clip_14/start_frame=0
animation/clip_14/end_frame=0
animation/clip_14/loops=false
animation/clip_15/name=""
animation/clip_15/start_frame=0
animation/clip_15/end_frame=0
animation/clip_15/loops=false
animation/clip_16/name=""
animation/clip_16/start_frame=0
animation/clip_16/end_frame=0
animation/clip_16/loops=false
animation/clip_17/name=""
animation/clip_17/start_frame=0
animation/clip_17/end_frame=0
animation/clip_17/loops=false
animation/clip_18/name=""
animation/clip_18/start_frame=0
animation/clip_18/end_frame=0
animation/clip_18/loops=false
animation/clip_19/name=""
animation/clip_19/start_frame=0
animation/clip_19/end_frame=0
animation/clip_19/loops=false
animation/clip_20/name=""
animation/clip_20/start_frame=0
animation/clip_20/end_frame=0
animation/clip_20/loops=false
animation/clip_21/name=""
animation/clip_21/start_frame=0
animation/clip_21/end_frame=0
animation/clip_21/loops=false
animation/clip_22/name=""
animation/clip_22/start_frame=0
animation/clip_22/end_frame=0
animation/clip_22/loops=false
animation/clip_23/name=""
animation/clip_23/start_frame=0
animation/clip_23/end_frame=0
animation/clip_23/loops=false
animation/clip_24/name=""
animation/clip_24/start_frame=0
animation/clip_24/end_frame=0
animation/clip_24/loops=false
animation/clip_25/name=""
animation/clip_25/start_frame=0
animation/clip_25/end_frame=0
animation/clip_25/loops=false
animation/clip_26/name=""
animation/clip_26/start_frame=0
animation/clip_26/end_frame=0
animation/clip_26/loops=false
animation/clip_27/name=""
animation/clip_27/start_frame=0
animation/clip_27/end_frame=0
animation/clip_27/loops=false
animation/clip_28/name=""
animation/clip_28/start_frame=0
animation/clip_28/end_frame=0
animation/clip_28/loops=false
animation/clip_29/name=""
animation/clip_29/start_frame=0
animation/clip_29/end_frame=0
animation/clip_29/loops=false
animation/clip_30/name=""
animation/clip_30/start_frame=0
animation/clip_30/end_frame=0
animation/clip_30/loops=false
animation/clip_31/name=""
animation/clip_31/start_frame=0
animation/clip_31/end_frame=0
animation/clip_31/loops=false
animation/clip_32/name=""
animation/clip_32/start_frame=0
animation/clip_32/end_frame=0
animation/clip_32/loops=false
animation/clip_33/name=""
animation/clip_33/start_frame=0
animation/clip_33/end_frame=0
animation/clip_33/loops=false
animation/clip_34/name=""
animation/clip_34/start_frame=0
animation/clip_34/end_frame=0
animation/clip_34/loops=false
animation/clip_35/name=""
animation/clip_35/start_frame=0
animation/clip_35/end_frame=0
animation/clip_35/loops=false
animation/clip_36/name=""
animation/clip_36/start_frame=0
animation/clip_36/end_frame=0
animation/clip_36/loops=false
animation/clip_37/name=""
animation/clip_37/start_frame=0
animation/clip_37/end_frame=0
animation/clip_37/loops=false
animation/clip_38/name=""
animation/clip_38/start_frame=0
animation/clip_38/end_frame=0
animation/clip_38/loops=false
animation/clip_39/name=""
animation/clip_39/start_frame=0
animation/clip_39/end_frame=0
animation/clip_39/loops=false
animation/clip_40/name=""
animation/clip_40/start_frame=0
animation/clip_40/end_frame=0
animation/clip_40/loops=false
animation/clip_41/name=""
animation/clip_41/start_frame=0
animation/clip_41/end_frame=0
animation/clip_41/loops=false
animation/clip_42/name=""
animation/clip_42/start_frame=0
animation/clip_42/end_frame=0
animation/clip_42/loops=false
animation/clip_43/name=""
animation/clip_43/start_frame=0
animation/clip_43/end_frame=0
animation/clip_43/loops=false
animation/clip_44/name=""
animation/clip_44/start_frame=0
animation/clip_44/end_frame=0
animation/clip_44/loops=false
animation/clip_45/name=""
animation/clip_45/start_frame=0
animation/clip_45/end_frame=0
animation/clip_45/loops=false
animation/clip_46/name=""
animation/clip_46/start_frame=0
animation/clip_46/end_frame=0
animation/clip_46/loops=false
animation/clip_47/name=""
animation/clip_47/start_frame=0
animation/clip_47/end_frame=0
animation/clip_47/loops=false
animation/clip_48/name=""
animation/clip_48/start_frame=0
animation/clip_48/end_frame=0
animation/clip_48/loops=false
animation/clip_49/name=""
animation/clip_49/start_frame=0
animation/clip_49/end_frame=0
animation/clip_49/loops=false
animation/clip_50/name=""
animation/clip_50/start_frame=0
animation/clip_50/end_frame=0
animation/clip_50/loops=false
animation/clip_51/name=""
animation/clip_51/start_frame=0
animation/clip_51/end_frame=0
animation/clip_51/loops=false
animation/clip_52/name=""
animation/clip_52/start_frame=0
animation/clip_52/end_frame=0
animation/clip_52/loops=false
animation/clip_53/name=""
animation/clip_53/start_frame=0
animation/clip_53/end_frame=0
animation/clip_53/loops=false
animation/clip_54/name=""
animation/clip_54/start_frame=0
animation/clip_54/end_frame=0
animation/clip_54/loops=false
animation/clip_55/name=""
animation/clip_55/start_frame=0
animation/clip_55/end_frame=0
animation/clip_55/loops=false
animation/clip_56/name=""
animation/clip_56/start_frame=0
animation/clip_56/end_frame=0
animation/clip_56/loops=false
animation/clip_57/name=""
animation/clip_57/start_frame=0
animation/clip_57/end_frame=0
animation/clip_57/loops=false
animation/clip_58/name=""
animation/clip_58/start_frame=0
animation/clip_58/end_frame=0
animation/clip_58/loops=false
animation/clip_59/name=""
animation/clip_59/start_frame=0
animation/clip_59/end_frame=0
animation/clip_59/loops=false
animation/clip_60/name=""
animation/clip_60/start_frame=0
animation/clip_60/end_frame=0
animation/clip_60/loops=false
animation/clip_61/name=""
animation/clip_61/start_frame=0
animation/clip_61/end_frame=0
animation/clip_61/loops=false
animation/clip_62/name=""
animation/clip_62/start_frame=0
animation/clip_62/end_frame=0
animation/clip_62/loops=false
animation/clip_63/name=""
animation/clip_63/start_frame=0
animation/clip_63/end_frame=0
animation/clip_63/loops=false
animation/clip_64/name=""
animation/clip_64/start_frame=0
animation/clip_64/end_frame=0
animation/clip_64/loops=false
animation/clip_65/name=""
animation/clip_65/start_frame=0
animation/clip_65/end_frame=0
animation/clip_65/loops=false
animation/clip_66/name=""
animation/clip_66/start_frame=0
animation/clip_66/end_frame=0
animation/clip_66/loops=false
animation/clip_67/name=""
animation/clip_67/start_frame=0
animation/clip_67/end_frame=0
animation/clip_67/loops=false
animation/clip_68/name=""
animation/clip_68/start_frame=0
animation/clip_68/end_frame=0
animation/clip_68/loops=false
animation/clip_69/name=""
animation/clip_69/start_frame=0
animation/clip_69/end_frame=0
animation/clip_69/loops=false
animation/clip_70/name=""
animation/clip_70/start_frame=0
animation/clip_70/end_frame=0
animation/clip_70/loops=false
animation/clip_71/name=""
animation/clip_71/start_frame=0
animation/clip_71/end_frame=0
animation/clip_71/loops=false
animation/clip_72/name=""
animation/clip_72/start_frame=0
animation/clip_72/end_frame=0
animation/clip_72/loops=false
animation/clip_73/name=""
animation/clip_73/start_frame=0
animation/clip_73/end_frame=0
animation/clip_73/loops=false
animation/clip_74/name=""
animation/clip_74/start_frame=0
animation/clip_74/end_frame=0
animation/clip_74/loops=false
animation/clip_75/name=""
animation/clip_75/start_frame=0
animation/clip_75/end_frame=0
animation/clip_75/loops=false
animation/clip_76/name=""
animation/clip_76/start_frame=0
animation/clip_76/end_frame=0
animation/clip_76/loops=false
animation/clip_77/name=""
animation/clip_77/start_frame=0
animation/clip_77/end_frame=0
animation/clip_77/loops=false
animation/clip_78/name=""
animation/clip_78/start_frame=0
animation/clip_78/end_frame=0
animation/clip_78/loops=false
animation/clip_79/name=""
animation/clip_79/start_frame=0
animation/clip_79/end_frame=0
animation/clip_79/loops=false
animation/clip_80/name=""
animation/clip_80/start_frame=0
animation/clip_80/end_frame=0
animation/clip_80/loops=false
animation/clip_81/name=""
animation/clip_81/start_frame=0
animation/clip_81/end_frame=0
animation/clip_81/loops=false
animation/clip_82/name=""
animation/clip_82/start_frame=0
animation/clip_82/end_frame=0
animation/clip_82/loops=false
animation/clip_83/name=""
animation/clip_83/start_frame=0
animation/clip_83/end_frame=0
animation/clip_83/loops=false
animation/clip_84/name=""
animation/clip_84/start_frame=0
animation/clip_84/end_frame=0
animation/clip_84/loops=false
animation/clip_85/name=""
animation/clip_85/start_frame=0
animation/clip_85/end_frame=0
animation/clip_85/loops=false
animation/clip_86/name=""
animation/clip_86/start_frame=0
animation/clip_86/end_frame=0
animation/clip_86/loops=false
animation/clip_87/name=""
animation/clip_87/start_frame=0
animation/clip_87/end_frame=0
animation/clip_87/loops=false
animation/clip_88/name=""
animation/clip_88/start_frame=0
animation/clip_88/end_frame=0
animation/clip_88/loops=false
animation/clip_89/name=""
animation/clip_89/start_frame=0
animation/clip_89/end_frame=0
animation/clip_89/loops=false
animation/clip_90/name=""
animation/clip_90/start_frame=0
animation/clip_90/end_frame=0
animation/clip_90/loops=false
animation/clip_91/name=""
animation/clip_91/start_frame=0
animation/clip_91/end_frame=0
animation/clip_91/loops=false
animation/clip_92/name=""
animation/clip_92/start_frame=0
animation/clip_92/end_frame=0
animation/clip_92/loops=false
animation/clip_93/name=""
animation/clip_93/start_frame=0
animation/clip_93/end_frame=0
animation/clip_93/loops=false
animation/clip_94/name=""
animation/clip_94/start_frame=0
animation/clip_94/end_frame=0
animation/clip_94/loops=false
animation/clip_95/name=""
animation/clip_95/start_frame=0
animation/clip_95/end_frame=0
animation/clip_95/loops=false
animation/clip_96/name=""
animation/clip_96/start_frame=0
animation/clip_96/end_frame=0
animation/clip_96/loops=false
animation/clip_97/name=""
animation/clip_97/start_frame=0
animation/clip_97/end_frame=0
animation/clip_97/loops=false
animation/clip_98/name=""
animation/clip_98/start_frame=0
animation/clip_98/end_frame=0
animation/clip_98/loops=false
animation/clip_99/name=""
animation/clip_99/start_frame=0
animation/clip_99/end_frame=0
animation/clip_99/loops=false
animation/clip_100/name=""
animation/clip_100/start_frame=0
animation/clip_100/end_frame=0
animation/clip_100/loops=false
animation/clip_101/name=""
animation/clip_101/start_frame=0
animation/clip_101/end_frame=0
animation/clip_101/loops=false
animation/clip_102/name=""
animation/clip_102/start_frame=0
animation/clip_102/end_frame=0
animation/clip_102/loops=false
animation/clip_103/name=""
animation/clip_103/start_frame=0
animation/clip_103/end_frame=0
animation/clip_103/loops=false
animation/clip_104/name=""
animation/clip_104/start_frame=0
animation/clip_104/end_frame=0
animation/clip_104/loops=false
animation/clip_105/name=""
animation/clip_105/start_frame=0
animation/clip_105/end_frame=0
animation/clip_105/loops=false
animation/clip_106/name=""
animation/clip_106/start_frame=0
animation/clip_106/end_frame=0
animation/clip_106/loops=false
animation/clip_107/name=""
animation/clip_107/start_frame=0
animation/clip_107/end_frame=0
animation/clip_107/loops=false
animation/clip_108/name=""
animation/clip_108/start_frame=0
animation/clip_108/end_frame=0
animation/clip_108/loops=false
animation/clip_109/name=""
animation/clip_109/start_frame=0
animation/clip_109/end_frame=0
animation/clip_109/loops=false
animation/clip_110/name=""
animation/clip_110/start_frame=0
animation/clip_110/end_frame=0
animation/clip_110/loops=false
animation/clip_111/name=""
animation/clip_111/start_frame=0
animation/clip_111/end_frame=0
animation/clip_111/loops=false
animation/clip_112/name=""
animation/clip_112/start_frame=0
animation/clip_112/end_frame=0
animation/clip_112/loops=false
animation/clip_113/name=""
animation/clip_113/start_frame=0
animation/clip_113/end_frame=0
animation/clip_113/loops=false
animation/clip_114/name=""
animation/clip_114/start_frame=0
animation/clip_114/end_frame=0
animation/clip_114/loops=false
animation/clip_115/name=""
animation/clip_115/start_frame=0
animation/clip_115/end_frame=0
animation/clip_115/loops=false
animation/clip_116/name=""
animation/clip_116/start_frame=0
animation/clip_116/end_frame=0
animation/clip_116/loops=false
animation/clip_117/name=""
animation/clip_117/start_frame=0
animation/clip_117/end_frame=0
animation/clip_117/loops=false
animation/clip_118/name=""
animation/clip_118/start_frame=0
animation/clip_118/end_frame=0
animation/clip_118/loops=false
animation/clip_119/name=""
animation/clip_119/start_frame=0
animation/clip_119/end_frame=0
animation/clip_119/loops=false
animation/clip_120/name=""
animation/clip_120/start_frame=0
animation/clip_120/end_frame=0
animation/clip_120/loops=false
animation/clip_121/name=""
animation/clip_121/start_frame=0
animation/clip_121/end_frame=0
animation/clip_121/loops=false
animation/clip_122/name=""
animation/clip_122/start_frame=0
animation/clip_122/end_frame=0
animation/clip_122/loops=false
animation/clip_123/name=""
animation/clip_123/start_frame=0
animation/clip_123/end_frame=0
animation/clip_123/loops=false
animation/clip_124/name=""
animation/clip_124/start_frame=0
animation/clip_124/end_frame=0
animation/clip_124/loops=false
animation/clip_125/name=""
animation/clip_125/start_frame=0
animation/clip_125/end_frame=0
animation/clip_125/loops=false
animation/clip_126/name=""
animation/clip_126/start_frame=0
animation/clip_126/end_frame=0
animation/clip_126/loops=false
animation/clip_127/name=""
animation/clip_127/start_frame=0
animation/clip_127/end_frame=0
animation/clip_127/loops=false
animation/clip_128/name=""
animation/clip_128/start_frame=0
animation/clip_128/end_frame=0
animation/clip_128/loops=false
animation/clip_129/name=""
animation/clip_129/start_frame=0
animation/clip_129/end_frame=0
animation/clip_129/loops=false
animation/clip_130/name=""
animation/clip_130/start_frame=0
animation/clip_130/end_frame=0
animation/clip_130/loops=false
animation/clip_131/name=""
animation/clip_131/start_frame=0
animation/clip_131/end_frame=0
animation/clip_131/loops=false
animation/clip_132/name=""
animation/clip_132/start_frame=0
animation/clip_132/end_frame=0
animation/clip_132/loops=false
animation/clip_133/name=""
animation/clip_133/start_frame=0
animation/clip_133/end_frame=0
animation/clip_133/loops=false
animation/clip_134/name=""
animation/clip_134/start_frame=0
animation/clip_134/end_frame=0
animation/clip_134/loops=false
animation/clip_135/name=""
animation/clip_135/start_frame=0
animation/clip_135/end_frame=0
animation/clip_135/loops=false
animation/clip_136/name=""
animation/clip_136/start_frame=0
animation/clip_136/end_frame=0
animation/clip_136/loops=false
animation/clip_137/name=""
animation/clip_137/start_frame=0
animation/clip_137/end_frame=0
animation/clip_137/loops=false
animation/clip_138/name=""
animation/clip_138/start_frame=0
animation/clip_138/end_frame=0
animation/clip_138/loops=false
animation/clip_139/name=""
animation/clip_139/start_frame=0
animation/clip_139/end_frame=0
animation/clip_139/loops=false
animation/clip_140/name=""
animation/clip_140/start_frame=0
animation/clip_140/end_frame=0
animation/clip_140/loops=false
animation/clip_141/name=""
animation/clip_141/start_frame=0
animation/clip_141/end_frame=0
animation/clip_141/loops=false
animation/clip_142/name=""
animation/clip_142/start_frame=0
animation/clip_142/end_frame=0
animation/clip_142/loops=false
animation/clip_143/name=""
animation/clip_143/start_frame=0
animation/clip_143/end_frame=0
animation/clip_143/loops=false
animation/clip_144/name=""
animation/clip_144/start_frame=0
animation/clip_144/end_frame=0
animation/clip_144/loops=false
animation/clip_145/name=""
animation/clip_145/start_frame=0
animation/clip_145/end_frame=0
animation/clip_145/loops=false
animation/clip_146/name=""
animation/clip_146/start_frame=0
animation/clip_146/end_frame=0
animation/clip_146/loops=false
animation/clip_147/name=""
animation/clip_147/start_frame=0
animation/clip_147/end_frame=0
animation/clip_147/loops=false
animation/clip_148/name=""
animation/clip_148/start_frame=0
animation/clip_148/end_frame=0
animation/clip_148/loops=false
animation/clip_149/name=""
animation/clip_149/start_frame=0
animation/clip_149/end_frame=0
animation/clip_149/loops=false
animation/clip_150/name=""
animation/clip_150/start_frame=0
animation/clip_150/end_frame=0
animation/clip_150/loops=false
animation/clip_151/name=""
animation/clip_151/start_frame=0
animation/clip_151/end_frame=0
animation/clip_151/loops=false
animation/clip_152/name=""
animation/clip_152/start_frame=0
animation/clip_152/end_frame=0
animation/clip_152/loops=false
animation/clip_153/name=""
animation/clip_153/start_frame=0
animation/clip_153/end_frame=0
animation/clip_153/loops=false
animation/clip_154/name=""
animation/clip_154/start_frame=0
animation/clip_154/end_frame=0
animation/clip_154/loops=false
animation/clip_155/name=""
animation/clip_155/start_frame=0
animation/clip_155/end_frame=0
animation/clip_155/loops=false
animation/clip_156/name=""
animation/clip_156/start_frame=0
animation/clip_156/end_frame=0
animation/clip_156/loops=false
animation/clip_157/name=""
animation/clip_157/start_frame=0
animation/clip_157/end_frame=0
animation/clip_157/loops=false
animation/clip_158/name=""
animation/clip_158/start_frame=0
animation/clip_158/end_frame=0
animation/clip_158/loops=false
animation/clip_159/name=""
animation/clip_159/start_frame=0
animation/clip_159/end_frame=0
animation/clip_159/loops=false
animation/clip_160/name=""
animation/clip_160/start_frame=0
animation/clip_160/end_frame=0
animation/clip_160/loops=false
animation/clip_161/name=""
animation/clip_161/start_frame=0
animation/clip_161/end_frame=0
animation/clip_161/loops=false
animation/clip_162/name=""
animation/clip_162/start_frame=0
animation/clip_162/end_frame=0
animation/clip_162/loops=false
animation/clip_163/name=""
animation/clip_163/start_frame=0
animation/clip_163/end_frame=0
animation/clip_163/loops=false
animation/clip_164/name=""
animation/clip_164/start_frame=0
animation/clip_164/end_frame=0
animation/clip_164/loops=false
animation/clip_165/name=""
animation/clip_165/start_frame=0
animation/clip_165/end_frame=0
animation/clip_165/loops=false
animation/clip_166/name=""
animation/clip_166/start_frame=0
animation/clip_166/end_frame=0
animation/clip_166/loops=false
animation/clip_167/name=""
animation/clip_167/start_frame=0
animation/clip_167/end_frame=0
animation/clip_167/loops=false
animation/clip_168/name=""
animation/clip_168/start_frame=0
animation/clip_168/end_frame=0
animation/clip_168/loops=false
animation/clip_169/name=""
animation/clip_169/start_frame=0
animation/clip_169/end_frame=0
animation/clip_169/loops=false
animation/clip_170/name=""
animation/clip_170/start_frame=0
animation/clip_170/end_frame=0
animation/clip_170/loops=false
animation/clip_171/name=""
animation/clip_171/start_frame=0
animation/clip_171/end_frame=0
animation/clip_171/loops=false
animation/clip_172/name=""
animation/clip_172/start_frame=0
animation/clip_172/end_frame=0
animation/clip_172/loops=false
animation/clip_173/name=""
animation/clip_173/start_frame=0
animation/clip_173/end_frame=0
animation/clip_173/loops=false
animation/clip_174/name=""
animation/clip_174/start_frame=0
animation/clip_174/end_frame=0
animation/clip_174/loops=false
animation/clip_175/name=""
animation/clip_175/start_frame=0
animation/clip_175/end_frame=0
animation/clip_175/loops=false
animation/clip_176/name=""
animation/clip_176/start_frame=0
animation/clip_176/end_frame=0
animation/clip_176/loops=false
animation/clip_177/name=""
animation/clip_177/start_frame=0
animation/clip_177/end_frame=0
animation/clip_177/loops=false
animation/clip_178/name=""
animation/clip_178/start_frame=0
animation/clip_178/end_frame=0
animation/clip_178/loops=false
animation/clip_179/name=""
animation/clip_179/start_frame=0
animation/clip_179/end_frame=0
animation/clip_179/loops=false
animation/clip_180/name=""
animation/clip_180/start_frame=0
animation/clip_180/end_frame=0
animation/clip_180/loops=false
animation/clip_181/name=""
animation/clip_181/start_frame=0
animation/clip_181/end_frame=0
animation/clip_181/loops=false
animation/clip_182/name=""
animation/clip_182/start_frame=0
animation/clip_182/end_frame=0
animation/clip_182/loops=false
animation/clip_183/name=""
animation/clip_183/start_frame=0
animation/clip_183/end_frame=0
animation/clip_183/loops=false
animation/clip_184/name=""
animation/clip_184/start_frame=0
animation/clip_184/end_frame=0
animation/clip_184/loops=false
animation/clip_185/name=""
animation/clip_185/start_frame=0
animation/clip_185/end_frame=0
animation/clip_185/loops=false
animation/clip_186/name=""
animation/clip_186/start_frame=0
animation/clip_186/end_frame=0
animation/clip_186/loops=false
animation/clip_187/name=""
animation/clip_187/start_frame=0
animation/clip_187/end_frame=0
animation/clip_187/loops=false
animation/clip_188/name=""
animation/clip_188/start_frame=0
animation/clip_188/end_frame=0
animation/clip_188/loops=false
animation/clip_189/name=""
animation/clip_189/start_frame=0
animation/clip_189/end_frame=0
animation/clip_189/loops=false
animation/clip_190/name=""
animation/clip_190/start_frame=0
animation/clip_190/end_frame=0
animation/clip_190/loops=false
animation/clip_191/name=""
animation/clip_191/start_frame=0
animation/clip_191/end_frame=0
animation/clip_191/loops=false
animation/clip_192/name=""
animation/clip_192/start_frame=0
animation/clip_192/end_frame=0
animation/clip_192/loops=false
animation/clip_193/name=""
animation/clip_193/start_frame=0
animation/clip_193/end_frame=0
animation/clip_193/loops=false
animation/clip_194/name=""
animation/clip_194/start_frame=0
animation/clip_194/end_frame=0
animation/clip_194/loops=false
animation/clip_195/name=""
animation/clip_195/start_frame=0
animation/clip_195/end_frame=0
animation/clip_195/loops=false
animation/clip_196/name=""
animation/clip_196/start_frame=0
animation/clip_196/end_frame=0
animation/clip_196/loops=false
animation/clip_197/name=""
animation/clip_197/start_frame=0
animation/clip_197/end_frame=0
animation/clip_197/loops=false
animation/clip_198/name=""
animation/clip_198/start_frame=0
animation/clip_198/end_frame=0
animation/clip_198/loops=false
animation/clip_199/name=""
animation/clip_199/start_frame=0
animation/clip_199/end_frame=0
animation/clip_199/loops=false
animation/clip_200/name=""
animation/clip_200/start_frame=0
animation/clip_200/end_frame=0
animation/clip_200/loops=false
animation/clip_201/name=""
animation/clip_201/start_frame=0
animation/clip_201/end_frame=0
animation/clip_201/loops=false
animation/clip_202/name=""
animation/clip_202/start_frame=0
animation/clip_202/end_frame=0
animation/clip_202/loops=false
animation/clip_203/name=""
animation/clip_203/start_frame=0
animation/clip_203/end_frame=0
animation/clip_203/loops=false
animation/clip_204/name=""
animation/clip_204/start_frame=0
animation/clip_204/end_frame=0
animation/clip_204/loops=false
animation/clip_205/name=""
animation/clip_205/start_frame=0
animation/clip_205/end_frame=0
animation/clip_205/loops=false
animation/clip_206/name=""
animation/clip_206/start_frame=0
animation/clip_206/end_frame=0
animation/clip_206/loops=false
animation/clip_207/name=""
animation/clip_207/start_frame=0
animation/clip_207/end_frame=0
animation/clip_207/loops=false
animation/clip_208/name=""
animation/clip_208/start_frame=0
animation/clip_208/end_frame=0
animation/clip_208/loops=false
animation/clip_209/name=""
animation/clip_209/start_frame=0
animation/clip_209/end_frame=0
animation/clip_209/loops=false
animation/clip_210/name=""
animation/clip_210/start_frame=0
animation/clip_210/end_frame=0
animation/clip_210/loops=false
animation/clip_211/name=""
animation/clip_211/start_frame=0
animation/clip_211/end_frame=0
animation/clip_211/loops=false
animation/clip_212/name=""
animation/clip_212/start_frame=0
animation/clip_212/end_frame=0
animation/clip_212/loops=false
animation/clip_213/name=""
animation/clip_213/start_frame=0
animation/clip_213/end_frame=0
animation/clip_213/loops=false
animation/clip_214/name=""
animation/clip_214/start_frame=0
animation/clip_214/end_frame=0
animation/clip_214/loops=false
animation/clip_215/name=""
animation/clip_215/start_frame=0
animation/clip_215/end_frame=0
animation/clip_215/loops=false
animation/clip_216/name=""
animation/clip_216/start_frame=0
animation/clip_216/end_frame=0
animation/clip_216/loops=false
animation/clip_217/name=""
animation/clip_217/start_frame=0
animation/clip_217/end_frame=0
animation/clip_217/loops=false
animation/clip_218/name=""
animation/clip_218/start_frame=0
animation/clip_218/end_frame=0
animation/clip_218/loops=false
animation/clip_219/name=""
animation/clip_219/start_frame=0
animation/clip_219/end_frame=0
animation/clip_219/loops=false
animation/clip_220/name=""
animation/clip_220/start_frame=0
animation/clip_220/end_frame=0
animation/clip_220/loops=false
animation/clip_221/name=""
animation/clip_221/start_frame=0
animation/clip_221/end_frame=0
animation/clip_221/loops=false
animation/clip_222/name=""
animation/clip_222/start_frame=0
animation/clip_222/end_frame=0
animation/clip_222/loops=false
animation/clip_223/name=""
animation/clip_223/start_frame=0
animation/clip_223/end_frame=0
animation/clip_223/loops=false
animation/clip_224/name=""
animation/clip_224/start_frame=0
animation/clip_224/end_frame=0
animation/clip_224/loops=false
animation/clip_225/name=""
animation/clip_225/start_frame=0
animation/clip_225/end_frame=0
animation/clip_225/loops=false
animation/clip_226/name=""
animation/clip_226/start_frame=0
animation/clip_226/end_frame=0
animation/clip_226/loops=false
animation/clip_227/name=""
animation/clip_227/start_frame=0
animation/clip_227/end_frame=0
animation/clip_227/loops=false
animation/clip_228/name=""
animation/clip_228/start_frame=0
animation/clip_228/end_frame=0
animation/clip_228/loops=false
animation/clip_229/name=""
animation/clip_229/start_frame=0
animation/clip_229/end_frame=0
animation/clip_229/loops=false
animation/clip_230/name=""
animation/clip_230/start_frame=0
animation/clip_230/end_frame=0
animation/clip_230/loops=false
animation/clip_231/name=""
animation/clip_231/start_frame=0
animation/clip_231/end_frame=0
animation/clip_231/loops=false
animation/clip_232/name=""
animation/clip_232/start_frame=0
animation/clip_232/end_frame=0
animation/clip_232/loops=false
animation/clip_233/name=""
animation/clip_233/start_frame=0
animation/clip_233/end_frame=0
animation/clip_233/loops=false
animation/clip_234/name=""
animation/clip_234/start_frame=0
animation/clip_234/end_frame=0
animation/clip_234/loops=false
animation/clip_235/name=""
animation/clip_235/start_frame=0
animation/clip_235/end_frame=0
animation/clip_235/loops=false
animation/clip_236/name=""
animation/clip_236/start_frame=0
animation/clip_236/end_frame=0
animation/clip_236/loops=false
animation/clip_237/name=""
animation/clip_237/start_frame=0
animation/clip_237/end_frame=0
animation/clip_237/loops=false
animation/clip_238/name=""
animation/clip_238/start_frame=0
animation/clip_238/end_frame=0
animation/clip_238/loops=false
animation/clip_239/name=""
animation/clip_239/start_frame=0
animation/clip_239/end_frame=0
animation/clip_239/loops=false
animation/clip_240/name=""
animation/clip_240/start_frame=0
animation/clip_240/end_frame=0
animation/clip_240/loops=false
animation/clip_241/name=""
animation/clip_241/start_frame=0
animation/clip_241/end_frame=0
animation/clip_241/loops=false
animation/clip_242/name=""
animation/clip_242/start_frame=0
animation/clip_242/end_frame=0
animation/clip_242/loops=false
animation/clip_243/name=""
animation/clip_243/start_frame=0
animation/clip_243/end_frame=0
animation/clip_243/loops=false
animation/clip_244/name=""
animation/clip_244/start_frame=0
animation/clip_244/end_frame=0
animation/clip_244/loops=false
animation/clip_245/name=""
animation/clip_245/start_frame=0
animation/clip_245/end_frame=0
animation/clip_245/loops=false
animation/clip_246/name=""
animation/clip_246/start_frame=0
animation/clip_246/end_frame=0
animation/clip_246/loops=false
animation/clip_247/name=""
animation/clip_247/start_frame=0
animation/clip_247/end_frame=0
animation/clip_247/loops=false
animation/clip_248/name=""
animation/clip_248/start_frame=0
animation/clip_248/end_frame=0
animation/clip_248/loops=false
animation/clip_249/name=""
animation/clip_249/start_frame=0
animation/clip_249/end_frame=0
animation/clip_249/loops=false
animation/clip_250/name=""
animation/clip_250/start_frame=0
animation/clip_250/end_frame=0
animation/clip_250/loops=false
animation/clip_251/name=""
animation/clip_251/start_frame=0
animation/clip_251/end_frame=0
animation/clip_251/loops=false
animation/clip_252/name=""
animation/clip_252/start_frame=0
animation/clip_252/end_frame=0
animation/clip_252/loops=false
animation/clip_253/name=""
animation/clip_253/start_frame=0
animation/clip_253/end_frame=0
animation/clip_253/loops=false
animation/clip_254/name=""
animation/clip_254/start_frame=0
animation/clip_254/end_frame=0
animation/clip_254/loops=false
animation/clip_255/name=""
animation/clip_255/start_frame=0
animation/clip_255/end_frame=0
animation/clip_255/loops=false
animation/clip_256/name=""
animation/clip_256/start_frame=0
animation/clip_256/end_frame=0
animation/clip_256/loops=false
           [gd_scene load_steps=11 format=2]

[sub_resource type="ProceduralSky" id=16]

radiance_size = 4
sky_top_color = Color( 0.992157, 0, 1, 1 )
sky_horizon_color = Color( 0, 0.882353, 1, 1 )
sky_curve = 0.25
sky_energy = 1.0
ground_bottom_color = Color( 0.14902, 0.101961, 0.188235, 1 )
ground_horizon_color = Color( 0.639216, 0.482353, 0.952941, 1 )
ground_curve = 0.01
ground_energy = 1.0
sun_color = Color( 1, 1, 1, 1 )
sun_latitude = 35.0
sun_longitude = 0.0
sun_angle_min = 1.0
sun_angle_max = 100.0
sun_curve = 0.05
sun_energy = 16.0
texture_size = 2
_sections_unfolded = [ "Ground", "Sky" ]

[sub_resource type="Environment" id=12]

background_mode = 2
background_sky = SubResource( 16 )
background_sky_custom_fov = 0.0
background_color = Color( 0, 0, 0, 1 )
background_energy = 1.0
background_canvas_max_layer = 0
ambient_light_color = Color( 0, 0, 0, 1 )
ambient_light_energy = 1.0
ambient_light_sky_contribution = 1.0
fog_enabled = false
fog_color = Color( 0.5, 0.6, 0.7, 1 )
fog_sun_color = Color( 1, 0.9, 0.7, 1 )
fog_sun_amount = 0.0
fog_depth_enabled = true
fog_depth_begin = 10.0
fog_depth_curve = 1.0
fog_transmit_enabled = false
fog_transmit_curve = 1.0
fog_height_enabled = false
fog_height_min = 0.0
fog_height_max = 100.0
fog_height_curve = 1.0
tonemap_mode = 0
tonemap_exposure = 1.0
tonemap_white = 1.0
auto_exposure_enabled = false
auto_exposure_scale = 0.4
auto_exposure_min_luma = 0.05
auto_exposure_max_luma = 8.0
auto_exposure_speed = 0.5
ss_reflections_enabled = false
ss_reflections_max_steps = 64
ss_reflections_fade_in = 0.15
ss_reflections_fade_out = 2.0
ss_reflections_depth_tolerance = 0.2
ss_reflections_roughness = true
ssao_enabled = false
ssao_radius = 1.0
ssao_intensity = 1.0
ssao_radius2 = 0.0
ssao_intensity2 = 1.0
ssao_bias = 0.01
ssao_light_affect = 0.0
ssao_ao_channel_affect = 0.0
ssao_color = Color( 0, 0, 0, 1 )
ssao_quality = 0
ssao_blur = 3
ssao_edge_sharpness = 4.0
dof_blur_far_enabled = false
dof_blur_far_distance = 10.0
dof_blur_far_transition = 5.0
dof_blur_far_amount = 0.1
dof_blur_far_quality = 1
dof_blur_near_enabled = false
dof_blur_near_distance = 2.0
dof_blur_near_transition = 1.0
dof_blur_near_amount = 0.1
dof_blur_near_quality = 1
glow_enabled = false
glow_levels/1 = false
glow_levels/2 = false
glow_levels/3 = true
glow_levels/4 = false
glow_levels/5 = true
glow_levels/6 = false
glow_levels/7 = false
glow_intensity = 0.8
glow_strength = 1.0
glow_bloom = 0.0
glow_blend_mode = 2
glow_hdr_threshold = 1.0
glow_hdr_scale = 2.0
glow_bicubic_upscale = false
adjustment_enabled = false
adjustment_brightness = 1.0
adjustment_contrast = 1.0
adjustment_saturation = 1.0
_sections_unfolded = [ "Background", "background_sky" ]

[sub_resource type="PrismMesh" id=9]

custom_aabb = AABB( 0, 0, 0, 0, 0, 0 )
flip_faces = false
left_to_right = 0.5
size = Vector3( 2, 2, 2 )
subdivide_width = 0
subdivide_height = 0
subdivide_depth = 0

[sub_resource type="CubeMesh" id=13]

custom_aabb = AABB( 0, 0, 0, 0, 0, 0 )
flip_faces = false
size = Vector3( 2, 2, 2 )
subdivide_width = 0
subdivide_height = 0
subdivide_depth = 0

[sub_resource type="PhysicsMaterial" id=14]

bounce = 0.999
bounce_combine_mode = 0
friction = 0.0
friction_combine_mode = 2

[sub_resource type="ConvexPolygonShape" id=15]

points = PoolVector3Array( -1, 1, 1, 1, 1, -1, 1, 1, 1, -1, 1, -1, -1, -1, 1, 1, -1, -1, 1, -1, 1, -1, -1, -1, 1, 1, 1, -1, 1, -1, 1, 1, -1, -1, 1, 1, 1, -1, 1, -1, -1, -1, 1, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, 1, -1, 1, 1, 1, -1, 1, 1, 1, -1, -1, -1, -1, -1, 1, -1, 1, -1, -1 )

[sub_resource type="CapsuleMesh" id=5]

custom_aabb = AABB( 0, 0, 0, 0, 0, 0 )
flip_faces = false
radius = 1.0
mid_height = 1.0
radial_segments = 64
rings = 8

[sub_resource type="CapsuleShape" id=6]

radius = 1.0
height = 1.0

[sub_resource type="ProceduralSky" id=7]

radiance_size = 4
sky_top_color = Color( 0.639216, 0, 1, 1 )
sky_horizon_color = Color( 0, 0.67451, 0.580392, 1 )
sky_curve = 0.25
sky_energy = 1.0
ground_bottom_color = Color( 0.101961, 0.145098, 0.188235, 1 )
ground_horizon_color = Color( 0.482353, 0.788235, 0.952941, 1 )
ground_curve = 0.01
ground_energy = 1.0
sun_color = Color( 1, 1, 1, 1 )
sun_latitude = 35.0
sun_longitude = 0.0
sun_angle_min = 1.0
sun_angle_max = 100.0
sun_curve = 0.05
sun_energy = 16.0
texture_size = 2
_sections_unfolded = [ "Sky" ]

[sub_resource type="Environment" id=8]

background_mode = 2
background_sky = SubResource( 7 )
background_sky_custom_fov = 0.0
background_color = Color( 0, 0, 0, 1 )
background_energy = 1.0
background_canvas_max_layer = 0
ambient_light_color = Color( 0, 0, 0, 1 )
ambient_light_energy = 1.0
ambient_light_sky_contribution = 1.0
fog_enabled = false
fog_color = Color( 0.5, 0.6, 0.7, 1 )
fog_sun_color = Color( 1, 0.9, 0.7, 1 )
fog_sun_amount = 0.0
fog_depth_enabled = true
fog_depth_begin = 10.0
fog_depth_curve = 1.0
fog_transmit_enabled = false
fog_transmit_curve = 1.0
fog_height_enabled = false
fog_height_min = 0.0
fog_height_max = 100.0
fog_height_curve = 1.0
tonemap_mode = 0
tonemap_exposure = 1.0
tonemap_white = 1.0
auto_exposure_enabled = false
auto_exposure_scale = 0.4
auto_exposure_min_luma = 0.05
auto_exposure_max_luma = 8.0
auto_exposure_speed = 0.5
ss_reflections_enabled = false
ss_reflections_max_steps = 64
ss_reflections_fade_in = 0.15
ss_reflections_fade_out = 2.0
ss_reflections_depth_tolerance = 0.2
ss_reflections_roughness = true
ssao_enabled = false
ssao_radius = 1.0
ssao_intensity = 1.0
ssao_radius2 = 0.0
ssao_intensity2 = 1.0
ssao_bias = 0.01
ssao_light_affect = 0.0
ssao_ao_channel_affect = 0.0
ssao_color = Color( 0, 0, 0, 1 )
ssao_quality = 0
ssao_blur = 3
ssao_edge_sharpness = 4.0
dof_blur_far_enabled = false
dof_blur_far_distance = 10.0
dof_blur_far_transition = 5.0
dof_blur_far_amount = 0.1
dof_blur_far_quality = 1
dof_blur_near_enabled = false
dof_blur_near_distance = 2.0
dof_blur_near_transition = 1.0
dof_blur_near_amount = 0.1
dof_blur_near_quality = 1
glow_enabled = false
glow_levels/1 = false
glow_levels/2 = false
glow_levels/3 = true
glow_levels/4 = false
glow_levels/5 = true
glow_levels/6 = false
glow_levels/7 = false
glow_intensity = 0.8
glow_strength = 1.0
glow_bloom = 0.0
glow_blend_mode = 2
glow_hdr_threshold = 1.0
glow_hdr_scale = 2.0
glow_bicubic_upscale = false
adjustment_enabled = false
adjustment_brightness = 1.0
adjustment_contrast = 1.0
adjustment_saturation = 1.0
_sections_unfolded = [ "Background", "background_sky" ]

[node name="Root" type="Spatial" index="0"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -0.5, 0 )
_sections_unfolded = [ "Transform" ]

[node name="CameraPivot" type="Spatial" parent="." index="0"]

[node name="Camera" type="Camera" parent="CameraPivot" index="0"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 3.73592 )
keep_aspect = 1
cull_mask = 1048575
environment = SubResource( 12 )
h_offset = 0.0
v_offset = 0.0
doppler_tracking = 0
projection = 0
current = false
fov = 70.0
size = 1.0
near = 0.05
far = 100.0
_sections_unfolded = [ "environment" ]

[node name="MeshInstance" type="MeshInstance" parent="CameraPivot/Camera" index="0"]
transform = Transform( 0.5, 0, 0, 0, -2.18557e-08, 0.5, 0, -0.5, -2.18557e-08, 0, 0, 0 )
layers = 1
material_override = null
cast_shadow = 1
extra_cull_margin = 0.0
use_in_baked_light = false
lod_min_distance = 0.0
lod_min_hysteresis = 0.0
lod_max_distance = 0.0
lod_max_hysteresis = 0.0
mesh = SubResource( 9 )
skeleton = NodePath("..")
material/0 = null

[node name="DirectionalLight" type="DirectionalLight" parent="." index="1"]
transform = Transform( 1, 0, 0, 0, 0.641345, 0.767253, 0, -0.767253, 0.641345, 0, 1.04477, 0 )
layers = 1
light_color = Color( 1, 1, 1, 1 )
light_energy = 1.0
light_indirect_energy = 1.0
light_negative = false
light_specular = 0.5
light_bake_mode = 1
light_cull_mask = -1
shadow_enabled = false
shadow_color = Color( 0, 0, 0, 1 )
shadow_bias = 0.1
shadow_contact = 0.0
shadow_reverse_cull_face = false
editor_only = false
directional_shadow_mode = 2
directional_shadow_split_1 = 0.1
directional_shadow_split_2 = 0.2
directional_shadow_split_3 = 0.5
directional_shadow_blend_splits = false
directional_shadow_normal_bias = 0.8
directional_shadow_bias_split_scale = 0.25
directional_shadow_depth_range = 0
directional_shadow_max_distance = 200.0

[node name="Floor" type="MeshInstance" parent="." index="2"]
transform = Transform( 1, 0, 0, 0, 0.1, 0, 0, 0, 1, 0, -0.5, 0 )
layers = 1
material_override = null
cast_shadow = 1
extra_cull_margin = 0.0
use_in_baked_light = false
lod_min_distance = 0.0
lod_min_hysteresis = 0.0
lod_max_distance = 0.0
lod_max_hysteresis = 0.0
mesh = SubResource( 13 )
skeleton = NodePath("..")
material/0 = null
_sections_unfolded = [ "Transform" ]

[node name="StaticBody" type="StaticBody" parent="Floor" index="0"]
input_ray_pickable = true
input_capture_on_drag = false
collision_layer = 1
collision_mask = 1
friction = 0.0
bounce = 0.999
physics_material_override = SubResource( 14 )
constant_linear_velocity = Vector3( 0, 0, 0 )
constant_angular_velocity = Vector3( 0, 0, 0 )
_sections_unfolded = [ "physics_material_override" ]

[node name="CollisionShape" type="CollisionShape" parent="Floor/StaticBody" index="0"]
shape = SubResource( 15 )
disabled = false

[node name="RigidBody" type="RigidBody" parent="." index="3"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2.31271, 0 )
input_ray_pickable = true
input_capture_on_drag = false
collision_layer = 1
collision_mask = 1
mode = 0
mass = 1.0
friction = 1.0
bounce = 0.0
physics_material_override = null
gravity_scale = 1.0
custom_integrator = false
continuous_cd = false
contacts_reported = 0
contact_monitor = false
sleeping = false
can_sleep = true
axis_lock_linear_x = true
axis_lock_linear_y = false
axis_lock_linear_z = true
axis_lock_angular_x = false
axis_lock_angular_y = false
axis_lock_angular_z = false
linear_velocity = Vector3( 0, 0, 0 )
linear_damp = -1.0
angular_velocity = Vector3( 0, 0, 0 )
angular_damp = -1.0
_sections_unfolded = [ "Axis Lock" ]

[node name="MeshInstance" type="MeshInstance" parent="RigidBody" index="0"]
transform = Transform( 0.3, 0, 0, 0, 0.3, 0, 0, 0, 0.3, 0, 0, 0 )
layers = 1
material_override = null
cast_shadow = 1
extra_cull_margin = 0.0
use_in_baked_light = false
lod_min_distance = 0.0
lod_min_hysteresis = 0.0
lod_max_distance = 0.0
lod_max_hysteresis = 0.0
mesh = SubResource( 5 )
skeleton = NodePath("..")
material/0 = null

[node name="CollisionShape" type="CollisionShape" parent="RigidBody" index="1"]
transform = Transform( 0.3, 0, 0, 0, 0.3, 0, 0, 0, 0.3, 0, 0, 0 )
shape = SubResource( 6 )
disabled = false

[node name="DebugViewport" type="Viewport" parent="." index="4"]
arvr = false
size = Vector2( 256, 256 )
own_world = false
world = null
transparent_bg = false
msaa = 0
hdr = true
disable_3d = false
keep_3d_linear = false
usage = 2
debug_draw = 0
render_target_v_flip = true
render_target_clear_mode = 0
render_target_update_mode = 2
audio_listener_enable_2d = false
audio_listener_enable_3d = false
physics_object_picking = false
gui_disable_input = false
gui_snap_controls_to_pixels = true
shadow_atlas_size = 0
shadow_atlas_quad_0 = 2
shadow_atlas_quad_1 = 2
shadow_atlas_quad_2 = 3
shadow_atlas_quad_3 = 4
_sections_unfolded = [ "Render Target" ]

[node name="Camera" type="Camera" parent="DebugViewport" index="0"]
transform = Transform( 0.258819, 0, 0.965926, 0, 1, 0, -0.965926, 0, 0.258819, 6.75, 1.25, 2.5 )
keep_aspect = 1
cull_mask = 1048575
environment = SubResource( 8 )
h_offset = 0.0
v_offset = 0.0
doppler_tracking = 0
projection = 0
current = true
fov = 70.0
size = 1.0
near = 0.05
far = 100.0

 GDSC   *      I   �     ������������϶��   ����Ҷ��   ������϶   ����������¶   �������϶���   �������Ҷ���   ���Ҷ���   �����������������۶�   ��������۶��   ������������������������۶��   ���������������۶���   ���������׶�   �����������׶���   �������������������۶���   ��������������������������۶   ������������Ҷ��   �������Ŷ���   ����׶��   ����¶��   ���������������������Ҷ�   ���������������Ŷ���   ��������ض��   ��������������ض   ������Ҷ   ����Ŷ��   ̶��   ϶��   ���������Ҷ�   ����¶��   ζ��   ����������������Ҷ��   ����������Ķ   �������������Ӷ�   ����������¶   ��������������¶   ��ζ   ��������ض��   ������������������ض   �������Ķ���   ��������϶��   ������������Ӷ��   �������ض���                     ������#@             jump         	   move_left               
   move_right        move_forward      move_backward                                  )      *      2      3   	   9   
   >      ?      E      M      N      T      \      ]      c      j      k      q      y      z      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *     +     ,     -     .      /   '  0   ,  1   5  2   <  3   B  4   K  5   V  6   W  7   ^  8   g  9   p  :   q  ;   w  <   {  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   6[[;R�  S>�  U[;R�  S>�  �  R�  T�  T�  SU[;R�  S>�  U[[>�  �  RSU[[3�  RSX�  1Y�  U[[3�  RSX�  1�  RSV�  U[[3�	  RSX�  1�  RSV�
  U[[3�  RSX�  1Y�  �  U[[3�  RSX�  1�  RSV�  U[[3�  RSX�  1�  RSV�
  U[[>�  �  U[[3�  R�  SX�  &�  V�  R�  SX�  �  �  U[[3�  R�  SX�  >�  �  RSU�  >�  �  RSU�  >�  Y�  V�
  V�  V�  U�  �  V�  �  U�  �  �  V�  RSU�  >�  Y�  V�
  V�  V�  V�  RSU�  &�  V�  R�  SX�  �  V�  �  U�  �  �  U�  &�  V�  R�  SX�  �  V�  �  U�  �  �  U�  &�  V�  R�	  SX�  �  V�  �  U�  �  �  U�  &�  V�  R�
  SX�  �  V�  �  U�  �  �  U�  �  �  V�  RSU�  �  �  V�  RS�  U[�  �  �  �  U�  �  V�  �  V�  U�  �  V�  �  V�  U[�  &�  RSX�  &�  X�  �  �  V�  RS�  U[�  �  �   R�  T�  V�  RSSU[�  >�!  �"  RSU�  &�!  �  X�  >�#  �  U�  +�#  	�!  X�  >�$  �%  R�#  SU�  &�$  V�&  7�'  X�  �$  V�&  V�(  R�$  V�)  T�  V�  RSSU�  �#  �  U�  �  �  Ub       [gd_scene load_steps=5 format=2]

[ext_resource path="res://Player.gd" type="Script" id=1]
[ext_resource path="res://HybridCamera.gd" type="Script" id=2]

[sub_resource type="CylinderMesh" id=1]

custom_aabb = AABB( 0, 0, 0, 0, 0, 0 )
flip_faces = false
top_radius = 0.3
bottom_radius = 0.3
height = 1.8
radial_segments = 8
rings = 4

[sub_resource type="ConvexPolygonShape" id=2]

points = PoolVector3Array( 0.3, 0, 0, 0.213, 0, 0.213, 0, 0, 0.3, -0.213, 0, 0.213, -0.3, 0, 0, -0.213, 0, -0.213, 0, 0, -0.3, 0.213, 0, -0.213, 0, 0.3, 0 )

[node name="Player" type="KinematicBody"]
input_ray_pickable = true
input_capture_on_drag = false
collision_layer = 1
collision_mask = 1
axis_lock_linear_x = false
axis_lock_linear_y = false
axis_lock_linear_z = false
axis_lock_angular_x = false
axis_lock_angular_y = false
axis_lock_angular_z = false
collision/safe_margin = 0.001
script = ExtResource( 1 )
_sections_unfolded = [ "Transform" ]
speed = 5
gravity = Vector3( 0, -9.8, 0 )
jump_height = 5

[node name="BodyMesh" type="MeshInstance" parent="." index="0"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0.9, 0 )
layers = 2
material_override = null
cast_shadow = 1
extra_cull_margin = 0.0
use_in_baked_light = false
lod_min_distance = 0.0
lod_min_hysteresis = 0.0
lod_max_distance = 0.0
lod_max_hysteresis = 0.0
mesh = SubResource( 1 )
skeleton = NodePath("..")
material/0 = null
_sections_unfolded = [ "Transform" ]

[node name="BodyCollider" type="CollisionPolygon" parent="." index="1"]
transform = Transform( 1, 0, 0, 0, -4.37114e-08, -1, 0, 1, -4.37114e-08, 0, 0.9, 0 )
depth = 1.8
disabled = false
polygon = PoolVector2Array( 0.213, 0.213, 0.3, 0, 0.213, -0.213, 0, -0.3, -0.213, -0.213, -0.3, 0, -0.213, 0.213, 0, 0.3 )
_sections_unfolded = [ "Transform" ]

[node name="Head" type="Position3D" parent="." index="2"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1.65, 0 )
_sections_unfolded = [ "Transform" ]

[node name="HybridCamera" type="Camera" parent="Head" index="0"]
keep_aspect = 1
cull_mask = 1048571
environment = null
h_offset = 0.0
v_offset = 0.0
doppler_tracking = 0
projection = 0
current = true
fov = 70.0
size = 1.0
near = 0.05
far = 100.0
script = ExtResource( 2 )
_sections_unfolded = [ "Transform" ]
camera_mode = 0
tp_offset = Vector3( 0, 0, 5 )
tp_x_inverted = false
tp_y_inverted = false
fp_x_inverted = false
fp_y_inverted = false
tp_sensitivity = Vector2( 0.2, 0.2 )
fp_sensitivity = Vector2( 0.2, 0.2 )

[node name="CollisionShape" type="CollisionShape" parent="." index="3"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1.8, 0 )
shape = SubResource( 2 )
disabled = false
_sections_unfolded = [ "Transform" ]

       [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

radiance_size = 4
sky_top_color = Color( 0.0470588, 0.454902, 0.976471, 1 )
sky_horizon_color = Color( 0.556863, 0.823529, 0.909804, 1 )
sky_curve = 0.25
sky_energy = 1.0
ground_bottom_color = Color( 0.101961, 0.145098, 0.188235, 1 )
ground_horizon_color = Color( 0.482353, 0.788235, 0.952941, 1 )
ground_curve = 0.01
ground_energy = 1.0
sun_color = Color( 1, 1, 1, 1 )
sun_latitude = 35.0
sun_longitude = 0.0
sun_angle_min = 1.0
sun_angle_max = 100.0
sun_curve = 0.05
sun_energy = 16.0
texture_size = 2

[resource]

background_mode = 2
background_sky = SubResource( 1 )
background_sky_custom_fov = 0.0
background_color = Color( 0, 0, 0, 1 )
background_energy = 1.0
background_canvas_max_layer = 0
ambient_light_color = Color( 0, 0, 0, 1 )
ambient_light_energy = 1.0
ambient_light_sky_contribution = 1.0
fog_enabled = false
fog_color = Color( 0.5, 0.6, 0.7, 1 )
fog_sun_color = Color( 1, 0.9, 0.7, 1 )
fog_sun_amount = 0.0
fog_depth_enabled = true
fog_depth_begin = 10.0
fog_depth_curve = 1.0
fog_transmit_enabled = false
fog_transmit_curve = 1.0
fog_height_enabled = false
fog_height_min = 0.0
fog_height_max = 100.0
fog_height_curve = 1.0
tonemap_mode = 0
tonemap_exposure = 1.0
tonemap_white = 1.0
auto_exposure_enabled = false
auto_exposure_scale = 0.4
auto_exposure_min_luma = 0.05
auto_exposure_max_luma = 8.0
auto_exposure_speed = 0.5
ss_reflections_enabled = false
ss_reflections_max_steps = 64
ss_reflections_fade_in = 0.15
ss_reflections_fade_out = 2.0
ss_reflections_depth_tolerance = 0.2
ss_reflections_roughness = true
ssao_enabled = false
ssao_radius = 1.0
ssao_intensity = 1.0
ssao_radius2 = 0.0
ssao_intensity2 = 1.0
ssao_bias = 0.01
ssao_light_affect = 0.0
ssao_ao_channel_affect = 0.0
ssao_color = Color( 0, 0, 0, 1 )
ssao_quality = 0
ssao_blur = 3
ssao_edge_sharpness = 4.0
dof_blur_far_enabled = false
dof_blur_far_distance = 10.0
dof_blur_far_transition = 5.0
dof_blur_far_amount = 0.1
dof_blur_far_quality = 1
dof_blur_near_enabled = false
dof_blur_near_distance = 2.0
dof_blur_near_transition = 1.0
dof_blur_near_amount = 0.1
dof_blur_near_quality = 1
glow_enabled = false
glow_levels/1 = false
glow_levels/2 = false
glow_levels/3 = true
glow_levels/4 = false
glow_levels/5 = true
glow_levels/6 = false
glow_levels/7 = false
glow_intensity = 0.8
glow_strength = 1.0
glow_bloom = 0.0
glow_blend_mode = 2
glow_hdr_threshold = 1.0
glow_hdr_scale = 2.0
glow_bicubic_upscale = false
adjustment_enabled = false
adjustment_brightness = 1.0
adjustment_contrast = 1.0
adjustment_saturation = 1.0

               shader_type spatial;
render_mode unshaded;
uniform sampler2D viewport_texture : hint_albedo;

void fragment()
{
	//highp vec3 col = texture(viewport_texture, SCREEN_UV).rgb;
	//ALBEDO = col;
	ALBEDO = texture(viewport_texture, SCREEN_UV).rgb;
}            GDST@   @       ���m�F��+*�!VZ)�0�     �2
"��+  �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU   �������2+*UU  �0P    �2
"_�� ��]���+*�!@P�.P   �2�!=// ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ �������������. �  �2�!|��� �������2+* ������������ ������������ ������������ ������C�2UUU ���������2U�� ���������2u�� ���������2UV\X ���������2U�5% ���������2]��� ���������2UW� ������C�2UUUT ������������ ������������ ������������ �������2+*PPPP �������2+* ������������ ������������ ������������ ������Ռ�2�� ��������wLTT\\ �������״���� ���������SR�U ���������S��U �������״���� ��������wL55 ������Ռ�2TTVV ������������ ������������ ������������ �������2+*PPPP �������2+* ������������ ���������2U�5� ���������2U`
� ���������2�%�� ��������wL\VUU �������״���� �������״���� �������״���� �������״���� ��������wL5�UU ���������2WX� ���������2U	�� ���������2UV\r ������������ �������2+*PPPP �������2+* ���������2UU� ��������PK���� �������״���� ������mwLXUUU �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� ������mwL%UUU �������״���� ��������PKK�?? ���������2UUVT �������2+*PPPP �������2+* ��������2UUU ���������2��� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� ���������2/�Kr ��������2TUUU �������2+*PPPP �������2+* ������������ ���������2���� �������״���� ���������Z��C ��������B� �U ��������wLUW\Z ��������wLUUU5 ��������wLUUU\ ��������wLU�5� ��������B
 �U ���������Z���� �������״���� ���������2RRRR ������������ �������2+*PPPP �������2+* ������������ ���������2���� �������״���� ��������Bbc� ������X�BUUU> �������wLQS\T ��������wL5555 ��������wL\\\\ �������wLE�5 ������X�BUUU� ��������B���� �������״���� ���������2RRRR ������������ �������2+*PPPP �������2+* ������������ ���������2���� �������״���� ������=�wL5UUU ��������wL�UUU ������wLwL     ��������wL5�UU ��������wL\WUU ������wLwL     ��������wLUUU ������=�wL\UUU �������״���� ���������2RRRR ������������ �������2+*PPPP �������2+* ������������ ���������2�� ��������wL�
UU ��������wL~ -% �������TwLUUUV ��������wLU� ��������wLU� V ��������wLU� � ��������wLUWTT �������TwLUUU� ��������wL� xX ��������wL*�UU ���������2PPRR ������������ �������2+*PPPP �������2+* ������������ ���������2�%5 ������=�wLUUWT ��������wL%5�U ��������wLW �U ��������wL(
U ������;�wLTVWU ������;�wL��U ��������wLT(�U ��������wL� �U ��������wLX\WU ������=�wLUU� ���������2RX\T ������������ �������2+*PPPP �������2+* ������������ ������s|�2UUU ���������2��5 ��������wLUUWx �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� ��������wLUU�- ���������2/�p\ ������s|�2TUUU ������������ �������2+*PPPP �������2+* ������������ ������������ �������:�2?��� ���������2�UU ���������2� �U ���������2�� � ��������wLUU � ��������wLUU  ���������2�� W ���������2� zU ���������2�^UU �������:�2���� ������������ ������������ �������2+*PPPP�/    �2�!/-= ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ �������������/  @ 
 �2�!��x|��o�6j�+*�!AP�0    �
�2
" +�� �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU �������2+*  UU�0     5�2
" ��_����m�+*�!PPA'�������2�!�- �������2+*U    �������2+*U    �������2+*U    �������2+*U    �������2+*U    �������2+*U   '�!���?�2�!Wx�� �������2+* ������������ ���������2��� ������zƮ2rJ� ������zƮ2���� ���������2WPss ������������ �������2+*@@@@ �������c+*���= �������֮2�!�� ������߮:���� �������״���� �������״���� ������߮:k/�� �������֮2{H/? �������c+*| ������PK+*=��� ������Ϯ2���� ��������IJ��Z ������{�wLUUW� ������{�wLUU� ��������IJ��� ������Ϯ2?�OO ������PK+*| �������2+* ������Ϯ2���� ��������B\ҋ� ��������wL�U ��������wL��VU ��������B5��� ������Ϯ2OOOO �������2+*@@@@ �������2+* ���������2��� ������^�wLXQ�� ��������wL��rZ ��������wL_b�� ������^�wL%EJ_ ���������2@Ooo �������2+*@@@@ �������2+* �������֮2�UU �������Ʈ2���� ������z�wLUU_
 ������z�wLUU�� �������Ʈ2���W �������֮2STUU �������2+*@@@@(�����o0�2�!-� �������2+*   U �������2+*   U �������2+*   U �������2+*   U �������2+*   U �������2+*   U(���®2�!�`x�O�ȟ�����2
"� ������y�l2UU�# ������y�l2UUc�O��?����2
"z��� ��������l2%��� ������ڕwL^UU� ������ڕwL�UU/ ��������l2XrRZ ������ڕl2��%� ������[��R&�(� ������[��R��(� ������ڕl2ZZXZO�������x��!=��U ������y�l2�UU ������y�l2��UUO������x�
"|U���������lL*U%����������lL*UXB@��������y}L*)-U�������y}L*h@xU�������u�2}��}            [remap]

importer="texture"
type="StreamTexture"
path.s3tc="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.s3tc.stex"
path.etc2="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.etc2.stex"

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.s3tc.stex", "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.etc2.stex" ]

[params]

compress/mode=2
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=true
flags/filter=true
flags/mipmaps=true
flags/anisotropic=false
flags/srgb=1
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
             [remap]

path="res://AutoRotate.gdc"
           [remap]

path="res://DimensionCube.gdc"
        [remap]

path="res://HybridCamera.gdc"
         [remap]

path="res://Player.gdc"
               �PNG

   IHDR   @   @   �iq�  qIDATx��{pTU����~���I�A	$2$�H E, 
(�>��ؙ\vvqtwj�ف�}��H�S�̨�*����0��
��S^�
B!$��t������!��N��t�_U�n�9�;������sסO�'}��QA!~'i�E�Dw2��P��w=�%EY}���c�˕�ɢ�!u�$m�)��qz�ȷD�~F����y��ly���n\s�i�}�����$!�Pi��4:$YF�V��g%H0��u��� *�.����zr�W֥Ô���V-���>��Z�G�d�����B I2*��FK��A� !��_�#1��'��:� �MH��V�ܯ~\mV���-�HZYZ(@Vk���H�
�V�@�ZYZ(Ձd��V����akPxP�������:[�$�����KJ00u|	�Y�^��43u|	I	�7��U ��������=e<��*bX�@�(�¦���C��ŢG�[6!AE���%v)g���X[�EϘ;�hh�L徱E!Q^�ʻ{�9|��qy&�*�����OEu]�r��Y�-�Ⱥ�8x����F�2����,���u��n�ɩs�1�7�H���w�/���/��x=��3���ɜ�y����ov)���������%\� ��6��%-A�̒L�����y<��JZ�Θ��i޴��HN�g�;�x{Ou��� �r���;�L�@3�Ņ�3f�������<����%�"91�iG�R�ض ����8�L��2��cu̽+��/[��}��˖�u!�tȼ��XS�]k�	:5�������3��t��ڝ��W������(�]�7uĊ�:��� �
��֨ew��#VD��j���L�NO��Z��CfG���N}�Q��_>�ߟ6�݇��ݻ��t�
z���/z��&�Mu���F[Ԋ�Fe���&;���S����͍�<^����9L�= ��c+���\1bړ
���6��?������_�������%���wSZ\@^N&�y���*7oiT�`^� ����z�<���'��{�/`Ъ��������x��;��r4[�eFR��b�̛�ί/�v� v�n�G�����qx�,�t��5�}2�7�A�u�/p���{x�e�Y�e��9�9�'�X2o&��>?p�W��� �dֿ�sj��<���@ׯ�o���	P���yё��Ǡ��l�wy���}l����l�WZB��h�v�˗�C�լ�v��� ���o�x��W7�|�U�N#�j�/�׫���=��qŅ���*�B��#�mn��k��=�4lް���E���'b�����\�:��6_X44Y�6�1� ��{;3� �lSM�']a��ǻ)��a�LML�OLK�P^YÇ��7��� ���:Ԓ�s�T���QK
���:�����(p��
����ݹ)��ҺՔ��;7�W�n�bÕ^�G4�ӧ{Y��2��=�Ѫ$��CI��AC����c���z����df��dHZ�/�k���`m�+ǁ�8�>?�toD�#^�u���8/�E�1 ��ƽ��ܓ�ʻ{����ͅ�����\`����J�(+�������hvz{(�T<��`Oq�ed�8w��-f��G���l6n�Ȃ���HY.=QGzb�����,�������l��~�ŋs��9��q,-+�F��sH,^�b�n7�~����� 8�N^�u����������dV/,e��RJ����Oaf߾�����8��A����,��r�n7����{8���b@AEE��[��]�< ���|s�$�$A�9�������}�X,TTT �`pJ���쀦k�O�V2]���d�~�ds�ф�{t��d�{|��hlss���|

��.%Ib����>v���̙3���*����ū���Ob�
+����2����b�op���<��̝�q�ͬX����HO7S�@+W�@A��'�P=6A�3m����xfZ���!pz�l=ZǺ��!��=�������yj�`^x�e�4*E��e�>��*K������p���O��
�Z����9|�`�ח1^[_�8u9d_@a͞j��&˨�j���B�Yb�7��z5�PX�eM�r#�y3��'�b@�-@����Q�I�Ë�����\�쥢������e$�(�H�d�`2h04�����j����r����7ٹb�`4h�I�c� c�<-.~�ցee%1:��c:���fN��|`ţ%dܰ(�j�`ux9��ƀ-9ƞm7Up��*�����x��O�?��Ia�?�@٦���RY��P������_Tauxivt]��=��؋%��|� *��r���uV%�Ft*	w���,	2���l�;+�����|J�R�%A ��N%��%ꬮ�A�,��C����lms`��9,f���
���7�ʜ�C%K�\qt�7��\q��%�7��a����.u��h���j�-��BÇ���n��7�UO|s�������iq�P�}к0{i�?4! 9N�A�"N�U͎�B1<#���z�������)&��=�2�8U߽����2No��x�
�V�ɠ!��s�^�U���K=wp�Z�:<��khs�hluc���:�8<~?W�^v�m
Y�(+�Lck���Ԭ�7G�5����3�s�v~��I���ǐ�<�����~(�xk���ǋk61,#��(�v:G-D{$xXF"/��ԫ���0�c�1r�SY2o&*Y���g�m+<RT��_�c�p3�}����EW>�
Wo����ҧf�o��՝���[��f���O��m2���-�����eȩy#�@��<�t���5L9���C�����r?O�����lb��!�pR�--,e-�v�J���>TF�	�B�R�Y�3����i����t#'j[8Uߊ�~W&Rtj���$�s��2�Lj���6;�?���>��?�%rG'�'t��e&�UĬ)�_2�,*TYlT_qP�좱͍��M�ˇ� Th�vL.I�F�z�L�^MZ�s��,���IK@��@�/��a�_��H9���;8���VMqa.%����#7�L�)��'���T�5r��y�WTs�L5�(z�pDuF(�O�������4j�&2R�$���kQIƤ�p���N ����fw���LC��/�9�͢RP��(J�������[���op+P�����B=�_&���i�B��t���w����a��k�.	X�(J��q}'ZA0���q�(J@�j���5jԨUw|d�!�m�J�?n{(
N����s�o�~�]��S}|�dP�=.%�B�;��h��Y?>����Bvۮ��o=,�i]��IZ�w��˳��lY��u���NCWj^��.%e���O-T&�(:��s������|�3�y?��c�ٓ��Z}�s�����J~u�qK    IEND�B`�      ECFG      _global_script_classes             application/config/name         DimensionPortal    application/run/main_scene         res://Main.tscn    application/config/icon         res://icon.png     input/ui_accept�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script               InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script               InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode             unicode              echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device               button_index             pressure          pressed           script            input/ui_selectD              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode             unicode              echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device               button_index            pressure          pressed           script            input/ui_cancelD              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device               button_index            pressure          pressed           script            input/ui_focus_nextp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/ui_focus_prevp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift            control           meta          command           pressed           scancode           unicode              echo          script            input/ui_leftD              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device               button_index            pressure          pressed           script            input/ui_rightD              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device               button_index            pressure          pressed           script            input/ui_upD              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device               button_index            pressure          pressed           script            input/ui_downD              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device               button_index            pressure          pressed           script            input/ui_page_upp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/ui_page_downp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/ui_homep              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/ui_endp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/move_forwardp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  W          unicode              echo          script            input/move_backwardp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  S          unicode              echo          script            input/move_leftp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  A          unicode              echo          script            input/move_rightp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  D          unicode              echo          script            input/toggle_mousep              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script            input/toggle_camera_modep              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  V          unicode              echo          script         
   input/jumpp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode             unicode              echo          script            input/crouchp              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode           unicode              echo          script         )   rendering/environment/default_environment          res://default_env.tres  GDPC