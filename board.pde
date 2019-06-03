/*
  Board Class
 */
public class Board {

  int x_pos, y_pos;  
  int cellSize;
  int rows, cols;
  int[][] layer;
  ArrayList<BoardItem> items;
  public int turn;
  public int winO;
  public int winX;
  public Board(int x, int y, int numRows, int numCols, int cellSize ) {
    x_pos = x;
    y_pos = y;
    this.cellSize = cellSize;
    rows = numRows;
    cols = numCols;
    layer = null;
    items = new ArrayList<BoardItem>();
  }

  public void addItem(BoardItem item) {
    items.add(item); 
    item.setBounds(rows, cols);
  }

  public void show() {
    pushMatrix();
    translate(x_pos, y_pos);
    strokeWeight(10);
    for (int j=0; j< rows; j++) {
      for (int i=0; i < cols; i++) {
        int xAt = i*cellSize;
        int yAt = j*cellSize;

        //todo: think about what color we want
        //fill( ? )
        //stroke( ? ) //border color
        //strokeWeight( ? ) // thickness of cell border
        fill(255);
        rect(xAt, yAt, cellSize, cellSize);
        drawLayerCell(j, i, xAt, yAt);
      }
    }

    //Draw each item on the board
    for (BoardItem item : items) {
      int xAt = item.col()*cellSize;
      int yAt = item.row()*cellSize;
      item.show(xAt, yAt, cellSize);
    }    

    popMatrix();
  }  

  protected void drawLayerCell(int rowId, int colId, int xPos, int yPos) {
    if (layer != null) {
      if (layer.length > rowId) {
        if (layer[rowId].length > colId) {
          int cellColor = layer[rowId][colId];
          strokeWeight(10);
          fill(cellColor);
          rect(xPos, yPos, cellSize, cellSize);
        }
      }
    }
  }


  public Cell getCell(int xClicked, int yClicked) {
    xClicked = xClicked - x_pos;
    yClicked = yClicked - y_pos;

    int xAt = xClicked/cellSize;
    int yAt = yClicked/cellSize;

    return new Cell(yAt, xAt);
  }

  public void moveItem(int xClicked, int yClicked, int turn) {
    xClicked = xClicked - x_pos;
    yClicked = yClicked - y_pos;

    int xAt = xClicked/cellSize;
    int yAt = yClicked/cellSize;


    //for (int i = 0; i < items.size()/2; i++) {
    //  BoardItem pieceO = items.get(i);

    //  if (pieceO.rowId < 0) {
    //    pieceO.rowId = yAt;
    //    pieceO.colId = xAt;
    //  }
    if (turn == 0 ) {
      items.get(0).rowId = yAt;
      items.get(0).colId = xAt;
      layer[yAt][xAt]  = 254;
    }
    if (turn == 2 ) {

      items.get(1).rowId = yAt;
      items.get(1).colId = xAt;
      layer[yAt][xAt] = 254;
    }      
    if (turn == 4 ) {

      items.get(2).rowId = yAt;
      items.get(2).colId = xAt;
      layer[yAt][xAt] = 254;
    }      
    if (turn == 6 ) {

      items.get(3).rowId = yAt;
      items.get(3).colId = xAt;
      layer[yAt][xAt] = 254;
    }      
    if (turn == 8 ) {

      items.get(4).rowId = yAt;
      items.get(4).colId = xAt;
      layer[yAt][xAt] = 254;
    }

    //for (int j = 5; j < items.size(); j++) {
    //  BoardItem pieceX = items.get(j);
    //  if (pieceX.rowId < 0) {
    //    pieceX.rowId = yAt;
    //    pieceX.colId = xAt;
    //  }
    //}
    if (turn == 1 ) {

      items.get(5).rowId = yAt;
      items.get(5).colId = xAt;
      layer[yAt][xAt] = 253;
    }
    if (turn == 3 ) {

      items.get(6).rowId = yAt;
      items.get(6).colId = xAt;
      layer[yAt][xAt] = 253;
    }      
    if (turn == 5 ) {

      items.get(7).rowId = yAt;
      items.get(7).colId = xAt;
      layer[yAt][xAt] = 253;
    }      
    if (turn == 7 ) {

      items.get(8).rowId = yAt;
      items.get(8).colId = xAt;
      layer[yAt][xAt] = 253;
    }      
    if (turn == 9 ) {

      items.get(9).rowId = yAt;
      items.get(9).colId = xAt;
      layer[yAt][xAt] = 253;
    }
  }

  public void addLayer(int[][] theLayer) {
    this.layer = theLayer;
  }
}
