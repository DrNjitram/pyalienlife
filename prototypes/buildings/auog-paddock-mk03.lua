local MODULE_SLOTS = 8

RECIPE {
    type = "recipe",
    name = "auog-paddock-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "auog-paddock-mk02", amount = 1},
        {type = "item", name = "nbti-alloy",        amount = 25},
        {type = "item", name = "advanced-circuit",  amount = 20},
        {type = "item", name = "neuromorphic-chip", amount = 30},
        {type = "item", name = "py-heat-exchanger", amount = 1},
    },
    results = {
        {type = "item", name = "auog-paddock-mk03", amount = 1}
    }
}:add_unlock("land-animals-mk03"):add_ingredient {type = "item", name = "small-parts-03", amount = 30}

ITEM {
    type = "item",
    name = "auog-paddock-mk03",
    icon = "__pyalienlifegraphics__/graphics/icons/auog-paddock-mk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-alienlife-farm-buildings-mk03",
    order = "d",
    place_result = "auog-paddock-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "auog-paddock-mk03",
    icon = "__pyalienlifegraphics__/graphics/icons/auog-paddock-mk03.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "auog-paddock-mk03"},
    fast_replaceable_group = "auog-paddock",
    max_health = 100,
    corpse = "medium-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-6.6, -6.6}, {6.6, 6.6}},
    selection_box = {{-7.0, -7.0}, {7.0, 7.0}},
    module_slots = 8,
    allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
    crafting_categories = {"auog"},
    crafting_speed = py.farm_speed_derived(MODULE_SLOTS, "auog-paddock-mk01"),
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {
            pollution = 2
        },
    },
    energy_usage = "300kW",
    graphics_set = {
        working_visualisations = {
            {
                north_position = util.by_pixel(-78, 63),
                west_position = util.by_pixel(-78, 63),
                south_position = util.by_pixel(-78, 63),
                east_position = util.by_pixel(-78, 63),
                animation = {
                    filename = "__pyalienlifegraphics__/graphics/entity/auog-paddock/left.png",
                    frame_count = 96,
                    line_length = 12,
                    width = 160,
                    height = 256,
                    animation_speed = 0.3
                }
            },
            {
                north_position = util.by_pixel(82, 63),
                west_position = util.by_pixel(82, 63),
                south_position = util.by_pixel(82, 63),
                east_position = util.by_pixel(82, 63),
                animation = {
                    filename = "__pyalienlifegraphics__/graphics/entity/auog-paddock/right.png",
                    frame_count = 96,
                    line_length = 12,
                    width = 160,
                    height = 256,
                    animation_speed = 0.3
                }
            },
        },
        animation = {
            layers = {
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/auog-paddock/off.png",
                    width = 448,
                    height = 448,
                    frame_count = 1,
                    shift = util.by_pixel(2, -1),
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/auog-paddock/off-mask.png",
                    width = 448,
                    height = 448,
                    frame_count = 1,
                    shift = util.by_pixel(2, -1),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
            }
        },
    },

    impact_category = "metal-large",
    working_sound = {
        sound = {filename = "__pyalienlifegraphics__/sounds/auog-paddock.ogg", volume = 1.5},
        idle_sound = {filename = "__pyalienlifegraphics__/sounds/auog-paddock.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
