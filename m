Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78EDE5FF353
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 20:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiJNSC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 14:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbiJNSC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 14:02:56 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7C01ABED9
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 11:02:54 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id fy4so12150301ejc.5
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 11:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T+/D1P012qWvHFAy4QAtB2fbqrXGKXCn5DEIUoSp89I=;
        b=IlVrLWTEV+XHWXbb8UiA5j+4wqjHRgVtFEc59v01qcQ7tl3GwkvZmyKhPhRS8iM1No
         268o3+oOhRRMv5azpxeis99gATbyVURyhtJ4ABfrG+JN4gpm1q2N+h3k9lQbc7V4UCDt
         Dd9FIH6xSKQgNOd4xMO4u12IXg5UFACcXov6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+/D1P012qWvHFAy4QAtB2fbqrXGKXCn5DEIUoSp89I=;
        b=HaR09sQVpaDqPmln0080TXEyJLgG8Zv+JwjYWMsslb+ynbQqM2PnYBIcCpoLAe8LzV
         vanc/2/J9uOmONpDHWHSwA2x/tq+cs/gFe7I79SdnUm0g+srXeUBElmic2o7ELZ7b8Fo
         PEtOKOLEKylads/TjqmwJF84cxehcxYsOb1SFGzW5InAu6FOpuo6wrFTyLzy6+7JgQNm
         WmWlEYQdfqANCCfg9pCs1leIH9ZciKj7fAVuNBMoanV+POEuOCV65QXxeKrqcSku75E5
         RGXbAVoSH6UMSTATN+PrvkN6lK7uHpfXUBsSw6AU3EoWxR8IXDu4+HCMNO2s54XBzDiq
         UTxg==
X-Gm-Message-State: ACrzQf34TnahLaxXjCG8/jYTiSZgaV1sy3FmwAJ8AW47bnEExXKB7b//
        o3uMTbm0TKYOe7gebleRdIZFqIGcVdfOimen
X-Google-Smtp-Source: AMsMyM7tM7H0+CoPE5UE3mvpE4n/ktOrN+qZTwLemkuYQo1DZlKv9jVUoknAO07ViuqddFZu9qiHrg==
X-Received: by 2002:a17:906:5d0d:b0:78d:ecd6:64c1 with SMTP id g13-20020a1709065d0d00b0078decd664c1mr4339514ejt.571.1665770573156;
        Fri, 14 Oct 2022 11:02:53 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id g25-20020a50ec19000000b00459d0df08f0sm2184056edr.75.2022.10.14.11.02.50
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 11:02:51 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so4145391wmq.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 11:02:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4b19:b0:3c6:cc7c:763c with SMTP id
 i25-20020a05600c4b1900b003c6cc7c763cmr4622906wmp.57.1665770570037; Fri, 14
 Oct 2022 11:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221013184700.87260-1-krzysztof.kozlowski@linaro.org> <20221013184700.87260-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013184700.87260-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 14 Oct 2022 11:02:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UvuiU2GhjTwSxu-SK8C6ovLTwyakf55GRs_g-8b+caUQ@mail.gmail.com>
Message-ID: <CAD=FV=UvuiU2GhjTwSxu-SK8C6ovLTwyakf55GRs_g-8b+caUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: pinctrl: qcom,sc7180: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Oct 13, 2022 at 11:49 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.yaml
> new file mode 100644
> index 000000000000..464f1031d15d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.yaml

[ ... cut ... ]

> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SC7180 TLMM pin controller
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm SC7180 SoC.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-pinctrl
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: west
> +      - const: north
> +      - const: south
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  "#interrupt-cells": true
> +  gpio-controller: true
> +  "#gpio-cells": true
> +  gpio-ranges: true
> +  wakeup-parent: true

Do you need interrupts/interrupt-controller/.../... ? Below you
include allOf "/schemas/pinctrl/qcom,tlmm-common.yaml". Won't you
magically get those from there? Why do you need to duplicate this?


> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 60
> +
> +  gpio-line-names:
> +    maxItems: 119
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sc7180-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-sc7180-tlmm-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-sc7180-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-8])$"
> +            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk,
> +                      sdc2_cmd, sdc2_data, ufs_reset ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +        enum: [ adsp_ext, agera_pll, aoss_cti, atest_char, atest_char0,
> +                atest_char1, atest_char2, atest_char3, atest_tsens,
> +                atest_tsens2, atest_usb1, atest_usb10, atest_usb11,
> +                atest_usb12, atest_usb13, atest_usb2, atest_usb20, atest_usb21,
> +                atest_usb22, atest_usb23, audio_ref, btfm_slimbus, cam_mclk,
> +                cci_async, cci_i2c, cci_timer0, cci_timer1, cci_timer2,
> +                cci_timer3, cci_timer4, cri_trng, dbg_out, ddr_bist, ddr_pxi0,
> +                ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot, edp_lcd, gcc_gp1,
> +                gcc_gp2, gcc_gp3, gpio, gp_pdm0, gp_pdm1, gp_pdm2, gps_tx,
> +                jitter_bist, ldo_en, ldo_update, lpass_ext, mdp_vsync,
> +                mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s_0, mi2s_1,
> +                mi2s_2, mss_lte, m_voc, pa_indicator, phase_flag, PLL_BIST,
> +                pll_bypassnl, pll_reset, prng_rosc, qdss, qdss_cti,
> +                qlink_enable, qlink_request, qspi_clk, qspi_cs, qspi_data,
> +                qup00, qup01, qup02_i2c, qup02_uart, qup03, qup04_i2c,
> +                qup04_uart, qup05, qup10, qup11_i2c, qup11_uart, qup12,
> +                qup13_i2c, qup13_uart, qup14, qup15, sdc1_tb, sdc2_tb,
> +                sd_write, sp_cmu, tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3,
> +                tsense_pwm1, tsense_pwm2, uim1, uim2, uim_batt, usb_phy, vfr_1,
> +                _V_GPIO, _V_PPS_IN, _V_PPS_OUT, vsense_trigger, wlan1_adc0,
> +                wlan1_adc1, wlan2_adc0, wlan2_adc1 ]
> +
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        description:
> +          Selects the drive strength for the specified pins, in mA.

Again, why do you need to duplicate. The yaml is weak in me, but I
think you're effectively subclassing
"qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state", right? It has the
exact same definition of drive-strength. Why duplicate it?


> +      bias-pull-down: true
> +      bias-pull-up: true
> +      bias-disable: true
> +      input-enable: true
> +      output-high: true
> +      output-low: true

Again, maybe the above properties aren't needed? Don't you inherit
them from tlmm-common?

-Doug
