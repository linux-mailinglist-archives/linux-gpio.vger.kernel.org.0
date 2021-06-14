Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680463A6D2C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 19:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235584AbhFNRbD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 13:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235570AbhFNRbD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 13:31:03 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2A8C0617AF;
        Mon, 14 Jun 2021 10:29:00 -0700 (PDT)
Received: from [192.168.1.78] (bband-dyn73.178-41-129.t-com.sk [178.41.129.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 469E51F73F;
        Mon, 14 Jun 2021 19:28:55 +0200 (CEST)
Date:   Mon, 14 Jun 2021 19:28:49 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH V4 1/2] dt-bindings: pinctrl: qcom: sm6125: Document
 SM6125 pinctrl driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <1KCPUQ.NH0JUJ1SOFC02@somainline.org>
In-Reply-To: <YMd7+e798xqUXKCN@yoga>
References: <20210612094534.88992-1-martin.botka@somainline.org>
        <YMd7+e798xqUXKCN@yoga>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Corrected all in V5. Added minItems to reg as well
since all the regs are required.

On Mon, Jun 14 2021 at 10:55:37 AM -0500, Bjorn Andersson 
<bjorn.andersson@linaro.org> wrote:
> On Sat 12 Jun 04:45 CDT 2021, Martin Botka wrote:
> 
>>  Document the newly added SM6125 pinctrl driver
>> 
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>  ---
>>  Changes in V2:
>>  Add commit description
>>  Changes in V3:
>>  Fix syntax errors
>>  Remove not needed state from example
>>  Changes in V4:
>>  maxItems set to 3
>>  Correct the pattern
>>  Remove deleted enums
>>  Fix the compatible
>>   .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml | 124 
>> ++++++++++++++++++
>>   1 file changed, 124 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
>> 
>>  diff --git 
>> a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml 
>> b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
>>  new file mode 100644
>>  index 000000000000..45366945a86f
>>  --- /dev/null
>>  +++ 
>> b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
>>  @@ -0,0 +1,124 @@
>>  +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id: 
>> http://devicetree.org/schemas/pinctrl/qcom,sm6125-pinctrl.yaml#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +title: Qualcomm Technologies, Inc. SM6125 TLMM block
>>  +
>>  +maintainers:
>>  +  - Martin Botka <martin.botka@somainline.org>
>>  +
>>  +description: |
>>  +  This binding describes the Top Level Mode Multiplexer (TLMM) 
>> block found
>>  +  in the SM6125 platform.
>>  +
>>  +allOf:
>>  +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>>  +
>>  +properties:
>>  +  compatible:
>>  +    const: qcom,sm6125-tlmm
>>  +
>>  +  reg:
>>  +    maxItems: 3
>>  +
> 
> As Rob's bot pointed out, you're missing reg-names here.
> 
>>  +  interrupts: true
>>  +  interrupt-controller: true
>>  +  '#interrupt-cells': true
>>  +  gpio-controller: true
>>  +  gpio-reserved-ranges: true
>>  +  '#gpio-cells': true
>>  +  gpio-ranges: true
>>  +  wakeup-parent: true
>>  +
>>  +required:
>>  +  - compatible
>>  +  - reg
> 
> And given the use of tiles, I would suggest that reg-names is required
> as well.
> 
> Other than that, I think this looks great.
> 
> Regards,
> Bjorn
> 
>>  +
>>  +additionalProperties: false
>>  +
>>  +patternProperties:
>>  +  '-state$':
>>  +    oneOf:
>>  +      - $ref: "#/$defs/qcom-sm6125-tlmm-state"
>>  +      - patternProperties:
>>  +          ".*":
>>  +            $ref: "#/$defs/qcom-sm6125-tlmm-state"
>>  +
>>  +$defs:
>>  +  qcom-sm6125-tlmm-state:
>>  +    type: object
>>  +    description:
>>  +      Pinctrl node's client devices use subnodes for desired pin 
>> configuration.
>>  +      Client device subnodes use below standard properties.
>>  +    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
>>  +
>>  +    properties:
>>  +      pins:
>>  +        description:
>>  +          List of gpio pins affected by the properties specified 
>> in this
>>  +          subnode.
>>  +        items:
>>  +          oneOf:
>>  +            - pattern: "^gpio[0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-2]$"
>>  +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, 
>> sdc2_cmd, sdc2_data ]
>>  +        minItems: 1
>>  +        maxItems: 36
>>  +
>>  +      function:
>>  +        description:
>>  +          Specify the alternative function to be configured for 
>> the specified
>>  +          pins.
>>  +
>>  +        enum: [ adsp_ext, agera_pll, atest_char, atest_char0, 
>> atest_char1,
>>  +                atest_char2, atest_char3, atest_tsens, 
>> atest_tsens2, atest_usb1,
>>  +                atest_usb10, atest_usb11, atest_usb12, 
>> atest_usb13, atest_usb2,
>>  +                atest_usb20, atest_usb21, atest_usb22, 
>> atest_usb23, aud_sb,
>>  +                audio_ref, cam_mclk, cci_async, cci_i2c, 
>> cci_timer0, cci_timer1,
>>  +                cci_timer2, cci_timer3, cci_timer4, copy_gp, 
>> copy_phase, cri_trng,
>>  +                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, 
>> ddr_pxi1,
>>  +                ddr_pxi2, ddr_pxi3, debug_hot, dmic0_clk, 
>> dmic0_data, dmic1_clk,
>>  +                dmic1_data, dp_hot, edp_hot, edp_lcd, gcc_gp1, 
>> gcc_gp2, gcc_gp3,
>>  +                gp_pdm0, gp_pdm1, gp_pdm2, gpio, gps_tx, 
>> jitter_bist, ldo_en,
>>  +                ldo_update, m_voc, mclk1, mclk2, mdp_vsync, 
>> mdp_vsync0, mdp_vsync1,
>>  +                mdp_vsync2, mdp_vsync3, mdp_vsync4, mdp_vsync5, 
>> mpm_pwr, mss_lte,
>>  +                nav_pps, pa_indicator, phase_flag, pll_bist, 
>> pll_bypassnl, pll_reset,
>>  +                pri_mi2s, pri_mi2s_ws, prng_rosc, qca_sb, 
>> qdss_cti, qdss, qlink_enable,
>>  +                qlink_request, qua_mi2s, qui_mi2s, qup00, qup01, 
>> qup02, qup03, qup04,
>>  +                qup10, qup11, qup12, qup13, qup14, sd_write, 
>> sec_mi2s, sp_cmu, swr_rx,
>>  +                swr_tx, ter_mi2s, tgu_ch0, tgu_ch1, tgu_ch2, 
>> tgu_ch3, tsense_pwm,
>>  +                uim1_clk, uim1_data, uim1_present, uim1_reset, 
>> uim2_clk, uim2_data,
>>  +                uim2_present, uim2_reset, unused1, unused2, 
>> usb_phy, vfr_1, vsense_trigger,
>>  +                wlan1_adc0, wlan1_adc1, wlan2_adc0, wlan2_adc1, 
>> wsa_clk, wsa_data ]
>>  +
>>  +
>>  +      bias-disable: true
>>  +      bias-pull-down: true
>>  +      bias-pull-up: true
>>  +      drive-strength: true
>>  +      input-enable: true
>>  +      output-high: true
>>  +      output-low: true
>>  +
>>  +    required:
>>  +      - pins
>>  +      - function
>>  +
>>  +    additionalProperties: false
>>  +
>>  +examples:
>>  +  - |
>>  +        #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  +        pinctrl@500000 {
>>  +                compatible = "qcom,sm6125-tlmm";
>>  +                reg = <0x00500000 0x400000>,
>>  +                    <0x00900000 0x400000>,
>>  +                    <0x00d00000 0x400000>;
>>  +                reg-names = "west", "south", "east";
>>  +                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
>>  +                gpio-controller;
>>  +                gpio-ranges = <&tlmm 0 0 134>;
>>  +                #gpio-cells = <2>;
>>  +                interrupt-controller;
>>  +                #interrupt-cells = <2>;
>>  +        };
>>  --
>>  2.31.1
>> 


