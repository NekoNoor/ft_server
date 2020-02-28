<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'A#(]`*JuV/K2*OBQR^N0RNF}(ytUw>y_9Me6|$l-~%:.N]iz2HLU $L7wO!54Rr~' );
define( 'SECURE_AUTH_KEY',  'b|0Wt,k&3tIEP6e/.K/m}6k^^~+ke)B/bZdSo}!s%iXxXc1}D*3G]u9o#/14Cm}=' );
define( 'LOGGED_IN_KEY',    'E]mg%2JVc{qGzk_,h z1G_qdpocH]`7DZ*-Y+8.OS}x{34g  4h^H;.Ut>%_pNL$' );
define( 'NONCE_KEY',        'o)aoSgRn>8n7&Xc=e{.-Qhna+]^q#PR]upR]-|9~stt-Gs%G#;yp;X/H:E,?d}4.' );
define( 'AUTH_SALT',        'kh[>_3C@>or&9]be3[b#$gQGK[_>8 RDy<piqu9Jz6MO1NLUD[H3*4.kRR.vnaVP' );
define( 'SECURE_AUTH_SALT', 'x>W[h)C:zX1t?O>Jc?b1b%vo}<L wf.<)yqlu-,<<BO$kef5=$1I3X{v4I<V;-]g' );
define( 'LOGGED_IN_SALT',   '40*pOMNdt>XW8<>NB~z2nWoR*]-8ou;h)Lmjc%HEJ,0Hk&{*u)V[wH+oLwfbs!sz' );
define( 'NONCE_SALT',       ',a3YaJkAdYt J2CvI*tWlduNQ!Z5fmP^egy#p!`Ht^|z9{2^3U:y>?~b?#U5AqA+' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
