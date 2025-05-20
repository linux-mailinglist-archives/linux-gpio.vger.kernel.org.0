Return-Path: <linux-gpio+bounces-20361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7826ABE3CD
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 524DA7B0AE7
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 19:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84BA2820CC;
	Tue, 20 May 2025 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYPYMk2w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800D28151E;
	Tue, 20 May 2025 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769834; cv=none; b=eUhApBHGG54RWpqGE3fOzcpObGTvSWfQtr59VhoKMxlv+V+Bc3JL0IgEM/LYFhjliiSuoYZkxOW5Qonb5/MdzwIxpsHcyP2BexdG84ZN+gSi0a780u0UfvBcyajGUw5XEl2nsRjXnt4xDGY51AfdDJHuVOcjcgeiXLsAEWCiofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769834; c=relaxed/simple;
	bh=aywi1GPz22dLfETlq+3Qb24G7PwlbMvJ4MbfKzQwohs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMTzQO7WdVsfrmjYu9KeHiSUazvC8Ow30sNX/UGPLymtFHT34t+LXtJ0qJS1oc+FsZjatbcKC0TO9IwHFdYW6VJbtlSmVp5e7V42UioBIclzhuRH8bydb8vlHGd2/2gYgjMu3hSR/Mu86htk0Om2/ci5z+XzOlvAtEmkJKHRlLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYPYMk2w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703F6C4CEE9;
	Tue, 20 May 2025 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747769833;
	bh=aywi1GPz22dLfETlq+3Qb24G7PwlbMvJ4MbfKzQwohs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYPYMk2wGXRYJymk1VSxI1xOCQcDM9i0qRRWNne2/ztSJoJkS7INaq2tyk6kQO4yY
	 6Sia2yuauftOr3NdXcXI3WqFc7OR1u2AU7TWbta8gu7li208fZC7A5nMF/hSWHvMUB
	 J4zVlZn4eevkU962iGENtOmHJFqR9uWhXnYGBWmsGyf86/mMf48UAkCOr6S2Ehbi4B
	 D3LYwNWlo5WCxOjglCJ1krYa6WLU3E1K+5itiBd4f3fUA3cUcGMKNcLJcAWv1M5PGH
	 jKMr6PpHLnouZTvSyzuLZiCUx11+n4kCpl6tBDUgUAVynikrdfapwIXLJiDjhuB3X8
	 Os7t6KnqQHpsg==
Date: Tue, 20 May 2025 14:37:11 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
Message-ID: <20250520193711.GA1227434-robh@kernel.org>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>

On Tue, May 20, 2025 at 05:02:28PM +0200, Clément Le Goffic wrote:
> 'HDP' stands for Hardware Debug Port, it is an hardware block in
> STMicrolectronics' MPUs that let the user decide which internal SoC's
> signal to observe.
> It provides 8 ports and for each port there is up to 16 different
> signals that can be output.
> Signals are different for each MPU.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 188 +++++++++++++++++++++
>  1 file changed, 188 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
> new file mode 100644
> index 000000000000..6251e9c16ced
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) STMicroelectronics 2025.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl-hdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Hardware Debug Port Mux/Config
> +
> +maintainers:
> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
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
> +        enum: [ HDP0, HDP1, HDP2, HDP3, HDP4, HDP5, HDP6, HDP7 ]

This can be:

pattern: '^HDP[0-7]$'


> +
> +      function:
> +        maxItems: 1

This is always 1 item, so just 'function: true' here.

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
> +      compatible = "st,stm32mp15-hdp";
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
> -- 
> 2.43.0
> 

