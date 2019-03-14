[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")

Clear-Host

$url = "http://hcpmtool.siemens.ru/docs/1"
$Site = new-object Microsoft.SharePoint.SPSite($url)

foreach ($web in $site.AllWebs)
{

         foreach ($list in $web.Lists)
         {

            if($list.BaseType -eq "DocumentLibrary")   
            {
                   $listSize = 0
                   foreach ($item in $list.items) 
                   {                         
                          $lib,$theRest = $item.Url.split('/');                  
                          $listSize += ($item.file).length
                          $lib + ";" + $theRest + ";" + ($item.file).length
                          
                   }
                   #"___________________________TOTAL_____________________: "+$web.Title+", Library Name: "+$list.Title+", Size: "+ $listSize #[Math]::Round(($listSize/1KB),2)+"KB"     
            }
        }
}
