Return-Path: <linux-gpio+bounces-35586-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH5SH/1v72mHBQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35586-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:17:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA54742B4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D5F43003D18
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E335A3D34BA;
	Mon, 27 Apr 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaDTs7Ak"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58C386C31;
	Mon, 27 Apr 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299449; cv=none; b=geXeyF0am7zY5XR78FcgwcDaFv5AvuxwTZpJqwQNfLg1yVPaOIq5cy+87Nc8aReM0HsrVvqw/dbC/R9usjjs1K0y+cUP0sCPqn1Z9VQe3Rj7JdpTWoybZPvpLMpDT9YRilgwMCDDKw3fd4KoppgODbEu7cZaVa0ikUk/J9GUocQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299449; c=relaxed/simple;
	bh=+/rz8omRuaWaydHM4yATSKYLfUoXUGeFZn1sTYwVosw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCZcsECKE4+wiRbEFJlq20mvoXBoE2Nycwh9TAAwXuWgfBU7ftimyMsrk/qQr90NkOw6OnBc2MScF2Rb1YTWcHrPmOt3GQAiOlGkD6fjI32KdWl3JYZg/Dr38yJxztIQ8fL444S4Fy2SMuyM48FrKYFI1lwUh1+yiooFuWlmC4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaDTs7Ak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B90C19425;
	Mon, 27 Apr 2026 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299449;
	bh=+/rz8omRuaWaydHM4yATSKYLfUoXUGeFZn1sTYwVosw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaDTs7AkK/NpPTO3cCXQz1qwKvKbve1jR3sm7X96HTCf+18GLK7xOGKCBu43mt2lx
	 cIc1+LUf3pKPa7R5dzyV9zSk0P+LAsLHwytf47Oe8O+jSi/JaR2Ez5BDE2vSmsaUBX
	 39NSbYYm10qXdLZuU3/FHgdTw1To8GfoW0w6PiKYBQwC3AFY0nuekIvZgNR2M2RLeT
	 pRROpk0l3M4/VfCCRYFElKcwP863caAyi9UM+BrPP5Y0GY0Kj0R+5Xba3DA+834NO+
	 4UQHS2MJu/a+ku8A1lJ9jnZq1iFjGt2yvrJWNzPAiFOyorCtDXmMh0AyqLXK3vd9mk
	 oPZYO96a1ablQ==
Date: Mon, 27 Apr 2026 09:17:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
Message-ID: <ae9usgOf-KtgEJ4q@baldur>
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
 <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1BCA54742B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35586-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 04:00:30PM +0200, Bartosz Golaszewski wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
[..]
> +enum nord_functions {
> +	msm_mux_gpio,
> +	msm_mux_aoss_cti,
> +	msm_mux_atest_char0,
> +	msm_mux_atest_char1,
> +	msm_mux_atest_char2,
> +	msm_mux_atest_char3,
> +	msm_mux_atest_char_start,
> +	msm_mux_atest_usb20,
> +	msm_mux_atest_usb21,
> +	msm_mux_aud_intfc0_clk,
> +	msm_mux_aud_intfc0_data0,
> +	msm_mux_aud_intfc0_data1,
> +	msm_mux_aud_intfc0_data2,
> +	msm_mux_aud_intfc0_data3,
> +	msm_mux_aud_intfc0_data4,
> +	msm_mux_aud_intfc0_data5,
> +	msm_mux_aud_intfc0_data6,
> +	msm_mux_aud_intfc0_data7,
> +	msm_mux_aud_intfc0_ws,
> +	msm_mux_aud_intfc10_clk,
> +	msm_mux_aud_intfc10_data0,
> +	msm_mux_aud_intfc10_data1,
> +	msm_mux_aud_intfc10_ws,
> +	msm_mux_aud_intfc1_clk,
> +	msm_mux_aud_intfc1_data0,
> +	msm_mux_aud_intfc1_data1,
> +	msm_mux_aud_intfc1_data2,
> +	msm_mux_aud_intfc1_data3,
> +	msm_mux_aud_intfc1_data4,
> +	msm_mux_aud_intfc1_data5,
> +	msm_mux_aud_intfc1_data6,
> +	msm_mux_aud_intfc1_data7,

Is there any reason to keep these 8 "data" lanes as separate pingroups?

> +	msm_mux_aud_intfc1_ws,
> +	msm_mux_aud_intfc2_clk,
> +	msm_mux_aud_intfc2_data0,
> +	msm_mux_aud_intfc2_data1,
> +	msm_mux_aud_intfc2_data2,
> +	msm_mux_aud_intfc2_data3,
> +	msm_mux_aud_intfc2_ws,
> +	msm_mux_aud_intfc3_clk,
> +	msm_mux_aud_intfc3_data0,
> +	msm_mux_aud_intfc3_data1,
> +	msm_mux_aud_intfc3_ws,
> +	msm_mux_aud_intfc4_clk,
> +	msm_mux_aud_intfc4_data0,
> +	msm_mux_aud_intfc4_data1,
> +	msm_mux_aud_intfc4_ws,
> +	msm_mux_aud_intfc5_clk,
> +	msm_mux_aud_intfc5_data0,
> +	msm_mux_aud_intfc5_data1,
> +	msm_mux_aud_intfc5_ws,
> +	msm_mux_aud_intfc6_clk,
> +	msm_mux_aud_intfc6_data0,
> +	msm_mux_aud_intfc6_data1,
> +	msm_mux_aud_intfc6_ws,
> +	msm_mux_aud_intfc7_clk,
> +	msm_mux_aud_intfc7_data0,
> +	msm_mux_aud_intfc7_data1,
> +	msm_mux_aud_intfc7_ws,
> +	msm_mux_aud_intfc8_clk,
> +	msm_mux_aud_intfc8_data0,
> +	msm_mux_aud_intfc8_data1,
> +	msm_mux_aud_intfc8_ws,
> +	msm_mux_aud_intfc9_clk,
> +	msm_mux_aud_intfc9_data0,
> +	msm_mux_aud_intfc9_ws,
> +	msm_mux_aud_mclk0_mira,
> +	msm_mux_aud_mclk0_mirb,
> +	msm_mux_aud_mclk1_mira,
> +	msm_mux_aud_mclk1_mirb,
> +	msm_mux_aud_mclk2_mira,
> +	msm_mux_aud_mclk2_mirb,
> +	msm_mux_aud_refclk0,
> +	msm_mux_aud_refclk1,
> +	msm_mux_bist_done,
> +	msm_mux_ccu_async_in0,
> +	msm_mux_ccu_async_in1,
> +	msm_mux_ccu_async_in2,
> +	msm_mux_ccu_async_in3,
> +	msm_mux_ccu_async_in4,
> +	msm_mux_ccu_async_in5,
> +	msm_mux_ccu_i2c_scl0,

If you combine scl and sda, you don't force the DT author to split the
state.

> +	msm_mux_ccu_i2c_scl1,
> +	msm_mux_ccu_i2c_scl2,
> +	msm_mux_ccu_i2c_scl3,
> +	msm_mux_ccu_i2c_scl4,
> +	msm_mux_ccu_i2c_scl5,
> +	msm_mux_ccu_i2c_scl6,
> +	msm_mux_ccu_i2c_scl7,
> +	msm_mux_ccu_i2c_scl8,
> +	msm_mux_ccu_i2c_scl9,
> +	msm_mux_ccu_i2c_sda0,
> +	msm_mux_ccu_i2c_sda1,
> +	msm_mux_ccu_i2c_sda2,
> +	msm_mux_ccu_i2c_sda3,
> +	msm_mux_ccu_i2c_sda4,
> +	msm_mux_ccu_i2c_sda5,
> +	msm_mux_ccu_i2c_sda6,
> +	msm_mux_ccu_i2c_sda7,
> +	msm_mux_ccu_i2c_sda8,
> +	msm_mux_ccu_i2c_sda9,
> +	msm_mux_ccu_timer0,
> +	msm_mux_ccu_timer1,
> +	msm_mux_ccu_timer10,
> +	msm_mux_ccu_timer11,
> +	msm_mux_ccu_timer12,
> +	msm_mux_ccu_timer13,
> +	msm_mux_ccu_timer14,
> +	msm_mux_ccu_timer15,
> +	msm_mux_ccu_timer2,
> +	msm_mux_ccu_timer3,
> +	msm_mux_ccu_timer4,
> +	msm_mux_ccu_timer5,
> +	msm_mux_ccu_timer6,
> +	msm_mux_ccu_timer7,
> +	msm_mux_ccu_timer8,
> +	msm_mux_ccu_timer9,
> +	msm_mux_clink_debug,
> +	msm_mux_dbg_out,
> +	msm_mux_dbg_out_clk,
> +	msm_mux_ddr_bist_complete,
> +	msm_mux_ddr_bist_fail,
> +	msm_mux_ddr_bist_start,
> +	msm_mux_ddr_bist_stop,
> +	msm_mux_ddr_pxi0,
> +	msm_mux_ddr_pxi1,
> +	msm_mux_ddr_pxi10,
> +	msm_mux_ddr_pxi11,
> +	msm_mux_ddr_pxi12,
> +	msm_mux_ddr_pxi13,
> +	msm_mux_ddr_pxi14,
> +	msm_mux_ddr_pxi15,
> +	msm_mux_ddr_pxi2,
> +	msm_mux_ddr_pxi3,
> +	msm_mux_ddr_pxi4,
> +	msm_mux_ddr_pxi5,
> +	msm_mux_ddr_pxi6,
> +	msm_mux_ddr_pxi7,
> +	msm_mux_ddr_pxi8,
> +	msm_mux_ddr_pxi9,

These can be a single group. Perhaps all the ddr_* is a single group?

> +	msm_mux_dp_rx0,
> +	msm_mux_dp_rx00,
> +	msm_mux_dp_rx01,
> +	msm_mux_dp_rx0_mute,
> +	msm_mux_dp_rx1,
> +	msm_mux_dp_rx10,
> +	msm_mux_dp_rx11,
> +	msm_mux_dp_rx1_mute,
> +	msm_mux_edp0_hot,
> +	msm_mux_edp0_lcd,
> +	msm_mux_edp1_hot,
> +	msm_mux_edp1_lcd,
> +	msm_mux_edp2_hot,
> +	msm_mux_edp2_lcd,
> +	msm_mux_edp3_hot,
> +	msm_mux_edp3_lcd,
> +	msm_mux_emac0_mcg0,
> +	msm_mux_emac0_mcg1,
> +	msm_mux_emac0_mcg2,
> +	msm_mux_emac0_mcg3,

Single group?

> +	msm_mux_emac0_mdc,
> +	msm_mux_emac0_mdio,
> +	msm_mux_emac0_ptp,
> +	msm_mux_emac1_mcg0,
> +	msm_mux_emac1_mcg1,
> +	msm_mux_emac1_mcg2,
> +	msm_mux_emac1_mcg3,
> +	msm_mux_emac1_mdc,
> +	msm_mux_emac1_mdio,
> +	msm_mux_emac1_ptp,
> +	msm_mux_gcc_gp1_clk,
> +	msm_mux_gcc_gp2_clk,
> +	msm_mux_gcc_gp3_clk,
> +	msm_mux_gcc_gp4_clk,
> +	msm_mux_gcc_gp5_clk,
> +	msm_mux_gcc_gp6_clk,
> +	msm_mux_gcc_gp7_clk,
> +	msm_mux_gcc_gp8_clk,
> +	msm_mux_jitter_bist,
> +	msm_mux_lbist_pass,
> +	msm_mux_mbist_pass,
> +	msm_mux_mdp0_vsync0_out,
> +	msm_mux_mdp0_vsync10_out,
> +	msm_mux_mdp0_vsync1_out,
> +	msm_mux_mdp0_vsync2_out,
> +	msm_mux_mdp0_vsync3_out,
> +	msm_mux_mdp0_vsync4_out,
> +	msm_mux_mdp0_vsync5_out,
> +	msm_mux_mdp0_vsync6_out,
> +	msm_mux_mdp0_vsync7_out,
> +	msm_mux_mdp0_vsync8_out,
> +	msm_mux_mdp0_vsync9_out,
> +	msm_mux_mdp1_vsync0_out,
> +	msm_mux_mdp1_vsync10_out,
> +	msm_mux_mdp1_vsync1_out,
> +	msm_mux_mdp1_vsync2_out,
> +	msm_mux_mdp1_vsync3_out,
> +	msm_mux_mdp1_vsync4_out,
> +	msm_mux_mdp1_vsync5_out,
> +	msm_mux_mdp1_vsync6_out,
> +	msm_mux_mdp1_vsync7_out,
> +	msm_mux_mdp1_vsync8_out,
> +	msm_mux_mdp1_vsync9_out,
> +	msm_mux_mdp_vsync_e,
> +	msm_mux_mdp_vsync_p,
> +	msm_mux_mdp_vsync_s,
> +	msm_mux_pcie0_clk_req_n,
> +	msm_mux_pcie1_clk_req_n,
> +	msm_mux_pcie2_clk_req_n,
> +	msm_mux_pcie3_clk_req_n,
> +	msm_mux_phase_flag0,
> +	msm_mux_phase_flag1,
> +	msm_mux_phase_flag10,
> +	msm_mux_phase_flag11,
> +	msm_mux_phase_flag12,
> +	msm_mux_phase_flag13,
> +	msm_mux_phase_flag14,
> +	msm_mux_phase_flag15,
> +	msm_mux_phase_flag16,
> +	msm_mux_phase_flag17,
> +	msm_mux_phase_flag18,
> +	msm_mux_phase_flag19,
> +	msm_mux_phase_flag2,
> +	msm_mux_phase_flag20,
> +	msm_mux_phase_flag21,
> +	msm_mux_phase_flag22,
> +	msm_mux_phase_flag23,
> +	msm_mux_phase_flag24,
> +	msm_mux_phase_flag25,
> +	msm_mux_phase_flag26,
> +	msm_mux_phase_flag27,
> +	msm_mux_phase_flag28,
> +	msm_mux_phase_flag29,
> +	msm_mux_phase_flag3,
> +	msm_mux_phase_flag30,
> +	msm_mux_phase_flag31,
> +	msm_mux_phase_flag4,
> +	msm_mux_phase_flag5,
> +	msm_mux_phase_flag6,
> +	msm_mux_phase_flag7,
> +	msm_mux_phase_flag8,
> +	msm_mux_phase_flag9,

Single group.

> +	msm_mux_pll_bist_sync,
> +	msm_mux_pll_clk_aux,
> +	msm_mux_prng_rosc0,
> +	msm_mux_prng_rosc1,
> +	msm_mux_pwrbrk_i_n,
> +	msm_mux_qdss_cti,
> +	msm_mux_qdss_gpio,
> +	msm_mux_qdss_gpio0,
> +	msm_mux_qdss_gpio1,
> +	msm_mux_qdss_gpio10,
> +	msm_mux_qdss_gpio11,
> +	msm_mux_qdss_gpio12,
> +	msm_mux_qdss_gpio13,
> +	msm_mux_qdss_gpio14,
> +	msm_mux_qdss_gpio15,
> +	msm_mux_qdss_gpio2,
> +	msm_mux_qdss_gpio3,
> +	msm_mux_qdss_gpio4,
> +	msm_mux_qdss_gpio5,
> +	msm_mux_qdss_gpio6,
> +	msm_mux_qdss_gpio7,
> +	msm_mux_qdss_gpio8,
> +	msm_mux_qdss_gpio9,

Single group. Perhaps even single "qdss" group?

> +	msm_mux_qspi0,
> +	msm_mux_qspi1,
> +	msm_mux_qspi2,
> +	msm_mux_qspi3,

Single group.

> +	msm_mux_qspi_clk,
> +	msm_mux_qspi_cs0_n,
> +	msm_mux_qspi_cs1_n,
> +	msm_mux_qup0_se0,
> +	msm_mux_qup0_se1,
> +	msm_mux_qup0_se2,
> +	msm_mux_qup0_se3,
> +	msm_mux_qup0_se4,
> +	msm_mux_qup0_se5,
> +	msm_mux_qup1_se0,
> +	msm_mux_qup1_se1,
> +	msm_mux_qup1_se2,
> +	msm_mux_qup1_se3,
> +	msm_mux_qup1_se4,
> +	msm_mux_qup1_se5,
> +	msm_mux_qup1_se6,
> +	msm_mux_qup2_se0,
> +	msm_mux_qup2_se1,
> +	msm_mux_qup2_se2,
> +	msm_mux_qup2_se3,
> +	msm_mux_qup2_se4,
> +	msm_mux_qup2_se5,
> +	msm_mux_qup2_se6,
> +	msm_mux_qup3_se0_mira,
> +	msm_mux_qup3_se0_mirb,

Nice, that's clean.

Regards,
Bjorn

