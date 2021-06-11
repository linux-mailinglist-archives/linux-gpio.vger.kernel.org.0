Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BD23A3A7E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 05:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhFKDro (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 23:47:44 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:36737 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhFKDrn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 23:47:43 -0400
Received: by mail-ot1-f43.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so1889556otl.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v5HUgDNUG0DteRQIbO29ak/ZPMI8G9zbaR4ORL6E92Y=;
        b=pGbA2Kn49VQNLt+Yn+WRqDvuH6ybgjRl/aWbn0Kn+gtVgO4Erw0HqqIkfg2G2p7e1h
         X+ct4wanPELvEE1mxGqh7qPYMJu+yP6tapRKU46y9xQGEEP6XFYh2+0qRWcMzAwhCs88
         QApsxRZNVSOlTVlJ5b1bJmW/asqFR/0Mf02U/2zmVZEuQ82wbx2fWVJF/w/xlJamFvn6
         BG/5b6GiMp2MFd8+3Bd8Zxx8FNvh2+oPYAmZ0LM4uH+ndSKulVOGC0v8m148U8HNupT4
         FIoGSA8it3SsCgaSLeLbNzsTZX4V4fwbD04WSaKUP9Zz+JY3n2zuvZpvfroehQAQO2Z8
         sS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v5HUgDNUG0DteRQIbO29ak/ZPMI8G9zbaR4ORL6E92Y=;
        b=qXFj0u+ApS7xFuyChC8LJYz924dzioAB8+yIaBh2KjP3jj42zks8IVqassIrsj6Qdl
         2ls33MXGx6gIsZy6P9FpFXkjQA0SMY2PIoQcOiRc68kdhcdKafFcY/r7ZcbpiL92W1FK
         D9wbGZALi7mZtDtKMCtyosgoOAHv77szG8An2ny693eimfcLAsDo4sHAisIAZaGZ7HuP
         woIk6sz9LH3UrCviLNrssm5+sX11m6KDrBdH9sG2FDKKq9iQv1IgWSDHK1VuLmEs3J7C
         qxMA58LvaAokNRkFQMEkDvQKUGRzk68n379T1vhg9v/3itwVyuZkGfG7Xv2D5qcdG7Cw
         XVeA==
X-Gm-Message-State: AOAM532jtIsE2nsAk9LbFxllkDkZNKbyWsk7its5NGPYyrC7jWOeQQDP
        F/Y2Qdv5fg6dQQ68+pb+MpdWmg==
X-Google-Smtp-Source: ABdhPJw26+0JSg7p9j6FUeu8iicff2Nit3420uUxxuK68mAlSVTv4iIOnZGIZqajzhZzQZ+MnumkwQ==
X-Received: by 2002:a05:6830:2707:: with SMTP id j7mr1277123otu.37.1623383072889;
        Thu, 10 Jun 2021 20:44:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p65sm911705oop.0.2021.06.10.20.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:44:32 -0700 (PDT)
Date:   Thu, 10 Jun 2021 22:44:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add bindings for MDM9607
Message-ID: <YMLcHn08uwqOat/B@builder.lan>
References: <20210602080518.1589889-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602080518.1589889-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 02 Jun 03:05 CDT 2021, Konrad Dybcio wrote:

> Document the newly added MDM9607 pinctrl driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
> new file mode 100644
> index 000000000000..3802fda140d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,mdm9607-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. MDM9607 TLMM block
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  MDM9607 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,mdm9607-pinctrl

Please make the compatible qcom,mdm9607-tlmm

Regards,
Bjorn

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
> +            - pattern: "^gpio([1-9]|[1-7][0-9]|80)$"
> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd,
> +                      sdc2_data, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
> +                      qdsd_data3 ]
> +        minItems: 1
> +        maxItems: 4
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +        enum: [ adsp_ext, atest_bbrx0, atest_bbrx1, atest_char, atest_char0,
> +                atest_char1, atest_char2, atest_char3,
> +                atest_combodac_to_gpio_native, atest_gpsadc_dtest0_native,
> +                atest_gpsadc_dtest1_native, atest_tsens, backlight_en_b,
> +                bimc_dte0, bimc_dte1, blsp1_spi, blsp2_spi, blsp3_spi,
> +                blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_i2c5,
> +                blsp_i2c6, blsp_spi1, blsp_spi2, blsp_spi3, blsp_spi4,
> +                blsp_spi5, blsp_spi6, blsp_uart1, blsp_uart2, blsp_uart3,
> +                blsp_uart4, blsp_uart5, blsp_uart6, blsp_uim1, blsp_uim2,
> +                codec_int, codec_rst, coex_uart, cri_trng, cri_trng0,
> +                cri_trng1, dbg_out, ebi0_wrcdc, ebi2_a, ebi2_a_d_8_b,
> +                ebi2_lcd, ebi2_lcd_cs_n_b, ebi2_lcd_te_b, eth_irq, eth_rst,
> +                gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a, gcc_gp2_clk_b,
> +                gcc_gp3_clk_a, gcc_gp3_clk_b, gcc_plltest, gcc_tlmm, gmac_mdio,
> +                gpio, gsm0_tx, lcd_rst, ldo_en, ldo_update, m_voc, modem_tsync,
> +                nav_ptp_pps_in_a, nav_ptp_pps_in_b, nav_tsync_out_a,
> +                nav_tsync_out_b, pa_indicator, pbs0, pbs1, pbs2,
> +                pri_mi2s_data0_a, pri_mi2s_data1_a, pri_mi2s_mclk_a,
> +                pri_mi2s_sck_a, pri_mi2s_ws_a, prng_rosc, ptp_pps_out_a,
> +                ptp_pps_out_b, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
> +                pwr_modem_enabled_a, pwr_modem_enabled_b, pwr_nav_enabled_a,
> +                pwr_nav_enabled_b, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
> +                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
> +                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0, qdss_cti_trig_out_b1,
> +                qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a,
> +                qdss_tracectl_b, qdss_tracedata_a, qdss_tracedata_b, rcm_marker1,
> +                rcm_marker2, sd_write, sec_mi2s, sensor_en, sensor_int2,
> +                sensor_int3, sensor_rst, ssbi1, ssbi2, touch_rst, ts_int,
> +                uim1_clk, uim1_data, uim1_present, uim1_reset, uim2_clk,
> +                uim2_data, uim2_present, uim2_reset, uim_batt, wlan_en1, ]
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
> +        tlmm: pinctrl@1000000 {
> +          compatible = "qcom,mdm9607-pinctrl";
> +          reg = <0x01000000 0x300000>;
> +          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +          gpio-controller;
> +          gpio-ranges = <&msmgpio 0 0 80>;
> +          #gpio-cells = <2>;
> +          interrupt-controller;
> +          #interrupt-cells = <2>;
> +        };
> -- 
> 2.31.1
> 
