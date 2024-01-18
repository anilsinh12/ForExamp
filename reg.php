<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Register Page</title>
</head>
<body>
    <center>
    <div class="container">
        <h1>Registeration Page</h1>
        <p>This is some text.</p>
    </div>
        <form action="login.php" method="POST"> 
            <div class="form-group">
                <label for="usr">Uername:</label>
                <input type="text" name="unm" class="form-control" placeholder="Username">
                <!-- <p><input type="text" name="unm" placeholder="Username"></p> -->
                
                <label for="ps">Password:</label>
                <p><input type="password" name="pass" placeholder="******" class="form-control"></p>
                
                <label for="em">Email:</label>
                <p><input type="email" name="email" id="" placeholder="E-Mail" class="form-control" ></p>

                <label for="em">Adderess:</label>
                <p><input type="text" name="add" id="" placeholder="Adderess" class="form-control" ></p>
             
            </div>  
             
             
             <tr>
                <td>
                <input type="submit" value="Register" name="submit" class="btn btn-primary">
                </td>
                <td>
                <input type="reset" value="Reset" name="reset" class="btn btn-danger">
                </td>

             </tr>
             
            
        </form>
    </center>
</body>
</html>
-----------------

class Myappix_wp_auto_update
{

    // ... (Existing class properties and methods)

    /**
     * Updates the license information.
     *
     * @param string $username      The username for the license.
     * @param string $purchase_code The purchase code for the license.
     * 
     * @return string The result of the license update. Returns 'correct' on success, or null/false on failure.
     */
    function updateLicense($username, $purchase_code)
    {
        $return = $this->getRemoteLicense($username, $purchase_code);
        if ($return == 'correct') {
            update_option('myappix_username', $username);
            update_option('myappix_purchase_code', $purchase_code);
        }
        return $return;
    }

    /**
     * Add our self-hosted autoupdate plugin to the filter transient.
     *
     * @param array $transient The transient to check for updates.
     * 
     * @return object $transient The modified transient with update information.
     */
    public function checkUpdate($transient)
    {
        if (empty($transient->last_checked)) {
            return $transient;
        }
        if ($this->getRemoteLicense() == 'correct') {
            // Get the remote version
            $remote_version = $this->getRemoteVersion();

            // If a newer version is available, add the update
            if (version_compare($this->current_version, $remote_version, '<')) {
                $transient->response[$this->theme_slug] = array(
                    'new_version' => $remote_version,
                    'package' => $this->update_path,
                    'url' => 'https://www.solwininfotech.com/product/wordpress-themes/myappix/'
                );
            }
        }
        return $transient;
    }

    /**
     * Return the remote version.
     *
     * @return string|false The remote version on success, or false on failure.
     */
    public function getRemoteVersion()
    {
        $request = wp_remote_post($this->update_path, array('body' => array('action' => 'version', 'product' => $this->theme_slug)));
        if (!is_wp_error($request) || wp_remote_retrieve_response_code($request) === 200) {
            return $request['body'];
        }
        return false;
    }

    /**
     * Return the status of the plugin licensing.
     *
     * @param string $username      The username for the license.
     * @param string $purchase_code The purchase code for the license.
     * 
     * @return string|false The remote license status on success, or false on failure.
     */
    public function getRemoteLicense($username = '', $purchase_code = '')
    {

        if ($username == '') {
            $username = get_option('myappix_username');
        }
        if ($purchase_code == '') {
            $purchase_code = get_option('myappix_purchase_code');
        }
        $site_url = get_site_url();
        $request = wp_remote_post($this->update_path, array('body' => array('action' => 'license', 'plugin_name' => $this->theme_slug, 'site_url' => $site_url, 'username' => $username, 'purchase_code' => $purchase_code)));
        if (!is_wp_error($request) || wp_remote_retrieve_response_code($request) === 200) {
            return $request['body'];
        }
        return false;
    }

}--------------------

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

/**
 * Class Myappix_wp_auto_update
 */
class Myappix_wp_auto_update
{
    /**
     * The plugin current version
     *
     * @var string
     */
    public $current_version;

    /**
     * The plugin remote update path
     *
     * @var string
     */
    public $update_path;

    /**
     * Plugin Slug (plugin_directory/plugin_file.php)
     *
     * @var string
     */
    public $theme_slug;

    /**
     * Initialize a new instance of the WordPress Auto-Update class
     */
    public function __construct()
    {
        $theme_data = wp_get_theme();

        // Set the class public variables
        $this->current_version = $theme_data->get('Version');
        $this->update_path = 'https://www.solwininfotech.com/sollicweb/myappix_check_purchase_code.php';
        $this->theme_slug = $theme_data->get_template();

        // Define the alternative API for updating checking
        add_filter('pre_set_site_transient_update_themes', array($this, 'check_update'));
    }

    /**
     * Updates the license information.
     *
     * @param string $username      The username for the license.
     * @param string $purchase_code The purchase code for the license.
     *
     * @return string The result of the license update.
     */
    public function updateLicense($username, $purchase_code)
    {
        $return = $this->getRemoteLicense($username, $purchase_code);
        if ($return === 'correct') {
            update_option('myappix_username', $username);
            update_option('myappix_purchase_code', $purchase_code);
        }
        return $return;
    }

    /**
     * Add our self-hosted autoupdate plugin to the filter transient
     *
     * @param array $transient The transient to check for updates.
     *
     * @return object $transient
     */
    public function checkUpdate($transient)
    {
        if (empty($transient->last_checked)) {
            return $transient;
        }
        if ($this->getRemoteLicense() === 'correct') {
            // Get the remote version
            $remote_version = $this->getRemoteVersion();

            // If a newer version is available, add the update
            if (version_compare($this->current_version, $remote_version, '<')) {
                $transient->response[$this->theme_slug] = array(
                    'new_version' => $remote_version,
                    'package' => $this->update_path,
                    'url' => 'https://www.solwininfotech.com/product/wordpress-themes/myappix/'
                );
            }
        }
        return $transient;
    }

    /**
     * Return the remote version
     *
     * @return string $remote_version
     */
    public function getRemoteVersion()
    {
        $request = wp_remote_post($this->update_path, array('body' => array('action' => 'version', 'product' => $this->theme_slug)));
        if (!is_wp_error($request) || wp_remote_retrieve_response_code($request) === 200) {
            return $request['body'];
        }
        return false;
    }

    /**
     * Return the changelog
     *
     * @return string $changelog
     */
    public function getRemoteChangelog()
    {
        $request = wp_remote_post($this->update_path, array('body' => array('action' => 'changelog', 'product' => $this->theme_slug)));
        if (!is_wp_error($request) || wp_remote_retrieve_response_code($request) === 200) {
            return $request['body'];
        }
        return false;
    }

    /**
     * Return the status of the plugin licensing
     *
     * @param string $username      The username for the license.
     * @param string $purchase_code The purchase code for the license.
     *
     * @return boolean $remote_license
     */
    public function getRemoteLicense($username = '', $purchase_code = '')
    {
        if ($username === '') {
            $username = get_option('myappix_username');
        }
        if ($purchase_code === '') {
            $purchase_code = get_option('myappix_purchase_code');
        }
        $site_url = get_site_url();
        $request = wp_remote_post($this->update_path, array('body' => array('action' => 'license', 'plugin_name' => $this->theme_slug, 'site_url' => $site_url, 'username' => $username, 'purchase_code' => $purchase_code)));
        if (!is_wp_error($request) || wp_remote_retrieve_response_code($request) === 200) {
            return $request['body'];
        }
        return false;
    }
}
-------------------

/**
 * Sanitize a text field.
 *
 * This function is used as a callback for sanitizing text fields.
 *
 * @param  string  $input  The input value to be sanitized.
 * @return string  The sanitized output.
 */
add_filter('of_sanitize_text', 'sanitize_text_field');

/**
 * Sanitize a textarea field.
 *
 * This function is used as a callback for sanitizing textarea fields.
 *
 * @param  string  $input  The input value to be sanitized.
 * @return string  The sanitized output using wp_kses.
 */
function of_sanitize_textarea($input)
{
    global $allowedposttags;
    $output = wp_kses($input, $allowedposttags);
    return $output;
}

add_filter('of_sanitize_textarea', 'of_sanitize_textarea');

/**
 * Sanitize a select field.
 *
 * This function is used as a callback for sanitizing select fields.
 *
 * @param  string  $input  The input value to be sanitized.
 * @param  array   $option An array of options for the select field.
 * @return string  The sanitized output.
 */
add_filter('of_sanitize_select', 'of_sanitize_enum', 10, 2);

/**
 * Sanitize a radio field.
 *
 * This function is used as a callback for sanitizing radio fields.
 *
 * @param  string  $input  The input value to be sanitized.
 * @param  array   $option An array of options for the radio field.
 * @return string  The sanitized output.
 */
add_filter('of_sanitize_radio', 'of_sanitize_enum', 10, 2);

/**
 * Sanitize an images field.
 *
 * This function is used as a callback for sanitizing images fields.
 *
 * @param  string  $input  The input value to be sanitized.
 * @param  array   $option An array of options for the images field.
 * @return string  The sanitized output.
 */
add_filter('of_sanitize_images', 'of_sanitize_enum', 10, 2);

/**
 * Sanitize a checkbox field.
 *
 * This function is used as a callback for sanitizing checkbox fields.
 *
 * @param  mixed  $input  The input value to be sanitized.
 * @return string|bool   The sanitized output.
 */
function of_sanitize_checkbox($input)
{
    if ($input) {
        $output = '1';
    } else {
        $output = false;
    }
    return $output;
}

add_filter('of_sanitize_checkbox', 'of_sanitize_checkbox');

/**
 * Sanitize a multicheck field.
 *
 * This function is used as a callback for sanitizing multicheck fields.
 *
 * @param  array   $input   The input value to be sanitized.
 * @param  array   $option  An array of options for the multicheck field.
 * @return array   The sanitized output.
 */
function of_sanitize_multicheck($input, $option)
{
    $output = '';
    if (is_array($input)) {
        foreach ($option['options'] as $key => $value) {
            $output[$key] = "0";
        }
        foreach ($input as $key => $value) {
            if (array_key_exists($key, $option['options']) && $value) {
                $output[$key] = "1";
            }
        }
    }
    return $output;
}

add_filter('of_sanitize_multicheck', 'of_sanitize_multicheck', 10, 2);

// Add other functions with appropriate documentation here...
