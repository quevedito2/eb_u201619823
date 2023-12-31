import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

class Posteo extends Table {
  // IntColumn get id => integer().named('id')();
  // IntColumn get userId => integer().named('userId')();
  // TextColumn get title => text().named('title')();
  // TextColumn get Body => text().named('body')();

  TextColumn get name => text().named('name')();
  TextColumn get intelligence => text().named('intelligence')();
  TextColumn get gender => text().named('gender')();
  TextColumn get image => text().named('image')();
  BoolColumn get isFavorite => boolean().named('isFavorite')();
}

LazyDatabase abrirConexion() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dbPost.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Posteo])
class AppDataBases extends _$AppDataBases {
  AppDataBases(NativeDatabase nativeDatabase) : super(abrirConexion());
  @override
  int get schemaVersion => 1;

  Future<int> insertPost(PosteoCompanion posteoCompanion) async {
    return await into(posteo).insert(posteoCompanion);
  }

  Future<List<PosteoData>> getListadoPost() async {
    return await select(posteo).get();
  }

  // Future<int> deletePost(int id) async {
  //   return await (delete(posteo)..where((tbl) => tbl.id.equals(id))).go();
  // }

  // Future<int> updatePost(PosteoCompanion posteoCompanion) async {
  //   return await (update(posteo)
  //         ..where((tbl) => tbl.id.equals(posteoCompanion.id.value)))
  //       .write(posteoCompanion);
  // }
}
