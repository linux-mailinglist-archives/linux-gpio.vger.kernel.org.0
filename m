Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9C75630FA
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 12:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233881AbiGAKG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 06:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbiGAKGY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 06:06:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E69C76976
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 03:06:22 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e28so2528039wra.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TiLVWLx63nyWyTQAY2zgpzwOLEkwTA7TBvrzJVEFLY0=;
        b=VSZVgCiBv/LEcqG2i3/LoY3K4GYoKYc2g6vdrRUe29yEfPFb9V51iIkJK+zv3OdM5e
         qtHsJdmdYcFdJCUlaOv2H1WxOrlI+3SNu7zPZOvaT/KVxyMnEb/gK12j18ujfpF7f6XO
         3Yk2ec7KueUUSu7TgNl7blf75Qarbcrv7rO7VQkzAeuCHeCvCr9sszsOIXvR1SiSr58o
         pZFk1STeu4NF4OOuoFA+X0PFR28Dzu9TYoowMOFn/+ndBwLHUQf/fV2GTXi3Tlpca/tl
         Zib7Lk7hnnpPOeaufSjJfLbEt0O57Iq9EFtlKrkKvEQSkG9/yBAdz8HX4AZIm0XNyZDp
         uaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TiLVWLx63nyWyTQAY2zgpzwOLEkwTA7TBvrzJVEFLY0=;
        b=iXtAA+/jmN5dIG3NLXQ/HLL+ukkd28ZkW2UAQ/if4MsVWDLS4rg0lY4j37ehfIGrEJ
         vekfltIKPypBLtecnXp2QNSQ4BU+X5Q6qG9ODMKQvThk3cU6YIoEQIJPM2eNc2UdFhoH
         g6Ke0AhhCKFGI4YqDIFJMDRj3ztNeMvYdbHeKZ+ErPf7sGo4CxekXYWG0Fisgp4CESh9
         VlfN6RDeKao5ZH+RbOratJivFJtlS3n7lpyFNCiQy+FX0nJEGYHewtuTQlayFswbIjGj
         h8pbkl5RmimLWy02a8cm0oE6azVlx023i4ZklZS4dMvEuq6L1eb6sSuxYI+COwU6uRAq
         bV+Q==
X-Gm-Message-State: AJIora9ig+4UxEDhFd7+QdQ6bn7D7X1jeqeouY2gt3l7i/RedadXZUeU
        t9c+q5UFTwokisxzv8fQy2WS2g==
X-Google-Smtp-Source: AGRyM1v3jB4wo495BGQVx5FDNFneed+hnet73p0jiqLRbahpKYdgWd4wUhG3+uvOA7F2UScGQdXpFQ==
X-Received: by 2002:a5d:660d:0:b0:21b:899f:5d69 with SMTP id n13-20020a5d660d000000b0021b899f5d69mr11988627wru.688.1656669980647;
        Fri, 01 Jul 2022 03:06:20 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id a1-20020a05600c348100b003a03be22f9fsm193981wmq.18.2022.07.01.03.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 03:06:20 -0700 (PDT)
Message-ID: <864aac78-d3a4-0008-345f-d210582b100e@linaro.org>
Date:   Fri, 1 Jul 2022 11:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8450 lpass lpi
 pinctrl bindings
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220629091716.68771-1-srinivas.kandagatla@linaro.org>
 <20220629091716.68771-2-srinivas.kandagatla@linaro.org>
 <20220630210848.GA3295428-robh@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220630210848.GA3295428-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

thanks Rob,

On 30/06/2022 22:08, Rob Herring wrote:
> On Wed, Jun 29, 2022 at 10:17:15AM +0100, Srinivas Kandagatla wrote:
>> Add device tree binding Documentation details for Qualcomm SM8450
>> LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../qcom,sm8450-lpass-lpi-pinctrl.yaml        | 138 ++++++++++++++++++
>>   1 file changed, 138 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..b49d70b9ba9a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>> @@ -0,0 +1,138 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
>> +  Low Power Island (LPI) TLMM block
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  This binding describes the Top Level Mode Multiplexer block found in the
>> +  LPASS LPI IP on most Qualcomm SoCs
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8450-lpass-lpi-pinctrl
>> +
>> +  reg:
>> +    minItems: 2
>> +    maxItems: 2
> 
> What is each entry?

These are tlmm and slew register base address.

This has been like this in previous bindings for sm8250 and sc7280 lpi 
binding.

Are you suggesting that we should add a description for reg for more 
clarity?


> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: LPASS Core voting clock
>> +      - description: LPASS Audio voting clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: audio
>> +
>> +  gpio-controller: true
>> +
>> +  '#gpio-cells':
>> +    description: Specifying the pin number and flags, as defined in
>> +      include/dt-bindings/gpio/gpio.h
>> +    const: 2
>> +
>> +  gpio-ranges:
>> +    maxItems: 1
>> +
>> +#PIN CONFIGURATION NODES
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
>> +
>> +    properties:
>> +      pins:
>> +        description:
>> +          List of gpio pins affected by the properties specified in this
>> +          subnode.
>> +        items:
>> +          oneOf:
>> +            - pattern: "^gpio([0-9]|[1-9][0-9])$"
> 
> Don't need oneOf with only 1.
> 
I think other lpass lpi bindings need that fix too.

>> +        minItems: 1
>> +        maxItems: 23
>> +
>> +      function:
>> +        enum: [ swr_tx_clk, swr_tx_data, swr_rx_clk, swr_rx_data,
>> +                dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic4_clk,
>> +                dmic4_data, i2s2_clk, i2s2_ws, dmic3_clk, dmic3_data,
>> +                qua_mi2s_sclk, qua_mi2s_ws, qua_mi2s_data, i2s1_clk, i2s1_ws,
>> +                i2s1_data, wsa_swr_clk, wsa_swr_data, wsa2_swr_clk,
>> +                wsa2_swr_data, i2s2_data, i2s4_ws, i2s4_clk, i2s4_data,
>> +                slimbus_clk, i2s3_clk, i2s3_ws, i2s3_data, slimbus_data,
>> +                ext_mclk1_c, ext_mclk1_b, ext_mclk1_a, ext_mclk1_d,
>> +                ext_mclk1_e ]
>> +
>> +        description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +
>> +      drive-strength:
>> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
>> +        default: 2
>> +        description:
>> +          Selects the drive strength for the specified pins, in mA.
>> +
>> +      slew-rate:
>> +        enum: [0, 1, 2, 3]
>> +        default: 0
>> +        description: |
>> +            0: No adjustments
>> +            1: Higher Slew rate (faster edges)
>> +            2: Lower Slew rate (slower edges)
>> +            3: Reserved (No adjustments)
> 
> Indent should be 2 more, not 4.

true, Will fix this in next spin.

Thanks,
Srini
> 
>> +
>> +      bias-pull-down: true
>> +
>> +      bias-pull-up: true
>> +
>> +      bias-disable: true
>> +
>> +      output-high: true
>> +
>> +      output-low: true
>> +
>> +    required:
>> +      - pins
>> +      - function
>> +
>> +    additionalProperties: false
>> +
>> +allOf:
>> +  - $ref: "pinctrl.yaml#"
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - gpio-controller
>> +  - '#gpio-cells'
>> +  - gpio-ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/sound/qcom,q6afe.h>
>> +    lpi_tlmm: pinctrl@3440000 {
>> +        compatible = "qcom,sm8450-lpass-lpi-pinctrl";
>> +        reg = <0x3440000 0x20000>,
>> +              <0x34d0000 0x10000>;
>> +        clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +        clock-names = "core", "audio";
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&lpi_tlmm 0 0 23>;
>> +    };
>> -- 
>> 2.25.1
>>
>>
