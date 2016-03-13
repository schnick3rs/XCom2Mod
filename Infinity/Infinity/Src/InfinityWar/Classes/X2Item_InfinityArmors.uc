class X2Item_InfinityArmors extends X2Item;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Armors;

	//Armors.AddItem(CreateTemplate_IW_LightKevlarArmor());
	Armors.AddItem(CreateTemplate_IW_MediumConventionalArmor());

	return Armors;
}

static function X2DataTemplate CreateTemplate_IW_MediumConventionalArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'IW_MediumConventionalArmor');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Predator_Armor";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = true;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('IW_MediumConventionalArmorStats');
	Template.ArmorTechCat = 'conventional';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	//Template.EquipNarrative = "X2NarrativeMoments.Strategy.CIN_ArmorIntro_PlatedMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated";

	//Template.UpgradeItem = 'IW_MediumArmor';
	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MITIGRATION_AMOUNT, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MOBILITY_BONUS, true);

	return Template;
}

/**
 * first generation heavy armor
 */
static function X2DataTemplate CreateTemplate_IW_HeavyConventionalArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'IW_HeavyConventionalArmor');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Predator_Armor";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = 35;
	Template.PointsToComplete = 0;
	//Template.Abilities.AddItem('IW_MediumConventionalArmorStats');
	Template.ArmorTechCat = 'conventional';
	Template.Tier = 1;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated";

	//Template.UpgradeItem = 'MediumPoweredArmor';
	
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MITIGRATION_AMOUNT, true);
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MOBILITY_BONUS, true);

	return Template;
}

static function X2DataTemplate CreateTemplate_IW_HeavyAriadnaArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'IW_HeavyAriadnaArmor');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Hammer_Armor";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = 35;
	Template.PointsToComplete = 0;
	//Template.Abilities.AddItem('IW_MediumConventionalArmorStats');
	Template.ArmorTechCat = 'conventional';
	Template.Tier = 2;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated";

	//Template.UpgradeItem = 'MediumPoweredArmor';
	
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MITIGRATION_AMOUNT, true);
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MOBILITY_BONUS, true);

	return Template;
}

static function X2DataTemplate CreateTemplate_IW_HeavyPoweredMk1Armor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'IW_HeavyPoweredMk1Armor');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Warden_Armor";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	//Template.Abilities.AddItem('IW_MediumConventionalArmorStats');
	Template.ArmorTechCat = 'powered';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Warden';
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered";

	//Template.UpgradeItem = 'MediumPoweredArmor';
	
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MITIGRATION_AMOUNT, true);
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MOBILITY_BONUS, true);

	return Template;
}

/**
 * increased mobility
 */
static function X2DataTemplate CreateTemplate_IW_HeavyPoweredMk2Armor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'IW_HeavyPoweredMk1Armor');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Predator_Armor";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = false;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	//Template.Abilities.AddItem('IW_MediumConventionalArmorStats');
	Template.ArmorTechCat = 'powered';
	Template.Tier = 0;
	//Template.AkAudioSoldierArmorSwitch = 'Predator';
	//Template.EquipSound = "StrategyUI_Armor_Equip_Plated";

	//Template.UpgradeItem = 'MediumPoweredArmor';
	
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MITIGRATION_AMOUNT, true);
	//Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_InfinityArmorGrantedAbilitySet'.default.MEDIUM_CONVENTIONAL_MOBILITY_BONUS, true);

	return Template;
}