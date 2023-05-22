--background Changer lua
local file = require "lfs"
local cjson = require "cjson"
local argparse = require "argparse"
local parser = argparse("BackGround changer", "By default picks a random image in a designated folder");

parser:flag("-n --next", "next picture in list")
parser:flag("-p --previous", "previous picture in list")

local args = parser:parse()
-----------------------------------------------------------------
local count = 0;
local pictures = {};
local index = nil;
local previousList = {};

--make sure we have the correct working directory;
file.chdir('/home/meleeman/Pictures/bg-pics');


for file in lfs.dir(file.currentdir()) do
    if string.find(file,'.jpg') or string.find(file,'.png') or string.find(file,'.webp') then
    	count = count+1;
    	print(count,file);
        pictures[count] = file;
    end
end
function checkIndexWithList(index,previousList,currentList)
	if index == nil or previousList == nil or currentList == nil then
		print('all args must be present and not nil');
		return
	end

	if previousList[tostring(index)] == currentList[index] then
		return true;
	else
		return false;
	end
	
end

-- Open the file in read mode
local jsonData = io.open("pictures.json", "r")

if file then
  -- Read the entire contents of the file
  local contents = jsonData:read("*a")

  -- Print the contents of the file

  index = tonumber(cjson.decode(contents)['currentIndex']);


  previousList = cjson.decode(contents);
  
  -- Close the file
  jsonData:close()
else
  -- Handle the case when the file could not be opened
  print("Failed to open pictures.json file.")
end

--now that the pictures are in a nice indexed table we can handle the options.
if checkIndexWithList(index,previousList,pictures) == false then
	print('list has changed, setting to random');
	index = nil;
end

if args.next and index ~= nil then 
	
	if index+1 > count then
		index = 1;
	else
		index = index + 1
	end
	print(pictures[index])
	print(index);
	local handle = os.execute('feh --bg-scale '..file.currentdir()..'/'..pictures[index])
  	pictures.currentIndex = index;
end

if args.previous and index ~= nil then
	print('previous index here');
	if index-1 < 1 then
		index = count;
	else
		index = index - 1
	end
	print(pictures[index])
	print(index);
	local handle = os.execute('feh --bg-scale '..file.currentdir()..'/'..pictures[index])
  	pictures.currentIndex = index;
end

if args.next == nil and args.previous == nil then
	--we should pull the original index from the json and see if it matches the new list 
	math.randomseed(os.time())

	local randomIndex = math.random(1, count)

	--select a random index
	if previousList.currentIndex == randomIndex then
		if randomIndex + 1 > count then
			randomIndex = 1
		else
			randomIndex = randomIndex + 1;
		end
	end
	

	index = randomIndex;

	print(pictures[randomIndex]);
	print('currentIndex: '..index)
	local handle = os.execute('feh --bg-scale '..file.currentdir()..'/'..pictures[randomIndex]);
  	pictures.currentIndex = index;
end







local json = cjson.encode(pictures);

local a = io.open("pictures.json","w");
a:write(json);
a:close();


