# frozen_string_literal: true

class ChatService
  def conn
    Faraday.new(url: 'https://api.openai.com/v1/chat/completions') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Authorization'] = "Bearer #{ENV['OPENAI_API_KEY']}"
    end
  end

  def get_fortune(hex, question)
    payload = {
      "model": 'gpt-3.5-turbo',
      "messages": [
        {
          "role": 'system',
          "content": "Give fortune based on hexagram and question as if you are a Taoist sage, don't include 'fortune:'
           or the hexagram in the response. Please make it 10 sentences minimum in length and with a definitve
           instruction. "
        },
        {
          "role": 'user',
          "content": "Hexagram: #{hex}, Question: #{question}"
        }
      ],
      "temperature": 0.9,
      "max_tokens": 1000,
      "top_p": 1
    }

    response = JSON.parse(
      conn.post do |req|
        req.body = payload.to_json
      end.body, symbolize_names: true
    )

    response&.dig(:choices, 0, :message, :content)
  end
end
