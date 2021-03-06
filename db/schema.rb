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

ActiveRecord::Schema.define(version: 20190503025904) do

  create_table "categoria", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "giros", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "actividad", null: false
  end

  create_table "marcas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "rut"
    t.string "nombre"
    t.string "ap_paterno"
    t.string "ap_materno"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "fecha_elaboracion"
    t.datetime "fecha_vencimiento"
    t.integer "stock"
    t.bigint "categoria_id"
    t.bigint "marca_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
    t.index ["marca_id"], name: "index_productos_on_marca_id"
  end

  create_table "sucursals", primary_key: "rut", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.integer "nro_fiscal"
    t.integer "fono1"
    t.integer "fono2"
    t.integer "giro_id", null: false
    t.string "razon_social", limit: 100
    t.string "direccion", limit: 200
    t.integer "numero"
    t.string "descripcion"
    t.index ["giro_id"], name: "sucursal_giro_fk"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "productos", "categoria", column: "categoria_id"
  add_foreign_key "productos", "marcas"
  add_foreign_key "sucursals", "giros", name: "sucursal_giro_fk"
end
