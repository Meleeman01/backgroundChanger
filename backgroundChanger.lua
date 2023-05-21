--background Changer lua
local file = require "lfs"
local cjson = require "cjson"
local argparse = require "argparse"

local parser = argparse("BackGround changer", "By default picks a random image in a designated folder");

parser:flag("-n --next", "next picture in list")
parser:flag("-p --previous", "previous picture in list")

local args = parser:parse()

if args.next then 
	print('next index here.');
end

if args.previous then
	print('previous index here');
end

if args.next == nil and args.previous == nil then
	print('no args');
end

file.chdir('/home/meleeman/Pictures/bg-pics');
local pictures = {};
local count = 0;
print(file.currentdir());

for file in lfs.dir(file.currentdir()) do
    if string.find(file,'.jpg') or string.find(file,'.png') then
        --print(file)
        table.insert(pictures,file);
    end
end

for key,value in pairs(pictures) do 
	print(key,value);
end

local json = cjson.encode(pictures);

local a = io.open("pictures.json","w");
a:write(json);
a:close();


print('lol');