package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type Role struct {
	Id         int64 `orm:"pk"`
	Name       string
	RoleType   int8
	Status     int8
	CreateTime time.Time
	UpdateTime time.Time
}

func (this *Role) TableName() string {
	return models.TableName(consts.ROLE)
}

func init() {
	orm.RegisterModel(new(Role))
}
