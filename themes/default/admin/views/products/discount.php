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
    var oTable;
    $(document).ready(function () {
        oTable = $('#PRData').dataTable({
            "aaSorting": [[2, "asc"], [3, "asc"]],
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('all') ?>"]],
            "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': false, 'bServerSide': false,
           
            'fnRowCallback': function (nRow, aData, iDisplayIndex) {
                var oSettings = oTable.fnSettings();
                nRow.id = aData[0];
                nRow.className = "product_link";
                //if(aData[7] > aData[9]){ nRow.className = "product_link warning"; } else { nRow.className = "product_link"; }
                return nRow;
            },
            "aoColumns": [
                 null, null, null, null, null, null, null, null
            ]
        }).fnSetFilteringDelay().dtFilter([
            {column_number: 2, filter_default_label: "[<?=lang('product');?>]", filter_type: "text", data: []},
			{column_number: 3, filter_default_label: "[<?=lang('name');?>]", filter_type: "text", data: []},
            {column_number: 4, filter_default_label: "[<?=lang('discount');?>]", filter_type: "text", data: []},
            {column_number: 5, filter_default_label: "[<?=lang('start_date');?>]", filter_type: "text", data: []},
            {column_number: 6, filter_default_label: "[<?=lang('end_date');?>]", filter_type: "text", data: []},
			{column_number: 7, filter_default_label: "[<?=lang('free_item');?>]", filter_type: "text", data: []},
			{column_number: 8, filter_default_label: "[<?=lang('min_transaction');?>]", filter_type: "text", data: []},
			{column_number: 9, filter_default_label: "[<?=lang('status');?>]", filter_type: "text", data: []},
           
        ], "footer");

    });
</script>
<?php if ($Owner || $GP['bulk_actions']) {
    echo admin_form_open('products/product_actions'.($warehouse_id ? '/'.$warehouse_id : ''), 'id="action-form"');
} ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i
                class="fa-fw fa fa-barcode"></i><?= lang('discounts') . ' (' . ($warehouse_id ? $warehouse->name : lang('all_warehouses')) . ')'.($supplier ? ' ('.lang('supplier').': '.($supplier->company && $supplier->company != '-' ? $supplier->company : $supplier->name).')' : ''); ?>
        </h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang("actions") ?>"></i>
                    </a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li>
                            <a href="<?= admin_url('products/add_discount') ?>">
                                <i class="fa fa-plus-circle"></i> <?= lang('add_discount') ?>
                            </a>
                        </li>
                        <?php if(!$warehouse_id) { ?>
                        <li>
                            <a href="<?= admin_url('discount/update') ?>" data-toggle="modal" data-target="#myModal">
                                <i class="fa fa-file-excel-o"></i> <?= lang('update_discount') ?>
                            </a>
                        </li>
                        <?php } ?>
                       
                        <li class="divider"></li>
                        <li>
                            <a href="#" class="bpo" title="<b><?= $this->lang->line("delete_products") ?></b>"
                                data-content="<p><?= lang('r_u_sure') ?></p><button type='button' class='btn btn-danger' id='delete' data-action='delete'><?= lang('i_m_sure') ?></a> <button class='btn bpo-close'><?= lang('no') ?></button>"
                                data-html="true" data-placement="left">
                            <i class="fa fa-trash-o"></i> <?= lang('delete_discounts') ?>
                             </a>
                         </li>
                    </ul>
                </li>
                <?php if (!empty($warehouses)) { ?>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-building-o tip" data-placement="left" title="<?= lang("warehouses") ?>"></i></a>
                        <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                            <li><a href="<?= admin_url('products') ?>"><i class="fa fa-building-o"></i> <?= lang('all_warehouses') ?></a></li>
                            <li class="divider"></li>
                            <?php
                            foreach ($warehouses as $warehouse) {
                                echo '<li><a href="' . admin_url('products/' . $warehouse->id) . '"><i class="fa fa-building"></i>' . $warehouse->name . '</a></li>';
                            }
                            ?>
                        </ul>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?= lang('list_results'); ?></p>
				<a href="products/add_discount/" class="btn btn-default btn-primary btn-xs"><i class="fa fa-plus"></i>&nbsp;Add Discount</a>
                <div class="table-responsive">

                    <table id="PRData" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                        <tr class="primary">
                           
                             <th><?= lang("name") ?></th>
							<th><?= lang("discount") ?></th>
                            <th><?= lang("start_date") ?></th>
                            <th><?= lang("end_date") ?></th>
							<th><?= lang("free_item") ?></th>
							<th><?= lang("min_transaction") ?></th>
							<th><?= lang("status") ?></th>
                            <th style="min-width:65px; text-align:center;"><?= lang("actions") ?></th>
                        </tr>
                        </thead>
                        <tbody>
							<?php foreach($discounts as $d) { ?>
							<tr>
								<td><?php echo $d->product_name;?></td>
								<td><?php echo $d->discount;?></td>
								<td align="right"><?php echo date('d-M-Y H:i:s', strtotime($d->start_date));?></td>
								<td align="right"><?php echo date('d-M-Y H:i:s', strtotime($d->end_date));?></td>
								<td><?php echo $d->free_item_name;?></td>
								<td align="right"><?php echo number_format($d->min_trx);?></td>
								<td><?php echo $d->status ? "Active" : "InActive"; ?></td>
								<td>
								<button type="button" class="btn btn-default btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span>
								
								</button>
								<ul class="dropdown-menu pull-right" role="menu">
								<li>
								<a class="" href="products/edit_discount/<?php echo $d->id;?>"><i class="fa fa-edit"></i>Edit Discount</a>
								</li>
								<li><a class=""  href="products/delete_discount/<?php echo $d->id;?>"><i class="fa fa-trash"></i>Delete Discount</a>
								</li></ul>
							</tr>
							<?php } ?>
                        </tbody>
<tfoot class="dtFilter">
                        <tr class="active">
                             <th></th>
                           <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                           
                            <th></th>
                           
                            
                            <th style="text-align:center;"><?= lang("actions") ?></th>
                        </tr>
                        </tfoot>
                        
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if ($Owner || $GP['bulk_actions']) { ?>
    <div style="display: none;">
        <input type="hidden" name="form_action" value="" id="form_action"/>
        <?= form_submit('performAction', 'performAction', 'id="action-form-submit"') ?>
    </div>
    <?= form_close() ?>
<?php } ?>
