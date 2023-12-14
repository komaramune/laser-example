# ディスプレイをtp
tp @s ~ ~ ~

# execute幾何学で、縦角度[-90~90]⇒横角度[0~180]に変換して、倒す角度特定
execute rotated -90 ~ positioned 0.0 0.0 0.0 positioned ^ ^ ^1 rotated ~90 ~ positioned ^ ^1 ^ facing 0.0 ~ 0.0 run tp @e[tag=laser_marker,limit=1] 0.0 0.0 0.0 ~ ~
execute store result storage laser: left_rotation.angle float 0.000001745 run data get entity @e[tag=laser_marker,limit=1] Rotation[0] 10000

# 倒す軸方向ベクトル特定
execute positioned 0.0 0.0 0.0 run tp @e[tag=laser_marker,limit=1] ^1 ^ ^ ~ ~
data modify storage laser: left_rotation.axis set from entity @e[tag=laser_marker,limit=1] Pos

# right_rotationの角度を特定
execute store result storage laser: right_rotation.angle float 0.000001745 run data get entity @e[tag=laser_marker,limit=1] Rotation[0] 10000
data modify storage laser: right_rotation.axis set value [0f,-1f,0f]

# 変形反映
data modify entity @s transformation.left_rotation set from storage laser: left_rotation
data modify entity @s transformation.right_rotation set from storage laser: right_rotation

# ブロックディスプレイのアニメーション補完のバグ回避のためにshadow_radiusを書き換えている
# アイテムディスプレイの場合は必要ない
execute store success entity @s shadow_radius float -1 if data entity @s {shadow_radius:0f}

# アニメーション補完
data modify entity @s start_interpolation set value 0

# 処理済みタグ付与
tag @s add laser_rotated