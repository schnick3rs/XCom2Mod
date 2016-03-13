class X2Item_InfinityWeapons extends X2Item config(IW_WeaponData);

var bool bFireSensitive;	// is disabled when hit by fire ammunition

// Variables from config - GameData_InfinityWeaponData.ini
// ***** Damage arrays for attack actions  *****

// Pistols
// var config WeaponDamageValue PISTOL_CONVENTIONAL_BASEDAMAGE; //
// var config WeaponDamageValue PISTOL_HEAVY_BASEDAMAGE; // more damage (-move)
// var config WeaponDamageValue PISTOL_ASSAULT_BASEDAMAGE; // more burst (+ to aim?)

// var config WeaponDamageValue SMG_CONVENTIONAL_BASEDAMAGE; //

// var config WeaponDamageValue CHAINRIFLE_CONVENTIONAL_BASEDAMAGE;

// Shotguns
// var config WeaponDamageValue SHOTGUN_CONVENTIONAL_BASEDAMAGE;
// var config WeaponDamageValue SHOTGUN_LIGHT_BASEDAMAGE; // CONVENTIONAL
// var config WeaponDamageValue SHOTGUN_BOARDING_BASEDAMAGE;
// var config WeaponDamageValue SHOTGUN_HEAVY_BASEDAMAGE;

// Rifles
// var config WeaponDamageValue CARBINE_PLASMA_BASEDAMAGE; //This version sacrifices fire rate and accuracy in favor of a bigger payload

// var config WeaponDamageValue RIFLE_CONVENTIONAL_BASEDAMAGE; // Infinity Rifle
var config WeaponDamageValue RIFLE_COMBI_BASEDAMAGE; // Infinity Combi Rifle
// var config WeaponDamageValue RIFLE_MULTI_BASEDAMAGE; // Infinity Combi Rifle
// var config WeaponDamageValue RIFLE_PLASMA_BASEDAMAGE; // Infinity Combi Rifle

// var config WeaponDamageValue MARKSMANRIFLE_CONVENTIONAL_BASEDAMAGE;

// Sniper
// var config WeaponDamageValue SNIPERRIFLE_CONVENTIONAL_BASEDAMAGE;
// var config WeaponDamageValue SNIPERRIFLE_MULTI_BASEDAMAGE;
// var config WeaponDamageValue SNIPERRIFLE_PLASMA_BASEDAMAGE;
// var config WeaponDamageValue SNIPERRIFLE_GUIDED_BASEDAMAGE;

// Spitfire
var config WeaponDamageValue SPITFIRE_MAGNETIC_BASEDAMAGE;

// HMGs
// var config WeaponDamageValue HMG_MAGNETIC_BASEDAMAGE;
// var config WeaponDamageValue HMG_MULTI_BASEDAMAGE;


//var config WeaponDamageValue SPITFIRE_MAGNETIC_BASEDAMAGE;
//var config WeaponDamageValue SPITFIRE_BEAM_BASEDAMAGE;


// ***** Core properties and variables for weapons *****
var config WeaponDamageValue IW_CHAINRIFLE_CONVENTIONAL_BASEDAMAGE;
var config int IW_CHAINRIFLE_CONVENTIONAL_CRITCHANCE;
var config int IW_CHAINRIFLE_CONVENTIONAL_CLIPSIZE;
var config int IW_CHAINRIFLE_CONVENTIONAL_UPGRADESLOTS;
var config int IW_CHAINRIFLE_CONVENTIONAL_SOUNDRANGE;
var config int IW_CHAINRIFLE_CONVENTIONAL_ENVIRONMENTDAMAGE;
var config int IW_CHAINRIFLE_CONVENTIONAL_SUPPLIES;

var config int SPITFIRE_MAGNETIC_AIM;
var config int SPITFIRE_MAGNETIC_CRITCHANCE;
var config int SPITFIRE_MAGNETIC_ICLIPSIZE;
var config int SPITFIRE_MAGNETIC_ISOUNDRANGE;
var config int SPITFIRE_MAGNETIC_IENVIRONMENTDAMAGE;
var config int SPITFIRE_MAGNETIC_ISUPPLIES;
var config int SPITFIRE_MAGNETIC_TRADINGPOSTVALUE;
var config int SPITFIRE_MAGNETIC_IPOINTS;
var config int SPITFIRE_MAGNETIC_UPGRADESLOTS;

var config int RIFLE_COMBI_AIM;
var config int RIFLE_COMBI_CRITCHANCE;
var config int RIFLE_COMBI_ICLIPSIZE;
var config int RIFLE_COMBI_ISOUNDRANGE;
var config int RIFLE_COMBI_IENVIRONMENTDAMAGE;
var config int RIFLE_COMBI_ISUPPLIES;
var config int RIFLE_COMBI_TRADINGPOSTVALUE;
var config int RIFLE_COMBI_IPOINTS;
var config int RIFLE_COMBI_UPGRADESLOTS;

// var config int RIFLE_CONVENTIONAL_AIM;
// var config int RIFLE_CONVENTIONAL_CRITCHANCE;
// var config int RIFLE_CONVENTIONAL_ICLIPSIZE;
// var config int RIFLE_CONVENTIONAL_ISOUNDRANGE;
// var config int RIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
// var config int RIFLE_CONVENTIONAL_ISUPPLIES;
// var config int RIFLE_CONVENTIONAL_TRADINGPOSTVALUE;
// var config int RIFLE_CONVENTIONAL_IPOINTS;
// var config int RIFLE_CONVENTIONAL_UPGRADESLOTS;


// ***** Range Modifier Tables *****
var config array<int> RIFLE_COMBI_RANGE;
var config array<int> SPITFIRE_RANGE;
// var config array<int> MEDIUM_CONVENTIONAL_RANGE;

//Template classes are searched for by the game when it starts. Any derived classes have their CreateTemplates function called
//on the class default object. The game expects CreateTemplates to return a list of templates that it will add to the manager
//reponsible for those types of templates. Later, these templates will be automatically picked up by the game mechanics and systems.
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> InfinityWeapons;

	`Log("InfinityWar : Create range weapon templates ");
	
	InfinityWeapons.AddItem(CreateTemplate_IW_ChainRifle()); // T0

// InfinityWeapons.AddItem(CreateTemplate_Rifle_Conventional()); // T0
//	InfinityWeapons.AddItem(CreateTemplate_Rifle_Magnetic()); // T1
	InfinityWeapons.AddItem(CreateTemplate_IW_CombiRifle_Magnetic()); // T2
//	InfinityWeapons.AddItem(CreateTemplate_MultiRifle_Beam()); // T3

	InfinityWeapons.AddItem(CreateTemplate_IW_Spitfire_Magnetic()); // T2

	InfinityWeapons.AddItem(CreateTemplate_IW_SniperRifle_Conventional());
	InfinityWeapons.AddItem(CreateTemplate_IW_SniperRifle_Multi());
	InfinityWeapons.AddItem(CreateTemplate_IW_SniperRifle_Plasma());

	InfinityWeapons.AddItem(CreateTemplate_IW_LightGrenadeLauncher());

	//ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	//AddCritUpgrade(ItemTemplateManager, 'CritUpgrade_Bsc');

	return InfinityWeapons;
}
/*
// The rifle is the inseparable companion of the infantry soldier: 
// conceived for mass combat, it is now the most common weapon in the battlefields of the Sphere.
// Recent technological advances have made it more lightweight and accurate, making it viable for covert operatives.
static function X2DataTemplate CreateTemplate_Rifle_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Rifle_CV');
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base"; // ?
	Template.Tier = 0;

	Template.RangeAccuracy = default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.RIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.RIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.RIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.RIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.RIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.RIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.RIFLE_CONVENTIONAL_UPGRADESLOTS;
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_AssaultRifle_CV.WP_AssaultRifle_CV";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	
	Template.UpgradeItem = 'CombiRifle_MG';

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';
	
	return Template;
}
*/

static function X2DataTemplate CreateTemplate_IW_CombiRifle_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'IW_CombiRifle_MG');
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.RIFLE_COMBI_RANGE;
	Template.BaseDamage = default.RIFLE_COMBI_BASEDAMAGE;
	Template.Aim = default.RIFLE_COMBI_AIM;
	Template.CritChance = default.RIFLE_COMBI_CRITCHANCE;
	Template.iClipSize = default.RIFLE_COMBI_ICLIPSIZE;
	Template.iSoundRange = default.RIFLE_COMBI_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.RIFLE_COMBI_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.RIFLE_COMBI_UPGRADESLOTS;
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	Template.GameArchetype = "WP_AssaultRifle_MG.WP_AssaultRifle_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	
	/* function AddDefaultAttachment(name AttachSocket, string MeshName, optional bool AttachToPawn, optional string Icon, optional string InventoryIconName, optional string InventoryCategoryIcon)
	{
		local WeaponAttachment Attach;

		Attach.AttachSocket = AttachSocket;
		Attach.AttachMeshName = MeshName;
		Attach.AttachIconName = Icon;
		Attach.InventoryIconName = InventoryIconName;
		Attach.InventoryCategoryIcon = InventoryCategoryIcon;
		Attach.AttachIconName = Icon;
		Attach.AttachToPawn = AttachToPawn;
		DefaultAttachments.AddItem(Attach);
	} */

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = true;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}


// Sniper Rifles are precision weapons with such long-range accuracy that they can dominate an entire battlefield.
// A well-placed marksman armed with one of these weapons can potentially deter the advance of a whole army.
static function X2DataTemplate CreateTemplate_IW_SniperRifle_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'IW_SniperRifle_CV_2');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.ItemCat = 'weapon';
	Template.Abilities.AddItem('Squadsight');

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;	

	return Template;
}

// A modernized, more versatile version of the standard Sniper Rifle,
// it can fire a range of Medium MULTI Special Ammunitions that give their user the ability to choose between two different Shooting Modes on the fly.
static function X2DataTemplate CreateTemplate_IW_SniperRifle_Multi()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'IW_SniperRifle_Multi');
	Template.WeaponPanelImage = "_MagneticRifle";
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.StowedLocation = eSlot_LeftHand;
	Template.Abilities.AddItem('Squadsight');

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;	

	return Template;
}

// This might be the most advanced Sniper Rifle ever created, firing Plasma Special Ammunition.
// * can't take ammunition
// * increase damage
// X2WeaponUpgradeTemplate appear in the upgrade selection segment
static function X2DataTemplate CreateTemplate_IW_SniperRifle_Plasma()
{
	local X2WeaponUpgradeTemplate Template;

	//`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SniperRifle_Plasma');
	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'SniperRifle_Plasma');
	//Template.WeaponPanelImage = "_BeamRifle";
	//Template.StowedLocation = eSlot_LeftHand;
	Template.ItemCat = 'weapon'; // check if this is working as expected

	//Template.Abilities.AddItem('Squadsight');

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;	

	return Template;
}

/**
 * This is the weapon template
 * This adds the LaunchGrenade ability replace the standart shot, that uses the 
 * Adds the ReloadGrenadeLauncher ability replace Reload
 * Adds a extra grenade pocket, where the ammunition is placed
 */
static function X2DataTemplate CreateTemplate_IW_LightGrenadeLauncher()
{
	local X2WeaponTemplate Template;

	/**
	could use X2GrenadeLauncherTemplate set sets
	var int IncreaseGrenadeRange;
	var int IncreaseGrenadeRadius;
	*/
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'IW_LightGrenadeLauncher');

	// from X2WeaponTemplate
	Template.WeaponCat = 'grenade_launcher';
	Template.WeaponTech = 'conventional';
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';	
	
	//Template.StowedLocation = eSlot_LeftHand; // should not be not needed for primaries
	//Template.WeaponPanelImage = "_BeamRifle"; // XXX
	// Template.ArmorTechCatForAltArchetype = ""; "powered" for heavy weapons
	Template.iEnvironmentDamage = 50; //default.IW_LightGrenadeLauncher_iEnvironmentDamage;
	
	Template.iRadius = 3; // (from grenade itself)
	Template.iClipSize = 1 ; // reload after each shot (via config)
	
	Template.Aim = 0;
	//Template.BaseDamage = 0; // set by grenade
	//Template.CritChance = 0; // set by grenade
	//Template.DamageTypeTemplateName = ; // set by grenade probably 'Explosion'

	//Template.RangeAccuracy = 
	Template.iSoundRange = 30; // set by grenade
	Template.bSoundOriginatesFromOwnerLocation = false; // is X2GrenadeLauncherTemplate default
	
	Template.NumUpgradeSlots = 1; // experimental

	// from X2EquipmentTemplate
	//Template.GameArchetype = "WP_ModExampleWeapon_CV.WP_ModExampleWeapon_CV";
	Template.GameArchetype = "WP_GrenadeLauncher_CV.WP_GrenadeLauncher_CV";
	//Template.Abilities.addItem('LaunchGrenade');
	//Template.Abilities.AddItem('Reload');
	//Template.Abilities.addItem('ReloadGrenadeLauncher'); // TBD
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";

	// from X2ItemTemplate
	Template.StartingItem = true;
	// Template.bInfiniteItem = true; // not needed as starting items = true
	Template.CanBeBuilt = false;
	//Template.UpgradeItem = '';
	Template.strImage = "img:///UILibrary_Common.ConvSecondaryWeapons.ConvGrenade";

	return Template;
}

// ***** Spitfire *****
// The Spitfire is a mid-range machine gun designed for close quarters and urban combat.
// Regardless of its specific incarnation, this type of weapon has carved its way into the history of weapons due to its high fire rate and notable accuracy.
// Internationally known by different iterations of the name "Fire Spitter", it is widely regarded as the 'most effective automatic firearm in the Sphere'.
// Compared to its big sister, the Heavy Machine Gun, a Spitfire barrel is shorter and its ammunition lighter, two factors that define its usefulness as assault and support weapon in urban combat environments.
// Coupled with its sturdy build and ease of use, the Spitfire has all the features of a legendary weapon.
static function X2DataTemplate CreateTemplate_IW_Spitfire_Magnetic()
{
	local X2WeaponTemplate Template;

	// TemplateType, out Template, Localisation
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'IW_Spitfire_MG');
	Template.WeaponPanelImage = "_MagneticRifle"; // UI resource for weapon image

	// Template.ItemCat = 'weapon';  // weapons are itemcat=weapon by default (if extended from X2WeaponTemplate
	Template.WeaponCat = 'cannon'; // see X2ItemTemplateManager's WeaponCategories
	
	//  IsLowTech() if  conventional OR magnetic
	Template.WeaponTech = 'conventional'; // X2ItemTemplateManager's WeaponTechCategorie

	Template.strImage = "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 1;

	Template.RangeAccuracy = default.SPITFIRE_RANGE; // Array of accuracy modifiers, where index is tiles distant from target.
	Template.BaseDamage = default.SPITFIRE_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.SPITFIRE_MAGNETIC_AIM;
	Template.CritChance = default.SPITFIRE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.SPITFIRE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.SPITFIRE_MAGNETIC_ISOUNDRANGE; // Range in Meters, for alerting enemies.  (Yellow alert)
	Template.iEnvironmentDamage = default.SPITFIRE_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SPITFIRE_MAGNETIC_UPGRADESLOTS;
	Template.bIsLargeWeapon = false; // Used in Weapon Upgrade UI to determine distance from camera.

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Suppression');

	// This all the resources; sounds, animations, models, physics, the works.
	// TODO: Replace with final mesh
	Template.GameArchetype = "WP_ModExampleWeapon_CV.WP_ModExampleWeapon_CV"; //Use a custom archetype
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false; // no infinity advanced items

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_IW_ChainRifle()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'IW_ChainRifle');

	// from X2WeaponTemplate
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'conventional';
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';	
	Template.WeaponPanelImage = "_MagneticRifle";
	// Template.ArmorTechCatForAltArchetype = ""; "powered" for heavy weapons
	Template.iEnvironmentDamage = 50;
	
	// Template.RangeAccuracy = default.IW_CHAINRIFLE_CONVENTIONAL_RANGE; // template weapon
	// Template.Aim = default.IW_CHAINRIFLE_CONVENTIONAL_AIM;
	Template.BaseDamage = default.IW_CHAINRIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.CritChance = default.IW_CHAINRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.IW_CHAINRIFLE_CONVENTIONAL_CLIPSIZE;
	Template.iRadius = 3;
	Template.iSoundRange = default.IW_CHAINRIFLE_CONVENTIONAL_SOUNDRANGE;
	
	Template.NumUpgradeSlots = default.IW_CHAINRIFLE_CONVENTIONAL_UPGRADESLOTS;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';
	Template.iPhysicsImpulse = 5;

	// from X2EquipmentTemplate
	//Template.GameArchetype = "WP_ModExampleWeapon_CV.WP_ModExampleWeapon_CV";
	Template.GameArchetype = "WP_GrenadeLauncher_CV.WP_GrenadeLauncher_CV";
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.EquipSound = "Primary_Weapon_Equip_Conventional";
	
	// from X2ItemTemplate
	Template.StartingItem = true;
	// Template.bInfiniteItem = true; // not needed as starting items = true
	Template.CanBeBuilt = false;
	//Template.UpgradeItem = '';
	Template.strImage = "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_Base"; // icon in armory

	return Template;
}

defaultproperties
{
	bFireSensitive = false;
}