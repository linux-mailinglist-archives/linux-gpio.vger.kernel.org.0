Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134052853CE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 23:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgJFVWi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 17:22:38 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38662 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgJFVWh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 17:22:37 -0400
Received: by mail-oi1-f194.google.com with SMTP id 26so134868ois.5;
        Tue, 06 Oct 2020 14:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pASNyciRlJQ+q1SzlU48duaPR4kwkXsTon5RTlA14jM=;
        b=ZouZg3/bUTt+zUBi3sShwB9nyjdUhGhEtM4zp7HcnIOFNTIVTq99cjTzE9ZnQO0xmt
         +Cke6dvxFiyCqH9zfIajMVR2kAEEhwb0zPUZEkffnwO83g8W6JqxdcXlqM/3EfealK7x
         1qvhrBpHq3yXXtAKibhu3TamUNj4fdQhXfXrpQCRNmc0rwmBotJLERCPllZgMq+PVZLh
         DPy5uu5NyOXdZk0nuktoWEKlH5lHOd+3FgHL4dP5ch3BvupHXTqAXOY61FrFfCgtJbAB
         Erz8aEU1JLPW8vRlrxxrTLWDmA8qB15dLg/VPqtJxpzN3OLxWoxh6bIAqP2uPO+TfKDx
         5vFg==
X-Gm-Message-State: AOAM533PYwfCiGsgvdY38+w86rwU+TaJxoKCLCuRz1AvPtUdVabB5/4z
        WnUjrB1rMj3FLZ7D8ltqhSudFBMnew8J
X-Google-Smtp-Source: ABdhPJwRbbc/2hD4U7BeLiJcL89GybUd1U3xNfN+SBpnmP60+6EL6BYBiite05NMzOXUMvCHt+iieQ==
X-Received: by 2002:aca:5b45:: with SMTP id p66mr152878oib.39.1602019356282;
        Tue, 06 Oct 2020 14:22:36 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l15sm27113oil.24.2020.10.06.14.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 14:22:35 -0700 (PDT)
Received: (nullmailer pid 2866684 invoked by uid 1000);
        Tue, 06 Oct 2020 21:22:34 -0000
Date:   Tue, 6 Oct 2020 16:22:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Lypak <junak.pub@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: qcom: add msm8953 pinctrl
 bindings
Message-ID: <20201006212234.GA2858909@bogus>
References: <20201004081644.323858-1-junak.pub@gmail.com>
 <20201004081644.323858-2-junak.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004081644.323858-2-junak.pub@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 04, 2020 at 11:16:44AM +0300, Vladimir Lypak wrote:
> Add device tree bindings documentation for Qualcomm MSM8953
> pinctrl driver.
> 
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> ---
>  .../pinctrl/qcom,msm8953-pinctrl.yaml         | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
> new file mode 100644
> index 000000000000..e539149834b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,msm8953-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. MSM8953 TLMM block
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  MSM8953 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8953-pinctrl
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
> +  '^.*$':
> +    if:
> +      type: object
> +    then:

For new bindings, please define a node name pattern you can match on 
and avoid this if/then. '-pins$' is my preference.

> +      properties:
> +        pins:
> +          description:
> +            List of gpio pins affected by the properties specified in this
> +            subnode.
> +          items:
> +            oneOf:
> +              - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
> +              - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk,
> +                        sdc2_cmd, sdc2_data, qdsd_clk, qdsd_cmd, qdsd_data0,
> +                        qdsd_data1, qdsd_data2, qdsd_data3 ]
> +          minItems: 1
> +          maxItems: 16
> +
> +        function:
> +          description:
> +            Specify the alternative function to be configured for the specified
> +            pins.
> +
> +          enum: [ accel_int, adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1,
> +                  atest_char, atest_char0, atest_char1, atest_char2, atest_char3,
> +                  atest_gpsadc_dtest0_native, atest_gpsadc_dtest1_native, atest_tsens,
> +                  atest_wlan0, atest_wlan1, bimc_dte0, bimc_dte1, blsp1_spi,
> +                  blsp3_spi, blsp6_spi, blsp7_spi, blsp_i2c1, blsp_i2c2, blsp_i2c3,
> +                  blsp_i2c4, blsp_i2c5, blsp_i2c6, blsp_i2c7, blsp_i2c8, blsp_spi1,
> +                  blsp_spi2, blsp_spi3, blsp_spi4, blsp_spi5, blsp_spi6, blsp_spi7,
> +                  blsp_spi8, blsp_uart2, blsp_uart4, blsp_uart5, blsp_uart6, cam0_ldo,
> +                  cam1_ldo, cam1_rst, cam1_standby, cam2_rst, cam2_standby, cam3_rst,
> +                  cam3_standby, cam_irq, cam_mclk, cap_int, cci_async, cci_i2c,
> +                  cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
> +                  cdc_pdm0, codec_int1, codec_int2, codec_reset, cri_trng, cri_trng0,
> +                  cri_trng1, dac_calib0, dac_calib1, dac_calib10, dac_calib11,
> +                  dac_calib12, dac_calib13, dac_calib14, dac_calib15, dac_calib16,
> +                  dac_calib17, dac_calib18, dac_calib19, dac_calib2, dac_calib20,
> +                  dac_calib21, dac_calib22, dac_calib23, dac_calib24, dac_calib25,
> +                  dac_calib3, dac_calib4, dac_calib5, dac_calib6, dac_calib7,
> +                  dac_calib8, dac_calib9, dbg_out, ddr_bist, dmic0_clk, dmic0_data,
> +                  ebi_cdc, ebi_ch0, ext_lpass, flash_strobe, fp_int, gcc_gp1_clk_a,
> +                  gcc_gp1_clk_b, gcc_gp2_clk_a, gcc_gp2_clk_b, gcc_gp3_clk_a,
> +                  gcc_gp3_clk_b, gcc_plltest, gcc_tlmm, gpio, gsm0_tx, gsm1_tx,
> +                  gyro_int, hall_int, hdmi_int, key_focus, key_home, key_snapshot,
> +                  key_volp, ldo_en, ldo_update, lpass_slimbus, lpass_slimbus0,
> +                  lpass_slimbus1, m_voc, mag_int, mdp_vsync, mipi_dsi0, modem_tsync,
> +                  mss_lte, nav_pps, nav_pps_in_a, nav_pps_in_b, nav_tsync,
> +                  nfc_disable, nfc_dwl, nfc_irq, ois_sync, pa_indicator, pbs0, pbs1,
> +                  pbs2, pressure_int, pri_mi2s, pri_mi2s_mclk_a, pri_mi2s_mclk_b,
> +                  pri_mi2s_ws, prng_rosc, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
> +                  pwr_down, pwr_modem_enabled_a, pwr_modem_enabled_b,
> +                  pwr_nav_enabled_a, pwr_nav_enabled_b, qdss_cti_trig_in_a0,
> +                  qdss_cti_trig_in_a1, qdss_cti_trig_in_b0, qdss_cti_trig_in_b1,
> +                  qdss_cti_trig_out_a0, qdss_cti_trig_out_a1, qdss_cti_trig_out_b0,
> +                  qdss_cti_trig_out_b1, qdss_traceclk_a, qdss_traceclk_b,
> +                  qdss_tracectl_a, qdss_tracectl_b, qdss_tracedata_a,
> +                  qdss_tracedata_b, sd_write, sdcard_det, sec_mi2s, sec_mi2s_mclk_a,
> +                  sec_mi2s_mclk_b, smb_int, ss_switch, ssbi_wtr1, ts_resout,
> +                  ts_sample, ts_xvdd, tsens_max, uim1_clk, uim1_data, uim1_present,
> +                  uim1_reset, uim2_clk, uim2_data, uim2_present, uim2_reset,
> +                  uim_batt, us_emitter, us_euro, wcss_bt, wcss_fm, wcss_wlan,
> +                  wcss_wlan0, wcss_wlan1, wcss_wlan2, wsa_en, wsa_io, wsa_irq ]
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
> +              compatible = "qcom,msm8953-pinctrl";
> +              reg = <0x01000000 0x300000>;
> +              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +              interrupt-controller;
> +              #interrupt-cells = <2>;
> +              gpio-controller;
> +              #gpio-cells = <2>;
> +              gpio-ranges = <&tlmm 0 0 142>;

Please show at least 1 child node.

> +        };
> -- 
> 2.24.1
> 
