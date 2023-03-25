Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A55D66C8D88
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Mar 2023 12:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjCYLlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Mar 2023 07:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjCYLlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Mar 2023 07:41:12 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B740CC677;
        Sat, 25 Mar 2023 04:41:09 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l12so4118845wrm.10;
        Sat, 25 Mar 2023 04:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679744468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSgT/kNdC5qhWq9sMouZDQ7RXK7BCAwyCpczvz42rMo=;
        b=N9gRSegSL9sEkm82md1UxZ6J0ROLUUUAJmwcJtULJux8AnPx1wkmpmODZPOaVmLdIP
         xdIFvbFLiBkwkKeqtx9dkijWqzkaydICmAk7R4XkldWeYqxA7ym6HQv7XhNO57KQQ7/g
         /IeIo57s1Lp3OI8Z5bLaxF3XQ0bVL93g8Cjl0Cw1kz43kLFdb2lareC2LIBfCgk4ygJW
         0ZQoqiDppSz5GYQsEEkP5njtpZ1IXyEf40KxojozGy/nnd24canGnZbiv4vFqiKglTTf
         DZzExo1Zppit/XMlpkReAHKSonwzMZktE+DfBtxWNWD2CBnQENqj4JYOEYvlndDqpWJh
         5HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679744468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSgT/kNdC5qhWq9sMouZDQ7RXK7BCAwyCpczvz42rMo=;
        b=sLBi7jLPkJlLWfA0BJ62PPZ50WrzSl7ra7mZYGK+g5yBLHAuOv/63qRQJetWv/YPrG
         0zCv5awkAYITdPJfVPzhFSDgq+Np88FiDZjs6IBb0rpJ4vMU1/8Vu5zumDUmdZmVHc3R
         aLe7XpqtzB01AgaUWmDfUDY1Nh6+PmHgUOoPgRjuzoG9MLbsxVYiUPxqOvdjSSrMb2xJ
         FUFUv3FMrpdTHxleGhQR2RWZ7qTwhdtDj83jKKM7WEw/wpqBWbXSS8R5GqCgmVjt7wHm
         Trmp7oRDHcXpaW24A4qnd5ytCWqy792RXGUeePYrjOGdQCx7QSewN0QD3XNU1lb6KitC
         N5Rw==
X-Gm-Message-State: AAQBX9dt4QSMwatuH9avoyuMkBNSl4FpT7tV0LvyH5ce4HqwYK60eKWn
        6+/Uz3EWWBTKQ0+YURLgpEc=
X-Google-Smtp-Source: AKy350YBwygS0Mhsgy7oQkitPTCRjZwJEYeNOzjcx9J7JKPMVV5m/InJRRspmSuCKjL5DRw6VTFk6A==
X-Received: by 2002:adf:fccc:0:b0:2cf:e868:f789 with SMTP id f12-20020adffccc000000b002cfe868f789mr4440046wrs.48.1679744467895;
        Sat, 25 Mar 2023 04:41:07 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73a5:2800:e59a:ffcb:c722:70cf? (dynamic-2a01-0c22-73a5-2800-e59a-ffcb-c722-70cf.c22.pool.telefonica.de. [2a01:c22:73a5:2800:e59a:ffcb:c722:70cf])
        by smtp.googlemail.com with ESMTPSA id n16-20020adffe10000000b002cfe63ded49sm20495400wrr.26.2023.03.25.04.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:41:07 -0700 (PDT)
Message-ID: <354ffe85-2033-eaf0-4dc5-b5a425900c20@gmail.com>
Date:   Sat, 25 Mar 2023 12:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <b0a91d24-4458-169e-6547-2a2a68cd9922@linaro.org>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <b0a91d24-4458-169e-6547-2a2a68cd9922@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25.03.2023 12:18, Krzysztof Kozlowski wrote:
> On 24/03/2023 23:51, Heiner Kallweit wrote:
>> Convert Amlogic Meson pin controller binding to yaml.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v2:
>> - consider that more than one compatible can be set
>> - remove bus part from example
>> v3:
>> - remove minItem/maxItem properties for compatible
>> v4:
>> - split patch to be able to deal with the different reg/reg-names
>> v5:
>> - remove compatible definition from common yaml
>> - move pincfg-node and pinmux-node definition to meson-gpio object definition
>> v6:
>> - add meson-pins definition
>> - change usage of unevaluatedProperties
>> v7:
>> - add unevaluatedProperties to meson-gpio references under patternProperties
>> ---
>>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 67 +++++++++++++
>>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 57 +++++++++++
>>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 68 ++++++++++++++
>>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 72 ++++++++++++++
>>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 76 +++++++++++++++
>>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 78 +++++++++++++++
>>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>>  7 files changed, 418 insertions(+), 94 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>> new file mode 100644
>> index 000000000..1a8f2d248
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>> @@ -0,0 +1,67 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-a1.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson A1 pinmux controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +allOf:
>> +  - $ref: amlogic,meson-pinctrl-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,meson-a1-periphs-pinctrl
>> +      - amlogic,meson-s4-periphs-pinctrl
>> +
>> +required:
>> +  - compatible
>> +
>> +patternProperties:
>> +  "^bank@[0-9a-z]+$":
>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 2
>> +
>> +      reg-names:
>> +        items:
>> +          - const: mux
>> +          - const: gpio
>> +
>> +    unevaluatedProperties: false
>> +
>> +unevaluatedProperties:
>> +  type: object
>> +  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
>> +
>> +examples:
>> +  - |
>> +    periphs_pinctrl: pinctrl {
>> +      compatible = "amlogic,meson-a1-periphs-pinctrl";
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      ranges;
>> +
>> +      bank@400 {
>> +        reg = <0x0400 0x003c>,
>> +              <0x0480 0x0118>;
>> +        reg-names = "mux", "gpio";
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&periphs_pinctrl 0 0 62>;
>> +      };
>> +
>> +      cec_ao_a_h_pins: cec_ao_a_h {
>> +        mux {
>> +          groups = "cec_ao_a_h";
>> +          function = "cec_ao_a_h";
>> +          bias-disable;
>> +        };
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>> new file mode 100644
>> index 000000000..a7b29ef0b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson pinmux controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +allOf:
>> +  - $ref: pinctrl.yaml#
>> +
>> +properties:
>> +  ranges: true
>> +
>> +  "#address-cells":
>> +    enum: [1, 2]
>> +
>> +  "#size-cells":
>> +    enum: [1, 2]
>> +
>> +required:
>> +  - ranges
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +
>> +additionalProperties: true
>> +
>> +$defs:
>> +  meson-gpio:
>> +    type: object
>> +
>> +    properties:
>> +      gpio-controller: true
>> +
>> +      "#gpio-cells":
>> +        const: 2
>> +
>> +      gpio-ranges:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - reg
>> +      - reg-names
>> +      - gpio-controller
>> +      - "#gpio-cells"
>> +      - gpio-ranges
>> +
>> +  meson-pins:
>> +    type: object
>> +    additionalProperties:
>> +      type: object
>> +      allOf:
>> +        - $ref: pincfg-node.yaml#
>> +        - $ref: pinmux-node.yaml#
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
>> new file mode 100644
>> index 000000000..6fd3d88f0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson G12 AOBUS pinmux controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +allOf:
>> +  - $ref: amlogic,meson-pinctrl-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,meson-g12a-aobus-pinctrl
>> +
>> +required:
>> +  - compatible
>> +
>> +patternProperties:
>> +  "^bank@[0-9a-z]+$":
>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 3
>> +
>> +      reg-names:
>> +        items:
>> +          - const: mux
>> +          - const: ds
>> +          - const: gpio
>> +
>> +    unevaluatedProperties: false
>> +
>> +unevaluatedProperties:
>> +  type: object
>> +  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
>> +
>> +examples:
>> +  - |
>> +    ao_pinctrl: pinctrl {
>> +      compatible = "amlogic,meson-g12a-aobus-pinctrl";
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      ranges;
>> +
>> +      bank@14 {
>> +        reg = <0x14 0x8>,
>> +              <0x1c 0x8>,
>> +              <0x24 0x14>;
>> +        reg-names = "mux", "ds", "gpio";
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&ao_pinctrl 0 0 15>;
>> +      };
>> +
>> +      cec_ao_a_h_pins: cec_ao_a_h {
>> +        mux {
>> +          groups = "cec_ao_a_h";
>> +          function = "cec_ao_a_h";
>> +          bias-disable;
>> +        };
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
>> new file mode 100644
>> index 000000000..b68d1bb06
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson G12 PERIPHS pinmux controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +allOf:
>> +  - $ref: amlogic,meson-pinctrl-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,meson-g12a-periphs-pinctrl
>> +
>> +required:
>> +  - compatible
>> +
>> +patternProperties:
>> +  "^bank@[0-9a-z]+$":
>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 5
>> +
>> +      reg-names:
>> +        items:
>> +          - const: gpio
>> +          - const: pull
>> +          - const: pull-enable
>> +          - const: mux
>> +          - const: ds
>> +
>> +    unevaluatedProperties: false
>> +
>> +unevaluatedProperties:
>> +  type: object
>> +  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
>> +
>> +examples:
>> +  - |
>> +    periphs_pinctrl: pinctrl {
>> +      compatible = "amlogic,meson-g12a-periphs-pinctrl";
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      ranges;
>> +
>> +      bank@40 {
>> +        reg = <0x40  0x4c>,
>> +              <0xe8  0x18>,
>> +              <0x120 0x18>,
>> +              <0x2c0 0x40>,
>> +              <0x340 0x1c>;
>> +        reg-names = "gpio", "pull", "pull-enable", "mux", "ds";
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&periphs_pinctrl 0 0 86>;
>> +      };
>> +
>> +      cec_ao_a_h_pins: cec_ao_a_h {
>> +        mux {
>> +          groups = "cec_ao_a_h";
>> +          function = "cec_ao_a_h";
>> +          bias-disable;
>> +        };
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
>> new file mode 100644
>> index 000000000..f529ecf8e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson8 AOBUS pinmux controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +allOf:
>> +  - $ref: amlogic,meson-pinctrl-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - amlogic,meson8-aobus-pinctrl
>> +          - amlogic,meson8b-aobus-pinctrl
>> +          - amlogic,meson-gxbb-aobus-pinctrl
>> +          - amlogic,meson-gxl-aobus-pinctrl
>> +          - amlogic,meson-axg-aobus-pinctrl
>> +      - items:
>> +          - const: amlogic,meson8m2-aobus-pinctrl
>> +          - const: amlogic,meson8-aobus-pinctrl
>> +
>> +required:
>> +  - compatible
>> +
>> +patternProperties:
>> +  "^bank@[0-9a-z]+$":
>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 3
>> +
>> +      reg-names:
>> +        items:
>> +          - const: mux
>> +          - const: pull
>> +          - const: gpio
>> +
>> +    unevaluatedProperties: false
>> +
>> +unevaluatedProperties:
>> +  type: object
>> +  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
>> +
>> +examples:
>> +  - |
>> +    pinctrl_aobus: pinctrl {
>> +      compatible = "amlogic,meson8-aobus-pinctrl";
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      ranges;
>> +
>> +      bank@14 {
>> +        reg = <0x14 0x4>,
>> +              <0x2c 0x4>,
>> +              <0x24 0x8>;
>> +        reg-names = "mux", "pull", "gpio";
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&pinctrl_aobus 0 0 16>;
>> +      };
>> +
>> +      cec_ao_a_h_pins: cec_ao_a_h {
>> +        mux {
>> +          groups = "cec_ao_a_h";
>> +          function = "cec_ao_a_h";
>> +          bias-disable;
>> +        };
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
>> new file mode 100644
>> index 000000000..c12f9ec58
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson8 CBUS pinmux controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +allOf:
>> +  - $ref: amlogic,meson-pinctrl-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - amlogic,meson8-cbus-pinctrl
>> +          - amlogic,meson8b-cbus-pinctrl
>> +          - amlogic,meson-gxbb-periphs-pinctrl
>> +          - amlogic,meson-gxl-periphs-pinctrl
>> +          - amlogic,meson-axg-periphs-pinctrl
>> +      - items:
>> +          - const: amlogic,meson8m2-cbus-pinctrl
>> +          - const: amlogic,meson8-cbus-pinctrl
>> +
>> +required:
>> +  - compatible
>> +
>> +patternProperties:
>> +  "^bank@[0-9a-z]+$":
>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 4
>> +
>> +      reg-names:
>> +        items:
>> +          - const: mux
>> +          - const: pull
>> +          - const: pull-enable
>> +          - const: gpio
>> +
>> +    unevaluatedProperties: false
> 
> Wrong placement. Rob asked you to put it after $ref and the review was
> conditional based on this. Don't add review-tag if you do not follow the
> comment.
> 
I wasn't aware that this makes a difference, and in e.g. samsung,pinctrl.yaml
I found it at the end of the patternProperties block.
Thanks for the hint, then I will correct this and resubmit.


    patternProperties:
      "^(pin-[a-z0-9-]+|[a-z0-9-]+-pin)$":
        $ref: samsung,pinctrl-pins-cfg.yaml

        properties:
          samsung,pins:
            description: See samsung,pinctrl-pins-cfg.yaml
            $ref: /schemas/types.yaml#/definitions/string-array
            maxItems: 1

        required:
          - samsung,pins

        unevaluatedProperties: false

> Best regards,
> Krzysztof
> 

