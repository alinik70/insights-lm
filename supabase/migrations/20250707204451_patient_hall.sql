/*
  # Add source selection for chat

  1. Schema Changes
    - Add `selected_for_chat` column to sources table
    - Set default to false for existing sources
    
  2. Security
    - No changes to existing RLS policies needed
*/

-- Add selected_for_chat column to sources table
ALTER TABLE sources ADD COLUMN IF NOT EXISTS selected_for_chat BOOLEAN DEFAULT FALSE;

-- Update existing sources to have selected_for_chat = false by default
UPDATE sources SET selected_for_chat = FALSE WHERE selected_for_chat IS NULL;