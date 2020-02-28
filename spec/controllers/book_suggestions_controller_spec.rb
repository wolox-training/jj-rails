require 'rails_helper'

describe BookSuggestionsController do
  include_context 'with a decoded response body'

  describe 'POST #create' do
    let(:book_suggestion) { build(:book_suggestion) }
    let(:http_request) { post :create, params: params }

    context 'with an authenticated user' do
      include_context 'with an authenticated user'

      context 'with missing params' do
        let(:params) { {} }

        it 'responds with 422 status' do
          expect(http_request).to have_http_status(:unprocessable_entity)
        end
      end

      context 'with the required params' do
        let(:params) { { book_suggestion: attributes_for(:book_suggestion) } }

        it 'creates a new book suggestion' do
          expect { http_request }.to change { BookSuggestion.count }.by(1)
        end

        it 'responds with 201 status' do
          http_request
          expect(response).to have_http_status(:created)
        end
      end
    end

    context 'with an invited user' do
      let(:params) { { book_suggestion: attributes_for(:book_suggestion) } }
      
      it 'responds with 201 status' do
        http_request
        expect(response).to have_http_status(:created)
      end

      it 'creates a new book suggestion' do
        expect { http_request }.to change { BookSuggestion.count }.by(1)
      end

      it 'creates without user_id' do
        http_request
        expect(BookSuggestion.last.user_id).to be_nil
      end
    end

    context 'with an invalid book suggestion' do
      let(:params) { { book_suggestion: attributes_for(:book_suggestion, title: nil) } }
      
      it 'responds with 422 status' do
        http_request
        expect(response).to have_http_status(:unprocessable_entity)
      end
      
      it 'doesn\'t create a new book suggestion' do
        expect { http_request }.to change { BookSuggestion.count }.by(0)
      end

    end
  end
end
