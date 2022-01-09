<?php 
  include "config/koneksi.php";
  
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>LAPORAN PENJUALAN</title>
  </head>
  <body onload="window.print()">
  <div class="container">
    <div class="row">
      <div class="col-md-12"><h1 class="text-center text-primary">LAPORAN PENJUALAN VOUCHER GAME</h1>
        <?php
        $tanggal = date('Y-m-d');
        echo $tanggal;
        ?>
      </div>
    </div>
    <br>
    <div class="row">
      <div class="col-md-12">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>No Faktur</th>
                    <th>Kode Game</th>
                    <th>Nama Game</th>
                    <th>Harga Satuan</th>
                    <th>Jumlah Beli</th>
                    <th>Total</th>
                    <th>Tanggal</th>
                </tr>
            </thead>

            <tbody>
              <?php 
                $sql = "SELECT * FROM tbl_beli";
                $query = mysqli_query($con, $sql);
                while($r= mysqli_fetch_array($query)){
              ?>
                <tr>
                    <td><?php echo $r['nofaktur'] ?></td>
                    <td><?php echo $r['kd_barang'] ?></td>
                    <td><?php echo $r['nama_barang'] ?></td>
                    <td><?php echo $r['hsatuan'] ?></td>
                    <td><?php echo $r['jumlah_beli'] ?></td>
                    <td><?php echo $r['harga'] ?></td>
                    <td><?php echo $r['tanggal'] ?></td>
                </tr>
                <?php } ?>
                
                
            </tbody>
        </table>

      </div>
    </div>

  </div>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>