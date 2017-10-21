var QuizOption = React.createClass({
  getInitialState: function () {
    return JSON.parse(this.props.presenter);
  },

  render: function () {
    return (
      <div>
        <input type="radio" value="op1">{this.state.question}</input>
      </div>
    )
  }
});