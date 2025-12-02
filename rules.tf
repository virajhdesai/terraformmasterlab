
data "akamai_property_rules_builder" "property_name_rule_default" {
  rules_v2024_01_09 {
    name      = "default"
    is_secure = true
    comments  = "The Default Rule template contains all the necessary and recommended behaviors. Rules are evaluated from top to bottom and the last matching rule wins."
    uuid      = "default"
    variable {
      name        = "PMUSER_JA3_FINGERPRINT"
      description = ""
      value       = ""
      hidden      = false
      sensitive   = false
    }
    variable {
      name        = "PMUSER_TLS_CLIENT_HELLO"
      description = ""
      value       = ""
      hidden      = false
      sensitive   = false
    }
    variable {
      name        = "PMUSER_REF_ERROR"
      description = ""
      value       = ""
      hidden      = false
      sensitive   = false
    }
    variable {
      name        = "PMUSER_X_REFERENCE_NO"
      description = ""
      value       = ""
      hidden      = false
      sensitive   = false
    }
    behavior {
      origin {
        cache_key_hostname = "ORIGIN_HOSTNAME"
        compress           = true
        custom_certificate_authorities {}
        custom_certificates {
          can_be_ca   = false
          can_be_leaf = false
          issuer_rdns {
            c  = "US"
            cn = "flexorigin"
            o  = "xap"
            ou = "devel"
          }
          not_after                 = 2005069037000
          not_before                = 1689709037000
          pem_encoded_cert          = <<EOT
-----BEGIN CERTIFICATE-----
MIID2TCCAsGgAwIBAgIUaX0dObHvowk3z8Txu0tqIneSql0wDQYJKoZIhvcNAQEL
BQAwfDELMAkGA1UEBhMCVVMxDzANBgNVBAgMBk9yZWdvbjENMAsGA1UEBwwEQmVu
ZDEMMAoGA1UECgwDeGFwMQ4wDAYDVQQLDAVkZXZlbDETMBEGA1UEAwwKZmxleG9y
aWdpbjEaMBgGCSqGSIb3DQEJARYLZm9AdGVzdC5uZXQwHhcNMjMwNzE4MTkzNzE3
WhcNMzMwNzE1MTkzNzE3WjB8MQswCQYDVQQGEwJVUzEPMA0GA1UECAwGT3JlZ29u
MQ0wCwYDVQQHDARCZW5kMQwwCgYDVQQKDAN4YXAxDjAMBgNVBAsMBWRldmVsMRMw
EQYDVQQDDApmbGV4b3JpZ2luMRowGAYJKoZIhvcNAQkBFgtmb0B0ZXN0Lm5ldDCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJhEW51UYxj+tiIgkO55agN0
uksJGaUUyI27wEAE7QOa/W1bIPjBrRTXxKCbFpwRx/LysPSIWuOyLAOBBADTokre
NUG7mcKp+fMAwNeK1wBfQsOT+FJ6BkdujjzgNmSJNW/OwZU3Et6v/jccWN7JKHR4
PiCFoSPiS80kgkntVDqhMdTOpc5jsfQA3BSfCnEKvkZP1ATjIZ1dPH+pIGhes+D/
O5b0eBW5I1LrFSM5NywLofBoLdSrEqPYiY6ub/oP4+hJ2t/1vEo02PgJVfGJpsqH
yuSSVniuijVSwLX5PB2WcjzAUD1trSmVovc6Rbc4qdUmQgMEjNySyMsRjAqL+TEC
AwEAAaNTMFEwHQYDVR0OBBYEFL9j71SmBJ0beZLjRvUOv3mBFz7YMB8GA1UdIwQY
MBaAFL9j71SmBJ0beZLjRvUOv3mBFz7YMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZI
hvcNAQELBQADggEBAGjVuwVAF7KFQArk4sm/Ong0Qx61xN6ZAYco3Z3nw0zqYoDe
E0Diw82hSYgrzD/XJG5FvH7hvt/i2cv+ltBKFAqo17t7qrbv3OlWC/gCXIitQ/O/
+jYtiog25TwUDI1AT9x7xOhjBQuxUdhVLlQEG1iGuP9KFfxwt9Cm0gyraiogy3Zt
YYvenUp1R9c7uAql4S+K+30e4sSwnC3CJkMhgCIhVljZDC6FuqT2CiKgvhd/JIxj
R7TM383HwXBqRjzSUBKGqJSvJ62Un8qVLtWT22z6bbtPWO6Gih/fRhuNtnlnxnG8
IrjERcUCREalN7GmW37sXGfjmKUSEc8qJar6giQ=
-----END CERTIFICATE-----
EOT
          public_key                = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmERbnVRjGP62IiCQ7nlqA3S6SwkZpRTIjbvAQATtA5r9bVsg+MGtFNfEoJsWnBHH8vKw9Iha47IsA4EEANOiSt41QbuZwqn58wDA14rXAF9Cw5P4UnoGR26OPOA2ZIk1b87BlTcS3q/+NxxY3skodHg+IIWhI+JLzSSCSe1UOqEx1M6lzmOx9ADcFJ8KcQq+Rk/UBOMhnV08f6kgaF6z4P87lvR4FbkjUusVIzk3LAuh8Ggt1KsSo9iJjq5v+g/j6Ena3/W8SjTY+AlV8YmmyofK5JJWeK6KNVLAtfk8HZZyPMBQPW2tKZWi9zpFtzip1SZCAwSM3JLIyxGMCov5MQIDAQAB"
          public_key_algorithm      = "RSA"
          public_key_format         = "X.509"
          self_signed               = true
          serial_number             = "602234169975224034444028885843984148201255119453"
          sha1_fingerprint          = "41d2adf3988c5ced592dd8bd7ed7d75655a5e232"
          sig_alg_name              = "SHA256withRSA"
          subject_alternative_names = []
          subject_cn                = "flexorigin"
          subject_rdns {
            c  = "US"
            cn = "flexorigin"
            o  = "xap"
            ou = "devel"
          }
          version = 3
        }
        custom_valid_cn_values           = ["{{Origin Hostname}}", "{{Forward Host Header}}", "flexorigin", ]
        enable_true_client_ip            = true
        forward_host_header              = "REQUEST_HOST_HEADER"
        hostname                         = "170.187.181.126"
        http_port                        = 80
        https_port                       = 443
        ip_version                       = "IPV4"
        min_tls_version                  = "DYNAMIC"
        origin_certificate               = ""
        origin_certs_to_honor            = "COMBO"
        origin_sni                       = true
        origin_type                      = "CUSTOMER"
        ports                            = ""
        standard_certificate_authorities = ["akamai-permissive", ]
        tls_version_title                = ""
        true_client_ip_client_setting    = true
        true_client_ip_header            = "True-Client-IP"
        verification_mode                = "CUSTOM"
      }
    }
    behavior {
      cp_code {
        value {
          cp_code_limits {
            current_capacity = 3474
            limit            = 10000
            limit_type       = "account"
          }
          created_date = 1701796224000
          description  = "Viraj.Master.Lab.2023"
          id           = 1569240
          name         = "Viraj.Master.Lab.2023"
          products     = ["Fresca", ]
        }
      }
    }
    behavior {
      m_pulse {
        api_key         = "9EY8D-YL765-QZV6K-NFA9S-JRUHN"
        buffer_size     = ""
        config_override = ""
        enabled         = true
        loader_version  = "V12"
        require_pci     = false
        title_optional  = ""
      }
    }
    children = [
      data.akamai_property_rules_builder.property_name_rule_-content--.json,
      data.akamai_property_rules_builder.property_name_rule_break_connection.json,
      data.akamai_property_rules_builder.property_name_rule_reference_error.json,
      data.akamai_property_rules_builder.property_name_rule_caching.json,
    ]
  }
}

data "akamai_property_rules_builder" "property_name_rule_-content--" {
  rules_v2024_01_09 {
    name                  = "/content/*"
    criteria_must_satisfy = "all"
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "MATCHES_ONE_OF"
        normalize            = false
        values               = ["/sandbox/*", ]
      }
    }
    behavior {
      origin {
        net_storage {
          cp_code              = 320422
          download_domain_name = "atf.download.akamai.com"
        }
        origin_type = "NET_STORAGE"
      }
    }
    behavior {
      caching {
        behavior        = "MAX_AGE"
        must_revalidate = false
        ttl             = "10m"
      }
    }
    behavior {
      rewrite_url {
        behavior          = "REPLACE"
        keep_query_string = true
        match             = "/sandbox/"
        match_multiple    = false
        target_path       = "/sfztest1/Archive/"
      }
    }
  }
}

data "akamai_property_rules_builder" "property_name_rule_break_connection" {
  rules_v2024_01_09 {
    name                  = "Break connection"
    criteria_must_satisfy = "all"
    criterion {
      request_header {
        header_name                = "breakconnection"
        match_case_sensitive_value = true
        match_operator             = "IS_ONE_OF"
        match_wildcard_name        = false
        match_wildcard_value       = false
        values                     = ["true", ]
      }
    }
    behavior {
      simulate_error_code {
        error_type = "ERR_CONNECT_FAIL"
      }
    }
  }
}

data "akamai_property_rules_builder" "property_name_rule_reference_error" {
  rules_v2024_01_09 {
    name                  = "Reference Error"
    criteria_must_satisfy = "any"
    uuid                  = "cbfae6c1-ff6d-4fc0-b75a-3fa4937c4fde"
    behavior {
      advanced {
        uuid        = "f3d666cf-77e7-4b27-abfe-d48530a04bc1"
        description = "Response Header X-Ref-Error"
        xml         = "<edgeservices:modify-outgoing-response.add-error-reference-header>on</edgeservices:modify-outgoing-response.add-error-reference-header>"
      }
    }
    behavior {
      global_request_number {
        header_name   = "Akamai-GRN"
        output_option = "RESPONSE_HEADER"
      }
    }
  }
}

data "akamai_property_rules_builder" "property_name_rule_caching" {
  rules_v2024_01_09 {
    name                  = "Caching"
    criteria_must_satisfy = "all"
    uuid                  = "e388511d-29ee-435b-981c-00fb34ea1d35"
    behavior {
      caching {
        behavior                 = "CACHE_CONTROL"
        cache_control_directives = ""
        default_ttl              = "1h"
        enhanced_rfc_support     = false
        honor_must_revalidate    = false
        honor_private            = false
        must_revalidate          = false
      }
    }
    children = [
      data.akamai_property_rules_builder.property_name_rule_200_ok.json,
    ]
  }
}

data "akamai_property_rules_builder" "property_name_rule_200_ok" {
  rules_v2024_01_09 {
    name                  = "200OK"
    criteria_must_satisfy = "all"
    uuid                  = "4b4fd63b-753d-42ab-a0fa-58698ab1a321"
    behavior {
      advanced {
        uuid        = "2d0529c3-8d2b-4bf4-a5ef-abb3bba45f1a"
        description = "Caching for 200 OK"
        xml = trimsuffix(<<EOT
<match:response.status value="200" result="true">
    <edgeservices:modify-incoming-response.add-header>
        <status>on</status>
        <name>cache-control</name>
        <value>max-age=31536000</value>
    </edgeservices:modify-incoming-response.add-header>
</match:response.status>
EOT
        , "\n")
      }
    }
  }
}
