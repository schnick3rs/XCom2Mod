class X2Item_InfinityAmmunitions extends X2Item config(IW_WeaponData);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;

	Items.AddItem(CreateTemplate_ArmorPiercingAmmunition());
	/*Items.AddItem(CreateTemplate_DoubleActionAmmunition());
	Items.AddItem(CreateTemplate_BreakerAmmunition());
	Items.AddItem(CreateTemplate_DoubleTroubleAmmunition());
	Items.AddItem(CreateTemplate_ElectromagneticAmmunition());*/
	
	return Items;
}

static function X2DataTemplate CreateTemplate_ArmorPiercingAmmunition()
{
	local X2AmmoTemplate Template;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'ArmorPiercingAmmunition');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Ap_Rounds";
	
	Template.Abilities.AddItem('ArmorPiercingAmmunition');

	// from X2Item
	Template.EquipSound = "StrategyUI_Ammo_Equip";
	Template.GameArchetype = "Ammo_AP.PJ_AP";

	Template.StartingItem = true;

	return Template;
}