import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:techinal_practice/Modals/database/category_modal.dart';

class dbHelper {
  dbHelper._();

  static final dbHelper dbhelper = dbHelper._();

  static Database? db;

  //initialize db

  Future initDb() async {
    String dbLocation = await getDatabasesPath();

    String path = join(dbLocation, "vivek.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String query =
            "CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,cat_name TEXT,cat_type TEXT,cat_price INTEGER)";
        await db.execute(query);
      },
    );
  }

  Future<int> insertCategory({required CategoryModel data})async{
    await initDb();
    String query = "INSERT INTO category(cat_name,cat_type,cat_price) VALUES (?,?,?);";
  List args  = [
    data.categoryName,
    data.categoryType,
    data.categoryPrice,
  ];
    int res =await  db!.rawInsert(query,args);
    return res;
  }

  Future<List<CategoryModel>> fetchallcategory()async{
    await initDb();

    String query = "SELECT * FROM category";

    List<Map<String, dynamic>>  data = await db!.rawQuery(query);

    List<CategoryModel> allcategory =  data.map((e) => CategoryModel.fromMap(data: e)).toList();
    return allcategory;
  }

  Future<int> deletecategory({required int id})async{
    await initDb();

    String query = "DELETE FROM category WHERE id=?";
    List args = [id];
    int res = await db!.rawDelete(query,args);
    return res;
  }

  Future<int> updatecategory({required CategoryModel data})async{
    await initDb();

    String query = "UPDATE category SET cat_name=?, cat_type=?, cat_price=? WHERE id=?";
    List args = [
      data.categoryName,
      data.categoryType,
      data.categoryPrice,
      data.categoryId,
    ];
    int res = await db!.rawUpdate(query,args);
    return res;
  }

  Future<List<CategoryModel>> fetchseaarchcategory({required String data})async{
    await initDb();

    String query = "SELECT * FROM category WHERE cat_name LIKE '%$data%'";
    // List args = [data];

    List<Map<String, dynamic>>  res = await db!.rawQuery(query);

    List<CategoryModel> allcategory =  res.map((e) => CategoryModel.fromMap(data: e)).toList();
    return allcategory;
  }
}
