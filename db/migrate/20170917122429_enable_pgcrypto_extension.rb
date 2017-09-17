class EnablePgcryptoExtension < ActiveRecord::Migration[5.1]
  def change
    # EXTENSION FOR UUIDs
    enable_extension 'pgcrypto'
  end
end
