class X2Item_InfinityUpgrades extends X2Item config(IW_WeaponUpgradePack);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> WeaponUpgrades;

	`Log("InfinityWar : Create weapon upgrade templates´");

	WeaponUpgrades.AddItem(CreateLightFlamethrowerAttachment());

	return WeaponUpgrades;
}

// tamplete if the attachment is added ?
static function X2DataTemplate CreateLightFlamethrowerAttachment()
{
	local X2WeaponUpgradeTemplate Template;
//	local X2AbilityTemplateManager AbilityTemplateManager;
//	local X2AbilityTemplate AbilityTemplate;

	// type, out, localisation (MISSING)
	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'LightFlamethrowerAttachment');

	SetUpCombiWeaponUpgrade(Template);
	class'X2Item_DefaultUpgrades'.static.SetUpTier1Upgrade(Template); // sets loot mesh, trading post costs and tier

	// XXX uses the clipsize from the weapon :/
	Template.BonusAbilities.AddItem('LightFlamethrowerAttack');

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_FlameThrower";
	
	return Template;
}


static function SetUpCombiWeaponUpgrade(out X2WeaponUpgradeTemplate Template)
{
	//SetUpWeaponUpgrade(Template);
	class'X2Item_DefaultUpgrades'.static.SetUpWeaponUpgrade(Template); // blackmarket 

	// MOH: hack to make upgrade availible
	Template.StartingItem = true;
	Template.bInfiniteItem = true;

	/*
	function AddUpgradeAttachment(
		Name AttachSocket, 
		Name UIArmoryCameraPointTag, 
		string MeshName, 
		string ProjectileName, 
		name MatchWeaponTemplate, 
		optional bool AttachToPawn, 
		optional string IconName, 
		optional string InventoryIconName, 
		optional string InventoryCategoryIcon,
		optional delegate<X2TacticalGameRulesetDataStructures.CheckUpgradeStatus> ValidateAttachmentFn)
	*/

	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticB", "", 'AssaultRifle_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_OpticB", "", 'AssaultRifle_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticB", "", 'AssaultRifle_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_OpticA", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}