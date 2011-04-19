<?php
/**
 * This a IP address agent to pppoe or dynamic IP user.
 * Send this PHP script to the PHP server, Then you can 
 * access the web page to get some host's gatway IP Address.
 *
 * Usage:
 *  your_domain/path/to/this/file.php?op=operator[&id=host_id]
 *
 *  - operator
 *      
 *      reg: Update or register the host IP address.
 *
 *          op=reg&id=host_id
 *
 *      read: Get registered host IP address.
 *
 *          op=read&id=host_id
 *
 *      clear: Delete the host IP data file.
 *
 *          op=clear
 */

$ip_data_file = './iplist.dat';

if (!file_exists($ip_data_file)) {
    $fp = fopen($ip_data_file, 'w');
    fclose($fp);
}

if (isset($_REQUEST['op'])) {
    // get operation type
    $op = $_REQUEST['op'];

    // load registered data
    $fp = fopen($ip_data_file, 'r');

    $data = array();
    while ($item = fgets($fp)) {
        $part = explode(':', $item);
        $data[$part[0]] = $part[1];
    }
    fclose($fp);

    // register the host id and update host ip address
    if ($op === 'reg' && isset($_REQUEST['id'])) {
        // get host id
        $host_id = $_REQUEST['id'];
    
        // remote ip address (http client ip address)
        $remote_ip = $_SERVER['REMOTE_ADDR'];

        $data[$host_id] = $remote_ip;

        $fp = fopen($ip_data_file, 'w');
        foreach ($data as $k => $v) {
            fputs($fp, $k . ':' . $v);
        }
        fclose($fp);

        echo $host_id . ':' . $data[$host_id];
    }

    // get host ip
    if ($op === 'read' && isset($_REQUEST['id'])) {
        // get host id
        $host_id = $_REQUEST['id'];

        if (array_key_exists($host_id, $data)) {
            echo $host_id . ':' . $data[$host_id];
        } else {
            echo 'Query Failed.';
        }
    }

    // clear all data
    if ($op === 'clear') {  
        if (file_exists($ip_data_file)) {
            unlink($ip_data_file);
            
            echo 'Cleared.';
        }
    }

} else {
    // echo some messages.
    echo 'This is a funny joke.';
}
