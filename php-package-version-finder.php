<?php

// Get the arguments passed to the file

$command = array_shift( $argv );
$fileName = array_shift( $argv );
$packageName = array_shift( $argv );

$separator = ','; //"\t"

if( basename( $fileName ) === 'composer.lock' ){

    $decoded = json_decode( file_get_contents( $fileName ), true );
    if( is_null( $decoded ) ){
        return;
    }
    $installedPackages = $decoded['packages'];

    foreach( $installedPackages as $installedPackage ){

        if( $installedPackage['name'] != $packageName ){
            continue;
        }

        echo implode( $separator , array( dirname( $fileName ), $packageName, $installedPackage['version'] ) ) . PHP_EOL;

        // echo dirname( $fileName ) . $separator . $packageName . $separator . $installedPackage['version'] . PHP_EOL;

    }

}

