Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857613C3212
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jul 2021 04:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhGJC6x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jul 2021 22:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhGJC6x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jul 2021 22:58:53 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C23C0613E5
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jul 2021 19:56:08 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id f93-20020a9d03e60000b02904b1f1d7c5f4so10705664otf.9
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jul 2021 19:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q7U9qOUSDsrK43rTblnVFlDzcLe5oOcvy0x/FulEFg4=;
        b=Q5KihE7myg2Fa2kbHoO6bSWVzJ9OoS4CYqKXpk/YDl5w0Fq+YgHptlXWsozdB66+xb
         thwdX5c2fHAYONlIN76homPwsmufgljdBkPO5vAmYKz7hXDa/KkTXGha7O1D5hyCkjOZ
         gKCTMYZChCezzcVTfPk7J6YDmigv46yjCIdcTnO8+lmtS02aI8fYrvbKTSzQTjTz7QjJ
         bUQO6VuwJ+rVFVtUhr+TDGbJp+qnZIqr0ZDNF1Lbw4I5DX3rZjsoNIlwjXejfzv0iWvu
         BuUDSx6WAoIEeSHdsuuA1efKO8jxyJgL+GRTh1VyjiJsTD4pq9hC4pk1n4m6I+tqYSxN
         h3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q7U9qOUSDsrK43rTblnVFlDzcLe5oOcvy0x/FulEFg4=;
        b=hK6eSgnF7BfnF/60JbQql5PjEegC0A/JRqeKVACE0+nywmTlU0jLJ1DhWVXvsUruyr
         wQsr7Ozd4tFzdpZ7dTJ1rxuvdt+L7svrrGJnS0bTx1gHpYclEXvCZfsWYnqO/TR8pwuQ
         aFrP5+sSwUY9pbhHMlJGpcXC76ZCBiPhLw6QTCqx5P8EAqLhC2mzwupps1FGUuMNcGNT
         oW8tuPkf8t0QTzotb+TG/Y3gq5Xm5Qw3pdtGcjlG8Vk/J5sGdANo8PI37bdhOCPiWPkU
         9VN7OogQQiNvknlDdFBspWDPZYeBfCWA4RXznQojBVtQgC1vf2MdIJYdDQZYSfzqkHhh
         vd1w==
X-Gm-Message-State: AOAM530Xd9rnWFqOm1CJ2Y3O2WbaQUUZ5GpJxDGDEAXcxIx48XN/0nwG
        PdtEEk++wUDvNPfp+wA2AS+RDg==
X-Google-Smtp-Source: ABdhPJyfqhCT/qHSmLTE+M5EyuvsusE1Dn0OTmnRU1cjJlyhVjfgSmGkSzQqdxhjf1j17G8E4xNrMw==
X-Received: by 2002:a9d:7f0d:: with SMTP id j13mr7672945otq.322.1625885767876;
        Fri, 09 Jul 2021 19:56:07 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b16sm1637278oic.5.2021.07.09.19.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 19:56:07 -0700 (PDT)
Date:   Fri, 9 Jul 2021 21:56:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SDX65 pinctrl
 bindings
Message-ID: <YOkMRZamuFplNyT/@yoga>
References: <20210709200618.20230-1-quic_vamslank@quicinc.com>
 <20210709200618.20230-2-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200618.20230-2-quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 09 Jul 15:06 CDT 2021, quic_vamslank@quicinc.com wrote:

> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add device tree binding Documentation details for Qualcomm SDX65
> pinctrl driver.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml  | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
> new file mode 100644
> index 000000000000..0d04bba4d8e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sdx65-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SDX65 TLMM block
> +
> +maintainers:
> +  - Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  SDX65 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,sdx65-pinctrl

Please make this qcom,sdx65-tlmm

> +
> +  reg:
> +    description: Specifies the base address and size of the TLMM register space
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Specifies the TLMM summary IRQ
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

This only allows:

&tlmm {
	some-pins {
		pins = "gpio1";
		properties...;
	};
};

Not:

&tlmm {
	some-pins {
		foo {
			pins = "gpio1";
			properties...;
		};

		bar {
			pins = "gpio2";
			other-properties;
		};
	};
};

And we want to be able to use both styles.

Also, the thing we describe here isn't a bunch of pins, but rather a
"state".

So please rework this following qcom,sc8180x-pinctrl.yaml and how it
uses qcom,tlmm-common.yaml.

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
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data, sdc1_rclk ]

Your driver has "ufs_reset" as a pin a well.

> +        minItems: 1
> +	maxItems: 150
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins. Functions are only valid for gpio pins.
> +        enum: [ blsp_uart1, blsp_spi1, blsp_i2c1, blsp_uim1, atest_tsens,
> +          bimc_dte1, dac_calib0, blsp_spi8, blsp_uart8, blsp_uim8,
> +          qdss_cti_trig_out_b, bimc_dte0, dac_calib1, qdss_cti_trig_in_b,
> +          dac_calib2, atest_tsens2, atest_usb1, blsp_spi10, blsp_uart10,
> +          blsp_uim10, atest_bbrx1, atest_usb13, atest_bbrx0, atest_usb12,
> +          mdp_vsync, edp_lcd, blsp_i2c10, atest_gpsadc1, atest_usb11,
> +          atest_gpsadc0, edp_hot, atest_usb10, m_voc, dac_gpio, atest_char,
> +          cam_mclk, pll_bypassnl, qdss_stm7, blsp_i2c8, qdss_tracedata_b,
> +          pll_reset, qdss_stm6, qdss_stm5, qdss_stm4, atest_usb2, cci_i2c,
> +          qdss_stm3, dac_calib3, atest_usb23, atest_char3, dac_calib4,
> +          qdss_stm2, atest_usb22, atest_char2, qdss_stm1, dac_calib5,
> +          atest_usb21, atest_char1, dbg_out, qdss_stm0, dac_calib6,
> +          atest_usb20, atest_char0, dac_calib10, qdss_stm10,
> +          qdss_cti_trig_in_a, cci_timer4, blsp_spi6, blsp_uart6, blsp_uim6,
> +          blsp2_spi, qdss_stm9, qdss_cti_trig_out_a, dac_calib11,
> +          qdss_stm8, cci_timer0, qdss_stm13, dac_calib7, cci_timer1,
> +          qdss_stm12, dac_calib8, cci_timer2, blsp1_spi, qdss_stm11,
> +          dac_calib9, cci_timer3, cci_async, dac_calib12, blsp_i2c6,
> +          qdss_tracectl_a, dac_calib13, qdss_traceclk_a, dac_calib14,
> +          dac_calib15, hdmi_rcv, dac_calib16, hdmi_cec, pwr_modem,
> +          dac_calib17, hdmi_ddc, pwr_nav, dac_calib18, pwr_crypto,
> +          dac_calib19, hdmi_hot, dac_calib20, dac_calib21, pci_e0,
> +          dac_calib22, dac_calib23, dac_calib24, tsif1_sync, dac_calib25,
> +          sd_write, tsif1_error, blsp_spi2, blsp_uart2, blsp_uim2,
> +          qdss_cti, blsp_i2c2, blsp_spi3, blsp_uart3, blsp_uim3, blsp_i2c3,
> +          uim3, blsp_spi9, blsp_uart9, blsp_uim9, blsp10_spi, blsp_i2c9,
> +          blsp_spi7, blsp_uart7, blsp_uim7, qdss_tracedata_a, blsp_i2c7,
> +          qua_mi2s, gcc_gp1_clk_a, ssc_irq, uim4, blsp_spi11, blsp_uart11,
> +          blsp_uim11, gcc_gp2_clk_a, gcc_gp3_clk_a, blsp_i2c11, cri_trng0,
> +          cri_trng1, cri_trng, qdss_stm18, pri_mi2s, qdss_stm17, blsp_spi4,
> +          blsp_uart4, blsp_uim4, qdss_stm16, qdss_stm15, blsp_i2c4,
> +          qdss_stm14, dac_calib26, spkr_i2s, audio_ref, lpass_slimbus,
> +          isense_dbg, tsense_pwm1, tsense_pwm2, btfm_slimbus, ter_mi2s,
> +          qdss_stm22, qdss_stm21, qdss_stm20, qdss_stm19, gcc_gp1_clk_b,
> +          sec_mi2s, blsp_spi5, blsp_uart5, blsp_uim5, gcc_gp2_clk_b,
> +          gcc_gp3_clk_b, blsp_i2c5, blsp_spi12, blsp_uart12, blsp_uim12,
> +          qdss_stm25, qdss_stm31, blsp_i2c12, qdss_stm30, qdss_stm29,
> +          tsif1_clk, qdss_stm28, tsif1_en, tsif1_data, sdc4_cmd, qdss_stm27,
> +          qdss_traceclk_b, tsif2_error, sdc43, vfr_1, qdss_stm26, tsif2_clk,
> +          sdc4_clk, qdss_stm24, tsif2_en, sdc42, qdss_stm23, qdss_tracectl_b,
> +          sd_card, tsif2_data, sdc41, tsif2_sync, sdc40, mdp_vsync_p_b,
> +          ldo_en, mdp_vsync_s_b, ldo_update, blsp11_uart_tx_b, blsp11_uart_rx_b,
> +          blsp11_i2c_sda_b, prng_rosc, blsp11_i2c_scl_b, uim2, uim1, uim_batt,
> +          pci_e2, pa_indicator, adsp_ext, ddr_bist, qdss_tracedata_11,
> +          qdss_tracedata_12, modem_tsync, nav_dr, nav_pps, pci_e1, gsm_tx,
> +          qspi_cs, ssbi2, ssbi1, mss_lte, qspi_clk, qspi0, qspi1, qspi2, qspi3,
> +          gpio ]
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
> +        tlmm: pinctrl@f100000{
> +                compatible = "qcom,sdx65-pinctrl";
> +                reg = <0x03000000 0xdc2000>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 108>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                serial-pins {
> +                        pins = "gpio8", "gpio9";
> +                        function = "blsp_uart3";
> +                        drive-strength = <2>;
> +                        bias-disable;
> +                };
> +        };
> +

Please drop this empty line.

Regards,
Bjorn

> +...
> -- 
> 2.32.0
> 
