Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980542A702B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 23:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730888AbgKDWGA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 17:06:00 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44645 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgKDWGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 17:06:00 -0500
Received: by mail-ot1-f67.google.com with SMTP id m26so196115otk.11;
        Wed, 04 Nov 2020 14:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3I49QOTD4X/4/x5/MQtOdffxAXsEpjW/71vUNYYUSPE=;
        b=TfcKDoxsLk/DEB90gLzWhF680olxomkBnVM7VjhlU9e5gxfVau1aMqAK1Tevq5AhQ5
         SLk25CAXMf1K1ToTxPzEgS1pqadq15gta+gSGEd2q/6q5jAQiLwHoLzVFnIhx3A44xld
         oMQX+2bV6aBdLsaH5XffEGqVVdTh0To2oCxrmPdpiQTvge3f46xVhZJJxKf9Hx7ZtsLU
         +/M/zWdX21kqmGbmm4/FQ3m0wNfadszy0KoHvysAq/yPWU15/4TqjFWFkD3B2Wt+6MNw
         GQgTiPqf9ljY052dtpyMUU+4TTCBNR/ewOuPicruCcmniOj7jUJ2S75bH4Ac5qKExKv+
         8Hag==
X-Gm-Message-State: AOAM533vFJ2DTb76La/nv0LjVwp3S6JHNg+vRgEkvkaz5HJvU190+PU9
        evd7IqlMWUo15BF/pD0/qw==
X-Google-Smtp-Source: ABdhPJzPAZDNgH8OO2ReYwma4DX8NFzOc+g1ezUXqt668OTSsOk7i32BWg3QhT6ezZq7Jq8aDIrvbA==
X-Received: by 2002:a05:6830:4c6:: with SMTP id s6mr14643765otd.31.1604527558162;
        Wed, 04 Nov 2020 14:05:58 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j186sm761106oib.38.2020.11.04.14.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 14:05:57 -0800 (PST)
Received: (nullmailer pid 10420 invoked by uid 1000);
        Wed, 04 Nov 2020 22:05:56 -0000
Date:   Wed, 4 Nov 2020 16:05:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi
 pinctrl bindings
Message-ID: <20201104220556.GA8198@bogus>
References: <20201030163421.14041-1-srinivas.kandagatla@linaro.org>
 <20201030163421.14041-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030163421.14041-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 04:34:20PM +0000, Srinivas Kandagatla wrote:
> Add device tree binding Documentation details for Qualcomm SM8250
> LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> new file mode 100644
> index 000000000000..8a0732574aee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> @@ -0,0 +1,129 @@
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
> +  '^.*$':
> +    if:
> +      type: object
> +    then:

For new bindings, avoid this hackery and do '-pins$' for the node names 
pattern.

> +      properties:
> +        pins:
> +          description:
> +            List of gpio pins affected by the properties specified in this
> +            subnode.
> +          items:
> +            oneOf:
> +              - pattern: "^gpio([0-9]|[1-9][0-9])$"
> +          minItems: 1
> +          maxItems: 14
> +
> +        function:
> +          enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data1, qua_mi2s_ws,
> +                  swr_tx_data2, qua_mi2s_data0, swr_rx_clk, qua_mi2s_data1,
> +                  swr_rx_data1, qua_mi2s_data2, swr_tx_data3, swr_rx_data2,
> +                  dmic1_clk, i2s1_clk, dmic1_data, i2s1_ws, dmic2_clk,
> +                  i2s1_data0, dmic2_data, i2s1_data1, i2s2_clk, wsa_swr_clk,
> +                  i2s2_ws, wsa_swr_data, dmic3_clk, i2s2_data0, dmic3_data,
> +                  i2s2_data1 ]
> +          description:
> +            Specify the alternative function to be configured for the specified
> +            pins.
> +
> +        drive-strength:
> +          enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +          default: 2
> +          description:
> +            Selects the drive strength for the specified pins, in mA.
> +
> +        slew-rate:
> +          enum: [0, 1, 2, 3]
> +          default: 0
> +          description: |
> +              0: No adjustments
> +              1: Higher Slew rate (faster edges)
> +              2: Lower Slew rate (slower edges)
> +              3: Reserved (No adjustments)
> +
> +        bias-pull-down: true
> +
> +        bias-pull-up: true
> +
> +        bias-disable: true
> +
> +        output-high: true
> +
> +        output-low: true
> +
> +      required:
> +        - pins
> +        - function
> +
> +      additionalProperties: false
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
> +              <0x355a000 0x1000>;
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
