require 'rails_helper'

describe BooksController do
  include_context 'with an authenticated user'
  include_context 'with a decoded response body'

  describe 'GET #index' do
    subject!(:http_request) { get :index }

    context 'when fetching all the books' do
      let(:books) { create_list(:book, 35) }

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response_body.to_json) =~ JSON.parse(expected)
      end

      it 'responds paginated' do
        expect(response_body).to be_paginated
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    subject!(:http_request) { get :show, params: { id: book_id } }

    context 'with an existing book' do
      let(:book) { create(:book) }
      let(:book_id) { book.id }

      it 'responds with the book json' do
        expect(response_body.to_json).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with an invalid id' do
      let(:book_id) { -1 }

      it 'responds with not found (404)' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
