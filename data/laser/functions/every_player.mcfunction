# 近くにディスプレイが無ければ召喚
execute unless entity @e[tag=laser,tag=!laser_rotated,limit=1,distance=..1] run summon minecraft:block_display ~ ~ ~ {Tags:["laser"],block_state:{Name:"red_stained_glass"},interpolation_duration:1,teleport_duration:1,transformation:{right_rotation:{axis:[0f,-1f,0f],angle:0},scale:[0.1f,50f,0.1f],left_rotation:{axis:[1f,0f,0f],angle:0},translation:[0f,0f,0f]},brightness:{block:15,sky:15}}

# 近くのディスプレイにファンクション実行
execute as @e[tag=laser,tag=!laser_rotated,sort=nearest,limit=1,distance=..1] run function laser:every_display