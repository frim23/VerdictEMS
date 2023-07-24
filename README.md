FiveM script for revive and heal, works with ND_Core for department specific commands and fax-revive for proper revive.  

/revive - Revive a player.  
/heal - Heal a player.  

***Option variables: (first lines in client/client.lua)***  
department - ND_Characters department name. (default: LSFD)  
fax_revive - Enable/disable fax-revive integration. If false - heals player by 10% to revive. (default: true)  
needsImport - Imports fax-revive revivePed function. Disable it if you merge all scripts into one script.  (default: false)
debug - Enables /revivedebug command, which allows you to set your HP to 1% for fast script check. (default: false)

To enable fax-revive integration if you have it as a separate script, add this "exports" function to the bottom of fax-revive/client.lua.  
  
>```exports("revivePed", function()```  
>```   revivePed(ped)```  
>```end)```  
