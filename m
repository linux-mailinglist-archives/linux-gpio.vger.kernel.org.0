Return-Path: <linux-gpio+bounces-20404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E882ABEECD
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B25F1745FE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 08:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05E4238C04;
	Wed, 21 May 2025 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="j0LK7o6z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3E236A70;
	Wed, 21 May 2025 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817926; cv=none; b=IqMLKg9123pCkfQ1AsiWwfGd5hGoc86spVbGykNTBnrHGy816mVzSrDSzxzJWeVT1DRuwPPk0uhlUfD8i0GX361C/2mdbkBRgLY/iiRE5CaFt0UtKNCLWkLkg0A7gXlYCyv2wQevl6+DcRNA+58UNx+zWqarppVt7AMk5VrqshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817926; c=relaxed/simple;
	bh=9oROgaRpgyQ3GB1/syDa8YVnvOgoQfHrFkuJQfbXF/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AYrzTh5JIRAxrWBP7Ani6vxzigRo8vR7t5zv3sGKQQkMOzNXWroI6cgVh+PzCU03b7wabCbwCA587OM4d0/zCWEbZr2cSoySJnhH9Id91dn4c0rAQlhv8hcGL1wTeCpQjjWnJJn85mnfm/PsHzoT3/S4HZ6I2f1aP+T9LNfHx0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=j0LK7o6z; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L8LBSd011048;
	Wed, 21 May 2025 10:58:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	jlDfocRpLBC1fqG7olksB35wg8e5cS+aaD6BkzKFG5o=; b=j0LK7o6zzY5H6ERp
	KASP8VeL6lA1ee/e/Xs48FG4No36uIe57CbEWV5rnfO6dsyFGGTsg2QSI3sUH15W
	ZnRGscPNBO0/8qBUaacySTI+a7W8cr+AqRL9Dv10FupmnslnRgPwl7CsaUkkPkF8
	BM2TDOBFT9k5QfbmL/+T7A5rYa7bRMpQvRpi6TmxdjrLN/zdjieneVI40x/Hvc+T
	l7vSE6skj2+o/Xc5UTq4o8f3aVofCgCaxPL2gESTuqbdU7wZLBx/u5Ujp+5XTkID
	qSNxhPAcw6mmg0U+Bn90Nbj2/cj2hkf3/RyhTvuJjv40FQ84qUDpOmOnSfe1mrbm
	TGERrA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfa2y9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AB3E140054;
	Wed, 21 May 2025 10:57:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42724B4B444;
	Wed, 21 May 2025 10:55:35 +0200 (CEST)
Received: from [10.48.81.67] (10.48.81.67) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:55:34 +0200
Message-ID: <0d113a6c-712b-440a-8f45-e12fd498fa51@foss.st.com>
Date: Wed, 21 May 2025 10:55:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
 <20250520193711.GA1227434-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250520193711.GA1227434-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01

On 5/20/25 21:37, Rob Herring wrote:
> On Tue, May 20, 2025 at 05:02:28PM +0200, Clément Le Goffic wrote:
>> 'HDP' stands for Hardware Debug Port, it is an hardware block in
>> STMicrolectronics' MPUs that let the user decide which internal SoC's
>> signal to observe.
>> It provides 8 ports and for each port there is up to 16 different
>> signals that can be output.
>> Signals are different for each MPU.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 188 +++++++++++++++++++++
>>   1 file changed, 188 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
>> new file mode 100644
>> index 000000000000..6251e9c16ced
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
>> @@ -0,0 +1,188 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) STMicroelectronics 2025.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl-hdp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Hardware Debug Port Mux/Config
>> +
>> +maintainers:
>> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
>> +
>> +description:
>> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
>> +  It allows to output internal signals on SoC's GPIO.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - st,stm32mp131-hdp
>> +      - st,stm32mp151-hdp
>> +      - st,stm32mp251-hdp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^hdp[0-7]-pins$":
>> +    type: object
>> +    $ref: pinmux-node.yaml#
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      pins:
>> +        enum: [ HDP0, HDP1, HDP2, HDP3, HDP4, HDP5, HDP6, HDP7 ]
> 
> This can be:
> 
> pattern: '^HDP[0-7]$'

Hi Rob, thanks for pattern tips I didn't know it was possible
> 
> 
>> +
>> +      function:
>> +        maxItems: 1
> 
> This is always 1 item, so just 'function: true' here.

Yes, I know I fought to make it work, and the maxItems was the only idea 
that came out.
> 
>> +
>> +    required:
>> +      - function
>> +      - pins
>> +
>> +allOf:
>> +  - $ref: pinctrl.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: st,stm32mp131-hdp
>> +    then:
>> +      patternProperties:
>> +        "^hdp[0-7]-pins$":
>> +          properties:
>> +            function:
>> +              enum: [ pwr_pwrwake_sys, pwr_stop_forbidden, pwr_stdby_wakeup, pwr_encomp_vddcore,
>> +                      bsec_out_sec_niden, aiec_sys_wakeup, none, ddrctrl_lp_req,
>> +                      pwr_ddr_ret_enable_n, dts_clk_ptat, sram3ctrl_tamp_erase_act, gpoval0,
>> +                      pwr_sel_vth_vddcpu, pwr_mpu_ram_lowspeed, ca7_naxierrirq, pwr_okin_mr,
>> +                      bsec_out_sec_dbgen, aiec_c1_wakeup, rcc_pwrds_mpu, ddrctrl_dfi_ctrlupd_req,
>> +                      ddrctrl_cactive_ddrc_asr, sram3ctrl_hw_erase_act, nic400_s0_bready, gpoval1,
>> +                      pwr_pwrwake_mpu, pwr_mpu_clock_disable_ack, ca7_ndbgreset_i,
>> +                      bsec_in_rstcore_n, bsec_out_sec_bsc_dis, ddrctrl_dfi_init_complete,
>> +                      ddrctrl_perf_op_is_refresh, ddrctrl_gskp_dfi_lp_req, sram3ctrl_sw_erase_act,
>> +                      nic400_s0_bvalid, gpoval2, pwr_sel_vth_vddcore, pwr_mpu_clock_disable_req,
>> +                      ca7_npmuirq0, ca7_nfiqout0, bsec_out_sec_dftlock, bsec_out_sec_jtag_dis,
>> +                      rcc_pwrds_sys, sram3ctrl_tamp_erase_req, ddrctrl_stat_ddrc_reg_selfref_type0,
>> +                      dts_valobus1_0, dts_valobus2_0, tamp_potential_tamp_erfcfg, nic400_s0_wready,
>> +                      nic400_s0_rready, gpoval3, pwr_stop2_active, ca7_nl2reset_i,
>> +                      ca7_npreset_varm_i, bsec_out_sec_dften, bsec_out_sec_dbgswenable,
>> +                      eth1_out_pmt_intr_o, eth2_out_pmt_intr_o, ddrctrl_stat_ddrc_reg_selfref_type1,
>> +                      ddrctrl_cactive_0, dts_valobus1_1, dts_valobus2_1, tamp_nreset_sram_ercfg,
>> +                      nic400_s0_wlast, nic400_s0_rlast, gpoval4, ca7_standbywfil2,
>> +                      pwr_vth_vddcore_ack, ca7_ncorereset_i, ca7_nirqout0, bsec_in_pwrok,
>> +                      bsec_out_sec_deviceen, eth1_out_lpi_intr_o, eth2_out_lpi_intr_o,
>> +                      ddrctrl_cactive_ddrc, ddrctrl_wr_credit_cnt, dts_valobus1_2, dts_valobus2_2,
>> +                      pka_pka_itamp_out, nic400_s0_wvalid, nic400_s0_rvalid, gpoval5,
>> +                      ca7_standbywfe0, pwr_vth_vddcpu_ack, ca7_evento, bsec_in_tamper_det,
>> +                      bsec_out_sec_spniden, eth1_out_mac_speed_o1, eth2_out_mac_speed_o1,
>> +                      ddrctrl_csysack_ddrc, ddrctrl_lpr_credit_cnt, dts_valobus1_3, dts_valobus2_3,
>> +                      saes_tamper_out, nic400_s0_awready, nic400_s0_arready, gpoval6,
>> +                      ca7_standbywfi0, pwr_rcc_vcpu_rdy, ca7_eventi, ca7_dbgack0, bsec_out_fuse_ok,
>> +                      bsec_out_sec_spiden, eth1_out_mac_speed_o0, eth2_out_mac_speed_o0,
>> +                      ddrctrl_csysreq_ddrc, ddrctrl_hpr_credit_cnt, dts_valobus1_4, dts_valobus2_4,
>> +                      rng_tamper_out, nic400_s0_awavalid, nic400_s0_aravalid, gpoval7 ]

Do you know if it is possible to add an "and" in the if condition ?
I want to restrict the function name per pin name:
If compatible is "st,stm32mp131-hdp" and pin is "HDP2" then
function:
	enum: [..]
Is it somehow feasible ?

Thank you

Clément

[...]
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>> +
>> +    pinctrl@54090000 {
>> +      compatible = "st,stm32mp15-hdp";
>> +      reg = <0x54090000 0x400>;
>> +      clocks = <&rcc HDP>;
>> +      pinctrl-names = "default";
>> +      pinctrl-0 = <&hdp2_gpo>;
>> +      hdp2_gpo: hdp2-pins {
>> +        function = "gpoval2";
>> +        pins = "HDP2";
>> +      };
>> +    };
>>
>> -- 
>> 2.43.0
>>


