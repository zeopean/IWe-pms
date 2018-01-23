package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type Notice struct {
	Id          int64 `orm:"pk"`
	Name        string
	Description string
	FromUserId  int64
	ToUserId    int64
	Status      int8
	NoticeType  int8
	CreateTime  time.Time
	UpdateTime  time.Time
}

func (this *Notice) TableName() string {
	return models.TableName(consts.NOTICE)
}

func init() {
	orm.RegisterModel(new(Notice))
}
