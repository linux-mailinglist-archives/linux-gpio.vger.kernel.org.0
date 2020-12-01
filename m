Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90572CA9AE
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 18:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403773AbgLARaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 12:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390586AbgLARaE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 12:30:04 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDDFC0613D4
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 09:29:24 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id z24so2415357oto.6
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 09:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l8vvlkbHOcQOjYY/Opy47c8Dw9W68kDnh+apjcsK7jc=;
        b=sxS/hByLKJEQs8SSpaMjUL2ervlOHphMtva39THckGzCiSJ0dC7d7ErfZ4WOlA2kdQ
         waAcYJt22YVIySKlh/I2Pei/RI3PxprBd5kCcxd/5NNqSYnb272u6JuF21Dv2O59xsij
         ToSgRLw6WbARZntnWaQmmn473GNz8dbbRXveK5bcQpGQ2SGc8VWCPutpwq+SicvIPe/P
         3bTOExhjWNAFc+sLKYmF672WfQOtXkXCC7jR3gtRmztqHcuD3RfiWzkJ2esYGXfRdoJj
         OKUTBXHYy+xrp1yxghCo7D3C66p7qhvU7lOC3un4nRiTdTedkhfk1SBpSa1r+Cm2yXH0
         g33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l8vvlkbHOcQOjYY/Opy47c8Dw9W68kDnh+apjcsK7jc=;
        b=suAyDYClfvHnibuaQuHrLszCiVMSC64RiHpqq+6QBBWK7cUBEeZ0dSg2ftAUV0D87t
         abq8WxHRRVstKgDOltZOEEWJ9sdKz0xqN0cFRy8E6JSUdbPTwXtMAOOmRTwejOaX4Pz/
         uX5tC1sHsK50r3aT0eNxrCYAvMFmvxbbi2Lle8wrahPXKQ4+IGdkx+nop5nVWklLAD2f
         ryX4Xk8YN9TDgKIh0b62dgqTocGDc1/wwg36i9dJ344b/9kTv00tV8nXp4iN+2mq+19E
         gn+f160sOBuoSp0ED9naHAvd1vPjQ9LuAmNuTMbKrGxrNQzYBmo69E+EZBnKdtMz/wya
         N5dw==
X-Gm-Message-State: AOAM531faQC++eWzlptIZUfMsztlFdEVvGJVNPHswLtqsiTuBObaoVKf
        1J3xOUPky1BF1O3pigwKYA+Heg==
X-Google-Smtp-Source: ABdhPJz219+0deBZngPjxwfYWY8oaCEqmDmI14IiB4RoHGZbWyhwhfuH1sFxngCr18KnCvfhpECMww==
X-Received: by 2002:a9d:5c04:: with SMTP id o4mr2564678otk.372.1606843763504;
        Tue, 01 Dec 2020 09:29:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 60sm87238ott.32.2020.12.01.09.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 09:29:22 -0800 (PST)
Date:   Tue, 1 Dec 2020 11:29:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi
 pinctrl bindings
Message-ID: <X8Z9cUOmHQRNuvCD@builder.lan>
References: <20201201142830.13152-1-srinivas.kandagatla@linaro.org>
 <20201201142830.13152-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201142830.13152-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 01 Dec 08:28 CST 2020, Srinivas Kandagatla wrote:

> Add device tree binding Documentation details for Qualcomm SM8250
> LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> new file mode 100644
> index 000000000000..3543324d9194
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
> +  Low Power Island (LPI) TLMM block
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  LPASS LPI IP on most Qualcomm SoCs
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-lpass-lpi-pinctrl
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: LPASS Core voting clock
> +      - description: LPASS Audio voting clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: audio
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: Specifying the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +
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
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9])$"
> +        minItems: 1
> +        maxItems: 14
> +
> +      function:
> +        enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data1, qua_mi2s_ws,
> +                swr_tx_data2, qua_mi2s_data0, swr_rx_clk, qua_mi2s_data1,
> +                swr_rx_data1, qua_mi2s_data2, swr_tx_data3, swr_rx_data2,
> +                dmic1_clk, i2s1_clk, dmic1_data, i2s1_ws, dmic2_clk,
> +                i2s1_data0, dmic2_data, i2s1_data1, i2s2_clk, wsa_swr_clk,
> +                i2s2_ws, wsa_swr_data, dmic3_clk, i2s2_data0, dmic3_data,
> +                i2s2_data1 ]
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
> +            0: No adjustments
> +            1: Higher Slew rate (faster edges)
> +            2: Lower Slew rate (slower edges)
> +            3: Reserved (No adjustments)
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
> +        compatible = "qcom,sm8250-lpass-lpi-pinctrl";
> +        reg = <0x33c0000 0x20000>,
> +              <0x3550000 0x10000>;
> +        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +        clock-names = "core", "audio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&lpi_tlmm 0 0 14>;
> +    };
> -- 
> 2.21.0
> 
