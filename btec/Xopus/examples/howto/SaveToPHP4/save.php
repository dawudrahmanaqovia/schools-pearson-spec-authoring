<?php

  /******
   *
   *  REQUIREMENTS AND CONFIGURATIONS: 
   *  
   *  This file is tested with
   *  1) apache 2.2
   *  2) PHP4
   *  3) iconv.dll
   *  4) Windows XP
   *
   *  NOTES:
   *
   *  - Don't forget to install iconv. It's needed th encode the incoming 
   *    raw data that was posted
   *  - For more information about using XML in PHP4 visit: http://nl3.php.net/manual/en/ref.domxml.php
   *  - If you want to write the rawdata directly to a file use: file_put_contents('document.xml', $xmlstr)
   *
   ******/

  $xmlstr = file_get_contents('php://input');

  $xmlstr = iconv('UTF-16', 'UTF-8', $xmlstr);
  
  $dom = domxml_open_mem($xmlstr);

  $saved = $dom->dump_file(realpath("document.xml"),false,true);

  echo "The number of bytes written :".$saved;


?>