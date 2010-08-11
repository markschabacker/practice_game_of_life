class GameOfLife

  attr_accessor :grid

  def evolve
    new_grid = []    
    @grid.each_with_index do |row, i|
      new_row = []
      row.each_with_index do |cell, j|
        neighbor_count = cell_live_neighbor_count(i,j)
        alive_next_iteration = cell_alive_next_iteration(cell, neighbor_count)
        new_row << (alive_next_iteration ? "x" : ".")
      end
      new_grid << new_row
    end
    @grid = new_grid
  end

  def cell_at(row,column)
    @grid[row][column]
  end

  def cell_alive_next_iteration(current_val, neighbor_count)
    neighbor_count = neighbor_count.to_i
    if(("." == current_val) & (3 == neighbor_count))
      true
    elsif (("x" == current_val) & ((2 == neighbor_count) || (3 == neighbor_count)))
      true
    else
      false
    end
  end

  def cell_live_neighbor_count(cell_row,cell_column)
    live_neighbors = 0;
    ((cell_row - 1) .. (cell_row + 1)).each do |row|
      if(@grid[row]) 
        ((cell_column - 1) .. (cell_column + 1)).each do |column|
          if(("x" == cell_at(row, column)) && !((row == cell_row) && (column == cell_column)))
                live_neighbors += 1
          end
        end
      end
    end
    live_neighbors
  end

end
