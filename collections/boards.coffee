# collections/boards.coffee
# схема данных
boardsSchema = SimpleSchema.build SimpleSchema.timestamp,
  'name':
    type: String
    index: true

  'description':
    type: String
    optional: true # не обязательное поле
# регистрируем коллекцию и добавляем схему
Boards = new Mongo.Collection 'boards'
Boards.attachSchema boardsSchema

# экспорт
@BoardsCollection = Boards
