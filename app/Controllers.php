<?php

namespace OOP\App;

class Controllers
{
    public static $header;

    public function __construct()
    {
        self::$header = new TrxHeaders();
    }

    public function index()
    {
        echo json_encode(self::$header->allHeader());
        // print_r(self::$header->allHeader());
    }

    public function findHeader($id)
    {
        echo json_encode(self::$header->findObj($id));
        // print_r(self::$header->findArray($id));
    }

    public function AddHeader()
    {
        $insertHeader = array(
            'id_hdr' => 2,
            'info_id' => 101,
            'branch_id' => 1,
            'date' => date('Y-m-d H:i:s'),
            'discount' => null,
            'total_prices' => 190000,
            'total_paid' => 200000,
            'charge' => 10000
        );
        print_r(self::$header->insertDataTrxHdr($insertHeader));
    }

    public function updateJeader()
    {
        $updateHeader = array(
            'info_id' => 101,
            'branch_id' => 1,
            'date' => date('Y-m-d H:i:s'),
            'discount' => null,
            'total_prices' => 190000,
            'total_paid' => 200000,
            'charge' => 10000
        );
        $idUpdate = array(
            'id_hdr' => 2
        );
        print_r(self::$header->updateDataTrxHdr($updateHeader, $idUpdate));
    }

    public function deleteHeader()
    {
        $deleteHeader = array(
            'id_hdr' => 6
        );

        print_r(self::$header->deleteDataTrxHdr($deleteHeader));
    }
}
