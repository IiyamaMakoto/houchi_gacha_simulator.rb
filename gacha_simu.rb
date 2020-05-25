def setting_select
  while true
    puts "ガチャを選択してください"
    puts "1. UR閃ガチャ　　　　　（必要絆180、ラッキーバフ）"
    puts "2. ラッキースターガチャ（必要絆120、ラッキーバフ）"
    puts "3. UR閃アバターガチャ　（必要絆120、チケットなし）"
    puts "4. UR閃アバターガチャ　（必要絆120、チケット幸運券のみ）"
    puts "5. UR閃アバターガチャ　（必要絆120、チケット割引券9枚＋幸運券セット）"
    puts "6. URアバターガチャ　　（必要絆60、チケットなし）"
    puts "7. URアバターガチャ　　（必要絆60、チケット幸運券のみ）"
    puts "8. URアバターガチャ　　（必要絆60、チケット割引券9枚＋幸運券セット）"
    puts "9. 終了する"
    input = gets.to_i
    if input < 1 && input > 9
      puts "正しい数値を入力してください"
      puts "--------------------------------------------------"
    else
      if input == 1
        need_bonds = 180
        once_bonds = 2
        tenth_bonds = 5
        once_genpou = 300
        tenth_genpou = 300
        bonds_rate = 8
        double_buff_rate = 15
        five_buff_rate = 2
      elsif input == 2
        need_bonds = 120
        once_bonds = 2
        tenth_bonds = 6
        once_genpou = 300
        tenth_genpou = 300
        bonds_rate = 8
        double_buff_rate = 15
        five_buff_rate = 2
      elsif input == 3
        need_bonds = 120
        once_bonds = 2
        tenth_bonds = 5
        once_genpou = 300
        tenth_genpou = 300
        bonds_rate = 8
        double_buff_rate = 0
        five_buff_rate = 0
      elsif input == 4
        need_bonds = 120
        once_bonds = 2
        tenth_bonds = 10
        once_genpou = 300
        tenth_genpou = 300
        bonds_rate = 8
        double_buff_rate = 0
        five_buff_rate = 0
      elsif input == 5
        need_bonds = 120
        once_bonds = 2
        tenth_bonds = 10
        once_genpou = 240
        tenth_genpou = 300
        bonds_rate = 8
        double_buff_rate = 0
        five_buff_rate = 0
      elsif input == 6
        need_bonds = 60
        once_bonds = 2
        tenth_bonds = 5
        once_genpou = 300
        tenth_genpou = 300
        bonds_rate = 8
        double_buff_rate = 0
        five_buff_rate = 0
      elsif input == 7
        need_bonds = 60
        once_bonds = 2
        tenth_bonds = 10
        once_genpou = 300
        tenth_genpou = 300
        bonds_rate = 8
        double_buff_rate = 0
        five_buff_rate = 0
      elsif input == 8
        need_bonds = 60
        once_bonds = 2
        tenth_bonds = 10
        once_genpou = 240
        tenth_genpou = 300
        bonds_rate = 8
        double_buff_rate = 0
        five_buff_rate = 0
      end
      setting = {
        need_bonds: need_bonds,
        once_bonds: once_bonds,
        tenth_bonds: tenth_bonds,
        once_genpou: once_genpou,
        tenth_genpou: tenth_genpou,
        bonds_rate: bonds_rate,
        double_buff_rate: double_buff_rate,
        five_buff_rate: five_buff_rate
      }
    return setting
    end
  end
end

def try_setting
  puts "試行回数を入力してください"
  input = gets.to_i
end

def gacha(setting)
  gacha_num = 0
  genpou = 0
  bonds = 0
  buff = 1
  while bonds < setting[:need_bonds] do
    gacha_num += 1
    if gacha_num % 10 == 0
      bonds += setting[:tenth_bonds]
      genpou += setting[:tenth_genpou]
    else
      bond_dice = rand(1..100)
      if bond_dice <= setting[:bonds_rate]
        bonds += setting[:once_bonds] * buff
      end
      genpou += setting[:tenth_genpou]
    end
    buff_dice = rand(1..100)
    if buff_dice <= setting[:double_buff_rate]
      buff = 2
    elsif buff_dice <= setting[:five_buff_rate] + setting[:double_buff_rate]
      buff = 5
    else
      buff = 1
    end
  end
  result = {gacha_num: gacha_num, genpou: genpou}
  return result
end

setting = setting_select

try_times = try_setting

try_times.times do
  result = gacha(setting)
  # puts "#{result[:gacha_num]}連　#{result[:genpou]}元宝"
  puts result[:genpou]
end
