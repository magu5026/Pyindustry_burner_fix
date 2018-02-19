local function make_void_recipe(name,newicons,ing)
    local recipe = 
		{
			name = name,
			type = "recipe",
			icons = newicons,
			icon_size = 32,
			hidden = true,
			enabled = true,
			flags = {"hidden"},
			category = "py-incineration",
			ingredients = {{ing,1}},
			results = {{type="fluid", name="water", amount=0}},
			subgroup = "py-void"			
        }
	data:extend({recipe})
end

local recipetypes = 
	{
		data.raw.ammo,
		data.raw.armor,
		data.raw.item,
		data.raw.gun,
		data.raw.capsule,
		data.raw.module,
		data.raw.tool,
		data.raw["rail-planner"],
		data.raw["repair-tool"],
		data.raw["mining-tool"]
	}

for _,item in pairs(recipetypes) do 
	for _, item in pairs(item) do
		local name = item.name .. "-pyvoid"
		local newicons
		if item.icons then
			newicons = table.deepcopy(item.icons)
		else
			newicons = {{icon = item.icon}}
		end
		table.insert(newicons, {icon = "__pyindustry_burner_fix__/graphics/no.png"})
		make_void_recipe(name,newicons,item.name)
	end
end