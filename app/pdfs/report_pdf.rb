class ReportPdf < Prawn::Document
  def initialize(group)
    super()
    @group = group
    header
    text_content
    table_content
  end
  def header
    image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
  end
  def text_content
    y_position = cursor - 50
    bounding_box([0,y_position], :width => 270, :height => 300)do
      text "Generated shopping lists from your group", size: 15, style: :bold
    end
  end

  def table_content
    table group_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD','FFFFFF']
      self.column_widths = [40,300,200]
    end
  end
  def group_rows
    [['#','Title','Body']] +
        @group.lists.map do |list|
          [@group.name, list.name, list.amount]
        end
  end
end