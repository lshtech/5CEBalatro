local jokerInfo = {
	name = 'Guilty Joker',
	config = {},
	text = {
		'{C:mult}+1{} Mult per $',
		'{C:attention}Costs all $ to sell{}',
		'{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)'
	},
	rarity = 2,
	cost = 4,
	canBlueprint = true,
	canEternal = true
}


function jokerInfo.locDef(self)
	return {G.GAME.dollars}
end

local function updateSellCost(self)
	self.sell_cost = -1 * G.GAME.dollars
	sell_cost_label = -1 * G.GAME.dollars
end

function jokerInfo.init(self)
	updateSellCost(self)
end

function jokerInfo.update(self,dt)
	updateSellCost(self)
end

function jokerInfo.calculate(self, context)
	updateSellCost(self)
	if SMODS.end_calculate_context(context) then
		return {
			message = localize { type = 'variable', key = 'a_mult', vars = { G.GAME.dollars } },
			mult_mod = G.GAME.dollars,
		}
	end
end



return jokerInfo
	