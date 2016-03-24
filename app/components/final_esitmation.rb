class FinalEstimation
  include Inesita::Component

  def render
    div id: 'final-estimation', class: 'clearfix' do
      div class: 'img' do
        img src: '/static/final.png'
      end
      span class: 'label' do
        'Final estimation:'
      end
      div class: 'value' do
        if store.user_admin? && store.state[:name] == 'review'
          select class: 'form-control',
            onchange: ->(e) { store.change_ticket_points(store.state[:current_ticket_id], e.target.value) } do
            store.game[:deck][:cards].each do |card|
              option { card }
            end
          end
        else
          span do
            text store.game[:tickets][store.state[:current_ticket_id]][:points] || ' - '
          end
        end
      end
    end
  end
end
