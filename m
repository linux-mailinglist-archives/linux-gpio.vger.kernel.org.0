Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F40812CE0D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 10:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfL3JMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 04:12:50 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:43062 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727247AbfL3JMu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Dec 2019 04:12:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577697169; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=L9Vu5nllDxeLPVYsgWa1F5+XK4kB9hG/w0HCoJugAaA=; b=ZmWu2LssOKvgczk5I3E1sdIs55izsXMVmGlIc+ygLgaBP+TluPewtfBfZFQcl5OOC5YmLjxE
 L9Q49D4lUzetEKqFpEKipON3mg025TvlGhwBVJEWTiT5Mg31whOjMJNMtdOb8QbE9sTEh/St
 YjMdcBIWxIpVYyfq2i7jjL329Gg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e09bf8f.7f9f6b049a78-smtp-out-n03;
 Mon, 30 Dec 2019 09:12:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0ED5C433A2; Mon, 30 Dec 2019 09:12:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A3ACC433CB;
        Mon, 30 Dec 2019 09:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A3ACC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH V2 1/7] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl
 bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        sivaprak@codeaurora.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
 <1576752109-24497-2-git-send-email-sricharan@codeaurora.org>
 <20191229034126.GO3755841@builder>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <8dd32c3f-aee4-cedf-bad4-ea3b2864980e@codeaurora.org>
Date:   Mon, 30 Dec 2019 14:42:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191229034126.GO3755841@builder>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bjorn,

On 12/29/2019 9:11 AM, Bjorn Andersson wrote:
> On Thu 19 Dec 02:41 PST 2019, Sricharan R wrote:
> 
>> Add device tree binding Documentation details for ipq6018
>> pinctrl driver.
>>
>> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
>> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
>> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>
>> [V2] Splitted dt bindings and driver into different patches. Added missing bindings,
>>      and some style changes.
>>
>>  .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     | 172 +++++++++++++++++++++
>>  1 file changed, 172 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
>> new file mode 100644
>> index 0000000..745a11e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
>> @@ -0,0 +1,172 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,ipq6018-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. IPQ6018 TLMM block
>> +
>> +maintainers:
>> +  - Sricharan R <sricharan@codeaurora.org>
>> +
>> +description: |
>> +  This binding describes the Top Level Mode Multiplexer block found in the
>> +  IPQ6018 platform.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,ipq6018-pinctrl
>> +  reg:
>> +    maxItems: 1
>> +  interrupts:
>> +    Description: Specifies the TLMM summary IRQ
>> +    maxItems: 1
>> +  interrupt-controller: true
>> +  '#interrupt-cells':
>> +    Description:
>> +      Specifies the PIN numbers and Flags, as defined in defined in
>> +      include/dt-bindings/interrupt-controller/irq.h
>> +    const: 2
>> +  gpio-controller: true
>> +  '#gpio-cells':
>> +    Description: Specifying the pin number and flags, as defined in
>> +      include/dt-bindings/gpio/gpio.h
>> +    const: 2
>> +  gpio-ranges:
>> +    Description: Documentation/devicetree/bindings/gpio/gpio.txt
>> +    maxItems: 1
>> +
>> +#PIN CONFIGURATION NODES
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    Description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +
>> +    Properties:
>> +      pins:
>> +        allOf:
>> +          $ref: /schemas/types.yaml#/definitions/string
>> +          enum:
>> +            gpio0-gpio80
>> +            sdc1_clk
>> +            sdc1_cmd
>> +            sdc1_data
>> +            sdc2_clk
>> +            sdc2_cmd
>> +            sdc2_data
>> +            qdsd_cmd
>> +            qdsd_data0
>> +            qdsd_data1
>> +            qdsd_data2
>> +            qdsd_data3
>> +        Description:
>> +          List of gpio pins affected by the properties specified in this
>> +          subnode.
>> +
>> +      function:
>> +        allOf:
>> +          $ref: /schemas/types.yaml#/definitions/string
>> +          enum:
>> +            adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char,
>> +            atest_char0, atest_char1, atest_char2, atest_char3, atest_combodac,
>> +            atest_gpsadc0, atest_gpsadc1, atest_tsens, atest_wlan0,
>> +            atest_wlan1, backlight_en, bimc_dte0, bimc_dte1, blsp_i2c1,
>> +            blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_i2c5, blsp_i2c6,  blsp_spi1,
>> +            blsp_spi1_cs1, blsp_spi1_cs2, blsp_spi1_cs3, blsp_spi2,
>> +            blsp_spi2_cs1, blsp_spi2_cs2, blsp_spi2_cs3, blsp_spi3,
>> +            blsp_spi3_cs1, blsp_spi3_cs2, blsp_spi3_cs3, blsp_spi4, blsp_spi5,
>> +            blsp_spi6, blsp_uart1, blsp_uart2, blsp_uim1, blsp_uim2, cam1_rst,
>> +            cam1_standby, cam_mclk0, cam_mclk1, cci_async, cci_i2c, cci_timer0,
>> +            cci_timer1, cci_timer2, cdc_pdm0, codec_mad, dbg_out, display_5v,
>> +            dmic0_clk, dmic0_data, dsi_rst, ebi0_wrcdc, euro_us, ext_lpass,
>> +            flash_strobe, gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a,
>> +            gcc_gp2_clk_b, gcc_gp3_clk_a, gcc_gp3_clk_b, gpio, gsm0_tx0,
>> +            gsm0_tx1, gsm1_tx0, gsm1_tx1, gyro_accl, kpsns0, kpsns1, kpsns2,
>> +            ldo_en, ldo_update, mag_int, mdp_vsync, modem_tsync, m_voc,
>> +            nav_pps, nav_tsync, pa_indicator, pbs0, pbs1, pbs2, pri_mi2s,
>> +            pri_mi2s_ws, prng_rosc, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
>> +            pwr_modem_enabled_a,  pwr_modem_enabled_b, pwr_nav_enabled_a,
>> +            pwr_nav_enabled_b, qdss_ctitrig_in_a0, qdss_ctitrig_in_a1,
>> +            qdss_ctitrig_in_b0, qdss_ctitrig_in_b1, qdss_ctitrig_out_a0,
>> +            qdss_ctitrig_out_a1, qdss_ctitrig_out_b0, qdss_ctitrig_out_b1,
>> +            qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
>> +            qdss_tracedata_a, qdss_tracedata_b, reset_n, sd_card, sd_write,
>> +            sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2, uim3,
>> +            uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst
>> +        Description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +      bias-disable:
> 
> Is there any way to inherit these from some common definition?
> 

 ok, will check and if possible will inherit those.

>> +        type: boolean
>> +        Description:
>> +          The specified pins should be configured as no pull.
>> +      bias-pull-down:
>> +        type: boolean
>> +        Description:
>> +          The specified pins should be configured as pull down.
>> +      bias-pull-up:
>> +        type: boolean
>> +        Description:
>> +          The specified pins should be configured as pull up.
>> +      output-high:
>> +        type: boolean
>> +        Description:
>> +          The specified pins are configured in output mode, driven high.
>> +          This option is not available for sdc pins.
>> +      output-low:
>> +        type: boolean
>> +        Description:
>> +          The specified pins are configured in output mode, driven low.
>> +          This option is not available for sdc pins.
>> +      drive-strength:
>> +        allOf:
>> +          $ref: /schemas/types.yaml#/definitions/uint32
>> +          enum: [2, 4, 6, 8, 10, 12, 14, 16]
>> +        Description:
>> +          elects the drive strength for the specified pins, in mA.
> 
> Selects?
> 

 ok will fix.

>> +
>> +    required:
>> +      - pins
>> +      - function
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
>> +  - gpio-controller
>> +  - '#gpio-cells'
>> +  - gpio-ranges
>> +
>> +example:
>> +        tlmm: pinctrl@1000000 {
>> +                compatible = "qcom,ipq6018-pinctrl";
>> +                reg = <0x1000000 0x300000>;
>> +                interrupts = <0 208 0>;
> 
> <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>
> 

 ok.

>> +                gpio-controller;
>> +                #gpio-cells = <2>;
>> +                interrupt-controller;
>> +                #interrupt-cells = <2>;
>> +
>> +                uart_pins: uart_pins {
> 
> s/_/- in the node name.
> 

 ok.

>> +                        mux {
>> +                                pins = "gpio4", "gpio5";
>> +                                function = "blsp_uart2";
> 
> Duplicate the function definition in tx and rx and drop the "mux" node.
> 

 ok.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
