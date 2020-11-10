Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47212AE1A6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 22:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730894AbgKJVYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 16:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKJVYU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 16:24:20 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0ECC0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 13:24:20 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id c25so3464827ooe.13
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 13:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sbR5v0iU+yPZpwD0s8nKqsM8+4KSn5ZLeUULGAXG3cM=;
        b=GviLwlObHSlQ62OtLXHeMjjIJC2rRDAaymJzN7GlRLMda/BFJCWJeHZSHQOti+psW8
         GtqKT6D+5MlUQr/Bx1yqVOwjB0jzAthiKfVd7IXSSo1tRcVHa7T7FVjWF7E2gchZe3xh
         sLUQYuzaVcAaN6to+8/I1KfPtQZAErC/lIkLIoL4kubWao3lSUTcgO5+jJe+j58VQciT
         gP/BurmmLg9ryBmX0nRM+OV306JF0qI7FTM8ugoCt7paSdmQ+TRpHKNn1dpOUj1hb63T
         P8z+BT5olAbK2DWmfShEOUd3cW7Fqt3myOFksYYJxBiOCCWyz/w0IDT5/28dggzBUZMT
         qWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sbR5v0iU+yPZpwD0s8nKqsM8+4KSn5ZLeUULGAXG3cM=;
        b=nFc3MWcZwvV4jK0R6IwsbtqvsC9HXpiQ7/SJwLB/+eNcKs8hql0JfAY96y3b5SLDAQ
         X0oD3L6DVKeJnqHHnHGADJa6ZCFNrGhXIf99m8ZzoY6UOcpUyoXnEtADdiX5bzvmvumN
         AMkDOZ8/plNoxsxTDaZ08T2HmQM7OvpyGdPika+xoV+b/6sSCiR3b/zLlmqVDURPAfap
         tNdxqheaQ9z3C7iPHBKTmUwWmUwo+1YSTGzdQG+gc+OS8EHcimS7jnhajCscNezI3nb1
         bEXVyXi3hhzoanbHnGnJ3uwSYiWbpzMLV20qRaBJjyZz4T9LCvZzJbeVMe/s4AFXYG7G
         lOxg==
X-Gm-Message-State: AOAM533M3n6PqmaRHAdemYgdhEjLqT+s2oJ2VCaDIMjdbcVyndonzuBU
        duRnCNJrh7Ts7pA83PH3nR4ZoA==
X-Google-Smtp-Source: ABdhPJxGMw4LxhccxkRKQ6zzF7az31jh9AC29u7CnYBuqTXH8mWrz+VrHO27QbASAW8sdWcUA6Zi9g==
X-Received: by 2002:a4a:c915:: with SMTP id v21mr15054075ooq.76.1605043459414;
        Tue, 10 Nov 2020 13:24:19 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g8sm3393355oia.16.2020.11.10.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 13:24:18 -0800 (PST)
Date:   Tue, 10 Nov 2020 15:24:16 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add sc7280 pinctrl
 bindings
Message-ID: <20201110212416.GE807@yoga>
References: <1604570192-15057-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604570192-15057-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 05 Nov 03:56 CST 2020, Rajendra Nayak wrote:

> Add device tree binding Documentation details for Qualcomm SC7280
> TLMM block.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> v2: Consolidated functions under phase_flag and qdss
> 
>  .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      | 158 +++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
> new file mode 100644
> index 0000000..7d6a2ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SC7280 TLMM block
> +
> +maintainers:
> +  - Rajendra Nayak <rnayak@codeaurora.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  SC7280 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-pinctrl
> +
> +  reg:
> +    maxItems: 1
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
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-4])$"
> +            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk,
> +                      sdc2_cmd, sdc2_data, ufs_reset ]
> +        minItems: 1
> +        maxItems: 16
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +        enum: [ atest_char, atest_char0, atest_char1, atest_char2,
> +                atest_char3, atest_usb0, atest_usb00, atest_usb01,
> +                atest_usb02, atest_usb03, atest_usb1, atest_usb10,
> +                atest_usb11, atest_usb12, atest_usb13, audio_ref,
> +                cam_mclk, cci_async, cci_i2c, cci_timer0, cci_timer1,
> +                cci_timer2, cci_timer3, cci_timer4, cmu_rng0, cmu_rng1,
> +                cmu_rng2, cmu_rng3, coex_uart1, cri_trng, cri_trng0,
> +                cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, dp_hot,
> +                dp_lcd, edp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
> +                gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,
> +                mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3,
> +                mdp_vsync4, mdp_vsync5, mi2s0_data0, mi2s0_data1, mi2s0_sck,
> +                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
> +                mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, mss_grfc0,
> +                mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12, mss_grfc2,
> +                mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6, mss_grfc7,
> +                mss_grfc8, mss_grfc9, nav_gpio0, nav_gpio1, nav_gpio2,
> +                pa_indicator, pcie0_clkreqn, pcie1_clkreqn, phase_flag,
> +                pll_bist, pll_bypassnl, pll_clk, pll_reset, pri_mi2s, prng_rosc,
> +                qdss, qdss_cti, qlink0_enable, qlink0_request, qlink0_wmss,
> +                qlink1_enable, qlink1_request, qlink1_wmss, qspi_clk, qspi_cs,
> +                qspi_data, qup00, qup01, qup02, qup03, qup04, qup05, qup06, qup07,
> +                qup10, qup11, qup12, qup13, qup14, qup15, qup16, qup17,
> +                sdc40, sdc41, sdc42, sdc43, sdc4_clk, sdc4_cmd, sd_write,
> +                sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tsense_pwm1,
> +                tsense_pwm2, uim0_clk, uim0_data, uim0_present, uim0_reset,
> +                uim1_clk, uim1_data, uim1_present, uim1_reset, usb2phy_ac,
> +                usb_phy, vfr_0, vfr_1, vsense_trigger ]
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
> +                compatible = "qcom,sc7280-pinctrl";
> +                reg = <0xf000000 0x1000000>;
> +                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 175>;
> +                wakeup-parent = <&pdc>;
> +
> +                qup_uart5_default: qup-uart5-pins {
> +                        pins = "gpio46", "gpio47";
> +                        function = "qup13";
> +                        drive-strength = <2>;
> +                        bias-disable;
> +                };
> +        };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
