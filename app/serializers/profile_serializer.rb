class ProfileSerializer < ActiveModel::Serializer
  embed :ids, :include => true
  attributes :id, :name, :plant_id
  has_one :plant

  def plant_id
    object.plant.id
  end
end
