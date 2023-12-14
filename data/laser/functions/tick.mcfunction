# 計算用マーカー召喚
summon marker ~ ~ ~ {Tags:["laser_marker"]}

# スニークしているプレイヤーにファンクションを実行
execute as @a at @s anchored eyes positioned ^ ^ ^ positioned ~ ~-1.27 ~ if entity @s[distance=..0.0001] at @s anchored eyes positioned ^0.05 ^0.15 ^ positioned ~ ~-0.2 ~ run function laser:every_player

# 計算用マーカー削除
kill @e[tag=laser_marker]

# 処理されなかったディスプレイをkill
kill @e[tag=laser,tag=!laser_rotated]

# 処理済みタグ削除
tag @e[tag=laser] remove laser_rotated