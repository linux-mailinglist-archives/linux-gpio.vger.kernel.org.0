Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2462EEE34
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 08:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbhAHH6c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 02:58:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:54096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727463AbhAHH6c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 02:58:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA59D2343F;
        Fri,  8 Jan 2021 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610092670;
        bh=VMgcTa9UQyuYxcm5rW2+nfQAw6U+ZXe9qiG0wkd8OOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QWxSIX+B82Sg2oEvqcJzp9gxiGpQ7y3ihZ5kxR6JtI6vywYp3/YYVmig2MjC1+lAM
         +SRVMf/2H5l9f+qc55BqWliaYsKBSkyN2sfRPv1hCMR5I77pbHIaZCDyjdcrTnoXJO
         G6rEMJhLGDI3YvBjGQjpCneSBsRUuUkw69YJxHlGCgsT8Sbdio92v6x0PmLdPBXgwa
         1JrUTy3asUuMKEQZwQRRyLtZSvHK/xkWRw64AS3A97gTWfSOXgumVrJsj2hx+nS6w6
         3FXsRfXqfz4aV1Smf/9a6YZItzsuEW0j71dGmCy3Snbpb9IruHhAqfWQ0u1yosaXQ+
         HBtfcMEqjCDuw==
Date:   Fri, 8 Jan 2021 13:27:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <20210108075746.GV2771@vkoul-mobl>
References: <20210106054950.303244-1-vkoul@kernel.org>
 <20210106054950.303244-2-vkoul@kernel.org>
 <X/dCIuUR/El8Gxaa@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/dCIuUR/El8Gxaa@builder.lan>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bjorn,

On 07-01-21, 11:17, Bjorn Andersson wrote:
> On Tue 05 Jan 23:49 CST 2021, Vinod Koul wrote:
> > +#PIN CONFIGURATION NODES
> > +patternProperties:
> > +  '-pinmux$':
> 
> I believe that what Rob was asking for was the matter of describing the
> mux and config subnodes under this one. But I don't know really how to
> express this, because the following are all valid:

I looked at the pinmux-node.yaml which describes subnodes with function
and groups, this is a generic description and should be in
pinmux-node.yaml not in every device description.. said that I am not
sure why else should we add here :)

> 
> default_state: default-state {
> 	pins = "gpio1";
> 	bias-disable;
> };
> 
> default_state: default-state {
> 	rx {
> 		pins = "gpio1";
> 		function = "gpio";
> 		bias-disable;
> 	};
> };
> 
> default_state: default-state {
> 	pinmux {
> 		pins = "gpio1";
> 		function = "gpio";
> 	};
> 
> 	pinconf {
> 		pins = "gpio1";
> 		bias-disable;
> 	};
> };
> 
> I.e. the properties described here applies either to this node directly,
> or any subnodes (1 level) down.
> 
> 
> Also we've been using different "patternProperties" for this node since
> the introduction of the binding 7 years ago. But to be "-state$" seems
> to best represent what the node actually describes.
> 
> Regards,
> Bjorn
> 
> > +    type: object
> > +    description:
> > +      Pinctrl node's client devices use subnodes for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> > +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this subnode.
> > +        items:
> > +          oneOf:
> > +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
> > +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
> > +        minItems: 1
> > +        maxItems: 36
> > +
> > +      function:
> > +        description:
> > +          Specify the alternative function to be configured for the specified
> > +          pins. Functions are only valid for gpio pins.
> > +        enum: [ atest_char, atest_usb, audio_ref, cam_mclk, cci_async,
> > +                cci_i2c, cci_timer, cmu_rng, coex_uart1, coex_uart2, cri_trng,
> > +                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
> > +                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
> > +                gpio, ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
> > +                mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
> > +                mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck,
> > +                mi2s1_ws, mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws,
> > +                mss_grfc0, mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12,
> > +                mss_grfc2, mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6,
> > +                mss_grfc7, mss_grfc8, mss_grfc9, nav_gpio, pa_indicator,
> > +                pcie0_clkreqn, pcie1_clkreqn, phase_flag, pll_bist, pll_clk,
> > +                pri_mi2s, prng_rosc, qdss_cti, qdss_gpio, qlink0_enable,
> > +                qlink0_request, qlink0_wmss, qlink1_enable, qlink1_request,
> > +                qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss, qspi0,
> > +                qspi1, qspi2, qspi3, qspi_clk, qspi_cs, qup0, qup1, qup10,
> > +                qup11, qup12, qup13, qup14, qup15, qup16, qup17, qup18, qup19,
> > +                qup2, qup3, qup4, qup5, qup6, qup7, qup8, qup9, qup_l4, qup_l5,
> > +                qup_l6, sd_write, sdc40, sdc41, sdc42, sdc43, sdc4_clk,
> > +                sdc4_cmd, sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tgu_ch2,
> > +                tgu_ch3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data,
> > +                uim0_present, uim0_reset, uim1_clk, uim1_data, uim1_present,
> > +                uim1_reset, usb2phy_ac, usb_phy, vfr_0, vfr_1, vsense_trigger ]
> > +
> > +
> > +      drive-strength:
> > +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> > +        default: 2
> > +        description:
> > +          Selects the drive strength for the specified pins, in mA.
> > +
> > +      bias-pull-down: true
> > +
> > +      bias-pull-up: true
> > +
> > +      bias-disable: true
> > +
> > +      output-high: true
> > +
> > +      output-low: true
> > +
> > +    required:
> > +      - pins
> > +      - function
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - gpio-ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +        tlmm: pinctrl@f000000 {
> > +          compatible = "qcom,sm8350-tlmm";
> > +          reg = <0x0f100000 0x300000>;
> > +          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > +          gpio-controller;
> > +          #gpio-cells = <2>;
> > +          interrupt-controller;
> > +          #interrupt-cells = <2>;
> > +          gpio-ranges = <&tlmm 0 0 203>;
> > +          serial-pinmux {
> > +            pins = "gpio18", "gpio19";
> > +            function = "qup3";
> > +            drive-strength = <8>;
> > +            bias-disable;
> > +          };
> > +        };
> > +
> > +...
> > -- 
> > 2.26.2
> > 

-- 
~Vinod
