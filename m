Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4C759691D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Aug 2022 08:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238715AbiHQGF7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Aug 2022 02:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbiHQGF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Aug 2022 02:05:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4074A6D9FE
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 23:05:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x19so17753580lfq.7
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 23:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=bWmFMUxl6d2LitE+dvs3csdd/mu6oD0O1Ta/ZIMPt5w=;
        b=tUX+4Hn3giE4YCkx/E3r8WWiuH4JZ1Wtyi1OYFyuJr+HpDyj75d4mrEc9RGv24TJPD
         7/xHAQxEaG78rkZfxDSsi7n2MbrA1BeZRnXpeOsj8p/ktLEywHd3XSKb8icMd6pp8P7Y
         Dvb9NX1AndP6YK0u/jwt4yoGfChP9OeD3r9SDGVYHeJyk5K4WRMAO522TaRFrAP1q4OC
         k9pXXlo6Z2AuR6XkDU8wPxapHkn127FwerVGL6xZdhs5hDtkvS4oLjxxBauPMgfImLjT
         vw5gyq1xwvOyn2S7VdpUIu6N9tBsdEYBaXAORdTlSni+axra1J7vAMoYYRecqndYq6DQ
         VRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=bWmFMUxl6d2LitE+dvs3csdd/mu6oD0O1Ta/ZIMPt5w=;
        b=wt4PG0muN1hsPQ9IYdvQAx2zzITAnurmBrPfvsC7ub5B9iqYGhJ2Caxv67t9TMbw/t
         3cQ+FgkDIjVdG66nL1rIt4/P6YwZahStFOm9B1/ZG1f8A/fka/pDvlFLuVzWMISiC9Xc
         EtQW3YUCb8U80L5p2FkwDGu4p5oppgQZTsfK+9g+iLNYiC6hdGveOpToQn4j4rhHZeJe
         Tb1huCA9eRUe+/pX6aifGDTyn43AtZOhMypcHpz2AL9ldZcZRLNJ04lq4elp3yabTaBX
         cZw7g5PDIDS2hC2gi41eUQehYrIu65Mgu2shbEheMNg//pJp0vhfHA0nNqTT+m+U64qO
         W+EQ==
X-Gm-Message-State: ACgBeo2OcEMFEKORrET4HXP+NDZ9PbM/zhxTTETl6QJksA7Ojy+wOySr
        W/7RtSdrmgXWzqFnMmFqwKiqlA==
X-Google-Smtp-Source: AA6agR5FDOl7BpD8mpkedePKEvYHg/Ukn8SXEztT/Q4GBFCOxeYKw7YzAc45ZNJO7bt2jX3eC2Z7TQ==
X-Received: by 2002:a05:6512:304c:b0:48c:ed09:1e95 with SMTP id b12-20020a056512304c00b0048ced091e95mr9059939lfb.642.1660716353479;
        Tue, 16 Aug 2022 23:05:53 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id h25-20020ac24d39000000b0048b2be5320csm1576801lfk.118.2022.08.16.23.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 23:05:52 -0700 (PDT)
Message-ID: <6c283634-70b3-200f-a346-28eb4c428d39@linaro.org>
Date:   Wed, 17 Aug 2022 09:05:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sc8280xp lpass lpi
 pinctrl bindings
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220816180538.9039-1-srinivas.kandagatla@linaro.org>
 <20220816180538.9039-2-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220816180538.9039-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/08/2022 21:05, Srinivas Kandagatla wrote:
> Add device tree binding Documentation details for Qualcomm SC8280XP
> LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> +  gpio-ranges:
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"

Drop the quotes.

> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          pattern: "^gpio([0-1]|[0-8]])$"

error in pattern - double ]. If you have 19 GPIOs, this should be
probably: ^gpio([0-9]|1[0-8])$

> +
> +      function:
> +        enum: [ swr_tx_clk, swr_tx_data, swr_rx_clk, swr_rx_data,
> +                dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic4_clk,
> +                dmic4_data, i2s2_clk, i2s2_ws, dmic3_clk, dmic3_data,
> +                qua_mi2s_sclk, qua_mi2s_ws, qua_mi2s_data, i2s1_clk, i2s1_ws,
> +                i2s1_data, wsa_swr_clk, wsa_swr_data, wsa2_swr_clk,
> +                wsa2_swr_data, i2s2_data, i2s3_clk, i2s3_ws, i2s3_data,
> +                ext_mclk1_c, ext_mclk1_b, ext_mclk1_a ]
> +

Skip blank line (confuses with a new property).

> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.
> +
> +      slew-rate:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          0: No adjustments
> +          1: Higher Slew rate (faster edges)
> +          2: Lower Slew rate (slower edges)
> +          3: Reserved (No adjustments)
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: "pinctrl.yaml#"

Drop the quotes.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    lpi_tlmm: pinctrl@33c0000 {

Drop the label, not used anywhere here.

> +        compatible = "qcom,sc8280xp-lpass-lpi-pinctrl";
> +        reg = <0x33c0000 0x20000>,
> +              <0x3550000 0x10000>;
> +        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +        clock-names = "core", "audio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&lpi_tlmm 0 0 18>;
> +    };


Best regards,
Krzysztof
