# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160812155311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aquisicoes", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "setor_id"
    t.integer  "usuario_id"
    t.integer  "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_aquisicoes_on_produto_id", using: :btree
    t.index ["setor_id"], name: "index_aquisicoes_on_setor_id", using: :btree
    t.index ["usuario_id"], name: "index_aquisicoes_on_usuario_id", using: :btree
  end

  create_table "estoques", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "setor_id"
    t.integer  "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_estoques_on_produto_id", using: :btree
    t.index ["setor_id"], name: "index_estoques_on_setor_id", using: :btree
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.float    "valor_compra"
    t.text     "descricao"
    t.string   "imagem"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "setores", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "principal"
  end

  create_table "solicitacoes", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "produto_id"
    t.integer  "quantidade_solicitada"
    t.integer  "quantidade_fornecida"
    t.datetime "data_fornecimento"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["produto_id"], name: "index_solicitacoes_on_produto_id", using: :btree
    t.index ["usuario_id"], name: "index_solicitacoes_on_usuario_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "setor_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
    t.index ["setor_id"], name: "index_usuarios_on_setor_id", using: :btree
  end

  add_foreign_key "aquisicoes", "produtos"
  add_foreign_key "aquisicoes", "setores"
  add_foreign_key "aquisicoes", "usuarios"
  add_foreign_key "estoques", "produtos"
  add_foreign_key "estoques", "setores"
  add_foreign_key "solicitacoes", "produtos"
  add_foreign_key "solicitacoes", "usuarios"
  add_foreign_key "usuarios", "setores"
end
