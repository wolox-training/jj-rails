require 'rails_helper'

describe BookSuggestionsController do
  include_context 'with a decoded response body'

  describe 'POST #create' do
    let(:book_suggestion) { build(:book_suggestion) }
    let!(:http_request) { post :create, params: params }

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

        it 'responds with 201 status' do
          expect(response).to have_http_status(:created)
        end
      end

      context 'with an invalid author' do
        context 'with author missing param' do
          let(:params) { attributes_for(:book_suggestion).except(:author) }

          it 'responds with 400 status' do
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end

        context 'with author nil value' do
          let(:params) { attributes_for(:book_suggestion, author: nil) }

          it 'responds with 400 status' do
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end

      context 'with an invalid title' do
        let(:params) { attributes_for(:book_suggestion, title: nil) }

        it 'responds with 400 status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'with an invalid url' do
        let(:params) { attributes_for(:book_suggestion, url: nil) }

        it 'responds with 400 status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'with an invalid editor' do
        let(:params) { attributes_for(:book_suggestion, editor: nil) }

        it 'responds with 400 status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'with an invalid year' do
        let(:params) { attributes_for(:book_suggestion, year: nil) }

        it 'responds with 400 status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'with an invited user' do
      let(:params) { { book_suggestion: attributes_for(:book_suggestion) } }

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
