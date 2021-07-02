import 'package:flutter_app_expense_app/Model/category.dart';
import 'package:flutter_app_expense_app/Model/transaction.dart';
import 'package:get/get.dart';
import 'dart:math';

class LandingPageController extends GetxController{

  List catName = ["Online Shopping","Grocery","Investment","Miscellaneous"];
  List spendames=["Reliance Mart","Petrol Pump","Tv Recharge","Medical","Zomato","Goldy gym","Bike servicing","Flipkart","Amazon","Groww","School Fees"];
  List date=["10 May 2021","1 May 2021","15 May 2021","18 May 2021","16 May 2021","25 May 2021","15 May 2021","22 May 2021","10 May 2021","10 May 2021","24 May 2021","21 May 2021"];
  List time=["6:45AM","8:45AM","7:45AM","7:15AM","6:25AM","6:35AM","8:45AM","8:25AM","8:60AM","8:41AM","8:12AM"];

  final List<Category> spends = <Category>[].obs;
  final List<Transaction> transaction = <Transaction>[].obs;



  @override
  void onInit() {
    callAllMethods();
    super.onInit();
  }

  void callAllMethods(){
    spends.clear();
    transaction.clear();
    generateSpends();
    generateTransaction();
    generateIncome();

  }

  void generateSpends(){
    int max=9000;
    int sum=0;
    int perSum=0;

    Random rnd = new Random();
    Category category ;

    for(int j=0;j<3;j++){

      int  r = rnd.nextInt(max  -sum);
      int percentage = r~/100;
      perSum=perSum+(percentage==0?1:percentage);
      category= new Category(r, percentage==0?1:percentage, catName[j]);
      spends.add(category);
      sum = sum+r;


    }

    category= new Category((10000 - sum),(100-perSum), catName[3]);
    spends.add(category);
    spends.sort((a, b) => b.spend.compareTo(a.spend));


  }

  void generateTransaction(){
    int max=9000;
    int sum=0;
    int perSum=0;

    Random rnd = new Random();
    Transaction tran;

    for(int j=0;j<14;j++){

      int  r = rnd.nextInt(max  -sum);
      int id=rnd.nextInt(10);
      tran=new Transaction(r, spendames[id],false,date[id],time[id]);
      transaction.add(tran);
      sum = sum+r;


    }
    int id = rnd.nextInt(10);
    tran=new Transaction(10000-sum, spendames[id],false,date[id],time[id]);
    transaction.add(tran);

  }

  void generateIncome(){
    int max=9000;
    int sum=0;
    int perSum=0;

    Random rnd = new Random();
    Transaction tran;

    for(int j=0;j<3;j++){

      int  r = rnd.nextInt(max  -sum);

      tran=new Transaction(r, "Sbi debit Card",true,date[4],time[5]);
      transaction.add(tran);
      sum = sum+r;

    }
    tran=new Transaction(10000-sum, "Sbi debit Card",true,date[4],time[5]);
    transaction.add(tran);

  }
}