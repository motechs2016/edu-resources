<?php
/*
 * 
 * To change the template for this generated file go to 
 * Window - Preferences - PHPeclipse - PHP - Code Templates 
 * 
 */
class SWFTransfer{ 
	
	/**
	 * change the pdf file to swf file, this method needs tools SWFTools to 
	 * support it's function. The tools' path is 'e:/SWFTools', please attention.
	 * 
	 * @param string $filename
	 * @param string $dir
	 */
	public function pdftoswf($filename,$dir)
	{ 
		//acquire the current path
		//$dir = dirname(__FILE__);
		
		//deal with the $dir
		//$dir = str_replace('/', '\\', $dir);
		
		//use pdf2swf transfer command
		$command= "e: &cd SWFTools &pdf2swf.exe  -t ".$dir.$filename.".pdf -o ".$dir.$filename.".swf -s flashversion=9 ";
		
		//create shell object
		$WshShell   = new COM("WScript.Shell");
		
		//exec cmd
		$oExec      = $WshShell->Run("cmd /C ". $command, 0, true);
		
		//return $command;
	}

}

/* End of file SWFTransfer.php */
/* Location: ./application/libraries/SWFTransfer.php */