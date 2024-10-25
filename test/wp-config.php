<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'helferna' );

/** Database password */
define( 'DB_PASSWORD', 'Test1234@!' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'H/xc%_R&/APptQ#D!RmDw}a5oOY@gklWcawC2^tuU>PW0fecyJbm5[6qxUQrNFc-' );
define( 'SECURE_AUTH_KEY',   'SZo6p5Yu7e4.xDGx2CUT)*~X<uJ3Y=~YTX}}4x)Yieug:7`H|ZwoPYI5Nt[K:B+u' );
define( 'LOGGED_IN_KEY',     '2h%J]YVNlXtA//pE4M-Qi{31?<1h`U2&AMW9O;^2<<GM3|gllqv#IJhT:kE`}nh(' );
define( 'NONCE_KEY',         'SYt2&/op8_JTu8PU/:]Z$5;J>&!GVJev,fm`IRpk8F<<^K|oB-HKO)@{:#`zu$k~' );
define( 'AUTH_SALT',         'X*3SmV B];SH?{BcHc42MKobp|8dk70Rmju,TiB*Lj(^Hk){L: >+(Lr0DEE2G;@' );
define( 'SECURE_AUTH_SALT',  'G%i./L#Za.oG48u-x74ko)BCfYMBi7-LUiE)NVWx22X-7PK^u[bhm1)P01.hSF/b' );
define( 'LOGGED_IN_SALT',    'gKiWu@XR5S[Om|BkNb[F2#?/`9Y`~%?&g+q2ER_c mm[E`HyhX>O$w7mQCG~M+)H' );
define( 'NONCE_SALT',        'cbdv}W]/o!j)fE3^}RC-x[kY/CZs(#4S5Je,hUmFN!%%}4%O[&g>yw6A@#(_jXDl' );
define( 'WP_CACHE_KEY_SALT', 'j,ibv{K~h^D;ZBm_=HE?SP$h(UjEJhg|Zh6|H=;^HF@TQK}.9Cp8J$N|~{?6M(Ou' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
