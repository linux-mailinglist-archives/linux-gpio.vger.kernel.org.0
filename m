Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77DC212FFD2
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2020 01:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgADA6i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 19:58:38 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:33600 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727190AbgADA6h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 19:58:37 -0500
Received: by mail-il1-f196.google.com with SMTP id v15so38076774iln.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2020 16:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6s7suD5k8r1P5lVpjFiz2sSeu2tVOfFmrag2vYJ1rvY=;
        b=ep7hCb7i4Dt1bnyNKBJxFBG05nORdxIg3Gcj7JLceUdItWc0VBvF8wNGRtxQRJXZvj
         piAyE94eJHjYq/oiSg7cmfbGE07r0Bu7J7kACDXhCnvFGqJ8TCxvouOL0iQUk13qpU89
         kub3F0eJ3ST+pRqVxan/tQQzQ/nVSurkRjz0Z0D/o4blhaAClsdyAUJlDxnuHnDTm4dQ
         r3IENeJ27B/wJW7ITn5ahvnI62LPM/RQnMehVKRYcrzGrf2QuVJJGJioNRSSuv50L0PC
         bStD84W52oIIb9Wdw2t0TTNWihYl0pDJJhBy3EcVB/IJkWVRroQN4mNTIk6uqki/8Zwg
         wfVQ==
X-Gm-Message-State: APjAAAWrmfLQfl7bf+e0vhEb2yT46LKURJ+HPmAt6kL5fXS3vJygBSh7
        mJddLZWPt8/fnwMwQnbzNiae9G8=
X-Google-Smtp-Source: APXvYqz2kksn9TNc49n9wTO1sQps3zfCdh9WLYhg54cvKGZw0leLIYajkOTHjDwtax5s0WJdMS2XPQ==
X-Received: by 2002:a92:ce09:: with SMTP id b9mr74564826ilo.219.1578099515904;
        Fri, 03 Jan 2020 16:58:35 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z21sm15317374ioj.21.2020.01.03.16.58.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:58:35 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:58:34 -0700
Date:   Fri, 3 Jan 2020 17:58:34 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH V3 1/5] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl
 bindings
Message-ID: <20200104005834.GA22707@bogus>
References: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
 <1578052177-6778-2-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578052177-6778-2-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 03, 2020 at 05:19:33PM +0530, Sricharan R wrote:
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
>  [v3] Fixed the example dt node, inherited properties
> 
>  .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     | 166 +++++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> new file mode 100644
> index 0000000..e959c5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> @@ -0,0 +1,166 @@
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

A blank line after each property schema is preferred.

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

Did you run 'make dt_binding_check' and is dt-schema up to date? This 
isn't valid json-schema which is case sensitive.

> +      pins:
> +        allOf:
> +          $ref: /schemas/types.yaml#/definitions/string

Also not valid as allOf is a list.

> +          enum:
> +            gpio0-gpio80

As is 'enum'...

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
> +        allOf:
> +          $ref: /schemas/pinctrl/pincfg-node.yaml

While you should have this reference, it is at the wrong level. The node 
needs to reference this schema, not the properties.

> +        Description:
> +          The specified pins should be configured as no pull.
> +      bias-pull-down:
> +        allOf:
> +          $ref: /schemas/pinctrl/pincfg-node.yaml
> +        Description:
> +          The specified pins should be configured as pull down.
> +      bias-pull-up:
> +        allOf:
> +          $ref: /schemas/pinctrl/pincfg-node.yaml
> +        Description:
> +          The specified pins should be configured as pull up.
> +      output-high:
> +        allOf:
> +          $ref: /schemas/pinctrl/pincfg-node.yaml
> +        Description:
> +          The specified pins are configured in output mode, driven high.
> +          This option is not available for sdc pins.
> +      output-low:
> +        allOf:
> +          $ref: /schemas/pinctrl/pincfg-node.yaml
> +        Description:
> +          The specified pins are configured in output mode, driven low.
> +          This option is not available for sdc pins.
> +      drive-strength:
> +        allOf:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        Description:
> +          Selects the drive strength for the specified pins, in mA.
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
> +                reg = <0x01000000 0x300000>;
> +                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-ranges = <&tlmm 0 80>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +
> +                serial_3_pins: serial3-pinmux {
> +                        pins = "gpio44", "gpio45";
> +                        function = "blsp2_uart";
> +                        drive-strength = <8>;
> +                        bias-pull-down;
> +                };
> +       };
> -- 
> 1.9.1
> 
