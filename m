Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8B838F8FD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 05:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhEYDsN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 23:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhEYDsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 23:48:11 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721C2C06138B
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 20:46:42 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id c196so20849167oib.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 20:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rkip6OsUPI3I8CTwZcBPub2IUfOlyAw41NYyjDQ66L8=;
        b=IMWaz8QksQiE1gtKozdRYfDawPo/ppdmImUiEgzFMYumGASmb9io+rduCLABAtR0aD
         xNICoD8NEv9c5YZ4G9mnOeXAAfJke+opO1sO0sFNM01AKR/QJRW0nq238t2pAWoW/Tiu
         jLh1Uj2777WfG+qDYd2DmGCLNr7hA4pmdDVxTebVJHH1Q0TuORPec84Sf5ysxmed1zMA
         M3s4pgoY3j/R7r5JuIyT2sN12TkoOPQl3huKkoqSeuRZGid7N6j56ylM/EkgZMz3PIz9
         tJ5Ziv7baKIKSgu0zM2MJzBGwlmz71je396Z0Bjj/KJ2a6FcU4gmHXEyPDlvg+p8dxM2
         8zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rkip6OsUPI3I8CTwZcBPub2IUfOlyAw41NYyjDQ66L8=;
        b=K5AWLTCIGqqmkGWEZ/JUJstjUbWLzDXo4ulbq0n/AvzQLvhorHLa1lzjhW4OjCvzOf
         l7IRPuhCzUbckmbZKajEamBed5FtVhvTj862cBp3zDLCWs9sI1QoaW3s1fbt/kAvSWcQ
         PZ87vScIoSRBnG2pw9CuhoT+ersZyZ5MA9KgXHSnbSU2COgHyShUsW6TH8uBWiEuF4ZU
         84c/htXnmFLAEp6aFMDpiCl5YMDAAlBPEdV7osJpB+WvySDgVMUUxDZB3OprceVk0BAl
         wjJLlbf9hVYJ94hE4MVRA/DSa6lVueaJGHBQBDcND6QNQVc8WzA0YsV8d9WQnnIfmq2L
         zfTw==
X-Gm-Message-State: AOAM532ooNSV4jePaFLK23aR46mQQ+TrGcYkoFso/MwaNzGB+BpW2w1P
        JKmOvTokVCF9921Tm+eJNMwXfA==
X-Google-Smtp-Source: ABdhPJzJ9wJWN3VBtOUv9zId5HPybHW8DRseEbik6TuCFZbeWdGyctV9tYlORyrgvC0FP2jwwwRn3w==
X-Received: by 2002:aca:6207:: with SMTP id w7mr1475803oib.177.1621914401724;
        Mon, 24 May 2021 20:46:41 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p3sm3218135oov.2.2021.05.24.20.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:46:41 -0700 (PDT)
Date:   Mon, 24 May 2021 22:46:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: pinctrl: qcom: sm6125: Document
 SM6125 pinctrl driver
Message-ID: <YKxzH1TS00/2tjlP@yoga>
References: <20210523211809.734107-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210523211809.734107-1-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun 23 May 16:18 CDT 2021, Martin Botka wrote:

> Document the newly added SM6125 pinctrl driver
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add commit description
>  .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> new file mode 100644
> index 000000000000..951348953c11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm6125-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +title: Qualcomm Technologies, Inc. SM6125 TLMM block
> +
> +maintainers:
> +  - Martin Botka <martin.botka@somainline.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer (TLMM) block found
> +  in the SM6125 platform.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm6125-tlmm
> +
> +  reg:
> +    maxItems: 1

Driver (and example) defines 3 tiles.

> +
> +  interrupts: true
> +  interrupt-controller: true
> +  '#interrupt-cells': true
> +  gpio-controller: true
> +  gpio-reserved-ranges: true
> +  '#gpio-cells': true
> +  gpio-ranges: true
> +  wakeup-parent: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  '-state$':
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sm6125-tlmm-state"
> +      - patternProperties:
> +          ".*":
> +            $ref: "#/$defs/qcom-sm6125-tlmm-state"
> +
> +$defs:
> +  qcom-sm6125-tlmm-state:
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
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"

This pattern allows gpio0-9, gpio10-99, gpio100-199 and gpio200-203. I
think you're looking for something in line with:

"^gpio[0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-2]$"

> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +        enum: [ adsp_ext, agera_pll, atest_char, atest_char0, atest_char1,
> +                atest_char2, atest_char3, atest_tsens, atest_tsens2, atest_usb1,
> +                atest_usb10, atest_usb11, atest_usb12, atest_usb13, atest_usb2,
> +                atest_usb20, atest_usb21, atest_usb22, atest_usb23, aud_sb,
> +                audio_ref, cam_mclk, cci_async, cci_i2c, cci_timer0, cci_timer1,
> +                cci_timer2, cci_timer3, cci_timer4, copy_gp, copy_phase, cri_trng,
> +                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
> +                ddr_pxi2, ddr_pxi3, debug_hot, dmic0_clk, dmic0_data, dmic1_clk,
> +                dmic1_data, dp_hot, edp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
> +                gp_pdm0, gp_pdm1, gp_pdm2, gpio, gps_tx, jitter_bist, ldo_en,
> +                ldo_update, m_voc, mclk1, mclk2, mdp_vsync, mdp_vsync0, mdp_vsync1,
> +                mdp_vsync2, mdp_vsync3, mdp_vsync4, mdp_vsync5, mpm_pwr, mss_lte,
> +                nav_pps, pa_indicator, phase_flag0, phase_flag1, phase_flag10,
> +                phase_flag11, phase_flag12, phase_flag13, phase_flag14, phase_flag15,
> +                phase_flag16, phase_flag17, phase_flag18, phase_flag19, phase_flag2,
> +                phase_flag20, phase_flag21, phase_flag22, phase_flag23, phase_flag24,
> +                phase_flag25, phase_flag26, phase_flag27, phase_flag28, phase_flag29,
> +                phase_flag3, phase_flag30, phase_flag31, phase_flag4, phase_flag5,
> +                phase_flag6, phase_flag7, phase_flag8, phase_flag9, pll_bist,
> +                pll_bypassnl, pll_reset, pri_mi2s, pri_mi2s_ws, prng_rosc, qca_sb,
> +                qdss_cti, qdss_gpio, qdss_gpio0, qdss_gpio1, qdss_gpio10, qdss_gpio11,
> +                qdss_gpio12, qdss_gpio13, qdss_gpio14, qdss_gpio15, qdss_gpio2,
> +                qdss_gpio3, qdss_gpio4, qdss_gpio5, qdss_gpio6, qdss_gpio7, qdss_gpio8,
> +                qdss_gpio9, qlink_enable, qlink_request, qua_mi2s, qui_mi2s, qup00,
> +                qup01, qup02, qup03, qup04, qup10, qup11, qup12, qup13, qup14,
> +                sd_write, sec_mi2s, sp_cmu, swr_rx, swr_tx, ter_mi2s, tgu_ch0,
> +                tgu_ch1, tgu_ch2, tgu_ch3, tsense_pwm, uim1_clk, uim1_data,
> +                uim1_present, uim1_reset, uim2_clk, uim2_data, uim2_present,
> +                uim2_reset, unused1, unused2, usb_phy, vfr_1, vsense_trigger,
> +                wlan1_adc0, wlan1_adc1, wlan2_adc0, wlan2_adc1, wsa_clk, wsa_data ]
> +
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +      drive-strength: true
> +      input-enable: true
> +      output-high: true
> +      output-low: true
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +	pinctrl@500000 {
> +		compatible = "qcom,sm6125-pinctrl";

s/pinconf/tlmm/

> +		reg = <0x00500000 0x400000>,
> +			<0x00900000 0x400000>,
> +			<0x00d00000 0x400000>;
> +		reg-names = "west", "south", "east";
> +		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +		gpio-controller;
> +		gpio-ranges = <&tlmm 0 0 134>;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		sdc2_state_on: sdc2-on {

Per the binding the node name needs to end in "-state".

> +			pinconf-clk {

There's no risk of name collisions in the state, so you should drop the
"pinconf-" prefix.

Regards,
Bjorn

> +				pins = "sdc2_clk";
> +				bias-disable;
> +				drive-strength = <16>;
> +			};
> +
> +			pinconf-cmd {
> +				pins = "sdc2_cmd";
> +				bias-pull-up;
> +				drive-strength = <10>;
> +			};
> +
> +			pinconf-data {
> +				pins = "sdc2_data";
> +				bias-pull-up;
> +				drive-strength = <10>;
> +			};
> +
> +			pinconf-sd-cd {
> +				pins = "gpio98";
> +				bias-pull-up;
> +				drive-strength = <2>;
> +			};
> +		};
> +	};
> +...
> -- 
> 2.31.1
> 
