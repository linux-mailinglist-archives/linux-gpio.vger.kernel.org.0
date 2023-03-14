Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A8B6B8DE2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 09:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjCNIzL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 04:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjCNIzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 04:55:08 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBA31C32D
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 01:55:05 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r11so7265968edd.5
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 01:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678784104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6U/uGEVGcYZ2SfTqWK2MgrOGjdTMzTC47YcrnnaB+Q=;
        b=gS7wvuQiexUbPWSR4Wu5b73eEKV6mwSjV7T5a2BsFaoMNrvpHiV1WfUye2RBEUTm3g
         PNhizCHnBo+wE6dH4aXvvj7K15krxY7j+NgKXRy7AKs1eA9TAJBR42ZeUn5sQl5xMDdG
         AUfhagi+poWWe9lEA4pO4ehdG8nJF85X/PK3OXmKt8OU2rhf0eecc23ju1CTMVAoaBwM
         uaNqIZRGj3rHxPR+sqMicND++DeMu2FhbErxICZMEzB1z8xz1f5VMcz771K/749gq9R2
         La1vbj8mC4ENDZIJzECoiz8sIbRPsq5SEJvSW/cTX53Bo2XwI0gGCRk82L7czK0z5HW7
         mg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678784104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6U/uGEVGcYZ2SfTqWK2MgrOGjdTMzTC47YcrnnaB+Q=;
        b=vPXtJK/uEd8zNLdx9twvMMUCgMid8GLv8Y4awTa1epjLiiMGX/f3HetltYAcnPYGa8
         K25LrnbnM2Zo84uo9n6+uAby1/ygQCtGYcvAQ1pUbHrTqslIgsZM+0faIXCq9ipk9DIy
         pUSQD5MTV0LnT9e1iyPyR9jeo+l9NQqXHW0COnhVu4xZJqdvym3QrIAPP/HMVgyf/RSV
         UkxoWX6J+vJKbR3Vfof8J0vJyCRXk4qrU8iEta4hJBMcZD5C2Wh87+r72ML9ABCIsxhl
         yqEMrCXOtl8iKHUBtTcKXMkw8QPu/UmDjLyUPKJ8T9GA3pPmGGS2Ucl5wJ1icGNCEVfy
         TsUw==
X-Gm-Message-State: AO0yUKU4CtO59pA/vRYLWdeJxlYyu4iDKq5U4GJga2S6p+OOS6HhVqJ7
        vH0BPBtXp5Wqrm79RNoPs9IAGQ==
X-Google-Smtp-Source: AK7set88dBI4MNpRSsXzSu4Pa9XR4EBKiSomqWEgimS8om0+IeObYoc4JuH1FJ/mAykHIV3sR8Bwew==
X-Received: by 2002:a17:906:f193:b0:907:68b9:e04e with SMTP id gs19-20020a170906f19300b0090768b9e04emr1881779ejb.19.1678784103895;
        Tue, 14 Mar 2023 01:55:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id cf23-20020a170906b2d700b008d6e551e1bcsm836536ejb.2.2023.03.14.01.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 01:55:03 -0700 (PDT)
Message-ID: <63a24be0-da17-5892-f761-5c5f68ea7d87@linaro.org>
Date:   Tue, 14 Mar 2023 09:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
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
References: <26d5c603-41e7-1d38-de2d-7367eed1be05@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <26d5c603-41e7-1d38-de2d-7367eed1be05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/03/2023 23:06, Heiner Kallweit wrote:
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
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 60 ++++++++++++
>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 53 +++++++++++
>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 61 ++++++++++++
>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 65 +++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 69 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 71 ++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>  7 files changed, 379 insertions(+), 94 deletions(-)
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
> index 000000000..1db9d8453
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -0,0 +1,60 @@
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
> +additionalProperties: true

No, this cannot be true.

This goes to the same place as in example-schema, so before required.

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

Missing required-compatible.

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
> index 000000000..035219f6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> @@ -0,0 +1,53 @@
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
> +  compatible: true

Drop.

> +  ranges: true
> +
> +  "#address-cells":
> +    enum: [1, 2]
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +required:
> +  - compatible

Drop

> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties:
> +  allOf:
> +    - $ref: pincfg-node.yaml#
> +    - $ref: pinmux-node.yaml#

I don't think this readable. Properties should rather reference the
schema, and now you allow evaluation of anything. Which probably caused
your wrong additionalProperties in the first place.

This could be part of node definition below.


> +
> +$defs:
> +  meson-gpio:
> +    type: object
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
> index 000000000..5a84e17f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
> @@ -0,0 +1,61 @@
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
> +additionalProperties: true

Same problems... and further as well.


Best regards,
Krzysztof

