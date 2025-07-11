Return-Path: <linux-gpio+bounces-23134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3FB0155D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 10:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C1616FA38
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 08:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3148D1FC0E6;
	Fri, 11 Jul 2025 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iQ+vXmg7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092831E9B08;
	Fri, 11 Jul 2025 08:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752221085; cv=none; b=pErpxfizHJ01BVw008uQzLcsjStWoz77ZjMuF2ie42qug1KZ+kRbTmArBbSWPrqPPtuW+tXw7TdzwgKteN3TNsbPxN9J5ptO75g0KserWbPwAH8l+24ri7ESbMl0elwYs2zMwfdStwACNWu7XMn1aRg4X6rO1Q/lc3cYS3GLDn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752221085; c=relaxed/simple;
	bh=3Tj1qrdyjH7UKtEYJ/RlBW6C8CQasHCUYPSA5X5AC58=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K2+9cmMxCobZztz/hUZODlXglqELqiKVpe0HFHsHyO0gxUBHgtP43Ij7ssKdqzu0di4RQXfgN+a1tyig2oF1/aGM6l/HuvWUX1Dt2Qf7nMVKWVhNLReUm9y0bY9Ad8Ab7z/IRXw98/JJS70xCbeTqEyDQvLT3d5yanDdtqbWLvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=iQ+vXmg7; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B7EBfT009407;
	Fri, 11 Jul 2025 10:04:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4v7wK0a8KCs9YIFamsyHyxhM2hljsn9apUJLUJvPZVI=; b=iQ+vXmg7CV396l61
	8hIaqCMHY1kEgypyaVFQ5YMMytIz3W3vC/1rbedpMuzWZ8ELRyowYK10aBW08NwM
	1vDYPAiHf+f7p6IxRCkSX/CyTlRm1d5bzS9EEvsIMccCrdSwSI233pU/0IQ+O0fX
	ZjlcGmgZj76hr4Yl074Bx/gAQjCUvHFpIe9LCLWgRCfsarDE/2LT3JPeXVhEQvla
	QrBidMnrKFcKXf8qTywabaG5LX5jpW78R4AQWmVMVMjmG/StvX6I1GwKAf5dT3V5
	aNctU9sylw4tgEMkilIyS1wbwxhDM/QfOKQ33BFpziMox2cj/TP4PzSHF8cLmeol
	Xjcgaw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfmwvjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 10:04:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0A21840049;
	Fri, 11 Jul 2025 10:03:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B4F7B16DD7;
	Fri, 11 Jul 2025 10:02:10 +0200 (CEST)
Received: from [10.252.16.187] (10.252.16.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 10:02:09 +0200
Message-ID: <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
Date: Fri, 11 Jul 2025 10:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
 <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01

On 7/11/25 09:41, Clément Le Goffic wrote:
> 'HDP' stands for Hardware Debug Port, it is an hardware block in
> STMicrolectronics' MPUs that let the user decide which internal SoC's
> signal to observe.
> It provides 8 ports and for each port there is up to 16 different
> signals that can be output.
> Signals are different for each MPU.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>   .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  | 187 +++++++++++++++++++++
>   1 file changed, 187 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
> new file mode 100644
> index 000000000000..d0eaee7f52c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
> @@ -0,0 +1,187 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) STMicroelectronics 2025.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/st,stm32-hdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Hardware Debug Port Mux/Config
> +
> +maintainers:
> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>

Oops, need to change the mail address here too.

> +
> +description:
> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
> +  It allows to output internal signals on SoC's GPIO.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp131-hdp
> +      - st,stm32mp151-hdp
> +      - st,stm32mp251-hdp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^hdp[0-7]-pins$":
> +    type: object
> +    $ref: pinmux-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      pins:
> +        pattern: '^HDP[0-7]$'
> +
> +      function: true
> +
> +    required:
> +      - function
> +      - pins
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp131-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, pwr_stop_forbidden, pwr_stdby_wakeup, pwr_encomp_vddcore,
> +                      bsec_out_sec_niden, aiec_sys_wakeup, none, ddrctrl_lp_req,
> +                      pwr_ddr_ret_enable_n, dts_clk_ptat, sram3ctrl_tamp_erase_act, gpoval0,
> +                      pwr_sel_vth_vddcpu, pwr_mpu_ram_lowspeed, ca7_naxierrirq, pwr_okin_mr,
> +                      bsec_out_sec_dbgen, aiec_c1_wakeup, rcc_pwrds_mpu, ddrctrl_dfi_ctrlupd_req,
> +                      ddrctrl_cactive_ddrc_asr, sram3ctrl_hw_erase_act, nic400_s0_bready, gpoval1,
> +                      pwr_pwrwake_mpu, pwr_mpu_clock_disable_ack, ca7_ndbgreset_i,
> +                      bsec_in_rstcore_n, bsec_out_sec_bsc_dis, ddrctrl_dfi_init_complete,
> +                      ddrctrl_perf_op_is_refresh, ddrctrl_gskp_dfi_lp_req, sram3ctrl_sw_erase_act,
> +                      nic400_s0_bvalid, gpoval2, pwr_sel_vth_vddcore, pwr_mpu_clock_disable_req,
> +                      ca7_npmuirq0, ca7_nfiqout0, bsec_out_sec_dftlock, bsec_out_sec_jtag_dis,
> +                      rcc_pwrds_sys, sram3ctrl_tamp_erase_req, ddrctrl_stat_ddrc_reg_selfref_type0,
> +                      dts_valobus1_0, dts_valobus2_0, tamp_potential_tamp_erfcfg, nic400_s0_wready,
> +                      nic400_s0_rready, gpoval3, pwr_stop2_active, ca7_nl2reset_i,
> +                      ca7_npreset_varm_i, bsec_out_sec_dften, bsec_out_sec_dbgswenable,
> +                      eth1_out_pmt_intr_o, eth2_out_pmt_intr_o, ddrctrl_stat_ddrc_reg_selfref_type1,
> +                      ddrctrl_cactive_0, dts_valobus1_1, dts_valobus2_1, tamp_nreset_sram_ercfg,
> +                      nic400_s0_wlast, nic400_s0_rlast, gpoval4, ca7_standbywfil2,
> +                      pwr_vth_vddcore_ack, ca7_ncorereset_i, ca7_nirqout0, bsec_in_pwrok,
> +                      bsec_out_sec_deviceen, eth1_out_lpi_intr_o, eth2_out_lpi_intr_o,
> +                      ddrctrl_cactive_ddrc, ddrctrl_wr_credit_cnt, dts_valobus1_2, dts_valobus2_2,
> +                      pka_pka_itamp_out, nic400_s0_wvalid, nic400_s0_rvalid, gpoval5,
> +                      ca7_standbywfe0, pwr_vth_vddcpu_ack, ca7_evento, bsec_in_tamper_det,
> +                      bsec_out_sec_spniden, eth1_out_mac_speed_o1, eth2_out_mac_speed_o1,
> +                      ddrctrl_csysack_ddrc, ddrctrl_lpr_credit_cnt, dts_valobus1_3, dts_valobus2_3,
> +                      saes_tamper_out, nic400_s0_awready, nic400_s0_arready, gpoval6,
> +                      ca7_standbywfi0, pwr_rcc_vcpu_rdy, ca7_eventi, ca7_dbgack0, bsec_out_fuse_ok,
> +                      bsec_out_sec_spiden, eth1_out_mac_speed_o0, eth2_out_mac_speed_o0,
> +                      ddrctrl_csysreq_ddrc, ddrctrl_hpr_credit_cnt, dts_valobus1_4, dts_valobus2_4,
> +                      rng_tamper_out, nic400_s0_awavalid, nic400_s0_aravalid, gpoval7 ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp151-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, cm4_sleepdeep, pwr_stdby_wkup, pwr_encomp_vddcore,
> +                      bsec_out_sec_niden, none, rcc_cm4_sleepdeep, gpu_dbg7, ddrctrl_lp_req,
> +                      pwr_ddr_ret_enable_n, dts_clk_ptat, gpoval0, pwr_pwrwake_mcu, cm4_halted,
> +                      ca7_naxierrirq, pwr_okin_mr, bsec_out_sec_dbgen, exti_sys_wakeup,
> +                      rcc_pwrds_mpu, gpu_dbg6, ddrctrl_dfi_ctrlupd_req, ddrctrl_cactive_ddrc_asr,
> +                      gpoval1, pwr_pwrwake_mpu, cm4_rxev, ca7_npmuirq1, ca7_nfiqout1,
> +                      bsec_in_rstcore_n, exti_c2_wakeup, rcc_pwrds_mcu, gpu_dbg5,
> +                      ddrctrl_dfi_init_complete, ddrctrl_perf_op_is_refresh,
> +                      ddrctrl_gskp_dfi_lp_req, gpoval2, pwr_sel_vth_vddcore, cm4_txev, ca7_npmuirq0,
> +                      ca7_nfiqout0, bsec_out_sec_dftlock, exti_c1_wakeup, rcc_pwrds_sys, gpu_dbg4,
> +                      ddrctrl_stat_ddrc_reg_selfref_type0, ddrctrl_cactive_1, dts_valobus1_0,
> +                      dts_valobus2_0, gpoval3, pwr_mpu_pdds_not_cstbydis, cm4_sleeping, ca7_nreset1,
> +                      ca7_nirqout1, bsec_out_sec_dften, bsec_out_sec_dbgswenable,
> +                      eth_out_pmt_intr_o, gpu_dbg3, ddrctrl_stat_ddrc_reg_selfref_type1,
> +                      ddrctrl_cactive_0, dts_valobus1_1, dts_valobus2_1, gpoval4, ca7_standbywfil2,
> +                      pwr_vth_vddcore_ack, ca7_nreset0, ca7_nirqout0, bsec_in_pwrok,
> +                      bsec_out_sec_deviceen, eth_out_lpi_intr_o, gpu_dbg2, ddrctrl_cactive_ddrc,
> +                      ddrctrl_wr_credit_cnt, dts_valobus1_2, dts_valobus2_2, gpoval5,
> +                      ca7_standbywfi1, ca7_standbywfe1, ca7_evento, ca7_dbgack1,
> +                      bsec_out_sec_spniden, eth_out_mac_speed_o1, gpu_dbg1, ddrctrl_csysack_ddrc,
> +                      ddrctrl_lpr_credit_cnt, dts_valobus1_3, dts_valobus2_3, gpoval6,
> +                      ca7_standbywfi0, ca7_standbywfe0, ca7_dbgack0, bsec_out_fuse_ok,
> +                      bsec_out_sec_spiden, eth_out_mac_speed_o0, gpu_dbg0, ddrctrl_csysreq_ddrc,
> +                      ddrctrl_hpr_credit_cnt, dts_valobus1_4, dts_valobus2_4, gpoval7 ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp251-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, cpu2_sleep_deep, bsec_out_tst_sdr_unlock_or_disable_scan,
> +                      bsec_out_nidenm, bsec_out_nidena, cpu2_state_0, rcc_pwrds_sys, gpu_dbg7,
> +                      ddrss_csysreq_ddrc, ddrss_dfi_phyupd_req, cpu3_sleep_deep,
> +                      d2_gbl_per_clk_bus_req, pcie_usb_cxpl_debug_info_ei_0,
> +                      pcie_usb_cxpl_debug_info_ei_8, d3_state_0, gpoval0, pwr_pwrwake_cpu2,
> +                      cpu2_halted, cpu2_state_1, bsec_out_dbgenm, bsec_out_dbgena, exti1_sys_wakeup,
> +                      rcc_pwrds_cpu2, gpu_dbg6, ddrss_csysack_ddrc, ddrss_dfi_phymstr_req,
> +                      cpu3_halted, d2_gbl_per_dma_req, pcie_usb_cxpl_debug_info_ei_1,
> +                      pcie_usb_cxpl_debug_info_ei_9, d3_state_1, gpoval1, pwr_pwrwake_cpu1,
> +                      cpu2_rxev, cpu1_npumirq1, cpu1_nfiqout1, bsec_out_shdbgen, exti1_cpu2_wakeup,
> +                      rcc_pwrds_cpu1, gpu_dbg5, ddrss_cactive_ddrc, ddrss_dfi_lp_req, cpu3_rxev,
> +                      hpdma1_clk_bus_req, pcie_usb_cxpl_debug_info_ei_2,
> +                      pcie_usb_cxpl_debug_info_ei_10, d3_state_2, gpoval2, pwr_sel_vth_vddcpu,
> +                      cpu2_txev, cpu1_npumirq0, cpu1_nfiqout0, bsec_out_ddbgen, exti1_cpu1_wakeup,
> +                      cpu3_state_0, gpu_dbg4, ddrss_mcdcg_en, ddrss_dfi_freq_0, cpu3_txev,
> +                      hpdma2_clk_bus_req, pcie_usb_cxpl_debug_info_ei_3,
> +                      pcie_usb_cxpl_debug_info_ei_11, d1_state_0, gpoval3, pwr_sel_vth_vddcore,
> +                      cpu2_sleeping, cpu1_evento, cpu1_nirqout1, bsec_out_spnidena, exti2_d3_wakeup,
> +                      eth1_out_pmt_intr_o, gpu_dbg3, ddrss_dphycg_en, ddrss_obsp0, cpu3_sleeping,
> +                      hpdma3_clk_bus_req, pcie_usb_cxpl_debug_info_ei_4,
> +                      pcie_usb_cxpl_debug_info_ei_12, d1_state_1, gpoval4, cpu1_standby_wfil2,
> +                      none, cpu1_nirqout0, bsec_out_spidena, exti2_cpu3_wakeup, eth1_out_lpi_intr_o,
> +                      gpu_dbg2, ddrctrl_dfi_init_start, ddrss_obsp1, cpu3_state_1,
> +                      d3_gbl_per_clk_bus_req, pcie_usb_cxpl_debug_info_ei_5,
> +                      pcie_usb_cxpl_debug_info_ei_13, d1_state_2, gpoval5, cpu1_standby_wfi1,
> +                      cpu1_standby_wfe1, cpu1_halted1, cpu1_naxierrirq, bsec_out_spnidenm,
> +                      exti2_cpu2_wakeup, eth2_out_pmt_intr_o, gpu_dbg1, ddrss_dfi_init_complete,
> +                      ddrss_obsp2, d2_state_0, d3_gbl_per_dma_req, pcie_usb_cxpl_debug_info_ei_6,
> +                      pcie_usb_cxpl_debug_info_ei_14, cpu1_state_0, gpoval6, cpu1_standby_wfi0,
> +                      cpu1_standby_wfe0, cpu1_halted0, bsec_out_spidenm, exti2_cpu1__wakeup,
> +                      eth2_out_lpi_intr_o, gpu_dbg0, ddrss_dfi_ctrlupd_req, ddrss_obsp3, d2_state_1,
> +                      lpdma1_clk_bus_req, pcie_usb_cxpl_debug_info_ei_7,
> +                      pcie_usb_cxpl_debug_info_ei_15, cpu1_state_1, gpoval7 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    pinctrl@54090000 {
> +      compatible = "st,stm32mp151-hdp";
> +      reg = <0x54090000 0x400>;
> +      clocks = <&rcc HDP>;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&hdp2_gpo>;
> +      hdp2_gpo: hdp2-pins {
> +        function = "gpoval2";
> +        pins = "HDP2";
> +      };
> +    };
> 


