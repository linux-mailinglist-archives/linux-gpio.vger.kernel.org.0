Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB9927983A1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Sep 2023 09:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235196AbjIHH5F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Sep 2023 03:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjIHH5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Sep 2023 03:57:04 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6F519A6;
        Fri,  8 Sep 2023 00:57:00 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3887pBs4026928;
        Fri, 8 Sep 2023 07:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fcVwnW9/PA9HjNaMT79zSSPC5ahtZvxXkAwR98HUP7Q=;
 b=RQH8/Nw1hzp4eBoV/b3ZfAmW908UcYftPSrrVq5p33h+znURLozEMIk2roHB7+XqmJGP
 qVo8sEK0sU5T3WG4qDVXY29Ywg97zVq1tVYD8LZLQ3BIOMVYWWJhWD4MTfagEk2TtQQF
 sd9NMEkKTfd6p5mQUIQFx8RisROPVVO2ZsnXKD8thaTCXlPcmm9sP690B2euIUCr7Drs
 Ddc/eXXs4VRYFOLEsLgx9/08sWcMOXCSCsR3rw1Oerp03rZibeBURAwU9hJQ+R9t7qxZ
 HRPFFvXxy5L3ezw3vEpd+NTjTUP9aSzj4lcrsN1iohOn5c3Sj2mMtiFqYYvYyMbMie+i PQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3syk9nscm4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Sep 2023 07:56:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3887uRiO010252
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 8 Sep 2023 07:56:27 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 8 Sep
 2023 00:56:18 -0700
Message-ID: <f7456b1c-a38c-4666-9840-a374a1a0bb2d@quicinc.com>
Date:   Fri, 8 Sep 2023 15:56:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom: Add SM4450 pinctrl
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>
CC:     <arnd@arndb.de>, <geert+renesas@glider.be>,
        <nfraprado@collabora.com>, <rafal@milecki.pl>, <peng.fan@nxp.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tsoni@quicinc.com>,
        <quic_shashim@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_tdas@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <kernel@quicinc.com>
References: <20230908063843.26835-1-quic_tengfan@quicinc.com>
 <20230908063843.26835-2-quic_tengfan@quicinc.com>
 <709fac9a-e153-d495-c421-f556fab30dde@linaro.org>
From:   Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <709fac9a-e153-d495-c421-f556fab30dde@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LNC2a759ZUXZCIuVb2A9xjQnMxRlKNJE
X-Proofpoint-GUID: LNC2a759ZUXZCIuVb2A9xjQnMxRlKNJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_04,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 suspectscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080072
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



在 9/8/2023 3:53 PM, Krzysztof Kozlowski 写道:
> On 08/09/2023 08:38, Tengfei Fan wrote:
>> Add device tree binding Documentation details for Qualcomm SM4450
>> TLMM device.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   .../bindings/pinctrl/qcom,sm4450-tlmm.yaml    | 129 ++++++++++++++++++
>>   1 file changed, 129 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
>> new file mode 100644
>> index 000000000000..51735604b3c3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
>> @@ -0,0 +1,129 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/pinctrl/qcom,sm4450-tlmm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. RAVELIN TLMM block
> 
> SM4450, not ravelin
yes, will update to SM4450.
> 
>> +
>> +maintainers:
>> +  - Tengfei Fan <quic_tengfan@quicinc.com>
>> +
>> +description:
>> +  Top Level Mode Multiplexer pin controller in Qualcomm SM4450 SoC.
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm4450-pinctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts: true
>> +  interrupt-controller: true
>> +  "#interrupt-cells": true
>> +  gpio-controller: true
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 105
> 
> That's not true, you cannot have 105 ranges.
> 
>> +
>> +  gpio-line-names:
>> +    maxItems: 210
> 
> No, your driver tells something entirely different.
> 
>> +
>> +  "#gpio-cells": true
>> +  gpio-ranges: true
>> +  wakeup-parent: true
>> +
>> +patternProperties:
>> +  "-state$":
>> +    oneOf:
>> +      - $ref: "#/$defs/qcom-sm4450-tlmm-state"
>> +      - patternProperties:
>> +          "-pins$":
>> +            $ref: "#/$defs/qcom-sm4450-tlmm-state"
>> +        additionalProperties: false
>> +
>> +$defs:
>> +  qcom-sm4450-tlmm-state:
>> +    type: object
>> +    description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      pins:
>> +        description:
>> +          List of gpio pins affected by the properties specified in this
>> +          subnode.
>> +        items:
>> +          oneOf:
>> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])$"
> 
> You do not have 210 GPIOs. Narrow it to real values.
> 
>> +            - enum: [ sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
> 
> Not tested. Missing min/maxItems.
> 
>> +
>> +      function:
>> +        description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +        enum: [ gpio, atest_char, atest_char0, atest_char1, atest_char2,
>> +                atest_char3, atest_usb0, atest_usb00, atest_usb01, atest_usb02,
>> +                atest_usb03, audio_ref, cam_mclk, cci_async, cci_i2c,
>> +                cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
>> +                cmu_rng0, cmu_rng1, cmu_rng2, cmu_rng3, coex_uart1, cri_trng,
>> +                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
>> +                dp0_hot, gcc_gp1, gcc_gp2, gcc_gp3, host2wlan_sol, ibi_i3c,
>> +                jitter_bist, mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2,
>> +                mdp_vsync3, mi2s0_data0, mi2s0_data1, mi2s0_sck, mi2s0_ws,
>> +                mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, mi2s_mclk0,
>> +                mi2s_mclk1, nav_gpio0, nav_gpio1, nav_gpio2, pcie0_clk,
>> +                phase_flag0, phase_flag1, phase_flag10, phase_flag11,
>> +                phase_flag12, phase_flag13, phase_flag14, phase_flag15,
>> +                phase_flag16, phase_flag17, phase_flag18, phase_flag19,
>> +                phase_flag2, phase_flag20, phase_flag21, phase_flag22,
>> +                phase_flag23, phase_flag24, phase_flag25, phase_flag26,
>> +                phase_flag27, phase_flag28, phase_flag29, phase_flag3,
>> +                phase_flag30, phase_flag31, phase_flag4, phase_flag5,
>> +                phase_flag6, phase_flag7, phase_flag8, phase_flag9,
>> +                pll_bist, pll_clk, prng_rosc0, prng_rosc1, prng_rosc2,
>> +                prng_rosc3, qdss_cti, qdss_gpio, qdss_gpio0, qdss_gpio1,
>> +                qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13, qdss_gpio14,
>> +                qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4, qdss_gpio5,
>> +                qdss_gpio6, qdss_gpio7, qdss_gpio8, qdss_gpio9, qlink0_enable,
>> +                qlink0_request, qlink0_wmss, qlink1_enable, qlink1_request,
>> +                qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss,
>> +                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
>> +                qup0_se6, qup0_se7, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
>> +                qup1_se4, qup1_se5, qup1_se6, sd_write, tb_trig, tgu_ch0,
>> +                tgu_ch1, tgu_ch2, tgu_ch3, tmess_prng0, tmess_prng1,
>> +                tmess_prng2, tmess_prng3, tsense_pwm1, tsense_pwm2, uim0_clk,
>> +                uim0_data, uim0_present, uim0_reset, uim1_clk, uim1_data,
>> +                uim1_present, uim1_reset, usb0_hs, usb0_phy, vfr_0, vfr_1,
>> +                vsense_trigger ]
>> +
>> +        required:
>> +          - pins
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
>> +    tlmm: pinctrl@f100000 {
>> +      compatible = "qcom,sm4450-tlmm";
>> +      reg = <0x0f100000 0x300000>;
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> 
> Example pin config, gpio-ranges.
> 
>> +    };
>> +...
> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Tengfei Fan
