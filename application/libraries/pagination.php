<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pagination{
	
	/**
	 *
	 * @link http://www.strangerstudios.com/blog/2006/07/07/paginate-your-site-like-digg/
	 * @link http://www.strangerstudios.com/sandbox/pagination/diggstyle.php?page=1
	 */
	
	
	/**
	 * Pagination function.
	 *
	 * @param int $page				Current page number
	 * @param int $totalitems		Total number of pages
	 * @param int $limit			Number of items shown per page
	 * @param int $adjacents		Number of pages to show next to the current page
	 * @param string $targetpage	Target that the page links point to
	 * @param string $pagestring	URL param to pass the page number via (?page=)
	 * @return string
	 * @todo Modify this so that it returns more flexible data.
	 */
	function getPaginationString($page = 1, $totalitems, $limit = 5, $adjacents = 1, $targetpage = "/", $pagestring = "/")//$pagestring = "page="
	{
		// Default the required variables if they're invalid or not provided
		$adjacents 	= isset($adjacents) ? $adjacents : 1;
		$limit 		= isset($limit) ? $limit : 5;
		$page 		= isset($page) ? $page : 1;
		$targetpage = isset($targetpage) ? $targetpage : "/";
		$pagination = "";
	
		// Figure out if we should prefix the page with a & or ?
		//$pagestring = (stripos($targetpage, '?') > 0) ? "&".$pagestring : "?".$pagestring;
	
		// Calculate the other required vars referenced later on
		$prev 		= $page - 1;							// Previous page = current page minus 1
		$next 		= $page + 1;							// Next page = current page plus 1
		$lastpage 	= ceil($totalitems / $limit);			// Last page = total items divided by items per page, rounded up
		$lpm1 		= $lastpage - 1;						// last page minus one
	
		// Make sure that we don't show any more than 10 pages of results because that's just ridiculous!
		if ($lastpage > 10)
		{
			$lastpage = 10;
		}
	
		$currentURL = '';
	
		// Generate the pagination string and return it
		if($lastpage > 1)
		{
			$pagination .= '<ul class="pagination">';
	
			// Previous button
			if ($page > 1)
			{
				$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$prev.'">&#171;</a></li>';
			}
			else
			{
				//$pagination .= '<li><span class="disabled">&#171;</span></li>';
			}
				
			// Page counting
			if ($lastpage < 7 + ($adjacents * 2)) // Not enough pages to bother breaking it up
			{
				for ($counter = 1; $counter <= $lastpage; $counter++)
				{
				if ($counter == $page)
				{
				$pagination .= '<li class="current"><span>'.$counter.'</span></li>';
						$currentURL = $targetpage.$pagestring.$counter;
				}
				else
				{
				$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$counter.'">'.$counter.'</a></li>';
				}
				}
				}
				elseif($lastpage >= 7 + ($adjacents * 2))	// Enough pages to hide some
				{
				// Only hide the later pages, we're close to the beginning
					if($page < 1 + ($adjacents * 3))
					{
					for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
					{
					if ($counter == $page)
						{
						$pagination .= '<li class="current"><span>'.$counter.'</span></li>';
								$currentURL = $targetpage.$pagestring.$counter;
						}
						else
						{
						$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$counter.'">'.$counter.'</a></li>';
						}
						}
						$pagination .= '<li class="nobg"><span>...</span></li>';
					//$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$lpm1.'">'.$lpm1.'</a></li>';
						$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$lastpage.'">'.$lastpage.'</a></li>';
					}
					// In the middle, hide some pages from the start and the end
					elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
					{
					$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.'1">1</a></li>';
					//$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.'2">2</a></li>';
					$pagination .= '<li class="nobg"><span>...</span></li>';
					for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
						{
						if ($counter == $page)
						{
						$pagination .= '<li class="current"><span>'.$counter.'</span></li>';
							$currentURL = $targetpage.$pagestring.$counter;
						}
						else
						{
						$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$counter.'">'.$counter.'</a></li>';
						}
						}
						$pagination .= '<li class="nobg"><span>...</span></li>';
						//$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$lpm1.'">'.$lpm1.'</a></li>';
						$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$lastpage.'">'.$lastpage.'</a></li>';
					}
					// Almost at the end, only hide the beginning pages
					else
					{
					$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.'1">1</a></li>';
					//$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.'2">2</a></li>';
					$pagination .= '<li class="nobg"><span>...</span></li>';
					for ($counter = $lastpage - (1 + ($adjacents * 3)); $counter <= $lastpage; $counter++)
					{
					if ($counter == $page)
					{
					$pagination .= '<li class="current"><span>'.$counter.'</span></li>';
					$currentURL = $targetpage.$pagestring.$counter;
					}
					else
						$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$counter.'">'.$counter.'</a></li>';
					}
					}
					}
						
					// Next button
					if ($page < $counter - 1)
					{
					$pagination .= '<li><a class="pageNum" href="'.$targetpage.$pagestring.$next.'">&#187;</a></li>';
			}
			else
				{
				//$pagination .= '<li><span class="disabled">&#187;</span></li>';
					}
						
					// Close off the ul
					$pagination .= '</ul>';
						
					// As a final touch, prefix the page data with the "Page:" title
					//$pagination .= '<span class="pageTitle">Page:</span>';
		}
	
		$pagination .= '<input type="hidden" name="currentURL" id="currentURL" value="'.$currentURL.'">';
	
		// Return the string.
		return $pagination;
	}
}

/* End of file pagination.php */
/* Location: ./application/libraries/pagination.php */