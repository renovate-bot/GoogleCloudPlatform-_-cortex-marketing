-- Copyright 2024 Google LLC
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     https://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

/* Ad dimension details. */


SELECT
  Ads.id AS ad_id,
  STRUCT(
    Creative.id,
    Creative.name
  ) AS creative,
  Ads.* EXCEPT (id, creative, recordstamp)
FROM `{{ project_id_src }}.{{ marketing_meta_datasets_cdc }}.ads` AS Ads
INNER JOIN `{{ project_id_src }}.{{ marketing_meta_datasets_cdc }}.ad_creative` AS Creative
  ON LAX_INT64(Ads.creative.id) = Creative.id
