<?php

namespace OOP\App;

class TrxHeaders extends Database
{

    public function allInfo()
    {
        $statement = self::$conn->prepare("SELECT * FROM trx_info");
        $statement->execute();
        return $statement->fetch(\PDO::FETCH_OBJ);
    }

    public function allHeader()
    {
        $statement = self::$conn->prepare("SELECT * FROM trx_header");
        $statement->execute();
        return $statement->fetchAll(\PDO::FETCH_OBJ);
    }

    public function findObj($id)
    {
        $statement = self::$conn->prepare("SELECT * FROM trx_header WHERE id_hdr=$id");
        $statement->execute();
        return $statement->fetch(\PDO::FETCH_OBJ);
    }
    public function findArray($id)
    {
        $statement = self::$conn->prepare("SELECT * FROM trx_header WHERE id_hdr=$id");
        $statement->execute();
        return $statement->fetch();
    }

    public function insertDataTrxInfo($data)
    {
        $statement = self::$conn->prepare("INSERT INTO trx_info VALUES (
            :id_info,
            :branch_info,
            :cashier_name,
            :is_active,
            :created_at,
            :updated_at
        )");

        return $statement->execute($data);
    }

    public function insertDataTrxHdr($data)
    {
        $statement = self::$conn->prepare("INSERT INTO trx_header VALUES (
            :id_hdr,
            :info_id,
            :branch_id,
            :date,
            :discount,
            :total_prices,
            :total_paid,
            :charge
        )");

        return $statement->execute($data);
    }

    public function updateDataTrxHdr($data, $id)
    {
        $statement = self::$conn->prepare("UPDATE trx_header SET
        info_id = :info_id,
        branch_id = :branch_id,
        date = :date,
        discount = :discount,
        total_prices = :total_prices,
        total_paid = :total_paid,
        charge = :charge
        WHERE id_hdr = :id_hdr");

        return $statement->execute(array_merge($data, $id));
    }

    public function deleteDataTrxHdr($id)
    {
        $statement = self::$conn->prepare("DELETE FROM trx_header WHERE id_hdr = :id_hdr");

        return $statement->execute($id);
    }
}
// try{
//     $trxHeaders = new TrxHeaders();
    // print_r($trxHeaders->findId(102));
    // $data = $trxHeaders->findObj(101);
    // $data = $trxHeaders->index();
    // echo json_encode($data);
    // $data2 = $trxHeaders->findArray(102);
    // echo $data2['cashier_name'];
    // var_dump((object)$data2);


    // $insertInfo = array(
    //     'id_info' => 107,
    //     'branch_info' => 'BINTARO ARCADE 2',
    //     'cashier_name' => 'SISCA',
    //     'is_active' =>'1',
    //     'created_at' => null,
    //     'updated_at' => null
    // );
    // echo $trxHeaders->insertDataTrxInfo($insertInfo);
    
    // $insertHeader= array(
    //     'id_hdr' => 2,
    //     'info_id' => 101,
    //     'branch_id' => 1,
    //     'date' => date('Y-m-d H:i:s'),
    //     'discount' => null,
    //     'total_prices' => 190000,
    //     'total_paid' => 200000,
    //     'charge' => 10000
    // );
    // $trxHeaders->insertDataTrxHdr($insertHeader);

    // $updateHeader = array(
    //     'info_id' => 101,
    //     'branch_id' => 1,
    //     'date' => date('Y-m-d H:i:s'),
    //     'discount' => null,
    //     'total_prices' => 190000,
    //     'total_paid' => 200000,
    //     'charge' => 10000
    // );

    // $idUpdate = array(
    //     'id_hdr' => 2
    // );

    // $trxHeaders->updateDataTrxHdr($updateHeader, $idUpdate);

    // $deleteHeader = array(
    //     'id_hdr' => 6
    // );

    // $trxHeaders->deleteDataTrxHdr($deleteHeader);
// }catch(\Throwable $th){
// //     throw $th;
// // }