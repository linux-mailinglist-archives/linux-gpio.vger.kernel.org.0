Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA68B3A6E0E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 20:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhFNSP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 14:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233591AbhFNSP7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 14:15:59 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD2BC0617AF
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 11:13:55 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id p5-20020a9d45450000b029043ee61dce6bso4627975oti.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 11:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KZcI66KL4lUhqfIFr7hbANO1TAmLEs4hR8w3wCiBRWY=;
        b=XUiXOd3te7lw0QLcaVsO3oxZTbl2Mm58M8pzLBLdfb1dj6S027RBO+LUxcbixkaTaj
         jLTtF5FfESIXMr2AUFZEx9HjbRmv+AJ0OvguausTfDzXVSavPkfqFJqEJ0fVy9dHONmh
         7aYalR5fNJe/Ba5x+a0R54JBCh26v5aAR+qJ09r4QuAfQaX0MkVYqohsoDIQz/KP3G8b
         GRjB4JCAHI/kLPDFsfZmgPdXLLPqXGsczxPoUSbzmCYD9sf3Xe7vaFgfgC7nwa5lp2e7
         oO+kz2FqGE0JTwO2vunIURRLvW5shebJi5DsC+RFS9QbQGse7H0xdFMCnF8hWe3SpMYL
         jkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KZcI66KL4lUhqfIFr7hbANO1TAmLEs4hR8w3wCiBRWY=;
        b=ZOp6LiPEvVueviBe7XGWUPngONSrv4ZQO5tmjTo/zQnUT0/jAQtY80JHBuS6M54hxE
         tVY4dUZkyUILfOpaehtuusZy6QzRzBnP3Yz6jojmvlWt/b0WkBr8EwhM/HovujEgsEZC
         WWU5pYTOOzY2YP7HERSiYi4CM0ahvPLhmrzOpm6N8F/u+SOPdB0ni/zPtSAkQJhk4iSY
         4f12Lt9PxQEPpHufaELZEQIY2/vj/Yw1svzvPkqaBSVgtbv3kK3FfMtBeHKl+SBcTvz6
         HJYqbzCqB5gKMtJ0Vlr6FToA4zP70Qmbcc69utkD77cz+kID2LYJ3mnN8LRUkWqgSfIU
         e7yw==
X-Gm-Message-State: AOAM533o7YGWTOVkE9xj80q5tAYIpGrlRlnLgKGpbhnfYSmqCPmMnJ6h
        h7wx9vDqnXOjXai1BdJl5b5cUg==
X-Google-Smtp-Source: ABdhPJzZED/JII+jDYq37ukybZgc2XEeI3z1G7ZyIW6hwwHcBOXUnbVQWq/qD3F0VaLGwk2qN0BNgg==
X-Received: by 2002:a9d:65cf:: with SMTP id z15mr14722316oth.250.1623694435290;
        Mon, 14 Jun 2021 11:13:55 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m18sm3460119otr.61.2021.06.14.11.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 11:13:54 -0700 (PDT)
Date:   Mon, 14 Jun 2021 13:13:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 1/2] dt-bindings: pinctrl: qcom: sm6125: Document
 SM6125 pinctrl driver
Message-ID: <YMecYELkzbAYGuSk@yoga>
References: <20210614172713.558192-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614172713.558192-1-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 14 Jun 12:27 CDT 2021, Martin Botka wrote:

> Document the newly added SM6125 pinctrl driver
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> Changes in V2:
> Add commit description
> Changes in V3:
> Fix syntax errors
> Remove not needed state from example
> Changes in V4:
> maxItems set to 3
> Correct the pattern
> Remove deleted enums
> Fix the compatible
> Changes in V5:
> Add reg-names and make them required
> Add minItems to reg
>  .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> new file mode 100644
> index 000000000000..5f7adaa81f83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> @@ -0,0 +1,132 @@
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
> +    minItems: 3
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: "west"
> +      - const: "south"
> +      - const: "east"
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
> +  - reg-names
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
> +            - pattern: "^gpio[0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-2]$"
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
> +                nav_pps, pa_indicator, phase_flag, pll_bist, pll_bypassnl, pll_reset,
> +                pri_mi2s, pri_mi2s_ws, prng_rosc, qca_sb, qdss_cti, qdss, qlink_enable,
> +                qlink_request, qua_mi2s, qui_mi2s, qup00, qup01, qup02, qup03, qup04,
> +                qup10, qup11, qup12, qup13, qup14, sd_write, sec_mi2s, sp_cmu, swr_rx,
> +                swr_tx, ter_mi2s, tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3, tsense_pwm,
> +                uim1_clk, uim1_data, uim1_present, uim1_reset, uim2_clk, uim2_data,
> +                uim2_present, uim2_reset, unused1, unused2, usb_phy, vfr_1, vsense_trigger,
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
> +        pinctrl@500000 {
> +                compatible = "qcom,sm6125-tlmm";
> +                reg = <0x00500000 0x400000>,
> +                    <0x00900000 0x400000>,
> +                    <0x00d00000 0x400000>;
> +                reg-names = "west", "south", "east";
> +                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +                gpio-controller;
> +                gpio-ranges = <&tlmm 0 0 134>;
> +                #gpio-cells = <2>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +        };
> -- 
> 2.31.1
> 
