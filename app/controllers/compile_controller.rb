def index
  @people = Person.find(:all)

  respond_to do |format|
    format.html
    format.xml { render :xml => @people.to_xml }
  end
end
