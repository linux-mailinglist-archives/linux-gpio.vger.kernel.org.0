Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46526BD703
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Mar 2023 18:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjCPR1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Mar 2023 13:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjCPR1r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2023 13:27:47 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD5A8C0D6;
        Thu, 16 Mar 2023 10:27:39 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id x3so10519991edb.10;
        Thu, 16 Mar 2023 10:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678987657;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dFAHwgUDF1AsZcQGq6ND18kNweUL7ea1ST3qNk0q0g=;
        b=nh/r8HH4HD7rOx2VJaeDpLBfZUzc/sgvBZdjuSR/C3sv5YrZ61ntRU6PZ3biVIJrCK
         plMZI2CHtJ2/5oiZAl6zbQTkQegIGAymJ8yna9uQqa1gEu9rBeQq6hntUzfsKUsZbrFh
         y9yrxxHwoyJRg+pbSOGSWV8nZQ/oAZJej13pHmtp5ccxYjQNeJv1leTWgbkzgA/Ol0UH
         jY/C+jKtBCACnrcpar9J9hXa7Bra6BFClrDFs9kwc8KQqwfSBnIOQRrTaYidq6DQzkH4
         UoDIVLSBW81ZAGAC3L6zjMhH/N53WSh4FBmkG4Omp8dLGnAcKB05eDozTOsZbNHMnBIR
         /Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678987657;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dFAHwgUDF1AsZcQGq6ND18kNweUL7ea1ST3qNk0q0g=;
        b=VkPmIX+0VvPTkrBT5RD9o0Nl9bf45ilfjLZrWgiHCfP7X0vMfvs0/XlAUnN46dRmTw
         dAfWo12Q4OUUqOvuVUx7IzpJ3xZf4JPT0ohkzAFI+9/6e7t17AQP2SL6Sg5bSWX5EDnN
         rz/Xc0rdAG9IqIjqCpAO7tYnTV9mksLgBOm85OnhvVlm6rxJ4KulzW3gYYmjDyP8cDc7
         qX8Enq0KSL5CorXa5OARmFR9q28Xlsrv6MuiPM7/KLZvQMXVjOwuyDBvHE3+7JrRQlmu
         eyT2hSSGbqq3tprSMDMk0WE4L2A9pW+vUspHhsypLKP//55R5Hj89KZLRwiWQnZbfqOy
         NH8w==
X-Gm-Message-State: AO0yUKWEr9xJHS69t2MZux6j2zAJDjOz6L+PZVH34H86VJVctLMai2Ev
        OaIP9we8icKNdYSKC5TaOAw=
X-Google-Smtp-Source: AK7set8ByHxk7JN7qaSsVbE4ybPr9AHtsdm3lZ1Bg7gtQ0bX4pexqcnDBCPxVGYi5zvB5Oh0Uej2Pw==
X-Received: by 2002:a17:906:eb91:b0:8af:305b:76af with SMTP id mh17-20020a170906eb9100b008af305b76afmr11236840ejb.33.1678987657516;
        Thu, 16 Mar 2023 10:27:37 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c416:2100:138:7dfa:fb30:53f? (dynamic-2a01-0c23-c416-2100-0138-7dfa-fb30-053f.c23.pool.telefonica.de. [2a01:c23:c416:2100:138:7dfa:fb30:53f])
        by smtp.googlemail.com with ESMTPSA id x30-20020a50d61e000000b004c30e2fc6e5sm25888edi.65.2023.03.16.10.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 10:27:37 -0700 (PDT)
Message-ID: <3feac3a0-e900-5b50-a9de-6011ee2ac57b@gmail.com>
Date:   Thu, 16 Mar 2023 18:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
Content-Language: en-US
In-Reply-To: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15.03.2023 22:23, Heiner Kallweit wrote:
> Convert Amlogic Meson pin controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible can be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> v4:
> - split patch to be able to deal with the different reg/reg-names
> v5:
> - remove compatible definition from common yaml
> - move pincfg-node and pinmux-node definition to meson-gpio object definition
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 63 +++++++++++++
>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 52 ++++++++++
>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 64 +++++++++++++
>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 68 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 72 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 74 +++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>  7 files changed, 393 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> new file mode 100644
> index 000000000..05074df12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-a1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson A1 pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: amlogic,meson-pinctrl-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-periphs-pinctrl
> +      - amlogic,meson-s4-periphs-pinctrl
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
> +
> +    properties:
> +      reg:
> +        maxItems: 2
> +
> +      reg-names:
> +        items:
> +          - const: mux
> +          - const: gpio
> +
> +examples:
> +  - |
> +    periphs_pinctrl: pinctrl {
> +      compatible = "amlogic,meson-a1-periphs-pinctrl";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      bank@400 {
> +        reg = <0x0400 0x003c>,
> +              <0x0480 0x0118>;
> +        reg-names = "mux", "gpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&periphs_pinctrl 0 0 62>;
> +
> +        cec_ao_a_h_pins: cec_ao_a_h {
> +          mux {
> +            groups = "cec_ao_a_h";
> +            function = "cec_ao_a_h";
> +            bias-disable;
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> new file mode 100644
> index 000000000..9620f2853
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  ranges: true
> +
> +  "#address-cells":
> +    enum: [1, 2]
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +required:
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: true
> +
> +$defs:
> +  meson-gpio:
> +    type: object
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +
> +    properties:
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - reg-names
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
> new file mode 100644
> index 000000000..8baaec81c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson G12 AOBUS pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: amlogic,meson-pinctrl-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-g12a-aobus-pinctrl
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
> +
> +    properties:
> +      reg:
> +        maxItems: 3
> +
> +      reg-names:
> +        items:
> +          - const: mux
> +          - const: ds
> +          - const: gpio
> +
> +examples:
> +  - |
> +    ao_pinctrl: pinctrl {
> +      compatible = "amlogic,meson-g12a-aobus-pinctrl";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      bank@14 {
> +        reg = <0x14 0x8>,
> +              <0x1c 0x8>,
> +              <0x24 0x14>;
> +        reg-names = "mux", "ds", "gpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&ao_pinctrl 0 0 15>;
> +
> +        cec_ao_a_h_pins: cec_ao_a_h {
> +          mux {
> +            groups = "cec_ao_a_h";
> +            function = "cec_ao_a_h";
> +            bias-disable;
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
> new file mode 100644
> index 000000000..7216cd8e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson G12 PERIPHS pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: amlogic,meson-pinctrl-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-g12a-periphs-pinctrl
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
> +
> +    properties:
> +      reg:
> +        maxItems: 5
> +
> +      reg-names:
> +        items:
> +          - const: gpio
> +          - const: pull
> +          - const: pull-enable
> +          - const: mux
> +          - const: ds
> +
> +examples:
> +  - |
> +    periphs_pinctrl: pinctrl {
> +      compatible = "amlogic,meson-g12a-periphs-pinctrl";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      bank@40 {
> +        reg = <0x40  0x4c>,
> +              <0xe8  0x18>,
> +              <0x120 0x18>,
> +              <0x2c0 0x40>,
> +              <0x340 0x1c>;
> +        reg-names = "gpio", "pull", "pull-enable", "mux", "ds";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&periphs_pinctrl 0 0 86>;
> +
> +        cec_ao_a_h_pins: cec_ao_a_h {
> +          mux {
> +            groups = "cec_ao_a_h";
> +            function = "cec_ao_a_h";
> +            bias-disable;
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
> new file mode 100644
> index 000000000..2ad79d754
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson8 AOBUS pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: amlogic,meson-pinctrl-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - amlogic,meson8-aobus-pinctrl
> +          - amlogic,meson8b-aobus-pinctrl
> +          - amlogic,meson-gxbb-aobus-pinctrl
> +          - amlogic,meson-gxl-aobus-pinctrl
> +          - amlogic,meson-axg-aobus-pinctrl
> +      - items:
> +          - const: amlogic,meson8m2-aobus-pinctrl
> +          - const: amlogic,meson8-aobus-pinctrl
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
> +
> +    properties:
> +      reg:
> +        maxItems: 3
> +
> +      reg-names:
> +        items:
> +          - const: mux
> +          - const: pull
> +          - const: gpio
> +
> +examples:
> +  - |
> +    pinctrl_aobus: pinctrl {
> +      compatible = "amlogic,meson8-aobus-pinctrl";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      bank@14 {
> +        reg = <0x14 0x4>,
> +              <0x2c 0x4>,
> +              <0x24 0x8>;
> +        reg-names = "mux", "pull", "gpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pinctrl_aobus 0 0 16>;
> +
> +        cec_ao_a_h_pins: cec_ao_a_h {
> +          mux {
> +            groups = "cec_ao_a_h";
> +            function = "cec_ao_a_h";
> +            bias-disable;
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
> new file mode 100644
> index 000000000..a04fbcb1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson8 CBUS pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: amlogic,meson-pinctrl-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - amlogic,meson8-cbus-pinctrl
> +          - amlogic,meson8b-cbus-pinctrl
> +          - amlogic,meson-gxbb-periphs-pinctrl
> +          - amlogic,meson-gxl-periphs-pinctrl
> +          - amlogic,meson-axg-periphs-pinctrl
> +      - items:
> +          - const: amlogic,meson8m2-cbus-pinctrl
> +          - const: amlogic,meson8-cbus-pinctrl
> +
> +unevaluedProperties: false

There's a typo I have to fix. However before sending a v6 I'll wait for
further review feedback.
