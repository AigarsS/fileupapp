prawn_document do |pdf|
  pdf.text 'Uploaded files in date range are:'
  pdf.move_down 20
  pdf.table @uploads.collect{|p| [p.uploaded_file.blob.filename.to_s,p.uploaded_file.blob.created_at.to_s]}
end
