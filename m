Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68A12EF799
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 19:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbhAHSln (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 13:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbhAHSlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 13:41:42 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7370BC061381
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 10:41:02 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id l207so12412877oib.4
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 10:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AaJsOT+2dXsrzbmSUBlolWUy7wnqag5xMcaj6pqD4EU=;
        b=q7O2eNwAg2X76k8sIS8g+BFeEIPJrVjsQ7AuInxl/sdsTrtgXwiCVQtdkkK6SMyuWS
         9QmfA4AD56gDVyj3PJzXDEJM1cRYmtcBmUaDirFS7hI8BL+mWPyS6bEQ+x0Vm51JZRWU
         bIdN5tvWEyUILKU9ReLpYPn7ZquSYhXv3dG4Hb7oTT9Gibgyu7EGLtFfPiwhlr6ohBwl
         sVCUE3vHj7qKsiD7xIjZ5LdLezBQZeqeCXxIbqRS2qEDsdzsvFRio/0PharhbZwdMGW6
         26+ruqNr6415J5cOeXdzj5dO6q9ISuTYQhpnBQ77VWkFN/RznSQaLa5EgV0o8QBNvISt
         5Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AaJsOT+2dXsrzbmSUBlolWUy7wnqag5xMcaj6pqD4EU=;
        b=qNBt4NJXCEGABqM+0GqPGuGZQWHt0TNFfW1T5c/Mfter7i5QXabJAftpUGTrkeuno/
         zz0fShvIgTGCE34W5HQhEdssBtO62s6UKzBt2QS6OkhSWE8C8Tf87O6KyrxcSPJ4ZSFJ
         sECarvcgePh1wX6D+i0yWgpexSYDk+HUExrvRSgb8rOYNkL3hDL1nr+t0rC5UH+t+Dg8
         Xi0KPWPtuaBFGyPALs2vq9vyZedjuiEX7P2g7hVJJwUTEpPJUtxkA2m6BPIOrjvlivp0
         Rfz2dNh2r6h5VQp6UQMt6chn8s7YnFJ7zYCmgnlpYDUiAWN16pScFr37f0Kwc9FeO6Ay
         awmQ==
X-Gm-Message-State: AOAM531t5dhlVP1b5ogHPBZNIuKK8//d/Lw6VjF7oKRppZsJtm8ahJig
        E8m9vd4rmsd2pIuhoeJc9uIJrw==
X-Google-Smtp-Source: ABdhPJwO6dayENaSus7KzZYfY/3OGpzNKmjKOSdXNbTiEYGBrKRj8PITuE0yRxMzTc7eaC9LeelgTA==
X-Received: by 2002:aca:c756:: with SMTP id x83mr3029963oif.62.1610131261676;
        Fri, 08 Jan 2021 10:41:01 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s66sm1862772ooa.37.2021.01.08.10.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 10:41:01 -0800 (PST)
Date:   Fri, 8 Jan 2021 12:40:59 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <X/inO3hecPJTaKi+@builder.lan>
References: <20210106054950.303244-1-vkoul@kernel.org>
 <20210106054950.303244-2-vkoul@kernel.org>
 <X/dCIuUR/El8Gxaa@builder.lan>
 <20210108075746.GV2771@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108075746.GV2771@vkoul-mobl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 08 Jan 01:57 CST 2021, Vinod Koul wrote:

> Hi Bjorn,
> 
> On 07-01-21, 11:17, Bjorn Andersson wrote:
> > On Tue 05 Jan 23:49 CST 2021, Vinod Koul wrote:
> > > +#PIN CONFIGURATION NODES
> > > +patternProperties:
> > > +  '-pinmux$':
> > 
> > I believe that what Rob was asking for was the matter of describing the
> > mux and config subnodes under this one. But I don't know really how to
> > express this, because the following are all valid:
> 
> I looked at the pinmux-node.yaml which describes subnodes with function
> and groups, this is a generic description and should be in
> pinmux-node.yaml not in every device description.. said that I am not
> sure why else should we add here :)
> 

Unfortunately I don't think I understand how the pinmux-node.yaml
applies to the two possible levels of nodes.

Also the description of our state nodes would have to be a mix of
pinmux-node.yaml, pincfg-node.yaml and then the properties/constraints
described here, plus something indicating that many of the common
properties are not valid ones for this binding.


Regardless of how to describe that though, I would like the
patternProperties to be "-state$" :)

Regards,
Bjorn

> > 
> > default_state: default-state {
> > 	pins = "gpio1";
> > 	bias-disable;
> > };
> > 
> > default_state: default-state {
> > 	rx {
> > 		pins = "gpio1";
> > 		function = "gpio";
> > 		bias-disable;
> > 	};
> > };
> > 
> > default_state: default-state {
> > 	pinmux {
> > 		pins = "gpio1";
> > 		function = "gpio";
> > 	};
> > 
> > 	pinconf {
> > 		pins = "gpio1";
> > 		bias-disable;
> > 	};
> > };
> > 
> > I.e. the properties described here applies either to this node directly,
> > or any subnodes (1 level) down.
> > 
> > 
> > Also we've been using different "patternProperties" for this node since
> > the introduction of the binding 7 years ago. But to be "-state$" seems
> > to best represent what the node actually describes.
> > 
> > Regards,
> > Bjorn
> > 
> > > +    type: object
> > > +    description:
> > > +      Pinctrl node's client devices use subnodes for desired pin configuration.
> > > +      Client device subnodes use below standard properties.
> > > +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > > +
> > > +    properties:
> > > +      pins:
> > > +        description:
> > > +          List of gpio pins affected by the properties specified in this subnode.
> > > +        items:
> > > +          oneOf:
> > > +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
> > > +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
> > > +        minItems: 1
> > > +        maxItems: 36
> > > +
> > > +      function:
> > > +        description:
> > > +          Specify the alternative function to be configured for the specified
> > > +          pins. Functions are only valid for gpio pins.
> > > +        enum: [ atest_char, atest_usb, audio_ref, cam_mclk, cci_async,
> > > +                cci_i2c, cci_timer, cmu_rng, coex_uart1, coex_uart2, cri_trng,
> > > +                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
> > > +                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
> > > +                gpio, ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
> > > +                mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
> > > +                mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck,
> > > +                mi2s1_ws, mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws,
> > > +                mss_grfc0, mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12,
> > > +                mss_grfc2, mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6,
> > > +                mss_grfc7, mss_grfc8, mss_grfc9, nav_gpio, pa_indicator,
> > > +                pcie0_clkreqn, pcie1_clkreqn, phase_flag, pll_bist, pll_clk,
> > > +                pri_mi2s, prng_rosc, qdss_cti, qdss_gpio, qlink0_enable,
> > > +                qlink0_request, qlink0_wmss, qlink1_enable, qlink1_request,
> > > +                qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss, qspi0,
> > > +                qspi1, qspi2, qspi3, qspi_clk, qspi_cs, qup0, qup1, qup10,
> > > +                qup11, qup12, qup13, qup14, qup15, qup16, qup17, qup18, qup19,
> > > +                qup2, qup3, qup4, qup5, qup6, qup7, qup8, qup9, qup_l4, qup_l5,
> > > +                qup_l6, sd_write, sdc40, sdc41, sdc42, sdc43, sdc4_clk,
> > > +                sdc4_cmd, sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tgu_ch2,
> > > +                tgu_ch3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data,
> > > +                uim0_present, uim0_reset, uim1_clk, uim1_data, uim1_present,
> > > +                uim1_reset, usb2phy_ac, usb_phy, vfr_0, vfr_1, vsense_trigger ]
> > > +
> > > +
> > > +      drive-strength:
> > > +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> > > +        default: 2
> > > +        description:
> > > +          Selects the drive strength for the specified pins, in mA.
> > > +
> > > +      bias-pull-down: true
> > > +
> > > +      bias-pull-up: true
> > > +
> > > +      bias-disable: true
> > > +
> > > +      output-high: true
> > > +
> > > +      output-low: true
> > > +
> > > +    required:
> > > +      - pins
> > > +      - function
> > > +
> > > +    additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - interrupt-controller
> > > +  - '#interrupt-cells'
> > > +  - gpio-controller
> > > +  - '#gpio-cells'
> > > +  - gpio-ranges
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +        tlmm: pinctrl@f000000 {
> > > +          compatible = "qcom,sm8350-tlmm";
> > > +          reg = <0x0f100000 0x300000>;
> > > +          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > > +          gpio-controller;
> > > +          #gpio-cells = <2>;
> > > +          interrupt-controller;
> > > +          #interrupt-cells = <2>;
> > > +          gpio-ranges = <&tlmm 0 0 203>;
> > > +          serial-pinmux {
> > > +            pins = "gpio18", "gpio19";
> > > +            function = "qup3";
> > > +            drive-strength = <8>;
> > > +            bias-disable;
> > > +          };
> > > +        };
> > > +
> > > +...
> > > -- 
> > > 2.26.2
> > > 
> 
> -- 
> ~Vinod
