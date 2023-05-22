-- set_paths.lua
local version = _VERSION:match("%d+%.%d+")
package.path = 'rocks/share/lua/' .. version .. '/?.lua;lua_modules/share/lua/' .. version .. '/?/init.lua;' .. package.path
package.cpath = 'rocks/lib/lua/' .. version .. '/?.so;' .. package.cpath

print('setting up paths.');
