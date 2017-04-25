# Folding-cell-programmatically

`FoldingCell` has two main parts: a `foregroundView` and a `containerView`. The `foregroundView` is shown when the cell is in its collapsed state, and the `containerView` is shown when the cell is opened.

To create a `FoldingCell`, you must initialize the two above views, as well as a top constraint for each of them, named `foregroundViewTop` and `containerViewTop`, respectively. In the example, these are created with [EasyPeasy](https://github.com/nakiostudio/EasyPeasy), a library which provides convenient syntax for working with constraints programmatically.

Finally, you'll want to override `func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)` in your `TableViewController` and call `cell.selectedAnimation` to play the folding animation. You'll also want to animate the table view to account for the new height of the cell.

And that's all!
