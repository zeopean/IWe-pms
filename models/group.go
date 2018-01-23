package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type Group struct {
	Id           int64 `orm:"pk"`
	Name         string
	Status       int8
	GroupType    int8
	DepartmentId int64
	HeaderUserId int64
	CreateTime   time.Time
	UpdateTime   time.Time
}

func (this *Group) TableName() string {
	return models.TableName(consts.GROUP)
}

func init() {
	orm.RegisterModel(new(Group))
}
