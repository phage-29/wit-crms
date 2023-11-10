<?php
$page = "Accused List";
$Role = "Operator";
require_once "includes/session.php";
require_once "components/header.php";
?>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <?php
        require_once "components/sidebar.php";
        ?>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <?php
                require_once "components/topbar.php";
                ?>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"><?= $page ?></h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Accussed List</h6>
                        </div>
                        <div class="card-body">
                            <p class="text-right">
                                <button class="btn btn-outline-primary" type="button" data-toggle="collapse" data-target="#collapseAddAccused" aria-expanded="false" aria-controls="collapseAddAccused">
                                    Add Accused Person
                                </button>
                            </p>
                            <div class="collapse mb-3" id="collapseAddAccused">
                                <div class="card card-body">
                                    <form class="user" action="includes/process.php" method="POST">
                                        <div class="mb-3 row">
                                            <div class="col-lg-6 col-md-6">
                                                <label for="FirstName" class="form-label">First Name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="FirstName" name="FirstName" value="" required>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <label for="MiddleName" class="form-label">Middle Name</label>
                                                <input type="text" class="form-control" id="MiddleName" name="MiddleName" value="" required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <div class="col-lg-6 col-md-6">
                                                <label for="LastName" class="form-label">Last Name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="LastName" name="LastName" value="" required>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <label for="Sex" class="form-label">Sex <span class="text-danger">*</span></label>
                                                <select class="custom-select" id="Sex" name="Sex" required>
                                                    <option value="" selected disabled>--</option>
                                                    <option value="male">Male</option>
                                                    <option value="female">Female</option>
                                                    <option value="other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="DateOfBirth" class="form-label">Date Of Birth <span class="text-danger">*</span></label>
                                            <input type="date" class="form-control" id="DateOfBirth" name="DateOfBirth" value="" required>
                                        </div>

                                        <div class="mb-3 row">
                                            <div class="col-lg-6 col-md-6">
                                                <label for="Contact" class="form-label">Contact <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="Contact" name="Contact" value="" required>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <label for="Email" class="form-label">Email <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="Email" name="Email" value="" required>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="Address" class="form-label">Address</label>
                                            <textarea class="form-control" id="Address" name="Address" required></textarea>
                                        </div>
                                        <div class="text-right">
                                            <input type="hidden" name="AddAccused" />
                                            <button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#collapseAddAccused">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="collapse mb-3" id="collapseEditAccused">
                                <div class="card card-body">
                                    <form class="user" action="includes/process.php" method="POST">
                                        <div class="mb-3 row">
                                            <div class="col-lg-6 col-md-6">
                                                <label for="FirstName" class="form-label">First Name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="FirstName" name="FirstName" value="" required>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <label for="MiddleName" class="form-label">Middle Name</label>
                                                <input type="text" class="form-control" id="MiddleName" name="MiddleName" value="" required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <div class="col-lg-6 col-md-6">
                                                <label for="LastName" class="form-label">Last Name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="LastName" name="LastName" value="" required>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <label for="Sex" class="form-label">Sex <span class="text-danger">*</span></label>
                                                <select class="custom-select" id="Sex" name="Sex" required>
                                                    <option value="" selected disabled>--</option>
                                                    <option value="male">Male</option>
                                                    <option value="female">Female</option>
                                                    <option value="other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="DateOfBirth" class="form-label">Date Of Birth <span class="text-danger">*</span></label>
                                            <input type="date" class="form-control" id="DateOfBirth" name="DateOfBirth" value="" required>
                                        </div>

                                        <div class="mb-3 row">
                                            <div class="col-lg-6 col-md-6">
                                                <label for="Contact" class="form-label">Contact <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="Contact" name="Contact" value="" required>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <label for="Email" class="form-label">Email <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="Email" name="Email" value="" required>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="Address" class="form-label">Address</label>
                                            <textarea class="form-control" id="Address" name="Address" required></textarea>
                                        </div>
                                        <div class="text-right">
                                            <input type="hidden" name="id" id="id" />
                                            <input type="hidden" name="UpdateAccused" />
                                            <button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#collapseEditAccused">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Accused ID</th>
                                            <th>Name</th>
                                            <th>Contact</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = "SELECT * FROM accused";
                                        $result = $conn->execute_query($query, []);
                                        while ($row = $result->fetch_object()) {
                                        ?>
                                            <tr>
                                                <td class="text-center text-nowrap"><?= $row->AccusedID ?></td>
                                                <td class="text-nowrap"><a class="btn-link" href="#"><?= $row->FirstName ?> <?= $row->LastName ?></a></td>
                                                <td class="text-nowrap"><?= $row->Contact ?></td>
                                                <td class="text-nowrap"><?= $row->Email ?></td>
                                                <td class="text-nowrap"><?= $row->Address ?></td>
                                                <td class="text-center text-nowrap">
                                                    <button class='upd-btn btn btn-success btn-sm rounded-0 mx-1' data-editAccused="<?= $row->id ?>" data-toggle="collapse" data-target="#collapseEditAccused" aria-expanded="false" aria-controls="collapseEditAccused"><i class="fas fa-edit"></i></button>
                                                </td>
                                            </tr>
                                        <?php
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
    <?php
    require_once "components/footer.php";
    ?>
    <script>
        $('.upd-btn').click(function() {
            var EditAccused = $(this).data('editaccused');
            $.ajax({
                url: "includes/fetch.php",
                method: "POST",
                data: {
                    EditAccused: EditAccused
                },
                dataType: "json",
                success: function(data) {
                    jQuery('#collapseEditAccused #FirstName').val(data.FirstName);
                    jQuery('#collapseEditAccused #MiddleName').val(data.MiddleName);
                    jQuery('#collapseEditAccused #LastName').val(data.LastName);
                    jQuery('#collapseEditAccused #Sex').val(data.Sex);
                    jQuery('#collapseEditAccused #DateOfBirth').val(data.DateOfBirth);
                    jQuery('#collapseEditAccused #Contact').val(data.Contact);
                    jQuery('#collapseEditAccused #Email').val(data.Email);
                    jQuery('#collapseEditAccused #Address').val(data.Address);
                    jQuery('#collapseEditAccused #id').val(EditAccused);
                },
                error: function() {
                    alert("Error fetching events from the server.");
                },
            });
        });
    </script>
</body>

</html>