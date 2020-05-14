Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0D41D26FA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 08:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgENGE1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 02:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725818AbgENGE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 02:04:26 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E1EC061A0E
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 23:04:26 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b190so852260pfg.6
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 23:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fdmSIWMsCpUW7wJAjQcM04l5EV2d38V1LLlFH56zh/Q=;
        b=t+81K8xIWHZAb+qZy4b/CyLYaDJEC3buGiFxgEM+vGGtP3OpgN/uRorgVQdklsZolt
         fUMiHNpNafAs3xthBI978lkA1NzlDyGuLkTuTs++Fwos6trlUHlOCcWOLT51P/tbaPa8
         EMAX6Xneovwlf0jYO+DSG7ju4bF4ps5Pnu6r04J47Kkq3Jn9Yqr0qHK99/QnLcb9TWOe
         ELDo+1d9D3l3uzm0ltFq+Gz3mTRDd7+gli5UHpqztRYjkZV+BL79pSaa/x1f/AvQIBqA
         eMHOSwaYnIjuc0cY0Fbh7YoccJUt6COcV9CoG13JZrx4h1P3lnzkrDoHP+bYr+91ROv4
         5yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fdmSIWMsCpUW7wJAjQcM04l5EV2d38V1LLlFH56zh/Q=;
        b=rZlP4ONQTwPfQoNy5G/KtAxARZ5DJd+kwRFLW5t2rgeuGTQ9NCLQCV1UOwEp7erVHI
         iEvTGvguGd3DNqdfqTvzXxPDoC8XRpKJTbWed29vtMxOWCn4PCui9SfBfYR3tmoLSdaX
         U1Uv/KzRyZrokQamh4ou4lioz5ZkugkJRBm9Fw/zMrzd8zytY0NEAKXHcf2aKEW1Eh90
         NH1QdxW7jWy7tUQkRUm3mZn8KTz2Dphy267nIlGx/NB1n9gWE1z3D8mb4IP1ICEkHIqO
         CXZ3/y+3qnduu3R6jA3nYecvymiUJ1v4mui6qkSDzia1jnxvyADSrrrsCIGBZ+osraUC
         2oDQ==
X-Gm-Message-State: AOAM533ef1RMsq4Sxf9tkQCt2fitzx44hLzYJmx4GfNnAdnrOyLJ8FI7
        NKLneyrBdaNDRES1G6KIhaiCIDlKqi4=
X-Google-Smtp-Source: ABdhPJy8/5JndA1WeHN8nNz8gCYQDDpjdxcICz8QbFZopFUpG6xUKfXZ6hED2rLKq8OOCHvu7Dtn/w==
X-Received: by 2002:a62:6dc3:: with SMTP id i186mr2697519pfc.273.1589436265605;
        Wed, 13 May 2020 23:04:25 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v189sm1218271pfv.176.2020.05.13.23.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 23:04:24 -0700 (PDT)
Date:   Wed, 13 May 2020 23:04:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8250 pinctrl
 bindings
Message-ID: <20200514060422.GL1302550@yoga>
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
 <20200417061907.1226490-2-bjorn.andersson@linaro.org>
 <20200429213453.GA32114@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429213453.GA32114@bogus>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 29 Apr 14:34 PDT 2020, Rob Herring wrote:
> On Thu, Apr 16, 2020 at 11:19:06PM -0700, Bjorn Andersson wrote:
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
[..]
> > +#PIN CONFIGURATION NODES
> > +patternProperties:
> > +  '^.*$':
> > +    if:
> > +      type: object
> > +    then:
> 
> Needs a $ref to the standard properties.
> 
> Would be good to show a child node in the example too. (And try having 
> an error in a standard property type to verify you get an error).
> 

Finally looked into this. By $ref'ing pinmux-node.yaml I can drop pins
and function from below properties, and by $ref'ing pincfg-node.yaml I
can drop the pinconf entries listed.

But how do I $ref both?

What's the appropriate method for amending pins, function and
drive-strength with the more specific value set? Should I both $ref them
and list them here?

How do I limit which standard properties are actually supported in this
binding?

Thanks,
Bjorn

> > +      properties:
> > +        pins:
> > +          description:
> > +            List of gpio pins affected by the properties specified in this
> > +            subnode.
> > +          items:
> > +            oneOf:
> > +              - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
> > +              - enum: [ sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
> > +          minItems: 1
> > +          maxItems: 36
> > +
> > +        function:
> > +          description:
> > +            Specify the alternative function to be configured for the specified
> > +            pins.
> > +
> > +          enum: [ aoss_cti, atest, audio_ref, cam_mclk, cci_async, cci_i2c,
> > +            cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4, cri_trng,
> > +            cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
> > +            ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
> > +            ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
> > +            mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
> > +            mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
> > +            mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, pci_e0, pci_e1,
> > +            pci_e2, phase_flag, pll_bist, pll_bypassnl, pll_clk, pll_reset,
> > +            pri_mi2s, prng_rosc, qdss_cti, qdss_gpio, qspi0, qspi1, qspi2, qspi3,
> > +            qspi_clk, qspi_cs, qup0, qup1, qup10, qup11, qup12, qup13, qup14,
> > +            qup15, qup16, qup17, qup18, qup19, qup2, qup3, qup4, qup5, qup6,
> > +            qup7, qup8, qup9, qup_l4, qup_l5, qup_l6, sd_write, sdc40, sdc41,
> > +            sdc42, sdc43, sdc4_clk, sdc4_cmd, sec_mi2s, sp_cmu, tgu_ch0, tgu_ch1,
> > +            tgu_ch2, tgu_ch3, tsense_pwm1, tsense_pwm2, tsif0_clk, tsif0_data,
> > +            tsif0_en, tsif0_error, tsif0_sync, tsif1_clk, tsif1_data, tsif1_en,
> > +            tsif1_error, tsif1_sync, usb2phy_ac, usb_phy, vsense_trigger ]
> > +
> > +        drive-strength:
> > +          enum: [2, 4, 6, 8, 10, 12, 14, 16]
> > +          default: 2
> > +          description:
> > +            Selects the drive strength for the specified pins, in mA.
> > +
> > +        bias-pull-down: true
> > +
> > +        bias-pull-up: true
> > +
> > +        bias-disable: true
> > +
> > +        output-high: true
> > +
> > +        output-low: true
> > +
> > +      required:
> > +        - pins
> > +        - function
> > +
> > +      additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
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
> > +        pinctrl@1f00000 {
> > +                compatible = "qcom,sm8250-pinctrl";
> > +                reg = <0x0f100000 0x300000>,
> > +                      <0x0f500000 0x300000>,
> > +                      <0x0f900000 0x300000>;
> > +                reg-names = "west", "south", "north";
> > +                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > +                gpio-controller;
> > +                #gpio-cells = <2>;
> > +                interrupt-controller;
> > +                #interrupt-cells = <2>;
> > +                gpio-ranges = <&tlmm 0 0 180>;
> > +                wakeup-parent = <&pdc>;
> > +        };
> > -- 
> > 2.24.0
> > 
