package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type UserGroup struct {
	Id           int64 `orm:"pk"`
	UserId       int64
	GroupId      int64
	HeaderUserId int64
	IsHeader     int8
	Status       int8
	CreateTime   time.Time
	UpdateTime   time.Time
}

func (this *UserGroup) TableName() string {
	return models.TableName(consts.USER_GROUP)
}

func init() {
	orm.RegisterModel(new(UserGroup))
}
