<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php
if (!empty($variants)) {
    foreach ($variants as $variant) {
        $vars[] = addslashes($variant->name);
    }
} else {
    $vars = array();
}
?>

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-plus"></i>Add Discount</h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?php echo lang('enter_info'); ?></p>

                <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form');
                echo admin_form_open_multipart("products/save_discount", $attrib)
                ?>

                <div class="col-md-5">
                   <div class="form-group standard">
                        <label class="control-label">Product *</label>
                        <select name="product_id" required class="form-control">
                            <option value="0">-All of products-</option>
							<?php
							$sql = "select * from sma_products order by name";
							$a = $this->db->query($sql)->result_object();
							foreach($a as $b) {
							?>
							<option value="<?php echo $b->id;?>"><?php echo $b->code;?> - <?php echo $b->name;?></option>
							<?php } ?>
						</select>
                    </div>
                   
                   
					
					<div class="form-group standard">
                         <label class="control-label">Start Date *</label>
                        <?= form_input('start_date', (isset($_POST['start_date']) ? $_POST['start_date'] :  ''), 'class="form-control tip date" id="min_trx" required="required"') ?>
                    </div>
					
					<div class="form-group standard">
                        <label class="control-label"> End Date *</label>
                        <?= form_input('end_date', (isset($_POST['end_date']) ? $_POST['end_date'] :  ''), 'class="form-control tip date" id="min_trx" required="required"') ?>
                    </div>
					
					 <div class="form-group standard">
                         <label class="control-label">Discount (%)</label>
                      
						 <input type="number" name="discount" min="0" max="100" class="form-control tipe" value="<?php (isset($_POST['discount']) ? $_POST['discount'] :  '') ?>"/>
                    </div>
					
					<div class="form-group standard">
                       <label class="control-label">Free Item</label>
                        <select name="free_item_id"  class="form-control">
							<option value=""></option>
							<?php
							$sql = "select * from sma_products order by name";
							$a = $this->db->query($sql)->result_object();
							foreach($a as $b) {
							?>
							<option value="<?php echo $b->id;?>"><?php echo $b->code;?> - <?php echo $b->name;?></option>
							<?php } ?>
						</select>
                    </div>
                   
                    <div class="form-group standard">
                        <label class="control-label">Minimum Transaction</label>
                    	
						 <input type="number" name="min_trx" min="0" class="form-control tip" value="<?php (isset($_POST['min_trx']) ? $_POST['min_trx'] :  '') ?>"/>
                    </div>
					
					<div class="form-group standard">
                       <label class="control-label">Status *</label>
                        <select name="status" required class="form-control">
							<option value="1">Active</option>
							<option value="2">Inactive</option>
						</select>
                    </div>
                 
                    
                </div>
              

                <div class="col-md-12">
                   

                    <div class="form-group">
                        <?php echo form_submit('add_product_discount', 'Add Discount', 'class="btn btn-primary"'); ?>
                    </div>

                </div>
                <?= form_close(); ?>

            </div>

        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
		$(".date").datetimepicker({
                format: "yyyy-mm-dd hh:ii:ss",
                fontAwesome: true,
                language: 'sma',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0
            });
	});
</script>	