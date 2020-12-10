Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85B32D5CEC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389671AbgLJNyh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:54:37 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45184 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729554AbgLJNxh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:53:37 -0500
Received: by mail-oi1-f195.google.com with SMTP id f132so5745693oib.12;
        Thu, 10 Dec 2020 05:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y32G0SiLzhGje+fPfkVUVVtOO584HQjIsyYAUWwTj50=;
        b=SknIROBPEv1ctbTWfnHo2zuUqg8FtufqEE1nX9afgV603pvZFtNpMlAw5YejykAngI
         KgRDsw+EioGbuVUdZcuh0agaWZpw0uTMmxwtmJ+s/RUw7kA8ERoZ9UAZleFVmYKBSJjd
         j5HHYRRsN0Qdd+JtcqV5P7wtxJenHNycN2huEPHvVvhCMcK3gdL/1l2WUzs1t3dJEmlB
         qdklxbiCHRnljkiBoRXOgXBtKV8xByT3WhmObRyhWeXsCSh5yxkts77EF5TlCb8GI0uX
         tYpM2mxoIICgQ+MvZfWNcq4Rx31yKfN3WtXyrgYzKKZLNnhuCWj9wornQ0i2TrRNyuQb
         +BOA==
X-Gm-Message-State: AOAM533cQG77t5LLebD79SgNB5ucn1jGOJYPA9R3JOCEoi8q8EuzJg6U
        TgU6xFJOpf8YwQGZHPGHxw==
X-Google-Smtp-Source: ABdhPJxBLv9CccTXi1it7qPV/oi4RQ+kwEjh9YL8f8mNtRRmjN3LYbkfkvUIWuHcSETrhvDQxMzIOA==
X-Received: by 2002:aca:f289:: with SMTP id q131mr5346313oih.159.1607608375805;
        Thu, 10 Dec 2020 05:52:55 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t26sm422964otm.17.2020.12.10.05.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:52:54 -0800 (PST)
Received: (nullmailer pid 2411367 invoked by uid 1000);
        Thu, 10 Dec 2020 13:52:53 -0000
Date:   Thu, 10 Dec 2020 07:52:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <20201210135253.GA2405508@robh.at.kernel.org>
References: <20201208085748.3684670-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208085748.3684670-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 02:27:47PM +0530, Vinod Koul wrote:
> Add device tree binding Documentation details for Qualcomm SM8350
> pinctrl driver.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> 
> Changes since v1:
>   - Fix pins pattern
>   - Fix example indent
> 
>  .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml | 151 ++++++++++++++++++
>  1 file changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> new file mode 100644
> index 000000000000..8ddb347c43da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SM8350 TLMM block
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  SM8350 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8350-pinctrl

If this block is called TLMM, then I'd expect that to be in the 
compatible string. But I guess this is consistent with the others.

> +
> +  reg:
> +    description: Specifies the base address and size of the TLMM register space

Drop.

> +    maxItems: 1
> +
> +  interrupts:
> +    description: Specifies the TLMM summary IRQ

Drop.

> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description: Specifies the PIN numbers and Flags, as defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2
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
> +  gpio-reserved-ranges:
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

Don't you need mux and config nodes in here? 

> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins. Functions are only valid for gpio pins.
> +        enum: [ atest_char, atest_usb, audio_ref, cam_mclk, cci_async,
> +                cci_i2c, cci_timer, cmu_rng, coex_uart1, coex_uart2, cri_trng,
> +                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
> +                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
> +                gpio, ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
> +                mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
> +                mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck,
> +                mi2s1_ws, mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws,
> +                mss_grfc0, mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12,
> +                mss_grfc2, mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6,
> +                mss_grfc7, mss_grfc8, mss_grfc9, nav_gpio, pa_indicator,
> +                pcie0_clkreqn, pcie1_clkreqn, phase_flag, pll_bist, pll_clk,
> +                pri_mi2s, prng_rosc, qdss_cti, qdss_gpio, qlink0_enable,
> +                qlink0_request, qlink0_wmss, qlink1_enable, qlink1_request,
> +                qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss, qspi0,
> +                qspi1, qspi2, qspi3, qspi_clk, qspi_cs, qup0, qup1, qup10,
> +                qup11, qup12, qup13, qup14, qup15, qup16, qup17, qup18, qup19,
> +                qup2, qup3, qup4, qup5, qup6, qup7, qup8, qup9, qup_l4, qup_l5,
> +                qup_l6, sd_write, sdc40, sdc41, sdc42, sdc43, sdc4_clk,
> +                sdc4_cmd, sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tgu_ch2,
> +                tgu_ch3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data,
> +                uim0_present, uim0_reset, uim1_clk, uim1_data, uim1_present,
> +                uim1_reset, usb2phy_ac, usb_phy, vfr_0, vfr_1, vsense_trigger ]
> +
> +
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.
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
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        tlmm: pinctrl@f000000 {
> +          compatible = "qcom,sm8350-pinctrl";
> +          reg = <0x0f100000 0x300000>;
> +          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          interrupt-controller;
> +          #interrupt-cells = <2>;
> +          gpio-ranges = <&tlmm 0 0 203>;
> +          serial-pins {
> +            pins = "gpio18", "gpio19";
> +            function = "qup3";
> +            drive-strength = <8>;
> +            bias-disable;
> +          };
> +        };
> +
> +...
> -- 
> 2.26.2
> 
