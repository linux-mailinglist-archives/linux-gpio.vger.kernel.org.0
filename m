Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127961BEA02
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 23:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgD2Ve5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 17:34:57 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:46150 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgD2Ve4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2020 17:34:56 -0400
Received: by mail-oo1-f65.google.com with SMTP id x16so777184oop.13;
        Wed, 29 Apr 2020 14:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3wI+m3Lp4Msfhx+NZFQZQ19Jr5Ux1UxLifKvOMueVA0=;
        b=ihOS09fb0gXUQmecNGTNcYEnD0AAax9ALpoCfJAEGV1/GpZmX9w7ofGtYSLdK2lfOZ
         S6nJiYBOcb8VfpdpUAW8G34nnCMgwW3vYMgqvD5WrkKCX5Yemsg9lObyMJ5eA2ih3d+5
         Nk4FR3BJi8zCf2cEr82gWFv0tKw5NGqiwIPt83k0sFAt7J+TXbkAtsLLy7s20urn65fP
         YTBlinKFZM3Yx6mABJYwPpzh3Nhg2qndh5gnifw/4fWqCZRdr488Vm1ZwYEQs1WhlkEE
         O6E/joJwu/yZ5dtAzFpJHUyb0mBe9BY4LZjJFmLZLvwPvyvtwywFPSQirnZAA2AIINmP
         s9CA==
X-Gm-Message-State: AGi0PuYv1rERRIWXtfqcZaRVhGoysDVpfaKADKOEDQgQSoMShvw6/Asw
        WZX+L/dFPvlinf62WXKhjJUgOMU=
X-Google-Smtp-Source: APiQypJz49rbWZlmdBvylWBwgLTfqZmjszuSuHIp91zs1eOOfCrntkS2nHsD2thdWFZSrECHIb/kgQ==
X-Received: by 2002:a4a:b489:: with SMTP id b9mr64185ooo.71.1588196094960;
        Wed, 29 Apr 2020 14:34:54 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l21sm775644ooq.18.2020.04.29.14.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 14:34:54 -0700 (PDT)
Received: (nullmailer pid 5820 invoked by uid 1000);
        Wed, 29 Apr 2020 21:34:53 -0000
Date:   Wed, 29 Apr 2020 16:34:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8250 pinctrl
 bindings
Message-ID: <20200429213453.GA32114@bogus>
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
 <20200417061907.1226490-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417061907.1226490-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 11:19:06PM -0700, Bjorn Andersson wrote:
> Add device tree binding Documentation details for Qualcomm SM8250
> pinctrl driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> new file mode 100644
> index 000000000000..6dc3b52f47cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SM8250 TLMM block
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  SM8250 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-pinctrl
> +
> +  reg:
> +    minItems: 3
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: "west"
> +      - const: "south"
> +      - const: "north"
> +
> +  interrupts:
> +    description: Specifies the TLMM summary IRQ
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description:
> +      Specifies the PIN numbers and Flags, as defined in defined in
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
> +  wakeup-parent:
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '^.*$':
> +    if:
> +      type: object
> +    then:

Needs a $ref to the standard properties.

Would be good to show a child node in the example too. (And try having 
an error in a standard property type to verify you get an error).

> +      properties:
> +        pins:
> +          description:
> +            List of gpio pins affected by the properties specified in this
> +            subnode.
> +          items:
> +            oneOf:
> +              - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
> +              - enum: [ sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
> +          minItems: 1
> +          maxItems: 36
> +
> +        function:
> +          description:
> +            Specify the alternative function to be configured for the specified
> +            pins.
> +
> +          enum: [ aoss_cti, atest, audio_ref, cam_mclk, cci_async, cci_i2c,
> +            cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4, cri_trng,
> +            cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
> +            ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
> +            ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
> +            mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
> +            mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
> +            mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, pci_e0, pci_e1,
> +            pci_e2, phase_flag, pll_bist, pll_bypassnl, pll_clk, pll_reset,
> +            pri_mi2s, prng_rosc, qdss_cti, qdss_gpio, qspi0, qspi1, qspi2, qspi3,
> +            qspi_clk, qspi_cs, qup0, qup1, qup10, qup11, qup12, qup13, qup14,
> +            qup15, qup16, qup17, qup18, qup19, qup2, qup3, qup4, qup5, qup6,
> +            qup7, qup8, qup9, qup_l4, qup_l5, qup_l6, sd_write, sdc40, sdc41,
> +            sdc42, sdc43, sdc4_clk, sdc4_cmd, sec_mi2s, sp_cmu, tgu_ch0, tgu_ch1,
> +            tgu_ch2, tgu_ch3, tsense_pwm1, tsense_pwm2, tsif0_clk, tsif0_data,
> +            tsif0_en, tsif0_error, tsif0_sync, tsif1_clk, tsif1_data, tsif1_en,
> +            tsif1_error, tsif1_sync, usb2phy_ac, usb_phy, vsense_trigger ]
> +
> +        drive-strength:
> +          enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +          default: 2
> +          description:
> +            Selects the drive strength for the specified pins, in mA.
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
> +  - reg-names
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
> +        pinctrl@1f00000 {
> +                compatible = "qcom,sm8250-pinctrl";
> +                reg = <0x0f100000 0x300000>,
> +                      <0x0f500000 0x300000>,
> +                      <0x0f900000 0x300000>;
> +                reg-names = "west", "south", "north";
> +                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 180>;
> +                wakeup-parent = <&pdc>;
> +        };
> -- 
> 2.24.0
> 
