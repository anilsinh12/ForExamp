 <?php
 
 //before file data


// Step 1: Register Custom Post Type
// Step 1: Register Custom Post Type 'Tour'
function register_tour_post_type() {
    $labels = array(
        'name'               => 'Tours',
        'singular_name'      => 'Tour',
        'menu_name'          => 'Tours',
        'add_new'            => 'Add New',
        'add_new_item'       => 'Add New Tour',
        'edit_item'          => 'Edit Tour',
        'new_item'           => 'New Tour',
        'view_item'          => 'View Tour',
        'search_items'       => 'Search Tours',
        'not_found'          => 'No tours found',
        'not_found_in_trash' => 'No tours found in Trash',
    );
    $args = array(
        'labels'              => $labels,
        'public'              => true,
        'has_archive'         => true,
        'publicly_queryable'  => true,
        'query_var'           => true,
        'rewrite'             => true,
        'capability_type'     => 'post',
        'hierarchical'        => false,
        'supports'            => array('title', 'editor', 'thumbnail', 'custom-fields'),
    );
    register_post_type('tour', $args);
}
add_action('init', 'register_tour_post_type');

// Step 2: Register Custom Taxonomy 'Tour Category'
function register_tour_category_taxonomy() {
    $labels = array(
        'name'                       => 'Tour Categories',
        'singular_name'              => 'Tour Category',
        'menu_name'                  => 'Tour Categories',
        'all_items'                  => 'All Tour Categories',
        'edit_item'                  => 'Edit Tour Category',
        'view_item'                  => 'View Tour Category',
        'update_item'                => 'Update Tour Category',
        'add_new_item'               => 'Add New Tour Category',
        'new_item_name'              => 'New Tour Category Name',
        'search_items'               => 'Search Tour Categories',
        'popular_items'              => 'Popular Tour Categories',
        'separate_items_with_commas' => 'Separate tour categories with commas',
        'add_or_remove_items'        => 'Add or remove tour categories',
        'choose_from_most_used'      => 'Choose from the most used tour categories',
        'not_found'                  => 'No tour categories found',
    );
    $args = array(
        'labels'            => $labels,
        'hierarchical'      => true,
        'public'            => true,
        'show_ui'           => true,
        'show_admin_column' => true,
        'query_var'         => true,
        'rewrite'           => array('slug' => 'tour-category'),
    );
    register_taxonomy('tour_category', array('tour'), $args);
}
add_action('init', 'register_tour_category_taxonomy');

// Step 3: Add Custom Metabox for 'Tour Type'  
function add_tour_metaboxes() {
    add_meta_box(
        'tour_metabox',
        'Tour Details',
        'render_tour_metabox',
        'tour',
        'normal',
        'high'
    );
}
add_action('add_meta_boxes', 'add_tour_metaboxes');

function render_tour_metabox($post) {
    $tour_type = get_post_meta($post->ID, '_tour_type', true);
    
    $day_night = get_post_meta($post->ID, '_day_night', true);
    $high_service = get_post_meta($post->ID, '_high_service', true);
    ?>
    <label for="tour_type">Tour Type:</label>
    <select name="tour_type" id="tour_type">
        <option value="premium" <?php selected($tour_type, 'premium'); ?>>Premium</option>
        <option value="regular" <?php selected($tour_type, 'regular'); ?>>Regular</option>
        <option value="average" <?php selected($tour_type, 'average'); ?>>Average</option>
    </select><br><br>

     

    <label for="day_night">Day/Night:</label>
    <select name="day_night" id="day_night">
        <option value="day" <?php selected($day_night, 'day'); ?>>Day</option>
        <option value="night" <?php selected($day_night, 'night'); ?>>Night</option>
    </select><br><br>

    <label for="high_service">High Service:</label>
    <input type="checkbox" name="high_service" id="high_service" <?php checked($high_service, 'on'); ?>>
    <br>
    <?php
}

function save_tour_metabox($post_id) {
    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) return;
    if (!current_user_can('edit_post', $post_id)) return;

    $tour_type = isset($_POST['tour_type']) ? sanitize_text_field($_POST['tour_type']) : '';
 
    $day_night = isset($_POST['day_night']) ? sanitize_text_field($_POST['day_night']) : '';
    $high_service = isset($_POST['high_service']) ? 'on' : '';

    update_post_meta($post_id, '_tour_type', $tour_type);
  
    update_post_meta($post_id, '_day_night', $day_night);
    update_post_meta($post_id, '_high_service', $high_service);
}

function tour_shortcode($atts) {
    $args = shortcode_atts(
        array(
            'posts_per_page' => -1, // Display all tours
        ),
        $atts,
        'display_tours'
    );

    $tour_query = new WP_Query(array(
        'post_type' => 'tour',
        'posts_per_page' => $args['posts_per_page'],
    ));

    ob_start();

    if ($tour_query->have_posts()) {
        while ($tour_query->have_posts()) : $tour_query->the_post();
            $tour_type = get_post_meta(get_the_ID(), '_tour_type', true);
            $day_night = get_post_meta(get_the_ID(), '_day_night', true);
            $high_service = get_post_meta(get_the_ID(), '_high_service', true);
            ?>
            <div class="tour-item">
                <h2><?php the_title(); ?></h2>
                <p><strong>Tour Type:</strong> <?php echo esc_html($tour_type); ?></p><br>
                <p><strong>Day/Night:</strong> <?php echo esc_html($day_night); ?></p><br>
                <p><strong>High Service:</strong> <?php echo ($high_service === 'on') ? 'Yes' : 'No'; ?></p><br>
            </div>
            <?php
        endwhile;
        wp_reset_postdata();
    } else {
        echo 'No tours found.';
    }

    return ob_get_clean();
}

add_shortcode('display_tours', 'tour_shortcode');






 // wp list table

 // Create employee table on theme activation
 function create_employee_table() {
    global $wpdb;

    $table_name = $wpdb->prefix . 'employees';

    if ($wpdb->get_var("SHOW TABLES LIKE '$table_name'") != $table_name) {
        $charset_collate = $wpdb->get_charset_collate();

        $sql = "CREATE TABLE $table_name (
            empid INT NOT NULL AUTO_INCREMENT,
            empname VARCHAR(100) NOT NULL,
            department VARCHAR(50),
            contactNo INT(20),
            email VARCHAR(100) NOT NULL,
            PRIMARY KEY (empid)
        ) $charset_collate;";

        require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
        dbDelta($sql);

        // Insert static data
        $wpdb->insert(
            $table_name,
            array(
                'empname'    => 'John Doe',
                'department' => 'IT',
                'contactNo'  => '1234567890',
                'email'      => 'john.doe@example.com',
            )
        );

        // Insert more static data if needed
        $wpdb->insert(
            $table_name,
            array(
                'empname'    => 'Jane Smith',
                'department' => 'HR',
                'contactNo'  => '9876543210',
                'email'      => 'jane.smith@example.com',
            )
        );
    }
}
register_activation_hook(__FILE__, 'create_employee_table');

if (!class_exists('WP_List_Table')) {
    require_once ABSPATH . 'wp-admin/includes/class-wp-list-table.php';
}

class Employee_List_Table extends WP_List_Table {
    function get_columns() {
        $columns = array(
            'cb'         => '<input type="checkbox" />',
            'empid'      => 'Employee ID',
            'empname'    => 'Employee Name',
            'department' => 'Department',
            'contactNo'  => 'Contact Number',
            'email'      => 'Email',
            'actions'    => 'Actions', // Add this line for the actions column
        );
        return $columns;
    }

    
    function prepare_items() {
        $per_page = 5;
        $current_page = $this->get_pagenum();
        $total_items = $this->get_total_items();
        $data = $this->get_employees($per_page, $current_page);

        $this->_column_headers = array($this->get_columns(), array(), array());
        $this->items = $data;

        $this->set_pagination_args(array(
            'total_items' => $total_items,
            'per_page'    => $per_page,
        ));
    }

    function get_total_items() {
        global $wpdb;
        $table_name = $wpdb->prefix . 'employees';

        return $wpdb->get_var("SELECT COUNT(empid) FROM $table_name");
    }

   function column_default($item, $column_name) {
    switch ($column_name) {
        case 'cb':
            return $this->column_cb($item);
        case 'empid':
        case 'empname':
        case 'department':
        case 'contactNo':
        case 'email':
            return $item[$column_name];
        case 'actions':
            $actions = array(
                'edit'   => sprintf('<a href="?page=%s&action=%s&empid=%s">Edit</a>', $_REQUEST['page'], 'edit', $item['empid']),
                'delete' => sprintf('<a href="?page=%s&action=%s&empid=%s">Trash</a>', $_REQUEST['page'], 'delete', $item['empid']),
                'view'   => sprintf('<a href="?page=%s&action=%s&empid=%s">View</a>', $_REQUEST['page'], 'view', $item['empid']),
            );
            return sprintf('%1$s | %2$s | %3$s',
                $actions['edit'],
                $actions['delete'],
                $actions['view']
            );
        default:
            return print_r($item, true);
    }
}

    function column_cb($item) {
        return sprintf(
            '<input type="checkbox" name="bulk-delete[]" value="%s" />',
            $item['empid']
        );
    }

    function get_employees($per_page = 5, $page_number = 1) {
    global $wpdb;
    $table_name = $wpdb->prefix . 'employees';

    $orderby = !empty($_GET["orderby"]) ? sanitize_text_field($_GET["orderby"]) : 'empid';
    $order = !empty($_GET["order"]) ? sanitize_text_field($_GET["order"]) : 'DESC';

    $search_field = isset($_POST['search-field']) ? sanitize_text_field($_POST['search-field']) : 'empname';
    $search_value = isset($_POST['s']) ? sanitize_text_field($_POST['s']) : '';

    $offset = ($page_number - 1) * $per_page;

    $search = '';
    if ($search_field === 'all') {
        // Search in all fields
        $search = $wpdb->prepare(
            " AND (empid LIKE '%%%s%%' OR empname LIKE '%%%s%%' OR department LIKE '%%%s%%' OR contactNo LIKE '%%%s%%' OR email LIKE '%%%s%%')",
            $search_value,
            $search_value,
            $search_value,
            $search_value,
            $search_value
        );
    } else {
        // Search in a specific field
        $search = $wpdb->prepare(" AND $search_field LIKE '%%%s%%'", $search_value);
    }

    $sql = "SELECT * FROM $table_name WHERE 1=1 $search ORDER BY $orderby $order LIMIT $offset, $per_page";

    return $wpdb->get_results($sql, ARRAY_A);
}
}

function employee_management_menu() {
    add_menu_page(
        'Employee Management',
        'Employee Management',
        'manage_options',
        'employee_management',
        'employee_management_page'
    );
}
add_action('admin_menu', 'employee_management_menu');

function employee_management_page() {
    $employee_table = new Employee_List_Table();
    $employee_table->prepare_items();

    // Insert Data into Table
    if (isset($_POST['insert_employee'])) {
        global $wpdb;
        $table_name = $wpdb->prefix . 'employees';

        $empname = sanitize_text_field($_POST['empname']);
        $department = sanitize_text_field($_POST['department']);
        $contactNo = sanitize_text_field($_POST['contactNo']);
        $email = sanitize_text_field($_POST['email']);

        $wpdb->insert(
            $table_name,
            array(
                'empname'    => $empname,
                'department' => $department,
                'contactNo'  => $contactNo,
                'email'      => $email,
            )
        );

        // Refresh the page to display the new data
        echo '<script>window.location.reload();</script>';
    }
    $empid_to_edit = 0;
        if (isset($_GET['action']) && $_GET['action'] === 'edit') {
            $empid_to_edit = isset($_GET['empid']) ? intval($_GET['empid']) : 0;
        }

    // Get employee data by ID to populate the form fields
    $employee_data = $employee_table->get_employee_by_id($empid_to_edit);

    ?>
    <div class="wrap">
        <h1 class="wp-heading-inline">Employee Management</h1>

        <!-- Search Form -->
        <form method="post">
            <div style="margin-bottom: 20px; display: flex; justify-content: flex-end; align-items: center;">
                <label for="search-field" style="margin-right: 10px;">Search Employees:</label>
                <select name="search-field">
                    <option value="empid">Employee ID</option>
                    <option value="empname">Employee Name</option>
                    <option value="department">Department</option>
                    <option value="contactNo">Contact Number</option>
                    <option value="email">Email</option>
                </select>
                <input type="text" name="s" value="<?php echo esc_attr($employee_table->get_search_text()); ?>" placeholder="Search...">
                <input type="submit" name="search" value="Search" class="button button-primary">
            </div>
        </form>

        <!-- Form for Manual Data Insertion -->
        <form method="post">
            <h2>Add New Employee</h2>
            <label for="empname">Employee Name:</label>
            <input type="text" name="empname" required>
            <label for="department">Department:</label>
            <input type="text" name="department">
            <label for="contactNo">Contact Number:</label>
            <input type="text" name="contactNo">
            <label for="email">Email:</label>
            <input type="email" name="email" required>
              <input type="submit" name="<?php echo ($empid_to_edit > 0) ? 'update_employee' : 'insert_employee'; ?>" value="<?php echo ($empid_to_edit > 0) ? 'Update Employee' : 'Insert Employee'; ?>" class="button button-primary">
        </form>

        <?php
        // Display the Employee List Table
        $employee_table->display();

        // Alternatively, if you want to manually display employee data without the list table
        $employees = $employee_table->get_employees();
        ?>
        <table class="wp-list-table widefat fixed striped">
            <thead>
                <tr>
                    <th>Employee Id</th>
                    <th>Employee Name</th>
                    <th>Department</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <!-- Add more columns if needed -->
                </tr>
            </thead>
            <tbody>
                <?php foreach ($employees as $employee) : ?>
                    <tr>
                        <td><?php echo $employee['empid']; ?></td>
                        <td><?php echo $employee['empname']; ?></td>
                        <td><?php echo $employee['department']; ?></td>
                        <td><?php echo $employee['contactNo']; ?></td>
                        <td><?php echo $employee['email']; ?></td>
                        <!-- Add more columns if needed -->
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <style>
        /* Add this to your theme's style.css */

        .wrap form {
            margin-bottom: 20px;
        }

        .wrap form label {
            margin-right: 10px;
        }
    </style>
<?php
}


// // cutom post / custom templet
// function custom_post_template($single_template) {
//     global $post;

//     if ($post->post_type == 'tour') {
//         $single_template = get_template_directory() . '/single-tour.php';
//     }

//     return $single_template;
// }
// add_filter('single_template', 'custom_post_template');

// Register Custom Post Type
function custom_post_type() {
    $labels = array(
        'name'               => 'Custom Posts',
        'singular_name'      => 'Custom Post',
        'menu_name'          => 'Custom Posts',
        'all_items'          => 'All Custom Posts',
        'add_new'            => 'Add New',
        'add_new_item'       => 'Add New Custom Post',
        'edit_item'          => 'Edit Custom Post',
        'new_item'           => 'New Custom Post',
        'view_item'          => 'View Custom Post',
        'search_items'       => 'Search Custom Posts',
        'not_found'          => 'No custom posts found',
        'not_found_in_trash' => 'No custom posts found in Trash',
    );
    $args = array(
        'labels'             => $labels,
        'public'             => true,
        'has_archive'        => true,
        'publicly_queryable' => true,
        'show_ui'            => true,
        'show_in_menu'       => true,
        'menu_position'      => 5,
        'menu_icon'          => 'dashicons-book-alt', // You can choose a different dashicon
        'query_var'          => true,
        'rewrite'            => array('slug' => 'custom-posts'),
        'capability_type'    => 'post',
        'supports'           => array('title', 'editor', 'thumbnail', 'excerpt', 'comments'),
    );
    register_post_type('custom_post', $args);

    // Register Custom Taxonomy
    $taxonomy_labels = array(
        'name'              => 'Custom Categories',
        'singular_name'     => 'Custom Category',
        'search_items'      => 'Search Custom Categories',
        'all_items'         => 'All Custom Categories',
        'parent_item'       => 'Parent Custom Category',
        'parent_item_colon' => 'Parent Custom Category:',
        'edit_item'         => 'Edit Custom Category',
        'update_item'       => 'Update Custom Category',
        'add_new_item'      => 'Add New Custom Category',
        'new_item_name'     => 'New Custom Category Name',
        'menu_name'         => 'Custom Categories',
    );
    $taxonomy_args = array(
        'hierarchical'      => true,
        'labels'            => $taxonomy_labels,
        'show_ui'           => true,
        'show_admin_column' => true,
        'query_var'         => true,
        'rewrite'           => array('slug' => 'custom-category'),
    );
    register_taxonomy('custom_category', array('custom_post'), $taxonomy_args);
}
add_action('init', 'custom_post_type');

// Flush rewrite rules to make custom post type and taxonomy work
function custom_rewrite_flush() {
    custom_post_type();
    flush_rewrite_rules();
}
add_action('after_switch_theme', 'custom_rewrite_flush');


function custom_posts_shortcode($atts) {
    // Shortcode attributes
    $atts = shortcode_atts(
        array(
            'category' => '',
        ),
        $atts,
        'custom_posts'
    );

    // Query custom posts based on the category
    $args = array(
        'post_type'      => 'custom_post',
        'posts_per_page' => -1,
        'tax_query'      => array(
            array(
                'taxonomy' => 'custom_category',
                'field'    => 'slug',
                'terms'    => $atts['category'],
            ),
        ),
    );
    $query = new WP_Query($args);

    // Display custom posts
    if ($query->have_posts()) {
        $output = '<ul>';
        while ($query->have_posts()) {
            $query->the_post();
            $output .= '<li><a href="' . get_permalink() . '">' . get_the_title() . '</a></li>';
        }
        $output .= '</ul>';
        wp_reset_postdata();
        return $output;
    } else {
        return 'No custom posts found.';
    }
}
add_shortcode('custom_posts', 'custom_posts_shortcode');
 
