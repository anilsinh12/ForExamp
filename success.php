// <!DOCTYPE html>
// <html lang="en">
// <head>
//     <meta charset="UTF-8">
     
//     <title>success</title>
// </head>
// <body>
//     <?php
//              echo "Wellcome Buddy 🤝";
//     ?>
// </body>
// </html>



<?php
if (!class_exists('WP_List_Table')) {
    require_once ABSPATH . 'wp-admin/includes/class-wp-list-table.php';
}

function enqueue_child_styles() {
    wp_enqueue_style('parent-style', get_template_directory_uri() . '/style.css');
    wp_enqueue_style('child-style', get_stylesheet_directory_uri() . '/style.css', array('parent-style'), wp_get_theme()->get('Version'));
}
add_action('wp_enqueue_scripts', 'enqueue_child_styles');

 function create_employee_table() {
    global $wpdb;

    $table_name = $wpdb->prefix . 'employees';

    $charset_collate = $wpdb->get_charset_collate();

    $sql = "CREATE TABLE $table_name (
        empid INT NOT NULL AUTO_INCREMENT,
        empname VARCHAR(100) NOT NULL,
        department VARCHAR(50),
        contactNo VARCHAR(20),
        email VARCHAR(100) NOT NULL,
        PRIMARY KEY (empid)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}
add_action('init', 'create_employee_table');

 
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
    ?>
    <div class="wrap">
        <h1 class="wp-heading-inline">Employee Management</h1>
        <a href="#" class="page-title-action">Add New</a>

        <?php
        // Handle the form submission to add a new employee
        if (isset($_POST['action']) && $_POST['action'] === 'add_employee') {
            $new_employee = array(
                'empid'      => $_POST['empid'],
                'empname'    => sanitize_text_field($_POST['empname']),
                'department' => sanitize_text_field($_POST['department']),
                'contactNo'  => sanitize_text_field($_POST['contactNo']),
                'email'      => sanitize_email($_POST['email']),
            );

            // Add the new employee to your database or array
            // Add your logic here to save the employee data
            // For demonstration purposes, let's assume $data is an array representing your table data
            $data[] = $new_employee;
        }

        // Display the add employee form
        ?>
        <form method="post">
            <input type="hidden" name="action" value="add_employee">

            <label for="empid">Employee ID:</label>
            <input type="text" name="empid" required><br>

            <label for="empname">Employee Name:</label>
            <input type="text" name="empname" required><br>

            <label for="department">Department:</label>
            <input type="text" name="department"><br>

            <label for="contactNo">Contact Number:</label>
            <input type="text" name="contactNo"><br>

            <label for="email">Email:</label>
            <input type="text" name="email" required><br>

            <input type="submit" value="Add Employee">
        </form>


        <?php
        $data = array(); 
        // Your WP_List_Table initialization and display code goes here
        $employee_table = new Employee_List_Table($data);
        $employee_table->prepare_items();
        $employee_table->display();
        ?>
    </div>
    <?php
}
class Employee_List_Table extends WP_List_Table {
 
    private $data;

    function __construct($data = array()) {
        parent::__construct(array(
            'singular' => 'employee',
            'plural'   => 'employees',
            'ajax'     => false,
        ));

        $this->data = $data;
    }

    function column_default($item, $column_name) {
        return $item[$column_name];
    }

    function column_empname($item) {
        $actions = array(
            'edit'   => sprintf('<a href="?page=%s&action=%s&empid=%s">Edit</a>', $_REQUEST['page'], 'edit', $item['empid']),
            'delete' => sprintf('<a href="?page=%s&action=%s&empid=%s">Delete</a>', $_REQUEST['page'], 'delete', $item['empid']),
        );

        return sprintf('%1$s %2$s', $item['empname'], $this->row_actions($actions));
    }

    function column_id_and_name($item) {
        return sprintf('%1$s (ID: %2$s)', $item['empname'], $item['empid']);
    }

    function get_columns() {
        $columns = array(
            'empid'      => 'Employee ID',
            'empname'    => 'Employee Name',
            'department' => 'Department',
            'contactNo'  => 'Contact Number',
            'email'      => 'Email',
            'id_and_name' => 'ID and Name', // New column for nested table
        );

        return $columns;
    }

    function get_sortable_columns() {
        $sortable_columns = array(
            'empid'      => array('empid', false),
            'empname'    => array('empname', false),
            'department' => array('department', false),
            'contactNo'  => array('contactNo', false),
            'email'      => array('email', false),
        );

        return $sortable_columns;
    }
function prepare_items() {
    $columns = $this->get_columns();
    $hidden = array();
    $sortable = $this->get_sortable_columns();

    // Pagination
    $per_page = 10;
    $current_page = $this->get_pagenum();
    $total_items = count($this->data); // Ensure $data is an array

    $data_slice = array_slice($this->data, (($current_page - 1) * $per_page), $per_page);

    $this->_column_headers = array($columns, $hidden, $sortable);

    $this->items = $data_slice;
    
    $this->set_pagination_args(
        array(
            'total_items' => $total_items,
            'per_page'    => $per_page,
            'total_pages' => ceil($total_items / $per_page),
        )
    );
}
}




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






 
