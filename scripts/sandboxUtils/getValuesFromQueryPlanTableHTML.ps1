#./scripts/sandboxUtils/getValuesFromQueryPlanTableHTML.ps1

# Suspected HTML text
$html = @'
<div id="gridpanel-1203" class="x-panel x-grid-with-row-lines x-border-item x-box-item x-window-item x-panel-default x-grid" style="margin: 0px; width: 811px; left: 0px; top: 0px; height: 67px;"><div id="headercontainer-1204" class="x-grid-header-ct x-docked x-grid-header-ct-default x-docked-top x-grid-header-ct-docked-top x-grid-header-ct-default-docked-top x-box-layout-ct" style="border-width: 1px; width: 811px; left: 0px; top: 0px;"><div id="headercontainer-1204-innerCt" class="x-box-inner " role="presentation" style="width: 826px; height: 22px;"><div id="headercontainer-1204-targetEl" style="position:absolute;width:20000px;left:0px;top:0px;height:1px"><div id="gridcolumn-1205" class="x-unselectable x-column-header-align-left x-box-item x-column-header x-unselectable-default x-column-header-sort-undefined x-column-header-sort-null x-column-header-first" style="border-width: 1px; width: 95px; height: auto; left: 0px; top: 0px; margin: 0px;"><div id="gridcolumn-1205-titleEl" class="x-column-header-inner" style="height: auto; padding-top: 3px;"><span id="gridcolumn-1205-textEl" class="x-column-header-text">Cardinality</span><div id="gridcolumn-1205-triggerEl" class="x-column-header-trigger"></div></div><div id="gridcolumn-1205-clearEl" class="x-clear" role="presentation"></div></div><div id="gridcolumn-1206" class="x-unselectable x-column-header-align-left x-box-item x-column-header x-unselectable-default x-column-header-sort-undefined x-column-header-sort-null" style="border-width: 1px; width: 134px; height: auto; left: 95px; top: 0px; margin: 0px; cursor: col-resize;"><div id="gridcolumn-1206-titleEl" class="x-column-header-inner" style="height: auto; padding-top: 3px;"><span id="gridcolumn-1206-textEl" class="x-column-header-text">Fields</span><div id="gridcolumn-1206-triggerEl" class="x-column-header-trigger"></div></div><div id="gridcolumn-1206-clearEl" class="x-clear" role="presentation"></div></div><div id="gridcolumn-1207" class="x-unselectable x-column-header-align-left x-box-item x-column-header x-unselectable-default x-column-header-sort-undefined x-column-header-sort-null" style="border-width: 1px; width: 118px; height: auto; left: 229px; top: 0px; margin: 0px;"><div id="gridcolumn-1207-titleEl" class="x-column-header-inner" style="height: auto; padding-top: 3px;"><span id="gridcolumn-1207-textEl" class="x-column-header-text">Leading Operation Type</span><div id="gridcolumn-1207-triggerEl" class="x-column-header-trigger"></div></div><div id="gridcolumn-1207-clearEl" class="x-clear" role="presentation"></div></div><div id="gridcolumn-1208" class="x-unselectable x-column-header-align-left x-box-item x-column-header x-unselectable-default x-column-header-sort-undefined x-column-header-sort-ASC" style="border-width: 1px; width: 194px; height: auto; left: 347px; top: 0px; margin: 0px;"><div id="gridcolumn-1208-titleEl" class="x-column-header-inner" style="height: auto; padding-top: 3px;"><span id="gridcolumn-1208-textEl" class="x-column-header-text">Cost</span><div id="gridcolumn-1208-triggerEl" class="x-column-header-trigger"></div></div><div id="gridcolumn-1208-clearEl" class="x-clear" role="presentation"></div></div><div id="gridcolumn-1209" class="x-unselectable x-column-header-align-left x-box-item x-column-header x-unselectable-default x-column-header-sort-undefined x-column-header-sort-null" style="border-width: 1px; width: 134px; height: auto; left: 541px; top: 0px; margin: 0px;"><div id="gridcolumn-1209-titleEl" class="x-column-header-inner" style="height: auto; padding-top: 3px;"><span id="gridcolumn-1209-textEl" class="x-column-header-text">sObject Cardinality</span><div id="gridcolumn-1209-triggerEl" class="x-column-header-trigger"></div></div><div id="gridcolumn-1209-clearEl" class="x-clear" role="presentation"></div></div><div id="gridcolumn-1210" class="x-unselectable x-column-header-align-left x-box-item x-column-header x-unselectable-default x-column-header-sort-undefined x-column-header-sort-null x-column-header-last" style="border-width: 1px; width: 134px; height: auto; left: 675px; top: 0px; margin: 0px;"><div id="gridcolumn-1210-titleEl" class="x-column-header-inner" style="height: auto; padding-top: 3px;"><span id="gridcolumn-1210-textEl" class="x-column-header-text">sObject Type</span><div id="gridcolumn-1210-triggerEl" class="x-column-header-trigger"></div></div><div id="gridcolumn-1210-clearEl" class="x-clear" role="presentation"></div></div></div></div></div><div id="gridpanel-1203-body" class="x-panel-body x-grid-body x-panel-body-default x-panel-body-default x-layout-fit" style="width: 811px; left: 0px; top: 23px; height: 44px;"><div id="gridview-1211" class="x-grid-view x-fit-item x-grid-view-default x-unselectable" style="overflow: auto; margin: 0px; width: 809px;" tabindex="-1"><table class="x-grid-table x-grid-table-resizer" border="0" cellspacing="0" cellpadding="0" style="width:809px;"><tbody><tr class="x-grid-header-row"><th class="x-grid-col-resizer-gridcolumn-1205" style="width: 95px; height: 0px;"></th><th class="x-grid-col-resizer-gridcolumn-1206" style="width: 134px; height: 0px;"></th><th class="x-grid-col-resizer-gridcolumn-1207" style="width: 118px; height: 0px;"></th><th class="x-grid-col-resizer-gridcolumn-1208" style="width: 194px; height: 0px;"></th><th class="x-grid-col-resizer-gridcolumn-1209" style="width: 134px; height: 0px;"></th><th class="x-grid-col-resizer-gridcolumn-1210" style="width: 134px; height: 0px;"></th></tr><tr class="x-grid-row x-grid-row-selected x-grid-row-focused"><td class=" x-grid-cell x-grid-cell-gridcolumn-1205   x-grid-cell-first"><div class="x-grid-cell-inner " style="text-align: left; ;">122483</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1206   "><div class="x-grid-cell-inner " style="text-align: left; ;">&nbsp;</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1207   "><div class="x-grid-cell-inner " style="text-align: left; ;">TableScan</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1208   "><div class="x-grid-cell-inner " style="text-align: left; ;">1.1711910646387833</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1209   "><div class="x-grid-cell-inner " style="text-align: left; ;">526000</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1210   x-grid-cell-last"><div class="x-grid-cell-inner " style="text-align: left; ;">Account</div></td></tr><tr class="x-grid-row x-grid-row-alt"><td class=" x-grid-cell x-grid-cell-gridcolumn-1205   x-grid-cell-first"><div class="x-grid-cell-inner " style="text-align: left; ;">526000</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1206   "><div class="x-grid-cell-inner " style="text-align: left; ;">Number_short_no_index__c</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1207   "><div class="x-grid-cell-inner " style="text-align: left; ;">Index</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1208   "><div class="x-grid-cell-inner " style="text-align: left; ;">10</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1209   "><div class="x-grid-cell-inner " style="text-align: left; ;">526000</div></td><td class=" x-grid-cell x-grid-cell-gridcolumn-1210   x-grid-cell-last"><div class="x-grid-cell-inner " style="text-align: left; ;">Account</div></td></tr></tbody></table></div></div><div class="x-grid-resize-marker" id="ext-gen1677" style="top: 1px; height: 46px; left: -9999px;"></div><div class="x-grid-resize-marker" id="ext-gen1678" style="top: 1px; height: 46px; left: -9999px;"></div></div>
'@

# Definition of column names
$columns = @("Cardinality", "Fields", "Leading Operation Type", "Cost", "sObject Cardinality", "sObject Type")

$table = @()

# Extract the rows from the HTML
$rows = [regex]::Matches($html, '<tr.*?>(.*?)<\/tr>').ForEach({
    $_.Groups[1].Value
})

# Process each row
foreach ($row in $rows) {
    # Extract cell values for the current row
    $cells = [regex]::Matches($row, '<div class="x-grid-cell-inner ".*?>(.*?)<\/div>').ForEach({
        $value = $_.Groups[1].Value.Trim()
        if ($value -eq "&nbsp;") {
            $value = "-"
        }
        $value
    })

    # Skip the header row if no cells were found
    if ($cells.Count -eq 0) {
        continue
    }


    for ($i = 0; $i -lt $columns.Length; $i++) {
        $table += [PSCustomObject]@{
            Value  = $cells[$i]
        }
    }

}

# Display the table
$table | Format-Table -AutoSize