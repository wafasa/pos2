<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?><!DOCTYPE html>
<?php
    $sql ="SELECT * FROM sma_banner WHERE 1 AND status='active' ORDER BY banner_date DESC";
    $query = $this->db->query($sql);
?>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SMA Promotional Page</title>
    <link href="<?= $assets ?>styles/theme.css" rel="stylesheet">
    <link href="<?php echo base_url('assets/fa/css/font-awesome.min.css'); ?>" rel="stylesheet">
    <style>
    a,a:focus,a:hover{color:#000}.btn-default,.btn-default:focus,.btn-default:hover{color:#333;text-shadow:none;background-color:#fff;border:1px solid #fff}body,html{height:100%;background-color:#FFF}body{color:#333;text-align:center;text-shadow:0 1px 3px rgba(0,0,0,.05)}.site-wrapper{display:table;width:100%;height:100%;min-height:100%;-webkit-box-shadow:inset 0 0 100px rgba(0,0,0,.5);border:1px solid #ddd;border-radius:10px;}.site-wrapper-inner{display:table-cell;vertical-align:top}.cover-container{margin-right:auto;margin-left:auto}.inner{padding:30px}.masthead-brand{margin-top:10px;margin-bottom:10px}.masthead-nav>li{display:inline-block}.masthead-nav>li+li{margin-left:20px}.masthead-nav>li>a{padding-right:0;padding-left:0;font-size:16px;font-weight:700;color:#333;color:rgba(255,255,255,.75);border-bottom:2px solid transparent}.masthead-nav>li>a:focus,.masthead-nav>li>a:hover{background-color:transparent;border-bottom-color:#a9a9a9;border-bottom-color:rgba(255,255,255,.25)}.masthead-nav>.active>a,.masthead-nav>.active>a:focus,.masthead-nav>.active>a:hover{color:#333;border-bottom-color:#fff}.cover{padding:0 20px}.cover .btn-lg{padding:10px 20px;font-weight:700}.mastfoot{color:#ccc;color:#333}@media (min-width:768px){.masthead{position:fixed;top:0}.mastfoot{position:fixed;bottom:0}.site-wrapper-inner{vertical-align:middle}.cover-container,.mastfoot,.masthead{width:100%}}@media (min-width:992px){.cover-container,.mastfoot,.masthead{width:700px}}
    </style>
</head>

<body>
    <div class="site-wrapper">
        <div class="site-wrapper-inner">
            <div class="cover-container">
                <div class="masthead clearfix">
                    <div class="inner">
                    <?php if ($query->num_rows() > 0) { $i = 1; ?>
                        <div id="bannerCarousel" class="carousel slide" data-ride="carousel">
                            <!-- <ol class="carousel-indicators">
                                <li data-target="#bannerCarousel" data-slide-to="0" class=""></li>
                                <li data-target="#bannerCarousel" data-slide-to="1" class=""></li>
                                <li data-target="#bannerCarousel" data-slide-to="2" class="active"></li>
                            </ol> -->
                            <div class="carousel-inner">
                            <?php foreach ($query->result() as $row) { ?>
                                <div class="item<?php echo ($i == 1 ? ' active' : ''); ?>">
                                <?php if(strpos($row->banner_type, 'image') !== false) { ?>
                                    <img src="<?php echo base_url('assets/uploads/') . $row->banner_src; ?>" class="img-responsive" alt="Image">
                                <?php } else { ?>
                                    <video style="width: 100%;" autoplay>
                                      <source src="<?php echo base_url('assets/uploads/') . $row->banner_src; ?>" type="<?php echo $row->banner_type; ?>">
                                    </video>
                                <?php } ?>
                                </div>
                            <?php $i++; } ?>
                            </div>
                            <!-- <a class="left carousel-control" href="#bannerCarousel" data-slide="prev"><span class="fa fa-chevron-left"></span></a>
                            <a class="right carousel-control" href="#bannerCarousel" data-slide="next"><span class="fa fa-chevron-right"></span></a> -->
                        </div>
                    <?php } ?>
                    </div>
                </div>
                <div class="inner cover">
                    </div>
                <div class="mastfoot">
                    <div class="inner">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="<?= $assets ?>js/jquery.js"></script>
    <script type="text/javascript" src="<?= $assets ?>js/bootstrap.min.js"></script>
</body>
</html>
