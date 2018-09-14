--My code is really really really really bad I know, I am not confortable with lua
--and once I got it working I stopped touching it


commands = {"Default"}
lastCommand = ''
count = 10
oldItem = 255

GSUB = string.gsub --faster than OOP :gsub
memory.usememorydomain("RDRAM")

rupees = memory.read_s16_be(0x11A604)

hearts = memory.read_s16_be(0x11A600)

--print("Rupees: ", rupees)

while true do
	if count > 10 then
		print("Update")
		count = 0
		local open = io.open
		local path = 'Command.txt'
		local file = open(path, "rb")
		local content = file:read "*all"
		local address = content:sub(-2,-1)
		file:close()
		if content ~= lastCommand and content ~= nil then
			lastCommand = content

			content = GSUB(content, "\n", "")
			content = GSUB(content, " ", "")
			address = GSUB(address, "\n", "")
			address = GSUB(address, " ", "")
			address = tonumber(address) or tonumber(address:match("%-?%d+%.?%d*"))
			content = content:sub(1,2)
			--print(content)

			if rupees < 0 then
				rupees = 0
				memory.write_s16_be(0x11A604, rupees)
			end

			content = tonumber(content)
			--print(content)
			--print(address)
			--Sorry I don't know how to store a RAM address into a variable, I only
			--just learned lua
			if address == -3 and  memory.read_s16_be(0x11A600) > 5 then
				print("Updated hearts")
				hearts = memory.read_s16_be(0x11A600)
				hearts = hearts + content
				memory.write_s16_be(0x11A600, hearts)
			elseif address == -2 then
				print("Updated rupees")
				rupees = memory.read_s16_be(0x11A604)
				--print(rupees)
				--print(content)
				rupees = rupees + content
				memory.write_s16_be(0x11A604, rupees)
			elseif address == -1 then
				--Time, cycles from 0 to 65530
				print("Updated time")
				memory.write_s16_be(0x11A5DC, content*660)
			elseif address == 0 then
				--Randomize tunic
				print("Updated tunic")
				memory.writebyte(0x11A640, content)
				--print("")
				--print("0x11A640")
				--print(content)
			elseif address == 1 and memory.readbyte(0x11A644) ~= 255 then
				oldItem = memory.readbyte(0x11A644)
				if content < 0 then
					content = 00
				end
				memory.writebyte(0x11A644, content)
			elseif address == 2 and memory.readbyte(0x11A645) ~= 255 then
				oldItem = memory.readbyte(0x11A645)
				if content < 0 then
					content = 01
				end
				memory.writebyte(0x11A645, content)
			elseif address == 3 and memory.readbyte(0x11A646) ~= 255 then
				oldItem = memory.readbyte(0x11A646)
				if content < 0 then
					content = 02
				end
				memory.writebyte(0x11A646, content)
			elseif address == 4 and memory.readbyte(0x11A647) ~= 255 then
				oldItem = memory.readbyte(0x11A647)
				if content < 0 then
					content = 03
				end
				memory.writebyte(0x11A647, content)
			elseif address == 5 and memory.readbyte(0x11A648) ~= 255 then
				oldItem = memory.readbyte(0x11A648)
				if content < 0 then
					content = 04
				end
				memory.writebyte(0x11A648, content)
			elseif address == 6 and memory.readbyte(0x11A649) ~= 255 then
				oldItem = memory.readbyte(0x11A649)
				if content < 0 then
					content = 05
				end
				memory.writebyte(0x11A649, content)
			elseif address == 7 and memory.readbyte(0x11A64A) ~= 255 then
				oldItem = memory.readbyte(0x11A64A)
				if content < 0 then
					content = 06
				end
				memory.writebyte(0x11A64A, content)
			elseif address == 8 and memory.readbyte(0x11A64B) ~= 255 then
				oldItem = memory.readbyte(0x11A64B)
				if content < 0 then
					content = 07
				end
				memory.writebyte(0x11A64B, content)
			elseif address == 9 and memory.readbyte(0x11A64C) ~= 255 then
				oldItem = memory.readbyte(0x11A64C)
				if content < 0 then
					content = 09
				end
				memory.writebyte(0x11A64C, content)
			elseif address == 10 and memory.readbyte(0x11A64D) ~= 255 then
				oldItem = memory.readbyte(0x11A64D)
				if content < 0 then
					content = 10
				end
				memory.writebyte(0x11A64D, content)
			elseif address == 11 and memory.readbyte(0x11A64E) ~= 255 then
				oldItem = memory.readbyte(0x11A64E)
				if content < 0 then
					content = 12
				end
				memory.writebyte(0x11A64E, content)
			elseif address == 12 and memory.readbyte(0x11A64F) ~= 255 then
				oldItem = memory.readbyte(0x11A64F)
				if content < 0 then
					content = 13
				end
				memory.writebyte(0x11A64F, content)
			elseif address == 13 and memory.readbyte(0x11A650) ~= 255 then
				oldItem = memory.readbyte(0x11A650)
				if content < 0 then
					content = 14
				end
				memory.writebyte(0x11A650, content)
			elseif address == 14 and memory.readbyte(0x11A651) ~= 255 then
				oldItem = memory.readbyte(0x11A651)
				if content < 0 then
					content = 15
				end
				memory.writebyte(0x11A651, content)
			elseif address == 15 and memory.readbyte(0x11A652) ~= 255 then
				oldItem = memory.readbyte(0x11A652)
				if content < 0 then
					content = 16
				end
				memory.writebyte(0x11A652, content)
			elseif address == 16 and memory.readbyte(0x11A653) ~= 255 then
				oldItem = memory.readbyte(0x11A653)
				if content < 0 then
					content = 17
				end
				memory.writebyte(0x11A653, content)
			elseif address == 17 and memory.readbyte(0x11A654) ~= 255 then
				oldItem = memory.readbyte(0x11A654)
				if content < 0 then
					content = 18
				end
				memory.writebyte(0x11A654, content)
			elseif address == 18 and memory.readbyte(0x11A655) ~= 255 then
				oldItem = memory.readbyte(0x11A655)
				if content < 0 then
					content = 19
				end
				memory.writebyte(0x11A655, content)
			elseif address == 19 and memory.readbyte(0x11A656) ~= 255 then
				oldItem = memory.readbyte(0x11A656)
				if content < 0 then
					content = 20
				end
				memory.writebyte(0x11A656, content)
			elseif address == 20 and memory.readbyte(0x11A657) ~= 255 then
				oldItem = memory.readbyte(0x11A657)
				if content < 0 then
					content = 20
				end
				memory.writebyte(0x11A657, content)
			elseif address == 21 and memory.readbyte(0x11A658) ~= 255 then
				oldItem = memory.readbyte(0x11A658)
				if content < 0 then
					content = 20
				end
				memory.writebyte(0x11A658, content)
			elseif address == 22 and memory.readbyte(0x11A659) ~= 255 then
				oldItem = memory.readbyte(0x11A659)
				if content < 0 then
					content = 20
				end
				memory.writebyte(0x11A659, content)
			end
			if address > 0 then
				print("Updated items")
				--print(memory.readbyte(0x11A639))
				--print(oldItem)
				--Make arrows and bow+arrows the same number
				if oldItem == 4 then
					oldItem = 56
				elseif oldItem == 12 then
					oldItem = 57
				elseif oldItem == 18 then
					oldItem = 58
				end

				if memory.readbyte(0x11A639) == oldItem then
					--Auto equip new item (glitchy icons)
					--memory.writebyte(0x11A639, content)
					--Un equip old item
					memory.writebyte(0x11A639, 255)
				end
				if memory.readbyte(0x11A63A) == oldItem then
					--memory.writebyte(0x11A63A, content)
					memory.writebyte(0x11A63A, 255)
				end
				if memory.readbyte(0x11A63B) == oldItem then
					--memory.writebyte(0x11A63B, content)
					memory.writebyte(0x11A63B, 255)
				end
			end
		end
	end
	--print(count)
	count = count + .01
	--Tunic Color
	emu.frameadvance()
	--os.remove('Command.txt')
end
