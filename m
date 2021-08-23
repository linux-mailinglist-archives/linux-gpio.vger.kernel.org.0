Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1893F4DE6
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 17:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhHWP6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 11:58:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13724 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231857AbhHWP6l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Aug 2021 11:58:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629734279; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=WknB8TeMHhJrnfwMX6wg3BT34rrUTZ32YkFLxT0g65Y=; b=eNZ6aaDdptYKhA/Yxb2MxVnhegruqhs9IZb+9yI9yMMMb5g2jA5l0tmARCWyewSL8jRcAemz
 9vjujuXJ0zGklkbCP/dJYcH1PIfCzk/Hcp0PaoSrpT5/v4pf/4Lj1Z8H3Pb/bCfUc9YqtFaW
 aRdUUxUlUE4QlkPYizlpQ0ewsO4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6123c55ee19abc79591c2bfd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 15:57:18
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22F3FC4338F; Mon, 23 Aug 2021 15:57:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.85.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4440EC43460;
        Mon, 23 Aug 2021 15:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4440EC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM6350 pinctrl
 bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210820203751.232645-1-konrad.dybcio@somainline.org>
 <20210820203751.232645-2-konrad.dybcio@somainline.org>
 <YSO+kQnDsqcaBIOg@ripper>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <82cb4d2d-f347-b823-fa4c-4c2b0c0bfb0c@codeaurora.org>
Date:   Mon, 23 Aug 2021 21:27:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YSO+kQnDsqcaBIOg@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Konrad,

On 8/23/2021 8:58 PM, Bjorn Andersson wrote:
> On Fri 20 Aug 13:37 PDT 2021, Konrad Dybcio wrote:
>
>> Add device tree binding Documentation details for Qualcomm SM6350
>> pinctrl driver.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>>   .../bindings/pinctrl/qcom,sm6350-pinctrl.yaml | 156 ++++++++++++++++++
>>   .../bindings/pinctrl/qcom,tlmm-common.yaml    |   2 +-
>>   2 files changed, 157 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..e4d8b7a044e6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
>> @@ -0,0 +1,156 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. SM6350 TLMM block
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
>> +
>> +description: |
>> +  This binding describes the Top Level Mode Multiplexer (TLMM) block found
>> +  in the SM6350 platform.
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm6350-tlmm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts: true
>> +  interrupt-controller: true
>> +  '#interrupt-cells': true
>> +  gpio-controller: true
>> +  gpio-reserved-ranges: true
>> +  '#gpio-cells': true
>> +  gpio-ranges: true
>> +  wakeup-parent: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +patternProperties:
>> +  '-state$':
>> +    oneOf:
>> +      - $ref: "#/$defs/qcom-sm6350-tlmm-state"
>> +      - patternProperties:
>> +          ".*":
>> +            $ref: "#/$defs/qcom-sm6350-tlmm-state"
>> +
>> +$defs:
>> +  qcom-sm6350-tlmm-state:
>> +    type: object
>> +    description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
>> +
>> +    properties:
>> +      pins:
>> +        description:
>> +          List of gpio pins affected by the properties specified in this
>> +          subnode.
>> +        items:
>> +          oneOf:
>> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
> "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9]|15[0-7])$"
>
>> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
>> +        minItems: 1
>> +        maxItems: 36
>> +
>> +      function:
>> +        description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +
>> +        enum: [ adsp_ext, agera_pll, atest_char, atest_char0, atest_char1, atest_char2,
>> +                atest_char3, atest_tsens, atest_tsens2, atest_usb1, atest_usb10, atest_usb11,
>> +                atest_usb12, atest_usb13, atest_usb2, atest_usb20, atest_usb21, atest_usb22,
>> +                atest_usb23, audio_ref, btfm_slimbus, cam_mclk0, cam_mclk1, cam_mclk2, cam_mclk3,
>> +                cam_mclk4, cci_async, cci_i2c, cci_timer0, cci_timer1, cci_timer2, cci_timer3,
>> +                cci_timer4, cri_trng, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3,
>> +                dp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3, gp_pdm0, gp_pdm1, gp_pdm2, gpio,
>> +                gps_tx, ibi_i3c, jitter_bist, ldo_en, ldo_update, lpass_ext, m_voc, mclk,
>> +                mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s_0, mi2s_1, mi2s_2,
>> +                mss_lte, nav_gpio, nav_pps, pa_indicator, pcie0_clk, phase_flag0, phase_flag1,
>> +                phase_flag10, phase_flag11, phase_flag12, phase_flag13, phase_flag14, phase_flag15,
>> +                phase_flag16, phase_flag17, phase_flag18, phase_flag19, phase_flag2, phase_flag20,
>> +                phase_flag21, phase_flag22, phase_flag23, phase_flag24, phase_flag25, phase_flag26,
>> +                phase_flag27, phase_flag28, phase_flag29, phase_flag3, phase_flag30, phase_flag31,
>> +                phase_flag4, phase_flag5, phase_flag6, phase_flag7, phase_flag8, phase_flag9,
>> +                pll_bist, pll_bypassnl, pll_reset, prng_rosc, qdss_cti, qdss_gpio, qdss_gpio0,
>> +                qdss_gpio1, qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13, qdss_gpio14,
>> +                qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4, qdss_gpio5, qdss_gpio6,
>> +                qdss_gpio7, qdss_gpio8, qdss_gpio9, qlink0_enable, qlink0_request, qlink0_wmss,
>> +                qlink1_enable, qlink1_request, qlink1_wmss, qup00, qup01, qup02, qup10, qup11,
>> +                qup12, qup13_f1, qup13_f2, qup14, rffe0_clk, rffe0_data, rffe1_clk, rffe1_data,
>> +                rffe2_clk, rffe2_data, rffe3_clk, rffe3_data, rffe4_clk, rffe4_data, sd_write,
>> +                sdc1_tb, sdc2_tb, sp_cmu, tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3, tsense_pwm1,
>> +                tsense_pwm2, uim1_clk, uim1_data, uim1_present, uim1_reset, uim2_clk, uim2_data,
>> +                uim2_present, uim2_reset, usb_phy, vfr_1, vsense_trigger, wlan1_adc0, wlan1_adc1,
>> +                wlan2_adc0, wlan2_adc1, ]
>> +
>> +
>> +      bias-disable: true
>> +      bias-pull-down: true
>> +      bias-pull-up: true
>> +      drive-strength: true
>> +      input-enable: true
>> +      output-high: true
>> +      output-low: true
>> +
>> +    required:
>> +      - pins
>> +      - function
>> +
>> +    additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +        pinctrl@f100000 {
>> +                compatible = "qcom,sm6350-tlmm";
>> +                reg = <0x0f100000 0x300000>;
>> +                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
>> +                gpio-controller;
>> +                #gpio-cells = <2>;
>> +                interrupt-controller;
>> +                #interrupt-cells = <2>;
>> +                gpio-ranges = <&tlmm 0 0 156>;
> Shouldn't this be 157?
>
>> +
>> +                gpio-wo-subnode-state {
>> +                        pins = "gpio1";
>> +                        function = "gpio";
>> +                };
>> +
>> +                uart-w-subnodes-state {
>> +                        rx {
>> +                                pins = "gpio25";
>> +                                function = "qup13_f2";
>> +                                bias-disable;
>> +                        };
>> +
>> +                        tx {
>> +                                pins = "gpio26";
>> +                                function = "qup13_f2";
>> +                                bias-disable;
>> +                        };
>> +                };
>> +        };
>> +...
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
>> index 3b37cf102d41..99975122a2ce 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
>> @@ -17,7 +17,7 @@ properties:
>>     interrupts:
>>       description:
>>         Specifies the TLMM summary IRQ
>> -    maxItems: 1
>> +    maxItems: 9
> Is this to support direct connected interrupts?
>
> Don't you need to add minItems: 1, to permit the other bindings to not
> define these? I think that's what Rob's automatic reply complains about
> at least.
>
>
> PS. Any plans to work up support for direct connected interrupts? I
> think that and "egpio" is the only downstream delta these days... That
> said, I don't know if anyone actually uses direct connected interrupts?

Using .wakeirq_dual_edge_errata = true, in pinctrl-sm6350.c 
(msm_pinctrl_soc_data structure) in [1] should help. The direct connect 
interrupt were added to support dual edge in downstream driver but in 
upstream setting this flag should help.

This was used in sc7180 but should apply SM6350 too.

That way you don't need other TLMM interrupts to be listed here.

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20210820203751.232645-3-konrad.dybcio@somainline.org/

Thanks,
Maulik


>
> Regards,
> Bjorn

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

