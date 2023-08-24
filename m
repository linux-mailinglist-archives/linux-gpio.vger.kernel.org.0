Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D52AC7879FC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 23:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243306AbjHXVLl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 17:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243448AbjHXVL1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 17:11:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7CA1BCA;
        Thu, 24 Aug 2023 14:11:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D6276413D;
        Thu, 24 Aug 2023 21:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A71CC433C8;
        Thu, 24 Aug 2023 21:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692911483;
        bh=XG9xLHZC9AhIzBvKGJ4Of38YYp/jhihhwc0lJqgRG3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X2fFplalH4gcAC/XBdhAZvLq8kJnZ0bUAstwzR/WDoE43vn82rk8Hwkw0lVu3ynHN
         /nXkXdwND1vFcF39koEeCCQvDbmzhr1nFx/r+ONo8mDZBS79mYhRMm4cDbLt5XS/35
         9bToe3RMwRgTZDnSZXt8Jml6NyvlDplle3QbvRu4XICD6acjgZh3wj2lwUAG0+PxMj
         oJyvXv9OTpBpZDrv6j8RPt3L/oCS27/yZaNLQ9yGMUJlc9wbdPaitSooET4Uzj6HLA
         6MUT/f2Y5Z7nrPDSitV6VVoe9flWt4/pzBteMUMao2W09C4DMH32GjZlhQcmGISpYP
         nS1rbgL0q2kHQ==
Received: (nullmailer pid 1436647 invoked by uid 1000);
        Thu, 24 Aug 2023 21:11:22 -0000
Date:   Thu, 24 Aug 2023 16:11:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tzuyi Chang <tychang@realtek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: realtek: add RTD1315E
 pinctrl binding
Message-ID: <20230824211121.GA1388146-robh@kernel.org>
References: <20230824105703.19612-1-tychang@realtek.com>
 <20230824105703.19612-6-tychang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824105703.19612-6-tychang@realtek.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 06:57:01PM +0800, Tzuyi Chang wrote:
> Add device tree bindings for RTD1315E.
> 
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> ---
> v1 to v2 change:
> 1. Add a description for RTD1315E.
> 2. Rename realtek,pdrive, realtekmndrive and realtek,dcycle.
> 3. Add a description for PMOS and NMOS driving strength.
> 4. Remove the wildcard in the compatible strings.
> 5. Use '-pins$' to be node name pattern.
> ---
>  .../pinctrl/realtek,rtd1315e-pinctrl.yaml     | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> new file mode 100644
> index 000000000000..babd87d05f32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2023 Realtek Semiconductor Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/realtek,rtd1315e-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek DHC RTD1315E Pin Controller
> +
> +maintainers:
> +  - TY Chang <tychang@realtek.com>
> +
> +description:
> +  The Realtek DHC RTD1315E is a high-definition media processor SoC. The
> +  RTD1315E pin controller is used to control pin function, pull up/down
> +  resistor, drive strength, schmitt trigger and power source.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtd1315e-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-pins$':
> +    if:
> +      type: object
> +    then:

Drop the if/then. "-pins" should always be a node (object).

> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      properties:
> +        pins:
> +          items:
> +            enum: [ gpio_0, gpio_1, emmc_rst_n, emmc_dd_sb, emmc_clk, emmc_cmd,
> +                    gpio_6, gpio_7, gpio_8, gpio_9, gpio_10, gpio_11, gpio_12,
> +                    gpio_13, gpio_14, gpio_15, gpio_16, gpio_17, gpio_18, gpio_19,
> +                    gpio_20, emmc_data_0, emmc_data_1, emmc_data_2, usb_cc2, gpio_25,
> +                    gpio_26, gpio_27, gpio_28, gpio_29, gpio_30, gpio_31, gpio_32,
> +                    gpio_33, gpio_34, gpio_35, hif_data, hif_en, hif_rdy, hif_clk,
> +                    gpio_dummy_40, gpio_dummy_41, gpio_dummy_42, gpio_dummy_43,
> +                    gpio_dummy_44, gpio_dummy_45, gpio_46, gpio_47, gpio_48, gpio_49,
> +                    gpio_50, usb_cc1, emmc_data_3, emmc_data_4, ir_rx, ur0_rx, ur0_tx,
> +                    gpio_57, gpio_58, gpio_59, gpio_60, gpio_61, gpio_62, gpio_dummy_63,
> +                    gpio_dummy_64, gpio_dummy_65, gpio_66, gpio_67, gpio_68, gpio_69,
> +                    gpio_70, gpio_71, gpio_72, gpio_dummy_73, emmc_data_5, emmc_data_6,
> +                    emmc_data_7, gpio_dummy_77, gpio_78, gpio_79, gpio_80, gpio_81,
> +                    ur2_loc, gspi_loc, hi_width, sf_en, arm_trace_dbg_en,
> +                    ejtag_aucpu_loc, ejtag_acpu_loc, ejtag_vcpu_loc, ejtag_scpu_loc,
> +                    dmic_loc, vtc_dmic_loc, vtc_tdm_loc, vtc_i2si_loc, tdm_ai_loc,
> +                    ai_loc, spdif_loc, hif_en_loc, scan_switch, wd_rset, boot_sel,
> +                    reset_n, testmode ]
> +
> +        function:
> +          enum: [ gpio, nf, emmc, ao, gspi_loc0, gspi_loc1, uart0, uart1,
> +                  uart2_loc0, uart2_loc1, i2c0, i2c1, i2c4, i2c5, pcie1,
> +                  etn_led, etn_phy, spi, pwm0_loc0, pwm0_loc1, pwm1_loc0,
> +                  pwm1_loc1, pwm2_loc0, pwm2_loc1, pwm3_loc0, pwm3_loc1,
> +                  spdif_optical_loc0, spdif_optical_loc1, usb_cc1, usb_cc2,
> +                  sd, dmic_loc0, dmic_loc1, ai_loc0, ai_loc1, tdm_ai_loc0,
> +                  tdm_ai_loc1, hi_loc0, hi_m, vtc_i2so, vtc_i2si_loc0,
> +                  vtc_i2si_loc1, vtc_dmic_loc0, vtc_dmic_loc1, vtc_tdm_loc0,
> +                  vtc_tdm_loc1, dc_fan, pll_test_loc0, pll_test_loc1,
> +                  ir_rx, uart2_disable, gspi_disable, hi_width_disable,
> +                  hi_width_1bit, sf_disable, sf_enable, scpu_ejtag_loc0,
> +                  scpu_ejtag_loc1, scpu_ejtag_loc2, scpu_ejtag_loc3,
> +                  acpu_ejtag_loc0, acpu_ejtag_loc1, acpu_ejtag_loc2,
> +                  vcpu_ejtag_loc0, vcpu_ejtag_loc1, vcpu_ejtag_loc2,
> +                  aucpu_ejtag_loc0, aucpu_ejtag_loc1, aucpu_ejtag_loc2,
> +                  gpu_ejtag, iso_tristate, dbg_out0, dbg_out1, standby_dbg,
> +                  spdif, arm_trace_debug_disable, arm_trace_debug_enable,
> +                  aucpu_ejtag_disable, acpu_ejtag_disable, vcpu_ejtag_disable,
> +                  scpu_ejtag_disable, vtc_dmic_loc_disable, vtc_tdm_disable,
> +                  vtc_i2si_disable, tdm_ai_disable, ai_disable, spdif_disable,
> +                  hif_disable, hif_enable, test_loop, pmic_pwrup ]
> +
> +
> +        drive-strength:
> +          enum: [4, 8]
> +
> +        bias-pull-down: true
> +
> +        bias-pull-up: true
> +
> +        bias-disable: true
> +
> +        input-schmitt-enable: true
> +
> +        input-schmitt-disable: true
> +
> +        drive-push-pull: true
> +
> +        power-source:
> +          description: |
> +            Valid arguments are described as below:
> +            0: power supply of 1.8V
> +            1: power supply of 3.3V
> +          enum: [0, 1]
> +
> +        realtek,drive-strength-p:
> +          description: |
> +            Some of pins can be driven using the P-MOS and N-MOS transistor to
> +            achieve finer adjustments. The block-diagram representation is as
> +            follows:
> +                           VDD
> +                            |
> +                        ||--+
> +                 +-----o||     P-MOS-FET
> +                 |      ||--+
> +            IN --+          +----- out
> +                 |      ||--+
> +                 +------||     N-MOS-FET
> +                        ||--+
> +                            |
> +                           GND
> +            The driving strength of the P-MOS/N-MOS transistors impacts the
> +            waveform's rise/fall times. Greater driving strength results in
> +            shorter rise/fall times. Each P-MOS and N-MOS transistor offers
> +            8 configurable levels (0 to 7), with higher values indicating
> +            greater driving strength, contributing to achieving the desired
> +            speed.
> +
> +            The realtek,drive-strength-p is used to control the driving strength
> +            of the P-MOS output.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          minimum: 0
> +          maximum: 7
> +
> +        realtek,drive-strength-n:
> +          description: |
> +            Similar to the realtek,drive-strength-p, the realtek,drive-strength-n
> +            is used to control the driving strength of the N-MOS output.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          minimum: 0
> +          maximum: 7
> +
> +        realtek,duty-cycle:
> +          description: |
> +            An integer describing the level to adjust output duty cycle, controlling
> +            the proportion of positive and negative waveforms in nanoseconds.
> +            Valid arguments are described as below:
> +            0: 0ns
> +            2: + 0.25ns
> +            3: + 0.5ns
> +            4: -0.25ns
> +            5: -0.5ns
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [ 0, 2, 3, 4, 5 ]
> +
> +      required:
> +        - pins
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +     pinctrl@4e000 {
> +         compatible = "realtek,rtd1315e-pinctrl";
> +         reg = <0x4e000 0x130>;
> +
> +         emmc-hs200-pins {
> +             pins = "emmc_clk",
> +                    "emmc_cmd",
> +                    "emmc_data_0",
> +                    "emmc_data_1",
> +                    "emmc_data_2",
> +                    "emmc_data_3",
> +                    "emmc_data_4",
> +                    "emmc_data_5",
> +                    "emmc_data_6",
> +                    "emmc_data_7";
> +             function = "emmc";
> +             realtek,drive-strength-p = <0x2>;
> +             realtek,drive-strength-n = <0x2>;
> +         };
> +
> +         i2c-0-pins {
> +             pins = "gpio_12",
> +                    "gpio_13";
> +             function = "i2c0";
> +             drive-strength = <4>;
> +         };
> +     };
> -- 
> 2.41.0
> 
