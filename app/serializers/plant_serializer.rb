class PlantSerializer < ActiveModel::MongoidSerializer
  attributes :id, :name, :created_at
  has_many :datas, class_name: "PlantDatas"
end
