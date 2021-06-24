Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A14D3B3680
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 21:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbhFXTEL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 15:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbhFXTEK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 15:04:10 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F8AC061766
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jun 2021 12:01:50 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so6703151ota.4
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jun 2021 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=niCJas6DLKYQ2aRdEe9ef7yZyU9hP5wpZvDJtvC0Zfw=;
        b=JFgdAv/Vghn65RudbuJtZe0WSoMp5z9gp8dgd1PkJOw/ZzTiMkrIWIv0EH03x+SIkY
         B7nh/Z7QOUBTshACf3w9CzENnoO1F04STqdvQewvqM1K4Uhby9P7cJL6LYwfUatt01Rp
         Re/e0QiqvmCrSweuO7J30L7FLhAT2wG87tC7q789iFx3SyOV9tWCN3ohoDwuylUcRNCf
         4TlSLQqcnNSCfWuh4w/AjwzA0SFCevl02EnyM/ACnxCkT7Kajnt77lEf41GAeNRyYUTB
         mA9SnpIhobvaYJB/Ukr/Fbq0YWh1HE4w88Qa8KKBmYAIj06ItLIa93xWu5CQ2pCX35tg
         VnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=niCJas6DLKYQ2aRdEe9ef7yZyU9hP5wpZvDJtvC0Zfw=;
        b=DSVec+YWAOi4lplLuSIuhXdbJbzOyDmtlVUHWqoYtcGjhv3TXcm+pciSQUcVERI++G
         rIhuUZ77cUxevvIxedy1qGddlNMUxmMu6JHStOtUYGRzCnEr5XhrJYDta4pW1MPT/4XW
         5DNOnfDTeLSrYFqNuFKg7v2NNfdIcDsRMtGXmK5OK9KXSa0BjgIR97H+BK6EBnrgFuni
         DOE08OR5w1gQuPy2hTQT14dW/a3PgfKPpmjJ3wz5AVlIC7Rfp7B/Pbcbo20SuEjkNEvg
         D94CjZnfnxYflGMuttCXpSZIe4ZPdkLYW+Ev5MBVmnjjG7cJ1QSO8r9AcwCAOCHOUZ/r
         nwaw==
X-Gm-Message-State: AOAM532qoAGzsVhPWPugFLWC10wisVvMX2k06nbqcZEiV29rI2jWayNp
        Rj28s/ROOIyYysSnFPBuHMkxyA==
X-Google-Smtp-Source: ABdhPJwNRLa5BzfvWSWwXXa9RsJN+K766evyrPB+27whsst0ko7CEOu+X9m7lixSuMQGzjMiolB8WQ==
X-Received: by 2002:a9d:a09:: with SMTP id 9mr6003334otg.126.1624561309069;
        Thu, 24 Jun 2021 12:01:49 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h11sm805451oov.8.2021.06.24.12.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 12:01:48 -0700 (PDT)
Date:   Thu, 24 Jun 2021 14:01:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: qcom: Add SM6115 pinctrl
 bindings
Message-ID: <YNTWmpqq1UGv+7pY@yoga>
References: <20210622201054.532979-1-iskren.chernev@gmail.com>
 <20210622201054.532979-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622201054.532979-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 22 Jun 15:10 CDT 2021, Iskren Chernev wrote:

> Add device tree binding Documentation details for Qualcomm SM6115 and
> SM4250 pinctrl.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
> new file mode 100644
> index 000000000000..461edb7c5a1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SM6115, SM4250 TLMM block
> +
> +maintainers:
> +  - Iskren Chernev <iskren.chernev@gmail.com>
> +
> +description: |

The '|' denotes that you want to keep the formatting, but there's no
need for that in your description.

> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  SM6115 and SM4250 platforms.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm4250-tlmm
> +      - qcom,sm6115-tlmm
> +
> +  reg:
> +    minItems: 3
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: "west"
> +      - const: "south"
> +      - const: "east"
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

This doesn't cover the ability to define pinctrl state both in immediate
nodes and nested one level down. So please mimic how this is done in

Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml

> +      properties:
> +        pins:
> +          description:
> +            List of gpio pins affected by the properties specified in this
> +            subnode.
> +          items:
> +            oneOf:
> +              - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"

This says that gpio0-9, gpio10-99 and gpio100-179 are valid, but the
driver only presents gpio0-112, so this should be:

^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-2]$

> +              - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data,
> +                        sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
> +          minItems: 1
> +          maxItems: 36
> +
> +        function:
> +          description:
> +            Specify the alternative function to be configured for the specified
> +            pins.
> +
> +          enum: [ qup0, gpio, ddr_bist, phase_flag0, qdss_gpio8, atest_tsens,
> +                  mpm_pwr, m_voc, phase_flag1, qdss_gpio9, atest_tsens2,
> +                  phase_flag2, qdss_gpio10, dac_calib0, atest_usb10,
> +                  phase_flag3, qdss_gpio11, dac_calib1, atest_usb11, qup1,
> +                  cri_trng0, phase_flag4, dac_calib2, atest_usb12, cri_trng1,
> +                  phase_flag5, dac_calib3, atest_usb13, qup2, phase_flag6,
> +                  dac_calib4, atest_usb1, qup3, pbs_out, pll_bist, qdss_gpio,
> +                  tsense_pwm, agera_pll, pbs0, qdss_gpio0, pbs1, qdss_gpio1,
> +                  qup4, tgu_ch0, tgu_ch1, qup5, tgu_ch2, phase_flag7,
> +                  qdss_gpio4, dac_calib5, tgu_ch3, phase_flag8, qdss_gpio5,
> +                  dac_calib6, phase_flag9, qdss_gpio6, dac_calib7,
> +                  phase_flag10, qdss_gpio7, dac_calib8, sdc2_tb, cri_trng,
> +                  pbs2, qdss_gpio2, sdc1_tb, pbs3, qdss_gpio3, cam_mclk, pbs4,
> +                  adsp_ext, pbs5, cci_i2c, prng_rosc, pbs6, phase_flag11,
> +                  dac_calib9, atest_usb20, pbs7, phase_flag12, dac_calib10,
> +                  atest_usb21, cci_timer1, gcc_gp1, pbs8, phase_flag13,
> +                  dac_calib11, atest_usb22, cci_async, cci_timer0, pbs9,
> +                  phase_flag14, dac_calib12, atest_usb23, pbs10, phase_flag15,
> +                  dac_calib13, atest_usb2, vsense_trigger, qdss_cti,
> +                  cci_timer2, phase_flag16, dac_calib14, atest_char,
> +                  phase_flag17, dac_calib15, atest_char0, gp_pdm0,
> +                  phase_flag18, dac_calib16, atest_char1, cci_timer3, gp_pdm1,
> +                  phase_flag19, dac_calib17, atest_char2, gp_pdm2,
> +                  phase_flag20, dac_calib18, atest_char3, phase_flag21,
> +                  phase_flag22, nav_gpio, phase_flag23, phase_flag24,
> +                  phase_flag25, pbs14, qdss_gpio14, vfr_1, pbs15, qdss_gpio15,
> +                  pa_indicator, gsm1_tx, ssbi_wtr1, pll_bypassnl, pll_reset,
> +                  phase_flag26, ddr_pxi0, gsm0_tx, phase_flag27, gcc_gp2,
> +                  qdss_gpio12, ddr_pxi1, gcc_gp3, qdss_gpio13, dbg_out,
> +                  uim2_data, uim2_clk, uim2_reset, uim2_present, uim1_data,
> +                  uim1_clk, uim1_reset, uim1_present, dac_calib19, mdp_vsync,
> +                  mdp_vsync_out_0, mdp_vsync_out_1, dac_calib20, dac_calib21,
> +                  atest_bbrx1, pbs11, usb_phy, atest_bbrx0, mss_lte, pbs12,
> +                  pbs13, wlan1_adc0, wlan1_adc1, sd_write, jitter_bist,
> +                  atest_gpsadc_dtest0_native, atest_gpsadc_dtest1_native,
> +                  phase_flag28, dac_calib22, ddr_pxi2, phase_flag29,
> +                  dac_calib23, phase_flag30, dac_calib24, ddr_pxi3,
> +                  phase_flag31, dac_calib25 ]
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
> +        pinctrl@500000 {
> +                compatible = "qcom,sm4250-tlmm";
> +                reg = <0x500000 0x400000>,
> +                        <0x900000 0x400000>,
> +                        <0xd00000 0x400000>;
> +                reg-names = "west", "south", "east";
> +                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 121>;

You only have 114 (113 GPIOs + UFS_RESET) gpios.

Doesn't the &tlmm need to be defined in the example as well?

> +                wakeup-parent = <&intc>;

The wakeup-parent should most likely be &pdc, but feel free to omit
"wakup-parent" from the example if that helps.

Regards,
Bjorn

> +        }
> +
> -- 
> 2.31.1
> 
