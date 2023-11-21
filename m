Return-Path: <linux-gpio+bounces-322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA27F30C2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 15:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31231C21BC2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 14:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F57154FBA;
	Tue, 21 Nov 2023 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FvxWctBA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5EED5D
	for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 06:30:50 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32dff08bbdbso4328638f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 06:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700577048; x=1701181848; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gNBdVexOS2rFhdNBsyEIv1F9WYnWDTUlYqa+qcf8hzQ=;
        b=FvxWctBAGdskj75atQTVAwJyZe6H0XhK1m9ArUMrSkwSkLwfIMovMLVimWxtW8Keyw
         1IswedJeA2b7GSyAnSnjN5s6ARScN6hVjPoG8czgeFDfy/A8WDdifg7G7zRfB87GaqIG
         lTy4fv2F3VXPLbZSEuClS/WpoNYsDYt/R+dU+TevuvNksBmBrtnvjkdYQ8XzsGv70z9E
         U/dcjRjKcY/pUgVIa0TQp4LTmEqVja0yrmdqXfB8eoJ+seS8qipl70jtV/Qc0NSSQ4Jk
         0ELXKSvtZba67EnLV9Mmjd0pqvndA28N7LvuwZtbUYMjD/RXp50Z9mFsqpu3RDHAKder
         cwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700577048; x=1701181848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNBdVexOS2rFhdNBsyEIv1F9WYnWDTUlYqa+qcf8hzQ=;
        b=ejjuX+Yasg+i/ODEA1AXBCLSS+Easfy57/9UZE1eXMQS4DPnOH2Igw5BvpQQmOfmI8
         B5Jzr00m2zBUz6/CMUnuGB/gyIL9ayI+igvcFxRBiIHQFlhDToybiwHJbaeZRfMfDjX8
         iOq/IqZkNKlNS5dQekOsQ/dpyB3MPLytgLfn+3mURJvI/onXp4zuFRMSBIWpvtWWbLln
         qlRf7609iq3yDsUHruxWgeLVDqRFgCBNaLMN02RSAITRoJtP25CBPv8BmJKCH46IupXc
         UZ6OSNYhqBREQCZavxXMITJxUu+H+iv6Z/D989Eec40Q0vCEh9WIU0iDVcJaUv8bLZl8
         qYLg==
X-Gm-Message-State: AOJu0Yza72JiS/XQQY7ct06cO1nY54IoQZ/IDExKP7HbUMM2L2nX9iDt
	4Ez4JsMCJVgM+ENhZCMgUWFrHA==
X-Google-Smtp-Source: AGHT+IFdDq8s8xEIRQ3+9S23u28ZojRTHZvq7IBqpudi3JlSagvWpPldboHVju4qMSeGvdUu2NcUQQ==
X-Received: by 2002:a5d:6c6b:0:b0:332:c3fc:47ab with SMTP id r11-20020a5d6c6b000000b00332c3fc47abmr7206670wrz.9.1700577048318;
        Tue, 21 Nov 2023 06:30:48 -0800 (PST)
Received: from [10.1.1.118] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id d8-20020adffbc8000000b003316aeb280esm13778774wrs.104.2023.11.21.06.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:30:47 -0800 (PST)
Message-ID: <8f7430b4056092552acaa323250709ba1c2bf605.camel@linaro.org>
Subject: Re: [PATCH v4 11/19] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Tue, 21 Nov 2023 14:30:45 +0000
In-Reply-To: <20231120212037.911774-12-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
	 <20231120212037.911774-12-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-11-20 at 21:20 +0000, Peter Griffin wrote:
> [...]
> +	/* HSI2 */
> +	MUX(CLK_MOUT_HSI2_BUS, "mout_cmu_hsi2_bus", mout_cmu_hsi2_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 2),
> +	MUX(CLK_MOUT_HSI2_PCIE, "mout_cmu_hsi2_pcie", mout_cmu_hsi2_pcie0_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE, 0, 2),
> +	MUX(CLK_MOUT_HSI2_UFS_EMBD, "mout_cmu_hsi2_ufs_embd",
> +	=C2=A0=C2=A0=C2=A0 mout_cmu_hsi2_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI=
2_UFS_EMBD,
> +	=C2=A0=C2=A0=C2=A0 0, 2),
> +	MUX(CLK_MOUT_HSI2_MMC_CARD, "mout_cmu_hsi2_mmc_card",
> +	=C2=A0=C2=A0=C2=A0 mout_cmu_hsi2_mmc_card_p, CLK_CON_MUX_MUX_CLKCMU_HSI=
2_MMC_CARD,
> +	=C2=A0=C2=A0=C2=A0 0, 2),
> +	/* CSIS */
> +	MUX(CLK_MOUT_CSIS, "mout_cmu_csis_bus", mout_cmu_csis_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS, 0, 2),
> +	/* PDP */
> +	MUX(CLK_MOUT_PDP_BUS, "mout_cmu_pdp_bus", mout_cmu_pdp_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_PDP_BUS, 0, 2),
> +	/* PDP */

you have the /* PDP */ commend twice here.

> +	MUX(CLK_MOUT_PDP_VRA, "mout_cmu_pdp_vra", mout_cmu_pdp_vra_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_PDP_VRA, 0, 2),
> +	/* IPP */
> +	MUX(CLK_MOUT_IPP_BUS, "mout_cmu_ipp_bus", mout_cmu_ipp_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_IPP_BUS, 0, 2),
> +	/* G3AA */
> +	MUX(CLK_MOUT_G3AA, "mout_cmu_g3aa_g3aa", mout_cmu_g3aa_g3aa_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 0, 2),
> +	/* ITP */
> +	MUX(CLK_MOUT_ITP, "mout_cmu_itp_bus", mout_cmu_itp_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_ITP_BUS, 0, 2),
> +	/* DNS */
> +	MUX(CLK_MOUT_DNS_BUS, "mout_cmu_dns_bus", mout_cmu_dns_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_DNS_BUS, 0, 2),
> +	/* TNR */
> +	MUX(CLK_MOUT_TNR_BUS, "mout_cmu_tnr_bus", mout_cmu_tnr_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 2),
> +	/* MCSC*/
> +	MUX(CLK_MOUT_MCSC_ITSC, "mout_cmu_mcsc_itsc", mout_cmu_mcsc_itsc_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC, 0, 2),
> +	MUX(CLK_MOUT_MCSC_MCSC, "mout_cmu_mcsc_mcsc", mout_cmu_mcsc_mcsc_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC, 0, 2),
> +	/* GDC */
> +	MUX(CLK_MOUT_GDC_SCSC, "mout_cmu_gdc_scsc", mout_cmu_gdc_scsc_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC, 0, 2),
> +	MUX(CLK_MOUT_GDC_GDC0, "mout_cmu_gdc_gdc0", mout_cmu_gdc_gdc0_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0, 0, 2),
> +	MUX(CLK_MOUT_GDC_GDC1, "mout_cmu_gdc_gdc1", mout_cmu_gdc_gdc1_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1, 0, 2),
> +	/* MFC */
> +	MUX(CLK_MOUT_MFC_MFC, "mout_cmu_mfc_mfc", mout_cmu_mfc_mfc_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 2),
> +	/* DDRPHY0/1/2/3 */
> +	MUX(CLK_MOUT_MIF_SWITCH, "mout_cmu_mif_switch", mout_cmu_mif_switch_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 2),
> +	/* MIF0/1/2/3 */
> +	MUX(CLK_MOUT_MIF_BUS, "mout_cmu_mif_busp", mout_cmu_mif_busp_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP, 0, 2),
> +	/* MISC */
> +	MUX(CLK_MOUT_MISC_BUS, "mout_cmu_misc_bus", mout_cmu_misc_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_MISC_BUS, 0, 2),
> +	MUX(CLK_MOUT_MISC_SSS, "mout_cmu_misc_sss", mout_cmu_misc_sss_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_MISC_SSS, 0, 2),
> +	/* PERI0 */
> +	MUX(CLK_MOUT_PERIC0_IP, "mout_cmu_peric0_ip", mout_cmu_peric0_ip_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
> +	MUX(CLK_MOUT_PERIC0_BUS, "mout_cmu_peric0_bus", mout_cmu_peric0_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
> +	/* PERI1 */
> +	MUX(CLK_MOUT_PERIC1_IP, "mout_cmu_peric1_ip", mout_cmu_peric1_ip_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
> +	MUX(CLK_MOUT_PERIC1_BUS, "mout_cmu_peric1_bus", mout_cmu_peric1_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
> +	/* TPU */
> +	MUX(CLK_MOUT_TPU_TPU, "mout_cmu_tpu_tpu", mout_cmu_tpu_tpu_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_TPU_TPU, 0, 2),
> +	MUX(CLK_MOUT_TPU_TPUCTL, "mout_cmu_tpu_tpuctl", mout_cmu_tpu_tpuctl_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL, 0, 2),
> +	MUX(CLK_MOUT_TPU_BUS, "mout_cmu_tpu_bus", mout_cmu_tpu_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_TPU_BUS, 0, 2),
> +	MUX(CLK_MOUT_TPU_UART, "mout_cmu_tpu_uart", mout_cmu_tpu_uart_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_TPU_UART, 0, 2),
> +	/* BO */
> +	MUX(CLK_MOUT_BO_BUS, "mout_cmu_bo_bus", mout_cmu_bo_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_BO_BUS, 0, 2),
> +};
> +
> +static const struct samsung_div_clock cmu_top_div_clks[] __initconst =3D=
 {
> +	/* CMU_TOP_PURECLKCOMP */
> +	DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_pll",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
> +	DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_pll",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
> +	DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "mout_shared0_pll",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED0_DIV5, 0, 2),
> +	DIV(CLK_DOUT_SHARED0_DIV4, "dout_shared0_div4", "dout_shared0_div2",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
> +	DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_pll",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
> +	DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_pll",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
> +	DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "mout_shared1_pll",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
> +	DIV(CLK_DOUT_SHARED2_DIV2, "dout_shared2_div2", "mout_shared2_pll",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
> +	DIV(CLK_DOUT_SHARED3_DIV2, "dout_shared3_div2", "mout_shared3_pll",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_PLL_SHARED3_DIV2, 0, 1),
> +	/* BUS0 */
> +	DIV(CLK_DOUT_BUS0_BUS, "dout_cmu_bus0_bus_div", "gout_cmu_bus0_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_BUS0_BUS, 0, 4),
> +	DIV(CLK_DOUT_CMU_BOOST, "dout_cmu_boost", "gout_cmu_cmu_boost",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
> +	/* BUS1 */
> +	DIV(CLK_DOUT_BUS1_BUS, "dout_cmu_bus1_bus", "gout_cmu_bus1_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_BUS1_BUS, 0, 4),
> +	/* BUS2 */
> +	DIV(CLK_DOUT_BUS2_BUS, "dout_cmu_bus2_bus", "gout_cmu_bus2_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_BUS2_BUS, 0, 4),
> +	/* CORE */
> +	DIV(CLK_DOUT_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> +	/* EH */
> +	DIV(CLK_DOUT_EH_BUS, "dout_cmu_eh_bus", "gout_cmu_eh_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_EH_BUS, 0, 4),
> +	/* CPUCL{0,1,2,} */
> +	DIV(CLK_DOUT_CPUCL2_SWITCH, "dout_cmu_cpucl2_switch",
> +	=C2=A0=C2=A0=C2=A0 "gout_cmu_cpucl2_switch", CLK_CON_DIV_CLKCMU_CPUCL2_=
SWITCH, 0, 3),
> +	DIV(CLK_DOUT_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch",
> +	=C2=A0=C2=A0=C2=A0 "gout_cmu_cpucl1_switch", CLK_CON_DIV_CLKCMU_CPUCL1_=
SWITCH, 0, 3),
> +	DIV(CLK_DOUT_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch",
> +	=C2=A0=C2=A0=C2=A0 "gout_cmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_=
SWITCH, 0, 3),
> +	DIV(CLK_DOUT_CPUCL0_DBG, "dout_cmu_cpucl0_dbg", "gout_cmu_cpucl0_dbg",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 4),
> +	DIV(CLK_DOUT_CMU_HPM, "dout_cmu_hpm", "gout_cmu_hpm",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_HPM, 0, 2),
> +	/* G3D */
> +	DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_switch", "gout_cmu_g3d_switch",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
> +	DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_G3D_BUSD, 0, 4),
> +

accidental extra empty line

> +	DIV(CLK_DOUT_G3D_GLB, "dout_cmu_g3d_glb", "gout_cmu_g3d_glb",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_G3D_GLB, 0, 4),
> +	/* DPU */
> +	DIV(CLK_DOUT_DPU_BUS, "dout_cmu_dpu_bus", "gout_cmu_dpu_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_DPU_BUS, 0, 4),
> +	/* DISP */
> +	DIV(CLK_DOUT_DISP_BUS, "dout_cmu_disp_bus", "gout_cmu_disp_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_DISP_BUS, 0, 4),
> +	/* G2D */
> +	DIV(CLK_DOUT_G2D_G2D, "dout_cmu_g2d_g2d", "gout_cmu_g2d_g2d",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
> +	DIV(CLK_DOUT_G2D_MSCL, "dout_cmu_g2d_mscl", "gout_cmu_g2d_mscl",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
> +	/* HSI0 */
> +	DIV(CLK_DOUT_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd",
> +	=C2=A0=C2=A0=C2=A0 "gout_cmu_hsi0_usb31drd", CLK_CON_DIV_CLKCMU_HSI0_US=
B31DRD, 0, 5),
> +	DIV(CLK_DOUT_HSI0_BUS, "dout_cmu_hsi0_bus", "gout_cmu_hsi0_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_HSI0_BUS, 0, 4),
> +	DIV(CLK_DOUT_HSI0_DPGTC, "dout_cmu_hsi0_dpgtc", "gout_cmu_hsi0_dpgtc",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 4),
> +	/* TODO register exists but all lower bits are reserved */
> +	DIV(CLK_DOUT_HSI0_USBDPDGB, "dout_cmu_hsi0_usbdpdbg",
> +	=C2=A0=C2=A0=C2=A0 "gout_cmu_hsi0_usbdpdbg", CLK_CON_DIV_CLKCMU_HSI0_US=
BDPDBG, 0, 0),
> +	/* HSI1 */
> +	DIV(CLK_DOUT_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 4),
> +	DIV(CLK_DOUT_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pcie",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 3),
> +	/* HSI2 */
> +	DIV(CLK_DOUT_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
> +	DIV(CLK_DOUT_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 3),
> +	DIV(CLK_DOUT_HSI2_UFS_EMBD, "dout_cmu_hsi2_ufs_embd",
> +	=C2=A0=C2=A0=C2=A0 "gout_cmu_hsi2_ufs_embd", CLK_CON_DIV_CLKCMU_HSI2_UF=
S_EMBD, 0, 4),
> +	DIV(CLK_DOUT_HSI2_MMC_CARD, "dout_cmu_hsi2_mmc_card",
> +	=C2=A0=C2=A0=C2=A0 "gout_cmu_hsi2_mmc_card", CLK_CON_DIV_CLKCMU_HSI2_MM=
C_CARD, 0, 9),
> +	/* CSIS */
> +	DIV(CLK_DOUT_CSIS, "dout_cmu_csis_bus", "gout_cmu_csis_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_CSIS_BUS, 0, 4),
> +	/* PDP */
> +	DIV(CLK_DOUT_PDP_BUS, "dout_cmu_pdp_bus", "gout_cmu_pdp_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_PDP_BUS, 0, 4),
> +	DIV(CLK_DOUT_PDP_VRA, "dout_cmu_pdp_vra", "gout_cmu_pdp_vra",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_PDP_VRA, 0, 4),
> +	/* IPP */
> +	DIV(CLK_DOUT_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
> +	/* G3AA */
> +	DIV(CLK_DOUT_G3AA, "dout_cmu_g3aa_g3aa", "gout_cmu_g3aa_g3aa",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_G3AA_G3AA, 0, 4),
> +	/* ITP */
> +	DIV(CLK_DOUT_ITP, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_ITP_BUS, 0, 4),
> +	/* DNS */
> +	DIV(CLK_DOUT_DNS_BUS, "dout_cmu_dns_bus", "gout_cmu_dns_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_DNS_BUS, 0, 4),
> +	/* TNR */
> +	DIV(CLK_DOUT_TNR_BUS, "dout_cmu_tnr_bus", "gout_cmu_tnr_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
> +	/* MCSC*/
> +	DIV(CLK_DOUT_MCSC_ITSC, "dout_cmu_mcsc_itsc", "gout_cmu_mcsc_itsc",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_MCSC_ITSC, 0, 4),
> +	DIV(CLK_DOUT_MCSC_MCSC, "dout_cmu_mcsc_mcsc", "gout_cmu_mcsc_mcsc",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_MCSC_MCSC, 0, 4),
> +	/* GDC */
> +	DIV(CLK_DOUT_GDC_SCSC, "dout_cmu_gdc_scsc", "gout_cmu_gdc_scsc",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_GDC_SCSC, 0, 4),
> +	DIV(CLK_DOUT_GDC_GDC0, "dout_cmu_gdc_gdc0", "gout_cmu_gdc_gdc0",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_GDC_GDC0, 0, 4),
> +	DIV(CLK_DOUT_GDC_GDC1, "dout_cmu_gdc_gdc1", "gout_cmu_gdc_gdc1",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_GDC_GDC1, 0, 4),
> +	/* MFC */
> +	DIV(CLK_DOUT_MFC_MFC, "dout_cmu_mfc_mfc", "gout_cmu_mfc_mfc",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
> +	/* MIF0/1/2/3 */
> +	DIV(CLK_DOUT_MIF_BUS, "dout_cmu_mif_busp", "gout_cmu_mif_busp",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
> +	/* MISC */
> +	DIV(CLK_DOUT_MISC_BUS, "dout_cmu_misc_bus", "gout_cmu_misc_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_MISC_BUS, 0, 4),
> +	DIV(CLK_DOUT_MISC_SSS, "dout_cmu_misc_sss", "gout_cmu_misc_sss",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_MISC_SSS, 0, 4),
> +	/* PERI0 */
> +	DIV(CLK_DOUT_PERIC0_BUS, "dout_cmu_peric0_bus", "gout_cmu_peric0_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
> +	DIV(CLK_DOUT_PERIC0_IP, "dout_cmu_peric0_ip", "gout_cmu_peric0_ip",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
> +	/* PERI1 */
> +	DIV(CLK_DOUT_PERIC1_BUS, "dout_cmu_peric1_bus", "gout_cmu_peric1_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_PERIC1_BUS, 0, 4),
> +	DIV(CLK_DOUT_PERIC1_IP, "dout_cmu_peric1_ip", "gout_cmu_peric1_ip",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
> +	/* TPU */
> +	DIV(CLK_DOUT_TPU_TPU, "dout_cmu_tpu_tpu", "gout_cmu_tpu_tpu",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_TPU_TPU, 0, 4),
> +	DIV(CLK_DOUT_TPU_TPUCTL, "dout_cmu_tpu_tpuctl", "gout_cmu_tpu_tpuctl",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_TPU_TPUCTL, 0, 4),
> +	DIV(CLK_DOUT_TPU_BUS, "dout_cmu_tpu_bus", "gout_cmu_tpu_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_TPU_BUS, 0, 4),
> +	DIV(CLK_DOUT_TPU_UART, "dout_cmu_tpu_uart", "gout_cmu_tpu_uart",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_TPU_UART, 0, 4),
> +	/* BO */
> +	DIV(CLK_DOUT_BO_BUS, "dout_cmu_bo_bus", "gout_cmu_bo_bus",
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_DIV_CLKCMU_BO_BUS, 0, 4),
> +};
> +
> +static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst =
=3D {
> +	/* BUS0 */
> +	GATE(CLK_GOUT_BUS0_BUS, "gout_cmu_bus0_bus", "mout_cmu_bus0_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS, 21, 0, 0),
> +	/* BUS1 */
> +	GATE(CLK_GOUT_BUS1_BUS, "gout_cmu_bus1_bus", "mout_cmu_bus1_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS, 21, 0, 0),
> +	/* BUS2 */
> +	GATE(CLK_GOUT_BUS2_BUS, "gout_cmu_bus2_bus", "mout_cmu_bus2_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS, 21, 0, 0),
> +	/* CORE */
> +	GATE(CLK_GOUT_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_CORE_BUS, 21, 0, 0),
> +	/* EH */
> +	GATE(CLK_GOUT_EH_BUS, "gout_cmu_eh_bus", "mout_cmu_eh_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_EH_BUS, 21, 0, 0),
> +	/* CPUCL{0,1,2,} */
> +	GATE(CLK_GOUT_CPUCL2_SWITCH, "gout_cmu_cpucl2_switch",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 "mout_cmu_cpucl2_switch", CLK_CON_GAT_GATE_CLK=
CMU_CPUCL2_SWITCH,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 21, 0, 0),
> +	GATE(CLK_GOUT_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 "mout_cmu_cpucl1_switch", CLK_CON_GAT_GATE_CLK=
CMU_CPUCL1_SWITCH,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 21, 0, 0),
> +	GATE(CLK_GOUT_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 "mout_cmu_cpucl0_switch", CLK_CON_GAT_GATE_CLK=
CMU_CPUCL0_SWITCH,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 21, 0, 0),
> +	GATE(CLK_GOUT_CPUCL0_DBG, "gout_cmu_cpucl0_dbg", "mout_cmu_cpucl0_dbg",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS, 21, 0,=
 0),
> +	GATE(CLK_GOUT_CMU_HPM, "gout_cmu_hpm", "mout_cmu_hpm",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_HPM, 21, 0, 0),
> +	/* G3D */
> +	GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_switch", "mout_cmu_g3d_switch",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH, 21, 0, 0),
> +	GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_busd", "mout_cmu_g3d_busd",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD, 21, 0, 0),
> +	GATE(CLK_GOUT_G3D_GLB, "gout_cmu_g3d_glb", "mout_cmu_g3d_glb",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_G3D_GLB, 21, 0, 0),
> +	/* DPU */
> +	GATE(CLK_GOUT_DPU_BUS, "gout_cmu_dpu_bus", "mout_cmu_dpu_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_DPU_BUS, 21, 0, 0),
> +	/* DISP */
> +	GATE(CLK_GOUT_DISP_BUS, "gout_cmu_disp_bus", "mout_cmu_disp_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_DISP_BUS, 21, 0, 0),
> +	/* G2D */
> +	GATE(CLK_GOUT_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
> +	GATE(CLK_GOUT_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL, 21, 0, 0),
> +	/* HSI0 */
> +	GATE(CLK_GOUT_HSI0_USB31DRD, "gout_cmu_hsi0_usb31drd",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 "mout_cmu_hsi0_usb31drd", CLK_CON_GAT_GATE_CLK=
CMU_HSI0_USB31DRD,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 21, 0, 0),
> +	GATE(CLK_GOUT_HSI0_BUS, "gout_cmu_hsi0_bus", "mout_cmu_hsi0_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_HSI0_DPGTC, "gout_cmu_hsi0_dpgtc", "mout_cmu_hsi0_dpgtc",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC, 21, 0, 0),
> +	GATE(CLK_GOUT_HSI0_USBDPDGB, "gout_cmu_hsi0_usbdpdbg",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 "mout_cmu_hsi0_usbdpdbg", CLK_CON_GAT_GATE_CLK=
CMU_HSI0_USBDPDBG,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 21, 0, 0),
> +	/* HSI1 */
> +	GATE(CLK_GOUT_HSI1_BUS, "gout_cmu_hsi1_bus", "mout_cmu_hsi1_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_HSI1_PCIE, "gout_cmu_hsi1_pcie", "mout_cmu_hsi1_pcie",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE, 21, 0, 0),
> +	/* HSI2 */
> +	GATE(CLK_GOUT_HSI2_BUS, "gout_cmu_hsi2_bus", "mout_cmu_hsi2_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_HSI2_PCIE, "gout_cmu_hsi2_pcie", "mout_cmu_hsi2_pcie",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE, 21, 0, 0),
> +	GATE(CLK_GOUT_HSI2_UFS_EMBD, "gout_cmu_hsi2_ufs_embd",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 "mout_cmu_hsi2_ufs_embd", CLK_CON_GAT_GATE_CLK=
CMU_HSI2_UFS_EMBD,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 21, 0, 0),
> +	GATE(CLK_GOUT_HSI2_MMC_CARD, "gout_cmu_hsi2_mmc_card",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 "mout_cmu_hsi2_mmc_card", CLK_CON_GAT_GATE_CLK=
CMU_HSI2_MMCCARD,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 21, 0, 0),
> +	/* CSIS */
> +	GATE(CLK_GOUT_CSIS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
> +	/* PDP */
> +	GATE(CLK_GOUT_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
> +	=C2=A0=C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> +

and here

Cheers,
Andre'


