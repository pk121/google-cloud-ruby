# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# EDITING INSTRUCTIONS
# This file was generated from the file
# https://github.com/googleapis/googleapis/blob/master/google/logging/v2/logging_config.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.


require "json"
require "pathname"

require "google/gax"

require "google/logging/v2/logging_config_pb"
require "google/cloud/logging/v2/credentials"
require "google/cloud/logging/version"

module Google
  module Cloud
    module Logging
      module V2
        # Service for configuring sinks used to route log entries.
        #
        # @!attribute [r] config_service_v2_stub
        #   @return [Google::Logging::V2::ConfigServiceV2::Stub]
        class ConfigServiceV2Client
          # @private
          attr_reader :config_service_v2_stub

          # The default address of the service.
          SERVICE_ADDRESS = "logging.googleapis.com".freeze

          # The default port of the service.
          DEFAULT_SERVICE_PORT = 443

          # The default set of gRPC interceptors.
          GRPC_INTERCEPTORS = []

          DEFAULT_TIMEOUT = 30

          PAGE_DESCRIPTORS = {
            "list_buckets" => Google::Gax::PageDescriptor.new(
              "page_token",
              "next_page_token",
              "buckets"),
            "list_sinks" => Google::Gax::PageDescriptor.new(
              "page_token",
              "next_page_token",
              "sinks"),
            "list_exclusions" => Google::Gax::PageDescriptor.new(
              "page_token",
              "next_page_token",
              "exclusions")
          }.freeze

          private_constant :PAGE_DESCRIPTORS

          # The scopes needed to make gRPC calls to all of the methods defined in
          # this service.
          ALL_SCOPES = [
            "https://www.googleapis.com/auth/cloud-platform",
            "https://www.googleapis.com/auth/cloud-platform.read-only",
            "https://www.googleapis.com/auth/logging.admin",
            "https://www.googleapis.com/auth/logging.read",
            "https://www.googleapis.com/auth/logging.write"
          ].freeze


          BILLING_ACCOUNT_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
            "billingAccounts/{billing_account}"
          )

          private_constant :BILLING_ACCOUNT_PATH_TEMPLATE

          FOLDER_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
            "folders/{folder}"
          )

          private_constant :FOLDER_PATH_TEMPLATE

          ORGANIZATION_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
            "organizations/{organization}"
          )

          private_constant :ORGANIZATION_PATH_TEMPLATE

          PROJECT_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
            "projects/{project}"
          )

          private_constant :PROJECT_PATH_TEMPLATE

          # Returns a fully-qualified billing_account resource name string.
          # @param billing_account [String]
          # @return [String]
          def self.billing_account_path billing_account
            BILLING_ACCOUNT_PATH_TEMPLATE.render(
              :"billing_account" => billing_account
            )
          end

          # Returns a fully-qualified folder resource name string.
          # @param folder [String]
          # @return [String]
          def self.folder_path folder
            FOLDER_PATH_TEMPLATE.render(
              :"folder" => folder
            )
          end

          # Returns a fully-qualified organization resource name string.
          # @param organization [String]
          # @return [String]
          def self.organization_path organization
            ORGANIZATION_PATH_TEMPLATE.render(
              :"organization" => organization
            )
          end

          # Returns a fully-qualified project resource name string.
          # @param project [String]
          # @return [String]
          def self.project_path project
            PROJECT_PATH_TEMPLATE.render(
              :"project" => project
            )
          end

          # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
          #   Provides the means for authenticating requests made by the client. This parameter can
          #   be many types.
          #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
          #   authenticating requests made by this client.
          #   A `String` will be treated as the path to the keyfile to be used for the construction of
          #   credentials for this client.
          #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
          #   credentials for this client.
          #   A `GRPC::Core::Channel` will be used to make calls through.
          #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
          #   should already be composed with a `GRPC::Core::CallCredentials` object.
          #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
          #   metadata for requests, generally, to give OAuth credentials.
          # @param scopes [Array<String>]
          #   The OAuth scopes for this service. This parameter is ignored if
          #   an updater_proc is supplied.
          # @param client_config [Hash]
          #   A Hash for call options for each method. See
          #   Google::Gax#construct_settings for the structure of
          #   this data. Falls back to the default config if not specified
          #   or the specified config is missing data points.
          # @param timeout [Numeric]
          #   The default timeout, in seconds, for calls made through this client.
          # @param metadata [Hash]
          #   Default metadata to be sent with each request. This can be overridden on a per call basis.
          # @param service_address [String]
          #   Override for the service hostname, or `nil` to leave as the default.
          # @param service_port [Integer]
          #   Override for the service port, or `nil` to leave as the default.
          # @param exception_transformer [Proc]
          #   An optional proc that intercepts any exceptions raised during an API call to inject
          #   custom error handling.
          def initialize \
              credentials: nil,
              scopes: ALL_SCOPES,
              client_config: {},
              timeout: DEFAULT_TIMEOUT,
              metadata: nil,
              service_address: nil,
              service_port: nil,
              exception_transformer: nil,
              lib_name: nil,
              lib_version: ""
            # These require statements are intentionally placed here to initialize
            # the gRPC module only when it's required.
            # See https://github.com/googleapis/toolkit/issues/446
            require "google/gax/grpc"
            require "google/logging/v2/logging_config_services_pb"

            credentials ||= Google::Cloud::Logging::V2::Credentials.default

            if credentials.is_a?(String) || credentials.is_a?(Hash)
              updater_proc = Google::Cloud::Logging::V2::Credentials.new(credentials).updater_proc
            end
            if credentials.is_a?(GRPC::Core::Channel)
              channel = credentials
            end
            if credentials.is_a?(GRPC::Core::ChannelCredentials)
              chan_creds = credentials
            end
            if credentials.is_a?(Proc)
              updater_proc = credentials
            end
            if credentials.is_a?(Google::Auth::Credentials)
              updater_proc = credentials.updater_proc
            end

            package_version = Google::Cloud::Logging::VERSION

            google_api_client = "gl-ruby/#{RUBY_VERSION}"
            google_api_client << " #{lib_name}/#{lib_version}" if lib_name
            google_api_client << " gapic/#{package_version} gax/#{Google::Gax::VERSION}"
            google_api_client << " grpc/#{GRPC::VERSION}"
            google_api_client.freeze

            headers = { :"x-goog-api-client" => google_api_client }
            if credentials.respond_to?(:quota_project_id) && credentials.quota_project_id
              headers[:"x-goog-user-project"] = credentials.quota_project_id
            end
            headers.merge!(metadata) unless metadata.nil?
            client_config_file = Pathname.new(__dir__).join(
              "config_service_v2_client_config.json"
            )
            defaults = client_config_file.open do |f|
              Google::Gax.construct_settings(
                "google.logging.v2.ConfigServiceV2",
                JSON.parse(f.read),
                client_config,
                Google::Gax::Grpc::STATUS_CODE_NAMES,
                timeout,
                page_descriptors: PAGE_DESCRIPTORS,
                errors: Google::Gax::Grpc::API_ERRORS,
                metadata: headers
              )
            end

            # Allow overriding the service path/port in subclasses.
            service_path = service_address || self.class::SERVICE_ADDRESS
            port = service_port || self.class::DEFAULT_SERVICE_PORT
            interceptors = self.class::GRPC_INTERCEPTORS
            @config_service_v2_stub = Google::Gax::Grpc.create_stub(
              service_path,
              port,
              chan_creds: chan_creds,
              channel: channel,
              updater_proc: updater_proc,
              scopes: scopes,
              interceptors: interceptors,
              &Google::Logging::V2::ConfigServiceV2::Stub.method(:new)
            )

            @list_buckets = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:list_buckets),
              defaults["list_buckets"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'parent' => request.parent}
              end
            )
            @get_bucket = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:get_bucket),
              defaults["get_bucket"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'name' => request.name}
              end
            )
            @update_bucket = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:update_bucket),
              defaults["update_bucket"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'name' => request.name}
              end
            )
            @list_sinks = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:list_sinks),
              defaults["list_sinks"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'parent' => request.parent}
              end
            )
            @get_sink = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:get_sink),
              defaults["get_sink"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'sink_name' => request.sink_name}
              end
            )
            @create_sink = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:create_sink),
              defaults["create_sink"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'parent' => request.parent}
              end
            )
            @update_sink = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:update_sink),
              defaults["update_sink"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'sink_name' => request.sink_name}
              end
            )
            @delete_sink = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:delete_sink),
              defaults["delete_sink"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'sink_name' => request.sink_name}
              end
            )
            @list_exclusions = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:list_exclusions),
              defaults["list_exclusions"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'parent' => request.parent}
              end
            )
            @get_exclusion = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:get_exclusion),
              defaults["get_exclusion"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'name' => request.name}
              end
            )
            @create_exclusion = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:create_exclusion),
              defaults["create_exclusion"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'parent' => request.parent}
              end
            )
            @update_exclusion = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:update_exclusion),
              defaults["update_exclusion"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'name' => request.name}
              end
            )
            @delete_exclusion = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:delete_exclusion),
              defaults["delete_exclusion"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'name' => request.name}
              end
            )
            @get_cmek_settings = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:get_cmek_settings),
              defaults["get_cmek_settings"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'name' => request.name}
              end
            )
            @update_cmek_settings = Google::Gax.create_api_call(
              @config_service_v2_stub.method(:update_cmek_settings),
              defaults["update_cmek_settings"],
              exception_transformer: exception_transformer,
              params_extractor: proc do |request|
                {'name' => request.name}
              end
            )
          end

          # Service calls

          # Lists buckets (Beta).
          #
          # @param parent [String]
          #   Required. The parent resource whose buckets are to be listed:
          #
          #       "projects/[PROJECT_ID]/locations/[LOCATION_ID]"
          #       "organizations/[ORGANIZATION_ID]/locations/[LOCATION_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/locations/[LOCATION_ID]"
          #       "folders/[FOLDER_ID]/locations/[LOCATION_ID]"
          #
          #   Note: The locations portion of the resource must be specified, but
          #   supplying the character `-` in place of [LOCATION_ID] will return all
          #   buckets.
          # @param page_size [Integer]
          #   The maximum number of resources contained in the underlying API
          #   response. If page streaming is performed per-resource, this
          #   parameter does not affect the return value. If page streaming is
          #   performed per-page, this determines the maximum number of
          #   resources in a page.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Gax::PagedEnumerable<Google::Logging::V2::LogBucket>]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Gax::PagedEnumerable<Google::Logging::V2::LogBucket>]
          #   An enumerable of Google::Logging::V2::LogBucket instances.
          #   See Google::Gax::PagedEnumerable documentation for other
          #   operations such as per-page iteration or access to the response
          #   object.
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `parent`:
          #   parent = ''
          #
          #   # Iterate over all results.
          #   config_client.list_buckets(parent).each do |element|
          #     # Process element.
          #   end
          #
          #   # Or iterate over results one page at a time.
          #   config_client.list_buckets(parent).each_page do |page|
          #     # Process each page at a time.
          #     page.each do |element|
          #       # Process element.
          #     end
          #   end

          def list_buckets \
              parent,
              page_size: nil,
              options: nil,
              &block
            req = {
              parent: parent,
              page_size: page_size
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::ListBucketsRequest)
            @list_buckets.call(req, options, &block)
          end

          # Gets a bucket (Beta).
          #
          # @param name [String]
          #   Required. The resource name of the bucket:
          #
          #       "projects/[PROJECT_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]"
          #       "organizations/[ORGANIZATION_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]"
          #       "folders/[FOLDER_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]"
          #
          #   Example:
          #   `"projects/my-project-id/locations/my-location/buckets/my-bucket-id"`.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::LogBucket]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::LogBucket]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `name`:
          #   name = ''
          #   response = config_client.get_bucket(name)

          def get_bucket \
              name,
              options: nil,
              &block
            req = {
              name: name
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::GetBucketRequest)
            @get_bucket.call(req, options, &block)
          end

          # Updates a bucket. This method replaces the following fields in the
          # existing bucket with values from the new bucket: `retention_period`
          #
          # If the retention period is decreased and the bucket is locked,
          # FAILED_PRECONDITION will be returned.
          #
          # If the bucket has a LifecycleState of DELETE_REQUESTED, FAILED_PRECONDITION
          # will be returned.
          #
          # A buckets region may not be modified after it is created.
          # This method is in Beta.
          #
          # @param name [String]
          #   Required. The full resource name of the bucket to update.
          #
          #       "projects/[PROJECT_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]"
          #       "organizations/[ORGANIZATION_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]"
          #       "folders/[FOLDER_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]"
          #
          #   Example:
          #   `"projects/my-project-id/locations/my-location/buckets/my-bucket-id"`. Also
          #   requires permission "resourcemanager.projects.updateLiens" to set the
          #   locked property
          # @param bucket [Google::Logging::V2::LogBucket | Hash]
          #   Required. The updated bucket.
          #   A hash of the same form as `Google::Logging::V2::LogBucket`
          #   can also be provided.
          # @param update_mask [Google::Protobuf::FieldMask | Hash]
          #   Required. Field mask that specifies the fields in `bucket` that need an update. A
          #   bucket field will be overwritten if, and only if, it is in the update
          #   mask. `name` and output only fields cannot be updated.
          #
          #   For a detailed `FieldMask` definition, see
          #   https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.FieldMask
          #
          #   Example: `updateMask=retention_days`.
          #   A hash of the same form as `Google::Protobuf::FieldMask`
          #   can also be provided.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::LogBucket]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::LogBucket]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `name`:
          #   name = ''
          #
          #   # TODO: Initialize `bucket`:
          #   bucket = {}
          #
          #   # TODO: Initialize `update_mask`:
          #   update_mask = {}
          #   response = config_client.update_bucket(name, bucket, update_mask)

          def update_bucket \
              name,
              bucket,
              update_mask,
              options: nil,
              &block
            req = {
              name: name,
              bucket: bucket,
              update_mask: update_mask
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::UpdateBucketRequest)
            @update_bucket.call(req, options, &block)
          end

          # Lists sinks.
          #
          # @param parent [String]
          #   Required. The parent resource whose sinks are to be listed:
          #
          #       "projects/[PROJECT_ID]"
          #       "organizations/[ORGANIZATION_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]"
          #       "folders/[FOLDER_ID]"
          # @param page_size [Integer]
          #   The maximum number of resources contained in the underlying API
          #   response. If page streaming is performed per-resource, this
          #   parameter does not affect the return value. If page streaming is
          #   performed per-page, this determines the maximum number of
          #   resources in a page.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Gax::PagedEnumerable<Google::Logging::V2::LogSink>]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Gax::PagedEnumerable<Google::Logging::V2::LogSink>]
          #   An enumerable of Google::Logging::V2::LogSink instances.
          #   See Google::Gax::PagedEnumerable documentation for other
          #   operations such as per-page iteration or access to the response
          #   object.
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #   formatted_parent = Google::Cloud::Logging::V2::ConfigServiceV2Client.project_path("[PROJECT]")
          #
          #   # Iterate over all results.
          #   config_client.list_sinks(formatted_parent).each do |element|
          #     # Process element.
          #   end
          #
          #   # Or iterate over results one page at a time.
          #   config_client.list_sinks(formatted_parent).each_page do |page|
          #     # Process each page at a time.
          #     page.each do |element|
          #       # Process element.
          #     end
          #   end

          def list_sinks \
              parent,
              page_size: nil,
              options: nil,
              &block
            req = {
              parent: parent,
              page_size: page_size
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::ListSinksRequest)
            @list_sinks.call(req, options, &block)
          end

          # Gets a sink.
          #
          # @param sink_name [String]
          #   Required. The resource name of the sink:
          #
          #       "projects/[PROJECT_ID]/sinks/[SINK_ID]"
          #       "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
          #       "folders/[FOLDER_ID]/sinks/[SINK_ID]"
          #
          #   Example: `"projects/my-project-id/sinks/my-sink-id"`.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::LogSink]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::LogSink]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `sink_name`:
          #   sink_name = ''
          #   response = config_client.get_sink(sink_name)

          def get_sink \
              sink_name,
              options: nil,
              &block
            req = {
              sink_name: sink_name
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::GetSinkRequest)
            @get_sink.call(req, options, &block)
          end

          # Creates a sink that exports specified log entries to a destination. The
          # export of newly-ingested log entries begins immediately, unless the sink's
          # `writer_identity` is not permitted to write to the destination. A sink can
          # export log entries only from the resource owning the sink.
          #
          # @param parent [String]
          #   Required. The resource in which to create the sink:
          #
          #       "projects/[PROJECT_ID]"
          #       "organizations/[ORGANIZATION_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]"
          #       "folders/[FOLDER_ID]"
          #
          #   Examples: `"projects/my-logging-project"`, `"organizations/123456789"`.
          # @param sink [Google::Logging::V2::LogSink | Hash]
          #   Required. The new sink, whose `name` parameter is a sink identifier that
          #   is not already in use.
          #   A hash of the same form as `Google::Logging::V2::LogSink`
          #   can also be provided.
          # @param unique_writer_identity [true, false]
          #   Optional. Determines the kind of IAM identity returned as `writer_identity`
          #   in the new sink. If this value is omitted or set to false, and if the
          #   sink's parent is a project, then the value returned as `writer_identity` is
          #   the same group or service account used by Logging before the addition of
          #   writer identities to this API. The sink's destination must be in the same
          #   project as the sink itself.
          #
          #   If this field is set to true, or if the sink is owned by a non-project
          #   resource such as an organization, then the value of `writer_identity` will
          #   be a unique service account used only for exports from the new sink. For
          #   more information, see `writer_identity` in {Google::Logging::V2::LogSink LogSink}.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::LogSink]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::LogSink]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #   formatted_parent = Google::Cloud::Logging::V2::ConfigServiceV2Client.project_path("[PROJECT]")
          #
          #   # TODO: Initialize `sink`:
          #   sink = {}
          #   response = config_client.create_sink(formatted_parent, sink)

          def create_sink \
              parent,
              sink,
              unique_writer_identity: nil,
              options: nil,
              &block
            req = {
              parent: parent,
              sink: sink,
              unique_writer_identity: unique_writer_identity
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::CreateSinkRequest)
            @create_sink.call(req, options, &block)
          end

          # Updates a sink. This method replaces the following fields in the existing
          # sink with values from the new sink: `destination`, and `filter`.
          #
          # The updated sink might also have a new `writer_identity`; see the
          # `unique_writer_identity` field.
          #
          # @param sink_name [String]
          #   Required. The full resource name of the sink to update, including the parent
          #   resource and the sink identifier:
          #
          #       "projects/[PROJECT_ID]/sinks/[SINK_ID]"
          #       "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
          #       "folders/[FOLDER_ID]/sinks/[SINK_ID]"
          #
          #   Example: `"projects/my-project-id/sinks/my-sink-id"`.
          # @param sink [Google::Logging::V2::LogSink | Hash]
          #   Required. The updated sink, whose name is the same identifier that appears as part
          #   of `sink_name`.
          #   A hash of the same form as `Google::Logging::V2::LogSink`
          #   can also be provided.
          # @param unique_writer_identity [true, false]
          #   Optional. See {Google::Logging::V2::ConfigServiceV2#create_sink}
          #   for a description of this field. When updating a sink, the effect of this
          #   field on the value of `writer_identity` in the updated sink depends on both
          #   the old and new values of this field:
          #
          #   * If the old and new values of this field are both false or both true,
          #     then there is no change to the sink's `writer_identity`.
          #   * If the old value is false and the new value is true, then
          #     `writer_identity` is changed to a unique service account.
          #   * It is an error if the old value is true and the new value is
          #     set to false or defaulted to false.
          # @param update_mask [Google::Protobuf::FieldMask | Hash]
          #   Optional. Field mask that specifies the fields in `sink` that need
          #   an update. A sink field will be overwritten if, and only if, it is
          #   in the update mask. `name` and output only fields cannot be updated.
          #
          #   An empty updateMask is temporarily treated as using the following mask
          #   for backwards compatibility purposes:
          #     destination,filter,includeChildren
          #   At some point in the future, behavior will be removed and specifying an
          #   empty updateMask will be an error.
          #
          #   For a detailed `FieldMask` definition, see
          #   https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.FieldMask
          #
          #   Example: `updateMask=filter`.
          #   A hash of the same form as `Google::Protobuf::FieldMask`
          #   can also be provided.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::LogSink]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::LogSink]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `sink_name`:
          #   sink_name = ''
          #
          #   # TODO: Initialize `sink`:
          #   sink = {}
          #   response = config_client.update_sink(sink_name, sink)

          def update_sink \
              sink_name,
              sink,
              unique_writer_identity: nil,
              update_mask: nil,
              options: nil,
              &block
            req = {
              sink_name: sink_name,
              sink: sink,
              unique_writer_identity: unique_writer_identity,
              update_mask: update_mask
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::UpdateSinkRequest)
            @update_sink.call(req, options, &block)
          end

          # Deletes a sink. If the sink has a unique `writer_identity`, then that
          # service account is also deleted.
          #
          # @param sink_name [String]
          #   Required. The full resource name of the sink to delete, including the parent
          #   resource and the sink identifier:
          #
          #       "projects/[PROJECT_ID]/sinks/[SINK_ID]"
          #       "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
          #       "folders/[FOLDER_ID]/sinks/[SINK_ID]"
          #
          #   Example: `"projects/my-project-id/sinks/my-sink-id"`.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result []
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `sink_name`:
          #   sink_name = ''
          #   config_client.delete_sink(sink_name)

          def delete_sink \
              sink_name,
              options: nil,
              &block
            req = {
              sink_name: sink_name
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::DeleteSinkRequest)
            @delete_sink.call(req, options, &block)
            nil
          end

          # Lists all the exclusions in a parent resource.
          #
          # @param parent [String]
          #   Required. The parent resource whose exclusions are to be listed.
          #
          #       "projects/[PROJECT_ID]"
          #       "organizations/[ORGANIZATION_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]"
          #       "folders/[FOLDER_ID]"
          # @param page_size [Integer]
          #   The maximum number of resources contained in the underlying API
          #   response. If page streaming is performed per-resource, this
          #   parameter does not affect the return value. If page streaming is
          #   performed per-page, this determines the maximum number of
          #   resources in a page.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Gax::PagedEnumerable<Google::Logging::V2::LogExclusion>]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Gax::PagedEnumerable<Google::Logging::V2::LogExclusion>]
          #   An enumerable of Google::Logging::V2::LogExclusion instances.
          #   See Google::Gax::PagedEnumerable documentation for other
          #   operations such as per-page iteration or access to the response
          #   object.
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #   formatted_parent = Google::Cloud::Logging::V2::ConfigServiceV2Client.project_path("[PROJECT]")
          #
          #   # Iterate over all results.
          #   config_client.list_exclusions(formatted_parent).each do |element|
          #     # Process element.
          #   end
          #
          #   # Or iterate over results one page at a time.
          #   config_client.list_exclusions(formatted_parent).each_page do |page|
          #     # Process each page at a time.
          #     page.each do |element|
          #       # Process element.
          #     end
          #   end

          def list_exclusions \
              parent,
              page_size: nil,
              options: nil,
              &block
            req = {
              parent: parent,
              page_size: page_size
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::ListExclusionsRequest)
            @list_exclusions.call(req, options, &block)
          end

          # Gets the description of an exclusion.
          #
          # @param name [String]
          #   Required. The resource name of an existing exclusion:
          #
          #       "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
          #       "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
          #       "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
          #
          #   Example: `"projects/my-project-id/exclusions/my-exclusion-id"`.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::LogExclusion]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::LogExclusion]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `name`:
          #   name = ''
          #   response = config_client.get_exclusion(name)

          def get_exclusion \
              name,
              options: nil,
              &block
            req = {
              name: name
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::GetExclusionRequest)
            @get_exclusion.call(req, options, &block)
          end

          # Creates a new exclusion in a specified parent resource.
          # Only log entries belonging to that resource can be excluded.
          # You can have up to 10 exclusions in a resource.
          #
          # @param parent [String]
          #   Required. The parent resource in which to create the exclusion:
          #
          #       "projects/[PROJECT_ID]"
          #       "organizations/[ORGANIZATION_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]"
          #       "folders/[FOLDER_ID]"
          #
          #   Examples: `"projects/my-logging-project"`, `"organizations/123456789"`.
          # @param exclusion [Google::Logging::V2::LogExclusion | Hash]
          #   Required. The new exclusion, whose `name` parameter is an exclusion name
          #   that is not already used in the parent resource.
          #   A hash of the same form as `Google::Logging::V2::LogExclusion`
          #   can also be provided.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::LogExclusion]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::LogExclusion]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #   formatted_parent = Google::Cloud::Logging::V2::ConfigServiceV2Client.project_path("[PROJECT]")
          #
          #   # TODO: Initialize `exclusion`:
          #   exclusion = {}
          #   response = config_client.create_exclusion(formatted_parent, exclusion)

          def create_exclusion \
              parent,
              exclusion,
              options: nil,
              &block
            req = {
              parent: parent,
              exclusion: exclusion
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::CreateExclusionRequest)
            @create_exclusion.call(req, options, &block)
          end

          # Changes one or more properties of an existing exclusion.
          #
          # @param name [String]
          #   Required. The resource name of the exclusion to update:
          #
          #       "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
          #       "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
          #       "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
          #
          #   Example: `"projects/my-project-id/exclusions/my-exclusion-id"`.
          # @param exclusion [Google::Logging::V2::LogExclusion | Hash]
          #   Required. New values for the existing exclusion. Only the fields specified in
          #   `update_mask` are relevant.
          #   A hash of the same form as `Google::Logging::V2::LogExclusion`
          #   can also be provided.
          # @param update_mask [Google::Protobuf::FieldMask | Hash]
          #   Required. A non-empty list of fields to change in the existing exclusion. New values
          #   for the fields are taken from the corresponding fields in the
          #   {Google::Logging::V2::LogExclusion LogExclusion} included in this request. Fields not mentioned in
          #   `update_mask` are not changed and are ignored in the request.
          #
          #   For example, to change the filter and description of an exclusion,
          #   specify an `update_mask` of `"filter,description"`.
          #   A hash of the same form as `Google::Protobuf::FieldMask`
          #   can also be provided.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::LogExclusion]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::LogExclusion]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `name`:
          #   name = ''
          #
          #   # TODO: Initialize `exclusion`:
          #   exclusion = {}
          #
          #   # TODO: Initialize `update_mask`:
          #   update_mask = {}
          #   response = config_client.update_exclusion(name, exclusion, update_mask)

          def update_exclusion \
              name,
              exclusion,
              update_mask,
              options: nil,
              &block
            req = {
              name: name,
              exclusion: exclusion,
              update_mask: update_mask
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::UpdateExclusionRequest)
            @update_exclusion.call(req, options, &block)
          end

          # Deletes an exclusion.
          #
          # @param name [String]
          #   Required. The resource name of an existing exclusion to delete:
          #
          #       "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
          #       "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
          #       "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
          #
          #   Example: `"projects/my-project-id/exclusions/my-exclusion-id"`.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result []
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `name`:
          #   name = ''
          #   config_client.delete_exclusion(name)

          def delete_exclusion \
              name,
              options: nil,
              &block
            req = {
              name: name
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::DeleteExclusionRequest)
            @delete_exclusion.call(req, options, &block)
            nil
          end

          # Gets the Logs Router CMEK settings for the given resource.
          #
          # Note: CMEK for the Logs Router can currently only be configured for GCP
          # organizations. Once configured, it applies to all projects and folders in
          # the GCP organization.
          #
          # See [Enabling CMEK for Logs
          # Router](/logging/docs/routing/managed-encryption) for more information.
          #
          # @param name [String]
          #   Required. The resource for which to retrieve CMEK settings.
          #
          #       "projects/[PROJECT_ID]/cmekSettings"
          #       "organizations/[ORGANIZATION_ID]/cmekSettings"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/cmekSettings"
          #       "folders/[FOLDER_ID]/cmekSettings"
          #
          #   Example: `"organizations/12345/cmekSettings"`.
          #
          #   Note: CMEK for the Logs Router can currently only be configured for GCP
          #   organizations. Once configured, it applies to all projects and folders in
          #   the GCP organization.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::CmekSettings]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::CmekSettings]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `name`:
          #   name = ''
          #   response = config_client.get_cmek_settings(name)

          def get_cmek_settings \
              name,
              options: nil,
              &block
            req = {
              name: name
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::GetCmekSettingsRequest)
            @get_cmek_settings.call(req, options, &block)
          end

          # Updates the Logs Router CMEK settings for the given resource.
          #
          # Note: CMEK for the Logs Router can currently only be configured for GCP
          # organizations. Once configured, it applies to all projects and folders in
          # the GCP organization.
          #
          # {Google::Cloud::Logging::V2::ConfigServiceV2Client#update_cmek_settings}
          # will fail if 1) `kms_key_name` is invalid, or 2) the associated service
          # account does not have the required
          # `roles/cloudkms.cryptoKeyEncrypterDecrypter` role assigned for the key, or
          # 3) access to the key is disabled.
          #
          # See [Enabling CMEK for Logs
          # Router](/logging/docs/routing/managed-encryption) for more information.
          #
          # @param name [String]
          #   Required. The resource name for the CMEK settings to update.
          #
          #       "projects/[PROJECT_ID]/cmekSettings"
          #       "organizations/[ORGANIZATION_ID]/cmekSettings"
          #       "billingAccounts/[BILLING_ACCOUNT_ID]/cmekSettings"
          #       "folders/[FOLDER_ID]/cmekSettings"
          #
          #   Example: `"organizations/12345/cmekSettings"`.
          #
          #   Note: CMEK for the Logs Router can currently only be configured for GCP
          #   organizations. Once configured, it applies to all projects and folders in
          #   the GCP organization.
          # @param cmek_settings [Google::Logging::V2::CmekSettings | Hash]
          #   Required. The CMEK settings to update.
          #
          #   See [Enabling CMEK for Logs
          #   Router](/logging/docs/routing/managed-encryption) for more information.
          #   A hash of the same form as `Google::Logging::V2::CmekSettings`
          #   can also be provided.
          # @param update_mask [Google::Protobuf::FieldMask | Hash]
          #   Optional. Field mask identifying which fields from `cmek_settings` should
          #   be updated. A field will be overwritten if and only if it is in the update
          #   mask. Output only fields cannot be updated.
          #
          #   See {Google::Protobuf::FieldMask FieldMask} for more information.
          #
          #   Example: `"updateMask=kmsKeyName"`
          #   A hash of the same form as `Google::Protobuf::FieldMask`
          #   can also be provided.
          # @param options [Google::Gax::CallOptions]
          #   Overrides the default settings for this call, e.g, timeout,
          #   retries, etc.
          # @yield [result, operation] Access the result along with the RPC operation
          # @yieldparam result [Google::Logging::V2::CmekSettings]
          # @yieldparam operation [GRPC::ActiveCall::Operation]
          # @return [Google::Logging::V2::CmekSettings]
          # @raise [Google::Gax::GaxError] if the RPC is aborted.
          # @example
          #   require "google/cloud/logging/v2"
          #
          #   config_client = Google::Cloud::Logging::V2::ConfigServiceV2Client.new
          #
          #   # TODO: Initialize `name`:
          #   name = ''
          #
          #   # TODO: Initialize `cmek_settings`:
          #   cmek_settings = {}
          #   response = config_client.update_cmek_settings(name, cmek_settings)

          def update_cmek_settings \
              name,
              cmek_settings,
              update_mask: nil,
              options: nil,
              &block
            req = {
              name: name,
              cmek_settings: cmek_settings,
              update_mask: update_mask
            }.delete_if { |_, v| v.nil? }
            req = Google::Gax::to_proto(req, Google::Logging::V2::UpdateCmekSettingsRequest)
            @update_cmek_settings.call(req, options, &block)
          end
        end
      end
    end
  end
end
