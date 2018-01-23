package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type User struct {
	Id         int64 `orm:"pk"`
	Name       string
	Avatar     string
	RoleId     int64
	Status     int8
	CreateTime time.Time
	UpdateTime time.Time
}

func (this *User) TableName() string {
	return models.TableName(consts.USER)
}

func init() {
	orm.RegisterModel(new(User))
}
