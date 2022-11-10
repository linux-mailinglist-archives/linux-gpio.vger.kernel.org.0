Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52022623DA8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 09:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbiKJIke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 03:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbiKJIkd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 03:40:33 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EED126AC8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 00:40:31 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id l12so1851215lfp.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 00:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdD7U8q11qQjpQj49zrRodh9DcWXDB4HZebD6A39+wA=;
        b=J55SSyxmGENcNOUNvUAjfpFyNIeloS6LUAdnyipCNuX4grCw1poGdGlXF5sVQoFboX
         Wz6Me/YaRZZBQq2CEfo442diV6zUeXtZ7wwPFBEUQzAd/gWuVo0ogozR4FY3SXyolfE2
         mFpL84HAAp8wpuXmq0eZBlGJRhjvm42SHh+zFUK9nz1GUP+yeIgS9lbY4q/QkLNBoZQP
         nKRVDi+NYCdUgXiy/9RhhX1y7wcjKHtkC9npVNqsu2gi/5fZLymIfT9TmKj7iRltvb4S
         HOOsdi2n7u1/Ct+DjK1KvTIHSRf2YEEzPoSjTpl2SBjYhYQKY0CAClUf4e/dycuMx2AZ
         jrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdD7U8q11qQjpQj49zrRodh9DcWXDB4HZebD6A39+wA=;
        b=VJO8C4HmYT/VrnbvN+CmGQrvsOo4rrtXuCUt716aXNV5OSOdMaIpfhzOdgQkC+N2wS
         z8H5g8voiPVAAeOerAhcase6JUt7vR84zi7CEfb8ZpqQNSpWRw2XY9mE9kWPW3FBNqRV
         Ey6fxT+a6JtMstQGqMgRNmRuO+atB0qc59Pcr3+n6q0ixEKO27HFzkPKN6AY5/YeozjV
         XdiM4O7htXTWfVrRxoJVeKOj3EFgL1nqY6yGg4eqzwtYQluERuzUHz1jzByZ7nZ3/vjI
         2FEDc/jCniGAQNi3ajnloE8I1s8VntGCRreqmR8f53nNpMBBbgyb66YgtmvGdf1V1OkI
         YEcw==
X-Gm-Message-State: ACrzQf24nN/6csFkzSOxTN8jIAEFG+eprLqbPaDgC2JdStvF4KcGGy7T
        a9edkcBosJ4zzZz1BwYZhI7UZA==
X-Google-Smtp-Source: AMsMyM5tJSVMZDh7ZAZrn7vTrB/BgA516meCbjojqK+h6BEJ2w4sInloqyevv3qS9sG7VlYp7V0PLg==
X-Received: by 2002:a05:6512:39cc:b0:4a2:9591:4523 with SMTP id k12-20020a05651239cc00b004a295914523mr20745744lfu.657.1668069629352;
        Thu, 10 Nov 2022 00:40:29 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id u6-20020a05651220c600b0049462af8614sm2655205lfr.145.2022.11.10.00.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 00:40:28 -0800 (PST)
Message-ID: <cc042c6b-2dc7-7416-1b1a-92b0235d142b@linaro.org>
Date:   Thu, 10 Nov 2022 09:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,msm8976: convert to dtschema
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221108140909.51422-1-krzysztof.kozlowski@linaro.org>
 <20221109113334.u2jhlwqgpfubfg5w@SoMainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109113334.u2jhlwqgpfubfg5w@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2022 12:33, Marijn Suijten wrote:
> On 2022-11-08 15:09:09, Krzysztof Kozlowski wrote:
>> Convert Qualcomm MSM8976 pin controller bindings to DT schema.  Keep the
>> parsing of pin configuration subnodes consistent with other Qualcomm
>> schemas (children named with '-state' suffix, their children with
>> '-pins').
>>
>> Changes during conversion: update the list of non-mux pins (like sdc1)
>> to match Linux driver.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks for sending this right as we are upstreaming MSM8976!  With one
> question and one nit below:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>  .../bindings/pinctrl/qcom,msm8976-pinctrl.txt | 183 ------------------
>>  .../pinctrl/qcom,msm8976-pinctrl.yaml         | 137 +++++++++++++
>>  2 files changed, 137 insertions(+), 183 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
>> deleted file mode 100644
>> index 70d04d12f136..000000000000
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
>> +++ /dev/null
>> @@ -1,183 +0,0 @@
>> -Qualcomm MSM8976 TLMM block
>> -
>> -This binding describes the Top Level Mode Multiplexer block found in the
>> -MSM8956 and MSM8976 platforms.
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <string>
>> -	Definition: must be "qcom,msm8976-pinctrl"
>> -
>> -- reg:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: the base address and size of the TLMM register space.
>> -
>> -- interrupts:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: should specify the TLMM summary IRQ.
>> -
>> -- interrupt-controller:
>> -	Usage: required
>> -	Value type: <none>
>> -	Definition: identifies this node as an interrupt controller
>> -
>> -- #interrupt-cells:
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: must be 2. Specifying the pin number and flags, as defined
>> -		    in <dt-bindings/interrupt-controller/irq.h>
>> -
>> -- gpio-controller:
>> -	Usage: required
>> -	Value type: <none>
>> -	Definition: identifies this node as a gpio controller
>> -
>> -- #gpio-cells:
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: must be 2. Specifying the pin number and flags, as defined
>> -		    in <dt-bindings/gpio/gpio.h>
>> -
>> -- gpio-ranges:
>> -	Usage: required
>> -	Definition:  see ../gpio/gpio.txt
>> -
>> -- gpio-reserved-ranges:
>> -	Usage: optional
>> -	Definition: see ../gpio/gpio.txt
>> -
>> -Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
>> -a general description of GPIO and interrupt bindings.
>> -
>> -Please refer to pinctrl-bindings.txt in this directory for details of the
>> -common pinctrl bindings used by client devices, including the meaning of the
>> -phrase "pin configuration node".
>> -
>> -The pin configuration nodes act as a container for an arbitrary number of
>> -subnodes. Each of these subnodes represents some desired configuration for a
>> -pin, a group, or a list of pins or groups. This configuration can include the
>> -mux function to select on those pin(s)/group(s), and various pin configuration
>> -parameters, such as pull-up, drive strength, etc.
>> -
>> -
>> -PIN CONFIGURATION NODES:
>> -
>> -The name of each subnode is not important; all subnodes should be enumerated
>> -and processed purely based on their content.
>> -
>> -Each subnode only affects those parameters that are explicitly listed. In
>> -other words, a subnode that lists a mux function but no pin configuration
>> -parameters implies no information about any pin configuration parameters.
>> -Similarly, a pin subnode that describes a pullup parameter implies no
>> -information about e.g. the mux function.
>> -
>> -
>> -The following generic properties as defined in pinctrl-bindings.txt are valid
>> -to specify in a pin configuration subnode:
>> -
>> -- pins:
>> -	Usage: required
>> -	Value type: <string-array>
>> -	Definition: List of gpio pins affected by the properties specified in
>> -		    this subnode.
>> -
>> -		    Valid pins are:
>> -		      gpio0-gpio145
>> -		        Supports mux, bias and drive-strength
>> -
>> -		      sdc1_clk, sdc1_cmd, sdc1_data,
>> -		      sdc2_clk, sdc2_cmd, sdc2_data,
>> -		      sdc3_clk, sdc3_cmd, sdc3_data
>> -		        Supports bias and drive-strength
>> -
>> -- function:
>> -	Usage: required
>> -	Value type: <string>
>> -	Definition: Specify the alternative function to be configured for the
>> -		    specified pins. Functions are only valid for gpio pins.
>> -		    Valid values are:
>> -
>> -		    gpio, blsp_uart1, blsp_spi1, smb_int, blsp_i2c1, blsp_spi2,
>> -		    blsp_uart2, blsp_i2c2, gcc_gp1_clk_b, blsp_spi3,
>> -		    qdss_tracedata_b, blsp_i2c3, gcc_gp2_clk_b, gcc_gp3_clk_b,
>> -		    blsp_spi4, cap_int, blsp_i2c4, blsp_spi5, blsp_uart5,
>> -		    qdss_traceclk_a, m_voc, blsp_i2c5, qdss_tracectl_a,
>> -		    qdss_tracedata_a, blsp_spi6, blsp_uart6, qdss_tracectl_b,
>> -		    blsp_i2c6, qdss_traceclk_b, mdp_vsync, pri_mi2s_mclk_a,
>> -		    sec_mi2s_mclk_a, cam_mclk, cci0_i2c, cci1_i2c, blsp1_spi,
>> -		    blsp3_spi, gcc_gp1_clk_a, gcc_gp2_clk_a, gcc_gp3_clk_a,
>> -		    uim_batt, sd_write, uim1_data, uim1_clk, uim1_reset,
>> -		    uim1_present, uim2_data, uim2_clk, uim2_reset,
>> -		    uim2_present, ts_xvdd, mipi_dsi0, us_euro, ts_resout,
>> -		    ts_sample, sec_mi2s_mclk_b, pri_mi2s, codec_reset,
>> -		    cdc_pdm0, us_emitter, pri_mi2s_mclk_b, pri_mi2s_mclk_c,
>> -		    lpass_slimbus, lpass_slimbus0, lpass_slimbus1, codec_int1,
>> -		    codec_int2, wcss_bt, sdc3, wcss_wlan2, wcss_wlan1,
>> -		    wcss_wlan0, wcss_wlan, wcss_fm, key_volp, key_snapshot,
>> -		    key_focus, key_home, pwr_down, dmic0_clk, hdmi_int,
>> -		    dmic0_data, wsa_vi, wsa_en, blsp_spi8, wsa_irq, blsp_i2c8,
>> -		    pa_indicator, modem_tsync, ssbi_wtr1, gsm1_tx, gsm0_tx,
>> -		    sdcard_det, sec_mi2s, ss_switch,
>> -
>> -- bias-disable:
>> -	Usage: optional
>> -	Value type: <none>
>> -	Definition: The specified pins should be configured as no pull.
>> -
>> -- bias-pull-down:
>> -	Usage: optional
>> -	Value type: <none>
>> -	Definition: The specified pins should be configured as pull down.
>> -
>> -- bias-pull-up:
>> -	Usage: optional
>> -	Value type: <none>
>> -	Definition: The specified pins should be configured as pull up.
>> -
>> -- output-high:
>> -	Usage: optional
>> -	Value type: <none>
>> -	Definition: The specified pins are configured in output mode, driven
>> -		    high.
>> -		    Not valid for sdc pins.
>> -
>> -- output-low:
>> -	Usage: optional
>> -	Value type: <none>
>> -	Definition: The specified pins are configured in output mode, driven
>> -		    low.
>> -		    Not valid for sdc pins.
>> -
>> -- drive-strength:
>> -	Usage: optional
>> -	Value type: <u32>
>> -	Definition: Selects the drive strength for the specified pins, in mA.
>> -		    Valid values are: 2, 4, 6, 8, 10, 12, 14 and 16
>> -
>> -Example:
>> -
>> -	tlmm: pinctrl@1000000 {
>> -		compatible = "qcom,msm8976-pinctrl";
>> -		reg = <0x1000000 0x300000>;
>> -		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>> -		gpio-controller;
>> -		#gpio-cells = <2>;
>> -		gpio-ranges = <&tlmm 0 0 145>;
>> -		interrupt-controller;
>> -		#interrupt-cells = <2>;
>> -
>> -		blsp1_uart2_active: blsp1_uart2_active {
>> -			mux {
>> -				pins = "gpio4", "gpio5", "gpio6", "gpio7";
>> -				function = "blsp_uart2";
>> -			};
>> -
>> -			config {
>> -				pins = "gpio4", "gpio5", "gpio6", "gpio7";
>> -				drive-strength = <2>;
>> -				bias-disable;
>> -			};
>> -		};
>> -	};
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..1002a57248f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.yaml
>> @@ -0,0 +1,137 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,msm8976-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm MSM8976 TLMM pin controller
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> +
>> +description:
>> +  Top Level Mode Multiplexer pin controller in Qualcomm MSM8976 SoC.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,msm8976-pinctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts: true
>> +  interrupt-controller: true
>> +  "#interrupt-cells": true
>> +  gpio-controller: true
>> +  "#gpio-cells": true
>> +  gpio-ranges: true
>> +  wakeup-parent: true
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 73
>> +
>> +  gpio-line-names:
>> +    maxItems: 145
>> +
>> +patternProperties:
>> +  "-state$":
>> +    oneOf:
>> +      - $ref: "#/$defs/qcom-msm8976-tlmm-state"
>> +      - patternProperties:
>> +          "-pins$":
>> +            $ref: "#/$defs/qcom-msm8976-tlmm-state"
>> +        additionalProperties: false
>> +
>> +$defs:
>> +  qcom-msm8976-tlmm-state:
>> +    type: object
>> +    description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
>> +
>> +    properties:
>> +      pins:
>> +        description:
>> +          List of gpio pins affected by the properties specified in this
>> +          subnode.
> 
> I thought I read earlier that the description shouldn't describe the DT
> format: should this be `state` instead of `subnode` (same in the
> description above)?

Yes, it feels more appropriate. The description is being copied from
other bindings and I never really cared about it.

> 
>> +        items:
>> +          oneOf:
>> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-3][0-9]|14[0-4])$"
>> +            - enum: [ qdsd_clk, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
>> +                      qdsd_data3 sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk,
>> +                      sdc2_clk, sdc2_cmd, sdc2_data ]
>> +        minItems: 1
>> +        maxItems: 36
>> +
>> +      function:
>> +        description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +
>> +        enum: [ gpio, blsp_uart1, blsp_spi1, smb_int, blsp_i2c1, blsp_spi2,
>> +                blsp_uart2, blsp_i2c2, gcc_gp1_clk_b, blsp_spi3,
>> +                qdss_tracedata_b, blsp_i2c3, gcc_gp2_clk_b, gcc_gp3_clk_b,
>> +                blsp_spi4, cap_int, blsp_i2c4, blsp_spi5, blsp_uart5,
>> +                qdss_traceclk_a, m_voc, blsp_i2c5, qdss_tracectl_a,
>> +                qdss_tracedata_a, blsp_spi6, blsp_uart6, qdss_tracectl_b,
>> +                blsp_i2c6, qdss_traceclk_b, mdp_vsync, pri_mi2s_mclk_a,
>> +                sec_mi2s_mclk_a, cam_mclk, cci0_i2c, cci1_i2c, blsp1_spi,
>> +                blsp3_spi, gcc_gp1_clk_a, gcc_gp2_clk_a, gcc_gp3_clk_a,
>> +                uim_batt, sd_write, uim1_data, uim1_clk, uim1_reset,
>> +                uim1_present, uim2_data, uim2_clk, uim2_reset, uim2_present,
>> +                ts_xvdd, mipi_dsi0, us_euro, ts_resout, ts_sample,
>> +                sec_mi2s_mclk_b, pri_mi2s, codec_reset, cdc_pdm0, us_emitter,
>> +                pri_mi2s_mclk_b, pri_mi2s_mclk_c, lpass_slimbus,
>> +                lpass_slimbus0, lpass_slimbus1, codec_int1, codec_int2,
>> +                wcss_bt, sdc3, wcss_wlan2, wcss_wlan1, wcss_wlan0, wcss_wlan,
>> +                wcss_fm, key_volp, key_snapshot, key_focus, key_home, pwr_down,
>> +                dmic0_clk, hdmi_int, dmic0_data, wsa_vi, wsa_en, blsp_spi8,
>> +                wsa_irq, blsp_i2c8, pa_indicator, modem_tsync, ssbi_wtr1,
>> +                gsm1_tx, gsm0_tx, sdcard_det, sec_mi2s, ss_switch ]
>> +
>> +      bias-pull-down: true
>> +      bias-pull-up: true
>> +      bias-disable: true
>> +      drive-strength: true
>> +      input-enable: true
>> +      output-high: true
>> +      output-low: true
>> +
>> +    required:
>> +      - pins
>> +
>> +    additionalProperties: false
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    tlmm: pinctrl@1000000 {
>> +        compatible = "qcom,msm8976-pinctrl";
>> +        reg = <0x1000000 0x300000>;
>> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&tlmm 0 0 145>;
> 
> Shouldn't this be alphabetical (disregarding `#`), where cells <
> controller? (same for interrupt-controller below)

Sure. It's more or less matches DTS, which is not sorted that way.



Best regards,
Krzysztof

