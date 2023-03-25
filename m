Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8832C6C8D5E
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Mar 2023 12:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbjCYLSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Mar 2023 07:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjCYLSL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Mar 2023 07:18:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8484489
        for <linux-gpio@vger.kernel.org>; Sat, 25 Mar 2023 04:18:09 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h8so17375696ede.8
        for <linux-gpio@vger.kernel.org>; Sat, 25 Mar 2023 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679743088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGYqKcAHUZcrayvI+SfYiJk80kjpszBCrmesL2/3mBc=;
        b=GC0h5/zkISc8Gx98qkGSP8DkaXoGXyPkkEYFC2JOig7iJsvpuiJ9hP2Arzoy/SSIal
         aBeiPjU53THL20WpsiqC556OLHd8gWFvT5WqIc9N7j4KPeKVOriq22NDy9QxLlqHJFe6
         iwaYNSvmXn2O0UL0WsBi3eGydodCHSH4eNF/Gzk/SHUHsP4xiir1i4SvSLkEUSKM4ViJ
         +WsvnHTeNpx7LT+CacEsyee+30n0d4Aa4C64vspkjSr+iUfa4WhT5hAt2JIBMVXxUlDZ
         fF6IH59JhJFs7XhRrNbfWCMiDnQcXfhlVhip2g5sFGT1OWZ3hRlL2aBv467tCtUMmN5N
         owxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679743088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGYqKcAHUZcrayvI+SfYiJk80kjpszBCrmesL2/3mBc=;
        b=sCg3gWQgje41X7jUl0wFoW0uIgXwaoZzFaI8qNSp+4LKHZnQ8EhWsLwAnJttnHrNd/
         4TEYBF7hPOrHB5Nyz6qQCdANJ3A4NgOBJm9Z/FhIkz9H+aGpn48Ex22AcchxyKzcEhJu
         1Uc3TEHnk1HwhUkUkFLp8RjxGsyb6iUqvmrnyBqJnbXR6Awuvmnd86FFsBX9djcy+VYR
         m+y8rHBzS62Zl0av24LwIoL/xSrVFf25dEYlWkSCzqlwldn7NfXsYYKscN+s0RAsbBVh
         Oo3QSHdfhX9eVZzwgg8hLYRKnN2jOEhQsg/TnbEGST5+PldsxuGcgdfbk+PgcUbnwzQ0
         cCvg==
X-Gm-Message-State: AAQBX9diVBTPN8lJkGFex7rI61SK7JtqIrRfOGD+qgHnGZ1WPXXBMiek
        0XVjGt7G8Pox9SU2Mo+6JxmsJA==
X-Google-Smtp-Source: AKy350ZHaY8/HkbjwAX5sLJVtobg4Y1VZbpblQQzynXLXNa17Uas8BVCfr9Uzahuk/9KkFmvzI2vYg==
X-Received: by 2002:a17:907:2cf1:b0:92e:a1d8:bf1 with SMTP id hz17-20020a1709072cf100b0092ea1d80bf1mr5534653ejc.13.1679743088080;
        Sat, 25 Mar 2023 04:18:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id u27-20020a170906069b00b00923bb9f0c36sm11605132ejb.127.2023.03.25.04.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:18:07 -0700 (PDT)
Message-ID: <b0a91d24-4458-169e-6547-2a2a68cd9922@linaro.org>
Date:   Sat, 25 Mar 2023 12:18:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
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
References: <3e839363-e12a-93f1-a1f6-f783caa5665e@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3e839363-e12a-93f1-a1f6-f783caa5665e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/03/2023 23:51, Heiner Kallweit wrote:
> Convert Amlogic Meson pin controller binding to yaml.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
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
> v6:
> - add meson-pins definition
> - change usage of unevaluatedProperties
> v7:
> - add unevaluatedProperties to meson-gpio references under patternProperties
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 67 +++++++++++++
>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 57 +++++++++++
>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 68 ++++++++++++++
>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 72 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 76 +++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 78 +++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>  7 files changed, 418 insertions(+), 94 deletions(-)
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
> index 000000000..1a8f2d248
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -0,0 +1,67 @@
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
> +    unevaluatedProperties: false
> +
> +unevaluatedProperties:
> +  type: object
> +  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
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
> +      };
> +
> +      cec_ao_a_h_pins: cec_ao_a_h {
> +        mux {
> +          groups = "cec_ao_a_h";
> +          function = "cec_ao_a_h";
> +          bias-disable;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> new file mode 100644
> index 000000000..a7b29ef0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> @@ -0,0 +1,57 @@
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
> +
> +  meson-pins:
> +    type: object
> +    additionalProperties:
> +      type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
> new file mode 100644
> index 000000000..6fd3d88f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
> @@ -0,0 +1,68 @@
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
> +    unevaluatedProperties: false
> +
> +unevaluatedProperties:
> +  type: object
> +  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
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
> +      };
> +
> +      cec_ao_a_h_pins: cec_ao_a_h {
> +        mux {
> +          groups = "cec_ao_a_h";
> +          function = "cec_ao_a_h";
> +          bias-disable;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
> new file mode 100644
> index 000000000..b68d1bb06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
> @@ -0,0 +1,72 @@
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
> +    unevaluatedProperties: false
> +
> +unevaluatedProperties:
> +  type: object
> +  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
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
> +      };
> +
> +      cec_ao_a_h_pins: cec_ao_a_h {
> +        mux {
> +          groups = "cec_ao_a_h";
> +          function = "cec_ao_a_h";
> +          bias-disable;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
> new file mode 100644
> index 000000000..f529ecf8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
> @@ -0,0 +1,76 @@
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
> +    unevaluatedProperties: false
> +
> +unevaluatedProperties:
> +  type: object
> +  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
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
> +      };
> +
> +      cec_ao_a_h_pins: cec_ao_a_h {
> +        mux {
> +          groups = "cec_ao_a_h";
> +          function = "cec_ao_a_h";
> +          bias-disable;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
> new file mode 100644
> index 000000000..c12f9ec58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
> @@ -0,0 +1,78 @@
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
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
> +
> +    properties:
> +      reg:
> +        maxItems: 4
> +
> +      reg-names:
> +        items:
> +          - const: mux
> +          - const: pull
> +          - const: pull-enable
> +          - const: gpio
> +
> +    unevaluatedProperties: false

Wrong placement. Rob asked you to put it after $ref and the review was
conditional based on this. Don't add review-tag if you do not follow the
comment.

Best regards,
Krzysztof

