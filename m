Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925A24155D7
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 05:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238973AbhIWDOG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 23:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239015AbhIWDOC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 23:14:02 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DACC061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 20:12:31 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w206so7720141oiw.4
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 20:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W/Ez8scEz6/K5eNZimYSZZsXj3bWHo8bMYwOs77bLjw=;
        b=gBCG3Y+roiTJ/VSQ5e85qQy++BzCQcYk/U7tvn346ohUMK4ddVmV7OIwd8v72kyQqT
         D3y/UuMnOIwcSe+JIljcO+iejjshkQpu5SDVRkCgKUoSRMGz09kVaIoOiuZSU4ti2dbL
         9bygLMgplxeHqd4QoC1t/WQHZ33IjJI2QiZYIDJPgEFLkCYlwjjXmUlqnRddfEp9nNFT
         wVCf85KZLO7aiZ3ztrdoO6ssJj9GWjZ4WbpYvFz/9abzFlsJ4xU2gCyzv+Y+UaK/5loi
         H3Ucq1qHJ2bEBQn4RKueG6SHAU+azEwm6rjRQIbFFfevoI8F+xuGOdHiLIjc1iVuMtLd
         3v3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W/Ez8scEz6/K5eNZimYSZZsXj3bWHo8bMYwOs77bLjw=;
        b=WgTZHCCNFJoFG9qYjJQ3RSb7W0ZYgjLr0BOUeTKBeaNpzeUEgE8922RdxpMOn3dIRS
         hZ80NLsoZRbUowCqDpV538VR+4xQU+gpnK5bI3aEO3cRdlq6wuAbjYwdkLJUhhxFjr+Z
         /wWmGQJ9/fFxY/VvYYon3i4Y3VWd2Ci2T7MEmBe6ITeUhKw2RGwaoI4/RIuR+btKGddS
         8N/Q8eec10NIY8VWX4+gpJ5dgpnG5dlse9jsIxIZCIsQ8rESn1CkjGkiGapiviZ0gQhz
         W64B4ah6jrjVkcxfvkgfURrc973ux79wDtjtNL5T1mB29imClCxNDucVHb1Fpu7MSeMy
         N2Qg==
X-Gm-Message-State: AOAM533yGDk4xvi98qhcu0wSKdFZiGrhddTx8Ny1jdHOMs1RcpEXQeS7
        1bx67W9o98qBtJFSE3Wj/pJ5sA==
X-Google-Smtp-Source: ABdhPJxmUyPBV0fs8n3TPS/s0zyQOrZZj4hTOEnmtPkqh4H6GhLYCfcLrOD8kh0CLslETG1Vv2LQdg==
X-Received: by 2002:a54:4383:: with SMTP id u3mr10604350oiv.149.1632366750822;
        Wed, 22 Sep 2021 20:12:30 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r31sm955087otv.45.2021.09.22.20.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 20:12:30 -0700 (PDT)
Date:   Wed, 22 Sep 2021 22:12:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl
 bindings
Message-ID: <YUvwnOncE54n821z@yoga>
References: <20210923030102.29148-1-shawn.guo@linaro.org>
 <20210923030102.29148-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923030102.29148-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 22 Sep 22:01 CDT 2021, Shawn Guo wrote:

> Add device tree bindings for QCM2290 pinctrl.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../pinctrl/qcom,qcm2290-pinctrl.yaml         | 186 ++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
> new file mode 100644
> index 000000000000..714ec245aa7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
> @@ -0,0 +1,186 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,qcm2290-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. QCM2290 TLMM block
> +
> +maintainers:
> +  - Shawn Guo <shawn.guo@linaro.org>
> +
> +description:
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  QCM2290 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-tlmm
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
> +  '-state$':
> +    oneOf:
> +      - $ref: "#/$defs/qcom-qcm2290-tlmm-state"
> +      - patternProperties:
> +          ".*":
> +            $ref: "#/$defs/qcom-qcm2290-tlmm-state"
> +
> +'$defs':
> +  qcom-qcm2290-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-9]|12[0-6])$"
> +            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data,
> +                      sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +        enum: [ qup0, gpio, ddr_bist, phase_flag0, qdss_gpio8, atest_tsens,
> +                mpm_pwr, m_voc, phase_flag1, qdss_gpio9, atest_tsens2,
> +                phase_flag2, qdss_gpio10, dac_calib0, atest_usb10, phase_flag3,
> +                qdss_gpio11, dac_calib1, atest_usb11, qup1, CRI_TRNG0,
> +                phase_flag4, dac_calib2, atest_usb12, CRI_TRNG1, phase_flag5,
> +                dac_calib3, atest_usb13, qup2, phase_flag6, dac_calib4,
> +                atest_usb1, qup3, pbs_out, PLL_BIST, qdss_gpio, tsense_pwm,
> +                AGERA_PLL, pbs0, qdss_gpio0, pbs1, qdss_gpio1, qup4, tgu_ch0,
> +                tgu_ch1, qup5, tgu_ch2, phase_flag7, qdss_gpio4, dac_calib5,
> +                tgu_ch3, phase_flag8, qdss_gpio5, dac_calib6, phase_flag9,
> +                qdss_gpio6, dac_calib7, phase_flag10, qdss_gpio7, dac_calib8,
> +                SDC2_TB, CRI_TRNG, pbs2, qdss_gpio2, pwm_0, SDC1_TB, pbs3,
> +                qdss_gpio3, cam_mclk, pbs4, adsp_ext, pbs5, cci_i2c, prng_rosc,
> +                pbs6, phase_flag11, dac_calib9, atest_usb20, pbs7, phase_flag12,
> +                dac_calib10, atest_usb21, CCI_TIMER1, GCC_GP1, pbs8,
> +                phase_flag13, dac_calib11, atest_usb22, cci_async, CCI_TIMER0,
> +                pbs9, phase_flag14, dac_calib12, atest_usb23, pbs10,
> +                phase_flag15, dac_calib13, atest_usb2, vsense_trigger, qdss_cti,
> +                CCI_TIMER2, pwm_1, phase_flag16, dac_calib14, atest_char,
> +                phase_flag17, dac_calib15, atest_char0, GP_PDM0, phase_flag18,
> +                dac_calib16, atest_char1, CCI_TIMER3, GP_PDM1, phase_flag19,
> +                dac_calib17, atest_char2, GP_PDM2, phase_flag20, dac_calib18,
> +                atest_char3, phase_flag21, phase_flag22, char_exec, NAV_GPIO,
> +                phase_flag23, phase_flag24, phase_flag25, pbs14, qdss_gpio14,
> +                vfr_1, pbs15, qdss_gpio15, PA_INDICATOR, pwm_2, gsm1_tx,
> +                SSBI_WTR1, pll_bypassnl, pll_reset, phase_flag26, ddr_pxi0,
> +                gsm0_tx, phase_flag27, GCC_GP2, qdss_gpio12, ddr_pxi1, GCC_GP3,
> +                qdss_gpio13, dbg_out, uim2_data, pwm_3, uim2_clk, uim2_reset,
> +                pwm_4, uim2_present, pwm_5, uim1_data, uim1_clk, uim1_reset,
> +                uim1_present, dac_calib19, mdp_vsync, mdp_vsync_out_0,
> +                mdp_vsync_out_1, dac_calib20, dac_calib21, pwm_6, atest_bbrx1,
> +                pbs11, usb_phy, atest_bbrx0, pwm_7, mss_lte, pbs12, pbs13,
> +                wlan1_adc0, wlan1_adc1, sd_write, JITTER_BIST,
> +                atest_gpsadc_dtest0_native, atest_gpsadc_dtest1_native,
> +                phase_flag28, dac_calib22, ddr_pxi2, phase_flag29, dac_calib23,
> +                phase_flag30, dac_calib24, ddr_pxi3, pwm_8, phase_flag31,
> +                dac_calib25, pwm_9 ]

I'm afraid that you forgot to update this list when you squashed the
functions in the driver.

Regards,
Bjorn
