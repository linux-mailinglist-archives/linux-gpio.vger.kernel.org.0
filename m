Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA542AFA36
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 22:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgKKVLA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 16:11:00 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44893 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgKKVLA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 16:11:00 -0500
Received: by mail-oi1-f195.google.com with SMTP id t16so3762700oie.11;
        Wed, 11 Nov 2020 13:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nSLYOx15FeQ/MCYp8Li7XlQ86kVHnDDAJubkDv/yxEk=;
        b=Oc24VwnsPQurfbvZhnDR8hAGHIUUVKUUn1XXRDAGqbGAiqtSF/kf6plYtk+EZqZZKb
         hsaZCHIkgoJ5cyCAQ1b+JiGhy2wPVh90EbIObfb75EWi3nUW/eZKd7LAuNkrRsUYOFFd
         WKI3/bXu2sJLYnfx87DVn5TxJ9bdhIoWc2i8PS0XiTCSOoHXeMwISCALdmJeqDUvqY7m
         aiK8pLd3xw+dea8zrGuZykMYQYzXqHGcYplAMDK78tY/Ot5npJsmIqz6H3Y+IVgy0N/Y
         JYGlS6yZ3ItGh9rU2+3TkQGlhSe/zpUhtl5Coa8DlqbwteQVoLqnMunDvV/Iz8vDCi2T
         lG/Q==
X-Gm-Message-State: AOAM533mVdsjm8l70L8NNaX54DvXRyigJcIN4+OBBMGMR1+hye6+9Lel
        M2197fpQmzOzrOxbUTjTlw==
X-Google-Smtp-Source: ABdhPJxCfCJ3WMwVcdYy9u0JqMve0f8zuX0Dvk7p0e5M6k8GAY30Pce9WUhCB0StbLmzvcV6L1nWuw==
X-Received: by 2002:aca:2217:: with SMTP id b23mr3372474oic.124.1605129057739;
        Wed, 11 Nov 2020 13:10:57 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s20sm775356oof.39.2020.11.11.13.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 13:10:56 -0800 (PST)
Received: (nullmailer pid 2039191 invoked by uid 1000);
        Wed, 11 Nov 2020 21:10:55 -0000
Date:   Wed, 11 Nov 2020 15:10:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi
 pinctrl bindings
Message-ID: <20201111211055.GA2033978@bogus>
References: <20201109130135.28589-1-srinivas.kandagatla@linaro.org>
 <20201109130135.28589-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109130135.28589-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 01:01:34PM +0000, Srinivas Kandagatla wrote:
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
> index 000000000000..562520f41a33
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
> +  '-pins$':
> +    if:
> +      type: object
> +    then:

The hacky part was also the if/then. You can drop that (and keep 'type: 
object').

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
