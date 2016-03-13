class X2Item_InfinityMeleeWeapons extends X2Item config(IW_WeaponData);

// Variables from config - GameData_InfinityWeaponData.ini
// ***** Damage arrays for attack actions  *****


// ***** CC weapon stasts *****
var config WeaponDamageValue IW_SWORD_CONVENTIONAL_BASEDAMAGE;
var config int IW_SWORD_CONVENTIONAL_AIM;
var config int IW_SWORD_CONVENTIONAL_CRITCHANCE;
var config int IW_SWORD_CONVENTIONAL_ICLIPSIZE;
var config int IW_SWORD_CONVENTIONAL_ISOUNDRANGE;
var config int IW_SWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int IW_SWORD_CONVENTIONAL_ISUPPLIES;
var config int IW_SWORD_CONVENTIONAL_TRADINGPOSTVALUE;
var config int IW_SWORD_CONVENTIONAL_IPOINTS;




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

	`Log("InfinityWar : Create melee weapon templates ");

	InfinityWeapons.AddItem(CreateTemplate_IW_Sword_Conventional());
	/*InfinityWeapons.AddItem(CreateTemplate_IW_Sword_ArmorPiercing());
	InfinityWeapons.AddItem(CreateTemplate_IW_Sword_DoubleAcion());
	InfinityWeapons.AddItem(CreateTemplate_IW_Sword_Electromagnetic());
	InfinityWeapons.AddItem(CreateTemplate_IW_Sword_Explosiv());
	InfinityWeapons.AddItem(CreateTemplate_IW_Sword_Monofilament());
	InfinityWeapons.AddItem(CreateTemplate_IW_Sword_Shock());
	InfinityWeapons.AddItem(CreateTemplate_IW_Sword_Viral());*/

	return InfinityWeapons;
}


static function X2DataTemplate CreateTemplate_IW_Sword_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'IW_Sword');
	Template.WeaponPanelImage = "_Sword"; // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon'; // XXX weapon id the default
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvSecondaryWeapons.Sword";
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Sword_CV.WP_Sword_CV";
	Template.AddDefaultAttachment('Sheath', "ConvSword.Meshes.SM_ConvSword_Sheath", true);
	Template.Tier = 0;

	Template.Abilities.AddItem('SwordSlice'); 

	Template.iRadius = 1;
	Template.NumUpgradeSlots = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;
	Template.BaseDamage = default.IW_SWORD_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.IW_SWORD_CONVENTIONAL_AIM;
	Template.CritChance = default.IW_SWORD_CONVENTIONAL_CRITCHANCE;
	Template.iSoundRange = default.IW_SWORD_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.IW_SWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType = 'Melee';

	Template.UpgradeItem = 'Sword_MG';
	
	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Melee';

	return Template;
}