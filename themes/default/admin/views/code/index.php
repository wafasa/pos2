<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<style type="text/css" media="screen">
    #PRData td:nth-child(7) {
        text-align: right;
    }
    <?php if($Owner || $Admin || $this->session->userdata('show_cost')) { ?>
    #PRData td:nth-child(9) {
        text-align: right;
    }
    <?php } if($Owner || $Admin || $this->session->userdata('show_price')) { ?>
    #PRData td:nth-child(8) {
        text-align: right;
    }
    <?php } ?>
</style>
<script>
    
</script>
<?php if ($Owner || $GP['bulk_actions']) {
    echo admin_form_open('products/product_actions'.($warehouse_id ? '/'.$warehouse_id : ''), 'id="action-form"');
} ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i
                class="fa-fw fa fa-barcode"></i><?= lang('code') . ' (' . ($warehouse_id ? $warehouse->name : lang('all_warehouses')) . ')'.($supplier ? ' ('.lang('supplier').': '.($supplier->company && $supplier->company != '-' ? $supplier->company : $supplier->name).')' : ''); ?>
        </h2>
        
        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang("actions") ?>"></i>
                    </a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li>
                            <a href="#" class="bpo" title="Edit Code"
                                data-content="<form><p>Please input new code</p><input type='text' name='code' id='code' style='width: 100px; margin-right:10px;' /><input type='button' value='Submit' class='btn btn-danger' onclick='submitss()'/> <a id='a__a' style='display:none' href='http://naturerepublic.id/pos/admin/code/update' class='btn btn-danger'>submit</a></form>"
                                data-html="true" data-placement="left">
                                <i class="fa fa-edit"></i> Edit Code
                            </a>
                         </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?= lang('list_results'); ?></p>

                <div class="table-responsive">
                    <table id="PRData" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                        <tr class="primary">
                            <th>No</th>
                            <th><?= lang("code") ?></th>
                            <th style="min-width:65px; text-align:center;"><?= lang("actions") ?></th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php 
                                    for ($i=0; $i< count($result); $i++){
                                        echo '<td>'.($i+1).'</td>';
                                        echo '<td>'.$result[$i]->generate_code.'</td>';
                                        echo '<td>action</td>';
                                        echo '</tr>';
                                    }
                                ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function submitss(){
        var a = document.getElementById("a__a");
        a.setAttribute("href", "http://naturerepublic.id/pos/admin/code/update?code="+document.getElementById("code").value);
        a.click();
    }
</script>
<?php if ($Owner || $GP['bulk_actions']) { ?>
    <div style="display: none;">
        <input type="hidden" name="form_action" value="" id="form_action"/>
        <?= form_submit('performAction', 'performAction', 'id="action-form-submit"') ?>
    </div>
    <?= form_close() ?>
<?php } ?>
