package models

import (
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/mattn/go-sqlite3" // SQLite driver
	"goflylivechat/common"
	"log"
	"time"
)

var DB *gorm.DB

type Model struct {
	ID        uint       `gorm:"primary_key" json:"id"`
	CreatedAt time.Time  `json:"created_at"`
	UpdatedAt time.Time  `json:"updated_at"`
	DeletedAt *time.Time `sql:"index" json:"deleted_at"`
}

func init() {
	Connect()
}
func Connect() error {
	mysql := common.GetMysqlConf()
	var dsn string
	var dialect string

	// Check if it's SQLite (no username/password) or MySQL
	if mysql.Username == "" && mysql.Password == "" {
		// SQLite
		dialect = "sqlite3"
		dsn = mysql.Database
	} else {
		// MySQL
		dialect = "mysql"
		dsn = fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local", mysql.Username, mysql.Password, mysql.Server, mysql.Port, mysql.Database)
	}

	var err error
	DB, err = gorm.Open(dialect, dsn)
	if err != nil {
		log.Println(err)
		panic("数据库连接失败!")
		return err
	}
	DB.SingularTable(true)
	DB.LogMode(true)
	DB.DB().SetMaxIdleConns(10)
	DB.DB().SetMaxOpenConns(100)
	DB.DB().SetConnMaxLifetime(59 * time.Second)
	return nil
}
func Execute(sql string) error {
	return DB.Exec(sql).Error
}
func CloseDB() {
	defer DB.Close()
}
