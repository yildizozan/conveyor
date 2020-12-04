package model

import (
	"encoding/json"
	pb "github.com/yildizozan/conveyor/v1beta1"
)

func NewPoint(latitude float32, longitude float32) *pb.Point {
	return &pb.Point{
		Latitude:  latitude,
		Longitude: longitude,
	}
}

func (p *pb.Point) MarshallJSON() ([]byte, error) {
	return json.Marshal(&struct {
		Latitude float64 `json:"latitude"`
		Longitude float64 `json:"longitude"`
	}{

	})
}
