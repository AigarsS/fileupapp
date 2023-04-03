prawn_document do |pdf|
  if @uploads&.any?
    pdf.text "User's #{current_user.email} uploaded files in date from #{@start_date} to #{@end_date}"
    pdf.move_down 20
    pdf.table @uploads.map.with_index(1) { |p, i| [i, p.uploaded_file.blob.filename.to_s,p.uploaded_file.blob.created_at.to_s] }
  else
    pdf.text 'There ar no uploaded files for selected period'
  end
end
