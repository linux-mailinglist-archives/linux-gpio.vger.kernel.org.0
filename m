Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 940E412C056
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2019 04:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfL2Dla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Dec 2019 22:41:30 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36999 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbfL2Dla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Dec 2019 22:41:30 -0500
Received: by mail-pj1-f66.google.com with SMTP id m13so6736425pjb.2
        for <linux-gpio@vger.kernel.org>; Sat, 28 Dec 2019 19:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3nYzbiySbBMWr0PTl27fhW8zMhEg+ip2bE0c5QuOqsI=;
        b=S1mkTqQVQ4HAOpRtLQ3Z5Ot5b91O27ZQMN1tfWr/raiqea/k8s8N8PSIaJbI0eVc+o
         wD+9B5R9McHSd/EBOEFNTwMwNZyMuEOmazjgDRZrCxYZkvptsX+YD8lU+ylSMOYJuhmT
         uhfTLW8UQwhkfZwVgyUt8hK+WXYDwKOl04yZZXQHrg9BDI1LGlE7lnhTovBU6JXXW755
         vVHv8fXhfmO1BF5s+YfNchQ8A2UWPm06AjsXzN2ZBfpNZlmXLK5y0yd179I0qNPiBypn
         laZ5sIZHqIfpuW33OA/0j/F1GAFFktKbhWvKszbcSgCZ270SwxYVASQkEY//HhAop+Pr
         3SaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3nYzbiySbBMWr0PTl27fhW8zMhEg+ip2bE0c5QuOqsI=;
        b=YhlZCacdVbQoeW9yja0GhxaYfUTL6pQKIdDn3NArauH6RNPcX50kjsRv2PCWrjNeCi
         suwKrwiixk7/U3Q4MAtsHKE45pyZJkO/LvIHuY9SVGjnoMUIEsP4BcoevjTmMXbHarQp
         cnEEsukfWkVtRSChCucbAz+4ydvMGAoo8CxuRpCqmbbSXwyG3LzgdLhuc/ZOMvGa/psT
         1boRVBxfZR570HMraMJexSRX482YA/bmNi96ndn+BmSt6ixWo4KhSujf0Ql4ekuTc+TD
         Z7GAunKXyh/O0LQ8rdrTewVkLYVM+iT6LY+AOZRC+dGkWcw4CjhDOGEyHI0YEWFXVDL2
         brZw==
X-Gm-Message-State: APjAAAXE6Wjq+VtPni8MFqdxhA7q2B2wC/wYKaUyv8kdpy9jaIm6szM2
        83OPPfExSBous15gjjpsENQiqg==
X-Google-Smtp-Source: APXvYqx2y3B/ZHSUs+Yq+AjalZ9qvoYa/EeRtB3Ey/8PQ54ZGkoeZ7JZ0pjNRy1k0Qim7ZgoA659iA==
X-Received: by 2002:a17:902:82c3:: with SMTP id u3mr57953226plz.73.1577590889282;
        Sat, 28 Dec 2019 19:41:29 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u23sm45938315pfm.29.2019.12.28.19.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 19:41:28 -0800 (PST)
Date:   Sat, 28 Dec 2019 19:41:26 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH V2 1/7] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl
 bindings
Message-ID: <20191229034126.GO3755841@builder>
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
 <1576752109-24497-2-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576752109-24497-2-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 19 Dec 02:41 PST 2019, Sricharan R wrote:

> Add device tree binding Documentation details for ipq6018
> pinctrl driver.
> 
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
> 
> [V2] Splitted dt bindings and driver into different patches. Added missing bindings,
>      and some style changes.
> 
>  .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     | 172 +++++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> new file mode 100644
> index 0000000..745a11e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,ipq6018-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. IPQ6018 TLMM block
> +
> +maintainers:
> +  - Sricharan R <sricharan@codeaurora.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  IPQ6018 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,ipq6018-pinctrl
> +  reg:
> +    maxItems: 1
> +  interrupts:
> +    Description: Specifies the TLMM summary IRQ
> +    maxItems: 1
> +  interrupt-controller: true
> +  '#interrupt-cells':
> +    Description:
> +      Specifies the PIN numbers and Flags, as defined in defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2
> +  gpio-controller: true
> +  '#gpio-cells':
> +    Description: Specifying the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +  gpio-ranges:
> +    Description: Documentation/devicetree/bindings/gpio/gpio.txt
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    Description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    Properties:
> +      pins:
> +        allOf:
> +          $ref: /schemas/types.yaml#/definitions/string
> +          enum:
> +            gpio0-gpio80
> +            sdc1_clk
> +            sdc1_cmd
> +            sdc1_data
> +            sdc2_clk
> +            sdc2_cmd
> +            sdc2_data
> +            qdsd_cmd
> +            qdsd_data0
> +            qdsd_data1
> +            qdsd_data2
> +            qdsd_data3
> +        Description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +
> +      function:
> +        allOf:
> +          $ref: /schemas/types.yaml#/definitions/string
> +          enum:
> +            adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char,
> +            atest_char0, atest_char1, atest_char2, atest_char3, atest_combodac,
> +            atest_gpsadc0, atest_gpsadc1, atest_tsens, atest_wlan0,
> +            atest_wlan1, backlight_en, bimc_dte0, bimc_dte1, blsp_i2c1,
> +            blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_i2c5, blsp_i2c6,  blsp_spi1,
> +            blsp_spi1_cs1, blsp_spi1_cs2, blsp_spi1_cs3, blsp_spi2,
> +            blsp_spi2_cs1, blsp_spi2_cs2, blsp_spi2_cs3, blsp_spi3,
> +            blsp_spi3_cs1, blsp_spi3_cs2, blsp_spi3_cs3, blsp_spi4, blsp_spi5,
> +            blsp_spi6, blsp_uart1, blsp_uart2, blsp_uim1, blsp_uim2, cam1_rst,
> +            cam1_standby, cam_mclk0, cam_mclk1, cci_async, cci_i2c, cci_timer0,
> +            cci_timer1, cci_timer2, cdc_pdm0, codec_mad, dbg_out, display_5v,
> +            dmic0_clk, dmic0_data, dsi_rst, ebi0_wrcdc, euro_us, ext_lpass,
> +            flash_strobe, gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a,
> +            gcc_gp2_clk_b, gcc_gp3_clk_a, gcc_gp3_clk_b, gpio, gsm0_tx0,
> +            gsm0_tx1, gsm1_tx0, gsm1_tx1, gyro_accl, kpsns0, kpsns1, kpsns2,
> +            ldo_en, ldo_update, mag_int, mdp_vsync, modem_tsync, m_voc,
> +            nav_pps, nav_tsync, pa_indicator, pbs0, pbs1, pbs2, pri_mi2s,
> +            pri_mi2s_ws, prng_rosc, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
> +            pwr_modem_enabled_a,  pwr_modem_enabled_b, pwr_nav_enabled_a,
> +            pwr_nav_enabled_b, qdss_ctitrig_in_a0, qdss_ctitrig_in_a1,
> +            qdss_ctitrig_in_b0, qdss_ctitrig_in_b1, qdss_ctitrig_out_a0,
> +            qdss_ctitrig_out_a1, qdss_ctitrig_out_b0, qdss_ctitrig_out_b1,
> +            qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
> +            qdss_tracedata_a, qdss_tracedata_b, reset_n, sd_card, sd_write,
> +            sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2, uim3,
> +            uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst
> +        Description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +      bias-disable:

Is there any way to inherit these from some common definition?

> +        type: boolean
> +        Description:
> +          The specified pins should be configured as no pull.
> +      bias-pull-down:
> +        type: boolean
> +        Description:
> +          The specified pins should be configured as pull down.
> +      bias-pull-up:
> +        type: boolean
> +        Description:
> +          The specified pins should be configured as pull up.
> +      output-high:
> +        type: boolean
> +        Description:
> +          The specified pins are configured in output mode, driven high.
> +          This option is not available for sdc pins.
> +      output-low:
> +        type: boolean
> +        Description:
> +          The specified pins are configured in output mode, driven low.
> +          This option is not available for sdc pins.
> +      drive-strength:
> +        allOf:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        Description:
> +          elects the drive strength for the specified pins, in mA.

Selects?

> +
> +    required:
> +      - pins
> +      - function
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
> +example:
> +        tlmm: pinctrl@1000000 {
> +                compatible = "qcom,ipq6018-pinctrl";
> +                reg = <0x1000000 0x300000>;
> +                interrupts = <0 208 0>;

<GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>

> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +
> +                uart_pins: uart_pins {

s/_/- in the node name.

> +                        mux {
> +                                pins = "gpio4", "gpio5";
> +                                function = "blsp_uart2";

Duplicate the function definition in tx and rx and drop the "mux" node.

Regards,
Bjorn

> +                        };
> +
> +                        tx {
> +                                pins = "gpio4";
> +                                drive-strength = <4>;
> +                                bias-disable;
> +                        };
> +
> +                        rx {
> +                                pins = "gpio5";
> +                                drive-strength = <2>;
> +                                bias-pull-up;
> +                        };
> +                };
> +        };
> -- 
> 1.9.1
