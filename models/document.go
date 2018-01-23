package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type Document struct {
	Id          int64 `orm:"pk"`
	Name        string
	Description string
	UserId      int64
	Status      int8
	Context     string
	ProjectId   int64
	CreateTime  time.Time
	UpdateTime  time.Time
}

func (this *Document) TableName() string {
	return models.TableName(consts.DOCUMENT)
}

func init() {
	orm.RegisterModel(new(Document))
}
