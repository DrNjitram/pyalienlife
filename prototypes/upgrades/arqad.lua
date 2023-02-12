local FUN = require '__pycoalprocessing__/prototypes/functions/functions'

if data then
    for i, recipe in pairs({
        table.deepcopy(data.raw.recipe['arqad-egg-1']),
        table.deepcopy(data.raw.recipe['arqad-egg-2']),
        table.deepcopy(data.raw.recipe['arqad-egg-3']),
        table.deepcopy(data.raw.recipe['arqad-egg-4']),
        table.deepcopy(data.raw.recipe['arqad-egg-5']),
    }) do
        recipe.name = recipe.name .. '-cold'
        FUN.add_ingredient(recipe, {type = 'fluid', name = 'purest-nitrogen-gas', amount = 100})
        for _, result in pairs(recipe.results) do
            if result.name == 'arqad-queen' then
                result.probability = 0.995
                break
            end
        end
        data:extend{recipe}
    end

    for recipe, result_name in pairs({
        [table.deepcopy(data.raw.recipe['wax'])] = 'wax',
        [table.deepcopy(data.raw.recipe['wax-honeycomb'])] = 'wax',
        [table.deepcopy(data.raw.recipe['honey-comb'])] = 'arqad-honey',
    }) do
        recipe.name = recipe.name .. '-buffed'
        FUN.multiply_result_amount(recipe, result_name, 2)
        data:extend{recipe}
    end

    data:extend{
        {
            type = 'item',
            name = 'cags',
            icon = '__pyalienlifegraphics3__/graphics/icons/cags.png',
            icon_size = 64,
            stack_size = 50,
            subgroup = 'py-alienlife-arqad'
        },
        {
            type = 'recipe',
            name = 'cags',
            result = 'cags',
            ingredients = {
                {'steel-plate', 10},
                {'niobium-plate', 10},
                {'cellulose', 10},
                {'latex', 10},
                {'plastic-bar', 10},
                {'melamine', 10},
                {'glass', 10},
                {'silver-plate', 10},
                {type = 'fluid', name = 'creamy-latex', amount = 50},
            },
            category = 'crafting-with-fluid',
            energy_required = 10,
            enabled = false
        }
    }

    local machine_recipe = table.deepcopy(data.raw.recipe['arqad-hive-mk01'])
    machine_recipe.name = machine_recipe.name .. '-with-cags'
    FUN.add_ingredient(machine_recipe, {name = 'cags', amount = 10, type = 'item'})
    FUN.remove_ingredient(machine_recipe, 'glass')
    data:extend{machine_recipe}

    local ez_queen = table.deepcopy(data.raw.recipe['arqad'])
    ez_queen.name = 'ez-queen'
    FUN.remove_result(ez_queen, 'arqad')
    FUN.add_result(ez_queen, {'arqad-queen', 1})
    ez_queen.energy_required = ez_queen.energy_required * 2
    ez_queen.main_product = 'arqad-queen'
    data:extend{ez_queen}
end

return {
    affected_entities = { -- the entities that should be effected by this tech upgrade
        'arqad-hive-mk01',
        'arqad-hive-mk02',
        'arqad-hive-mk03',
        'arqad-hive-mk04',
    },
    master_tech = { -- tech that is shown in the tech tree
        name = 'arqad-upgrade',
        icon = '__pyalienlifegraphics3__/graphics/technology/updates/u-arqad.png',
        icon_size = 128,
        order = 'c-a',
        prerequisites = {'arqad', 'nitrogen-mk01'},
        unit = {
            count = 500,
            ingredients = {
                {'automation-science-pack', 1},
                {'logistic-science-pack', 1},
            },
            time = 45
        }
    },
    sub_techs = {
        {
            name = 'air-conditioner',
            icon = '__pyalienlifegraphics3__/graphics/technology/air-con.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {old = 'arqad-egg-1', new = 'arqad-egg-1-cold', type = 'recipe-replacement'},
                {old = 'arqad-egg-2', new = 'arqad-egg-2-cold', type = 'recipe-replacement'},
                {old = 'arqad-egg-3', new = 'arqad-egg-3-cold', type = 'recipe-replacement'},
                {old = 'arqad-egg-4', new = 'arqad-egg-4-cold', type = 'recipe-replacement'},
                {old = 'arqad-egg-5', new = 'arqad-egg-5-cold', type = 'recipe-replacement'},
                {old = 'wax', new = 'wax-buffed', type = 'recipe-replacement'},
                {old = 'wax-honeycomb', new = 'wax-honeycomb-buffed', type = 'recipe-replacement'},
                {old = 'honey-comb', new = 'honey-comb-buffed', type = 'recipe-replacement'},
            },
        },
        {
            name = 'cags',
            icon = '__pyalienlifegraphics3__/graphics/technology/cags.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {productivity = 0.03, type = 'module-effects'},
                {recipe = 'cags', type = 'unlock-recipe'},
                {old = 'arqad-hive-mk01', new = 'arqad-hive-mk01-with-cags', type = 'recipe-replacement'},
            }
        },
        {
            name = 'drone',
            icon = '__pyalienlifegraphics3__/graphics/technology/drone.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {recipe = 'ez-queen', type = 'unlock-recipe'}
            }
        }
    },
    module_category = 'arqad'
}