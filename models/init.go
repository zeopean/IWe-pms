package models

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

func TableName(name string) string {
	return beego.AppConfig.String("mysqlPre") + name
}


func init() {
	orm.RegisterDriver("mysql", orm.DRMySQL)
	orm.RegisterDataBase("default", "mysql", "admin:admin@tcp(127.0.0.1:3306)/iwe_pms?charset=utf8", 30)
}