Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23F4913D559
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 08:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgAPHs7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 02:48:59 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:15392 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726827AbgAPHs7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jan 2020 02:48:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579160938; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LeX5HX3rkYH2PnvSEJOJKoKg9DCtPQiRr5VOCPlPpMY=; b=YqcS4ShZeop9cR2TUSJY5FPnNT95/we2co5ikg8I3k4bQHD5ZRkqtE2WCw2w4X7HJZQIlfb4
 XxiW7wFTXAHnnAuwoGSeoQPsjKvneK8J+XYPoaahGfG7+AVIqAxk2x0i1WFFl211bMo9/Koq
 p3fU8UiUZCQR8AjfgUMgfimeL3I=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e201568.7f29deef7180-smtp-out-n02;
 Thu, 16 Jan 2020 07:48:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7BD42C4479F; Thu, 16 Jan 2020 07:48:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.8] (unknown [171.76.62.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D392C43383;
        Thu, 16 Jan 2020 07:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D392C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH V4 1/5] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
        sivaprak@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
References: <1578561543-23132-1-git-send-email-sricharan@codeaurora.org>
 <1578561543-23132-2-git-send-email-sricharan@codeaurora.org>
 <20200113224931.GA1297@bogus>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <6c5a0e35-b02c-ad52-bae9-ce05c64e98ee@codeaurora.org>
Date:   Thu, 16 Jan 2020 13:18:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113224931.GA1297@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,
  Thanks for the review, fixed all below comments and posted V5.


On 1/14/2020 4:19 AM, Rob Herring wrote:
> On Thu, Jan 09, 2020 at 02:48:59PM +0530, Sricharan R wrote:
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
>> [V4]
>>   * cleaned-up schema as per Rob's comments.
>>   * Ran make dt_binding_check and no issues.
>>
>>  .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     | 140 +++++++++++++++++++++
>>  1 file changed, 140 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
>> new file mode 100644
>> index 0000000..68c3c8c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
>> @@ -0,0 +1,140 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
> 
> Dual license please.
> 
> (GPL-2.0-only or BSD-2-Clause)
>

 ok, fixed in V5
 
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
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    description: Specifies the TLMM summary IRQ
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    description:
>> +      Specifies the PIN numbers and Flags, as defined in defined in
>> +      include/dt-bindings/interrupt-controller/irq.h
>> +    const: 2
>> +
>> +  gpio-controller: true
>> +
>> +  '#gpio-cells':
>> +    description: Specifying the pin number and flags, as defined in
>> +      include/dt-bindings/gpio/gpio.h
>> +    const: 2
>> +
>> +  gpio-ranges:
>> +    description: Documentation/devicetree/bindings/gpio/gpio.txt
>> +    maxItems: 1
>> +
>> +#PIN CONFIGURATION NODES
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +    allOf:
>> +      - $ref: "/schemas/pinctrl/pincfg-node.yaml"
>> +
>> +    properties:
>> +      pins:
>> +        description:
>> +          List of gpio pins affected by the properties specified in this
>> +          subnode.
>> +        allOf:
>> +          - $ref: "/schemas/types.yaml#/definitions/string"
> 
> No need for type ref as the common binding does this.
>

 ok. fixed in V5.

 
>> +          - enum: ['gpio$', sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd,
>> +            sdc2_data, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
>> +            qdsd_data3]
>> +
>> +      function:
>> +        description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +        allOf:
>> +          - $ref: "/schemas/types.yaml#/definitions/string"
> 
> Same here.
>

 ok, fixed in V5.

 
>> +          - enum: [ adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char,
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
>> +            uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst ]
>> +
>> +      drive-strength:
>> +        allOf:
>> +          - $ref: "/schemas/types.yaml#/definitions/uint32"
> 
> Same here.
>

fixed in v5.

 
>> +          - enum: [2, 4, 6, 8, 10, 12, 14, 16]
> 
> default?
>

fixed in v5.

 
>> +        description:
>> +          Selects the drive strength for the specified pins, in mA.
> 
>> +
>> +    required:
>> +      - pins
>> +      - function
> 
>        additionalProperties: false
> 
> You'll need to list any other properties you use. Based 
> on the example, you'll need 'bias-pull-down: true'.
>

 ok, fixed in v5.

 
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
> 
> additionalProperties: false
>

 ok, fixed in v5.
 
>> +
>> +examples:
>> +  - |
>> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +        tlmm: pinctrl@1000000 {
>> +              compatible = "qcom,ipq6018-pinctrl";
>> +              reg = <0x01000000 0x300000>;
>> +              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>> +              gpio-controller;
>> +              #gpio-cells = <2>;
>> +              gpio-ranges = <&tlmm 0 80>;
>> +              interrupt-controller;
>> +              #interrupt-cells = <2>;
>> +
>> +              serial3-pinmux {
> 
> Doesn't match the schema.

 fixed in v5.


Regards,
 Sricharan
-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
