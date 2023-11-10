<?php
$page = "Calendar";
$Role = "Admin";
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
                    <!-- <h1 class="h3 mb-4 text-gray-800">Dashboard</h1> -->

                    <div class="card shadow mb-4">
                        <!-- Card Header -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Calendar</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body" id="Notes">
                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    var calendarEl = document.getElementById('calendar');

                                    var calendar = new FullCalendar.Calendar(calendarEl, {
                                        initialDate: '<?= date('Y-m-d') ?>',
                                        initialView: 'dayGridMonth',
                                        headerToolbar: {
                                            left: 'prev,next today',
                                            center: 'title',
                                            right: 'dayGridMonth,dayGridWeek'
                                        },
                                        height: 'auto',
                                        navLinks: true, // can click day/week names to navigate views
                                        editable: true,
                                        selectable: true,
                                        selectMirror: true,
                                        nowIndicator: true,
                                        events: [
                                            <?php
                                            $result = $conn->query("SELECT * FROM cases");
                                            while ($row = $result->fetch_object()) {
                                                ?>
                                                {
                                                    title: '<?= $row->CaseNo ?>',
                                                    start: '<?= $row->CreatedAt ?>',
                                                },
                                                <?php
                                            }
                                            ?>

                                        ]
                                    });

                                    calendar.render();
                                });

                            </script>
                            <div id='calendar'></div>
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

</body>

</html>