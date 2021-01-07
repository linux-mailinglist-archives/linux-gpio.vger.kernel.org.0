Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB432ED54D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 18:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbhAGRSG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 12:18:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbhAGRSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 12:18:05 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C5EC0612F8
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 09:17:25 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id p5so8141605oif.7
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 09:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y0b32X4SCSQW4ZyWSqBJZ7gE3D/FLBK0/PnLsSA/kDo=;
        b=iFZBxcINm4NcJ4GzA0htrQ1YNQO9+Xa8zaWCTXqusc3yELttivb/svo9bOBQv5wCwU
         Twrmlc7cAbS+irWpBW5j976lssLbI+/dKST1tZx/DS5RHnWrzpkQmSS6kFWmD3rKSkHH
         rHrLUaCW92FgBRZUM47aXZe1ymhd19CHHKALMJoSR2DAYJt6Is16xa9LhVlOOht51vID
         zgbIrWzpPYqmyMyJh9uQ1aWyPdZCZaD6jqSTbVInDZOfDpXBtCsgpCO3zVZugwxten0M
         /qmL/TslKIVLI6yqRhsKaof+atdMdGyVjjnZ6ADlb1+5uLGsn74k984zij7/JKk/hhdK
         31xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y0b32X4SCSQW4ZyWSqBJZ7gE3D/FLBK0/PnLsSA/kDo=;
        b=IUOJXIhiAvdt/yGgtr/YFjWF32F4odSSg61e5yNQ3FwgtTzauWb+t9T4oAlrMKVyOe
         oYCiPibDiDRbGn77yVXtvJUz/wN+ZZfWbURpXnSsnUCKHiDF09065CYlIKe2PseyQQBY
         l+nIKT6mQTr71nMyY9/fwOAwdvFQp+06Aj6X5kJGU2PCT02OIIGulSWVjvVDVDBkU2F0
         L+j1YnluSGvjFEQfh9JBlYScbcDDbHCrpompOQwcKj8H/k/fQSwexMpMQ9LhWmYwiJlp
         N4GS/SkGzWI05mSh698gRbddFI/Q1cNWBE1UK2esrawOHy6LECt31MJz5JZKmi8aQoYC
         BQSg==
X-Gm-Message-State: AOAM532u5LlzVUwgpzNi0suWQEHzCyY4UusHHW8w/omHEKzV7qQDw6bI
        RI7TvOwMi7oR3/+sBotXgGxFpQ==
X-Google-Smtp-Source: ABdhPJzRRmW36uQ+skMh0nkic0qhC58gTdp5qyWT1IhJrztmvIepafMnqRRJtZ2hZyzfiMrDmy6EYA==
X-Received: by 2002:aca:3192:: with SMTP id x140mr2010483oix.172.1610039844452;
        Thu, 07 Jan 2021 09:17:24 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u141sm1382809oie.46.2021.01.07.09.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:17:23 -0800 (PST)
Date:   Thu, 7 Jan 2021 11:17:22 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <X/dCIuUR/El8Gxaa@builder.lan>
References: <20210106054950.303244-1-vkoul@kernel.org>
 <20210106054950.303244-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106054950.303244-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 05 Jan 23:49 CST 2021, Vinod Koul wrote:

> Add device tree binding Documentation details for Qualcomm SM8350
> pinctrl driver.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sm8350-tlmm.yaml    | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> new file mode 100644
> index 000000000000..abdafd25bfc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-tlmm.yaml#
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
> +    const: qcom,sm8350-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
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
> +  '-pinmux$':

I believe that what Rob was asking for was the matter of describing the
mux and config subnodes under this one. But I don't know really how to
express this, because the following are all valid:

default_state: default-state {
	pins = "gpio1";
	bias-disable;
};

default_state: default-state {
	rx {
		pins = "gpio1";
		function = "gpio";
		bias-disable;
	};
};

default_state: default-state {
	pinmux {
		pins = "gpio1";
		function = "gpio";
	};

	pinconf {
		pins = "gpio1";
		bias-disable;
	};
};

I.e. the properties described here applies either to this node directly,
or any subnodes (1 level) down.


Also we've been using different "patternProperties" for this node since
the introduction of the binding 7 years ago. But to be "-state$" seems
to best represent what the node actually describes.

Regards,
Bjorn

> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
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
> +          compatible = "qcom,sm8350-tlmm";
> +          reg = <0x0f100000 0x300000>;
> +          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          interrupt-controller;
> +          #interrupt-cells = <2>;
> +          gpio-ranges = <&tlmm 0 0 203>;
> +          serial-pinmux {
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
