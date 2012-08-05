class Item < ActiveRecord::Base
  belongs_to :site
  belongs_to :location
  belongs_to :itype
  attr_accessible :serial, :stockable, :site_id, :location_id, :itype_id
end
