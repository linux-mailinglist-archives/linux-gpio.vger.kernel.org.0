Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD60D3A487C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 20:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhFKST7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 14:19:59 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:43592 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhFKST4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 14:19:56 -0400
Received: by mail-oi1-f172.google.com with SMTP id x196so6681262oif.10
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UvpCY1hScpxkzeQgGxHD8V+v58ShLMlpuw8YxtPhQDg=;
        b=FFFaonKr16J4ZBGvau0wrOuoxyMcUR94fJbhkB+ho3Xeo5sJKS/njBK0uGKhUONsKa
         wQwZS009ChIwOuClpxf/vSFV/tZQZwU12VXv5l//PVJLfxDSt4Bl4iZM5hIX8CRR8wpz
         eWYCaxmUY+3dVRXXqd+LC8ij1RstnFwqtcafs6KmwYEEuMVOKpWSJICaa8T1Mc23R34E
         x7z51K1+yELPkWD/QKE9t4jDlrl6F9aTTx8sy8W/0Yx0WgNfrmD3aF+Y73KlI3nzJc32
         9NIstP3OVWzVsUKJoRGgQE6CP8VvcsY78xMj5lkq1/HWwd3lqZuwHK5vlKygpCVwNjpa
         XtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UvpCY1hScpxkzeQgGxHD8V+v58ShLMlpuw8YxtPhQDg=;
        b=NlTsLMwW0PLWE5aFb+BqqMfknSSSuePr/qrb4oeyJxq5jao+dfeLJpm4kmQS5cRIRi
         TUI7RqQ/cEnInuPXsY3X5VaZR80SVUIA4DXDMq4oi/rb2OX48t1WCwhK/VSKEUtTPpJL
         WTymgSzrV64BXqRQmTCkmUnmXHSX9A8B/xF9fgXc+HhTIvvT60cMSdqsaWLm2SCL4kAL
         QKUi+BEULF1UmAnBcA9pd7xT5I4V8bsYaZyGRzEPCeTdmJx0vgCMyJw1wHGFT1gjyI6Z
         WT48aqtuyYeheFLIUueEUMbuIPo+nmDJIUg1d04jLEZNt2ERQr6/JIL9+4Vx4k267/LX
         mb5g==
X-Gm-Message-State: AOAM531ck3U2gdUY25Gy39ZwlJ1mC3ssbMsijB3L9fv2tMohDpUIk29/
        yJr/492GTUbzgz6+mQqOznqKyQ==
X-Google-Smtp-Source: ABdhPJwXPibW2ETbPXPnpgUGnHHAvm7ckXiDNrMGoYCQpWlpA2z433wGv/msjdjD3txxOa3PArmcWg==
X-Received: by 2002:aca:e0d6:: with SMTP id x205mr3319945oig.109.1623435403575;
        Fri, 11 Jun 2021 11:16:43 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u42sm1068717oiw.50.2021.06.11.11.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 11:16:43 -0700 (PDT)
Date:   Fri, 11 Jun 2021 13:16:40 -0500
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
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add bindings for
 MDM9607
Message-ID: <YMOoiMMFFhEU6Clu@yoga>
References: <20210611091615.15309-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611091615.15309-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 11 Jun 04:16 CDT 2021, Konrad Dybcio wrote:

> Document the newly added MDM9607 pinctrl driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - Change the compatible to qcom,mdm9607-tlmm
> 
>  .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
> new file mode 100644
> index 000000000000..30663248b7ac
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
> +    const: qcom,mdm9607-tlmm
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

I'm sorry, but I forgot about this part when looking at your patch
yesterday.

As defined here the following syntax is valid:

	tlmm@abc {
		compatible = "qcom,mdm9607-tlmm";

		foo-pins {
			pins = "a", "b";
		};
	};

But we're not allowed to describe the valid (according to
implementation) and often used case:

	tlmm@abc {
		compatible = "qcom,mdm9607-tlmm";

		foo-pins {
			a {
				pins = "a";
			};

			b {
				pins = "b";
			};
		};
	};

In order to properly validate this I came up with the scheme of defining
the node that carries the various properties using a $defs and then
define the '-pin$' as something that can be describes as that definition
or have a list of subnodes defined by that def.

You can see this in the sc8180x or sm8350 tlmm bindings.

What you also can see if that I defined qcom,tlmm-common.yaml to
describe the common TLMM properties, so that would be nice to use as
well.


Lastly, in particular in the nested case you're not really describing
some pins, but a state of some pins. I therefor would prefer if we move
to using '-state$' as the suffix for these nodes.


Again, I'm sorry for forgetting all this when I looked at your binding
yesterday.

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
> 2.32.0
> 
