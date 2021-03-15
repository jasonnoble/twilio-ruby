##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class CallContext < InstanceContext
            class FeedbackList < ListResource
              ##
              # Initialize the FeedbackList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] responsible for this
              #   resource.
              # @param [String] call_sid The unique string that we created to identify this Call
              #   resource.
              # @return [FeedbackList] FeedbackList
              def initialize(version, account_sid: nil, call_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, call_sid: call_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.FeedbackList>'
              end
            end

            class FeedbackPage < Page
              ##
              # Initialize the FeedbackPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [FeedbackPage] FeedbackPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of FeedbackInstance
              # @param [Hash] payload Payload response from the API
              # @return [FeedbackInstance] FeedbackInstance
              def get_instance(payload)
                FeedbackInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.FeedbackPage>'
              end
            end

            class FeedbackContext < InstanceContext
              ##
              # Initialize the FeedbackContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] responsible for this
              #   resource.
              # @param [String] call_sid The call sid that uniquely identifies the call
              # @return [FeedbackContext] FeedbackContext
              def initialize(version, account_sid, call_sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, call_sid: call_sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Feedback.json"
              end

              ##
              # Create the FeedbackInstance
              # @param [String] quality_score The call quality expressed as an integer from `1`
              #   to `5` where `1` represents very poor call quality and `5` represents a perfect
              #   call.
              # @param [Array[feedback.Issues]] issue A list of one or more issues experienced
              #   during the call. Issues can be: `imperfect-audio`, `dropped-call`,
              #   `incorrect-caller-id`, `post-dial-delay`, `digits-not-captured`,
              #   `audio-latency`, `unsolicited-call`, or `one-way-audio`.
              # @return [FeedbackInstance] Created FeedbackInstance
              def create(quality_score: nil, issue: :unset)
                data = Twilio::Values.of({
                    'QualityScore' => quality_score,
                    'Issue' => Twilio.serialize_list(issue) { |e| e },
                })

                payload = @version.create('POST', @uri, data: data)

                FeedbackInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Fetch the FeedbackInstance
              # @return [FeedbackInstance] Fetched FeedbackInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                FeedbackInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Update the FeedbackInstance
              # @param [String] quality_score The call quality expressed as an integer from `1`
              #   to `5` where `1` represents very poor call quality and `5` represents a perfect
              #   call.
              # @param [Array[feedback.Issues]] issue One or more issues experienced during the
              #   call. The issues can be: `imperfect-audio`, `dropped-call`,
              #   `incorrect-caller-id`, `post-dial-delay`, `digits-not-captured`,
              #   `audio-latency`, `unsolicited-call`, or `one-way-audio`.
              # @return [FeedbackInstance] Updated FeedbackInstance
              def update(quality_score: nil, issue: :unset)
                data = Twilio::Values.of({
                    'QualityScore' => quality_score,
                    'Issue' => Twilio.serialize_list(issue) { |e| e },
                })

                payload = @version.update('POST', @uri, data: data)

                FeedbackInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.FeedbackContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.FeedbackContext #{context}>"
              end
            end

            class FeedbackInstance < InstanceResource
              ##
              # Initialize the FeedbackInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The unique id of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] responsible for this
              #   resource.
              # @param [String] call_sid The unique string that we created to identify this Call
              #   resource.
              # @return [FeedbackInstance] FeedbackInstance
              def initialize(version, payload, account_sid: nil, call_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'issues' => payload['issues'],
                    'quality_score' => payload['quality_score'].to_i,
                    'sid' => payload['sid'],
                }

                # Context
                @instance_context = nil
                @params = {'account_sid' => account_sid, 'call_sid' => call_sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [FeedbackContext] FeedbackContext for this FeedbackInstance
              def context
                unless @instance_context
                  @instance_context = FeedbackContext.new(@version, @params['account_sid'], @params['call_sid'], )
                end
                @instance_context
              end

              ##
              # @return [String] The unique sid that identifies this account
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [Time] The date this resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [Array[feedback.Issues]] Issues experienced during the call
              def issues
                @properties['issues']
              end

              ##
              # @return [String] 1 to 5 quality score
              def quality_score
                @properties['quality_score']
              end

              ##
              # @return [String] A string that uniquely identifies this feedback resource
              def sid
                @properties['sid']
              end

              ##
              # Create the FeedbackInstance
              # @param [String] quality_score The call quality expressed as an integer from `1`
              #   to `5` where `1` represents very poor call quality and `5` represents a perfect
              #   call.
              # @param [Array[feedback.Issues]] issue A list of one or more issues experienced
              #   during the call. Issues can be: `imperfect-audio`, `dropped-call`,
              #   `incorrect-caller-id`, `post-dial-delay`, `digits-not-captured`,
              #   `audio-latency`, `unsolicited-call`, or `one-way-audio`.
              # @return [FeedbackInstance] Created FeedbackInstance
              def create(quality_score: nil, issue: :unset)
                context.create(quality_score: quality_score, issue: issue, )
              end

              ##
              # Fetch the FeedbackInstance
              # @return [FeedbackInstance] Fetched FeedbackInstance
              def fetch
                context.fetch
              end

              ##
              # Update the FeedbackInstance
              # @param [String] quality_score The call quality expressed as an integer from `1`
              #   to `5` where `1` represents very poor call quality and `5` represents a perfect
              #   call.
              # @param [Array[feedback.Issues]] issue One or more issues experienced during the
              #   call. The issues can be: `imperfect-audio`, `dropped-call`,
              #   `incorrect-caller-id`, `post-dial-delay`, `digits-not-captured`,
              #   `audio-latency`, `unsolicited-call`, or `one-way-audio`.
              # @return [FeedbackInstance] Updated FeedbackInstance
              def update(quality_score: nil, issue: :unset)
                context.update(quality_score: quality_score, issue: issue, )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.FeedbackInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.FeedbackInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end