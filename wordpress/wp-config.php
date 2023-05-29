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
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wp_user' );

/** Database password */
define( 'DB_PASSWORD', 'popiloli' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         '8w/~MN3~!.o(l/RO`+d|l%GC5IaaW]fn8t{B%S84:81,)90|}zb4T%lQfZ-(=62{' );
define( 'SECURE_AUTH_KEY',  '7L|&`9MElPg?OkW=|>&/jI2~n.$6z4f<F/e$z:-B`9m6mtl`tV-39/MfRIsfu?sR' );
define( 'LOGGED_IN_KEY',    'hsl.lnb+lFjHWN`?=>@JiZR$=LgK @5d9?~aV|.(N.{.3n:do+@*cKp$J06NU|?D' );
define( 'NONCE_KEY',        'yL~ojowu,3abPfcZ_~k-Y8LHl~4p0(ui }9 ?o@561yWB::+jjw!L[/U`+bkq34%' );
define( 'AUTH_SALT',        '}<_)qsI]b[7NXq1f<?EG[L[<S?>btYZrH}H|r0>|9J8=2/47qa<Ek4t[Zgs;~,gh' );
define( 'SECURE_AUTH_SALT', 'L(k-VXWv[q9Y]7Nb8TFCJ6/qlM9ZA&x>HRf2JvxCI{}*{`SW|eT`TQK)C)D~|M{#' );
define( 'LOGGED_IN_SALT',   'Wr.#Lf./7csa|baa]4aBu*6% F4@>aT++zKw6u?A_b.00vQyTfigNt Hr*?agdqJ' );
define( 'NONCE_SALT',       'qh{,pE^~]=IoN3W)0qG@%@[=NS:;J9@N2p2=W(1uy<($=8=jq;|8=<`{9Z.[e-]a' );

/**#@-*/

/**
 * WordPress database table prefix.
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
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
