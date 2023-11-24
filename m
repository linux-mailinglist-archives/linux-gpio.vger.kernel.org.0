Return-Path: <linux-gpio+bounces-498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4237F85BF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 23:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF4111C20BCD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 22:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F36B3C482;
	Fri, 24 Nov 2023 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u619RSkJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DBF198D
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 14:03:41 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-67a14f504f8so5110516d6.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 14:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700863421; x=1701468221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2FD6lHSL0jntZeI+sqnzA24RGYrlV2G506rRStuqkY=;
        b=u619RSkJT0tYMEde0RCb+YipkmEZA3eoIuZOUuhQ5ywqfov/CJsznCP5uadCTX64tR
         o/7oe46AkSYkzcW9Nb37OlE4NGHqT2jpdYW/Es/f8OkHVSMmMhqcbaDm+dTeccaW+ERY
         E3SI2rm2ZtsLlqdN2CtBsIB5MYt4tUe7OoIjWBQxAMBVchoBnkZZXCjp9hHV/2m7A4L7
         CmRTG5BS9gf42bgyFKNSq0hbLyndztN3u5+BcYzySJDNr4iXJsYRK8WnmJPq8S5pSfRb
         +yuwXbHpLV1sKyr0PkQymfzVu3mwazkMm/Xc0dkYrLsEgJoyHUMxixVnlAt188pqPbmw
         PPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700863421; x=1701468221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2FD6lHSL0jntZeI+sqnzA24RGYrlV2G506rRStuqkY=;
        b=KICZfTll6VDeO8N+qVw7+cY6uG3H2bX2avM2gcBXrr1edxN0FUxxhu70wU43ZQUDKo
         HKhkoc39N95Yp5JScoR1oEcrCYFAqJWOQR54j++2bvNbXyo7TyjlOk0+NXrPAmek0+Go
         kZq/6SG5wkA6emfMrvqo5GgmSrPwbg4HBASdFz+ZLXKL/vjkV7QizOy2aecOheyVYQPL
         CVH1Nr+1WaVZhjr5nu2Mj230ptXkLGKd6TTApbqSn1tmAjUh/D2dBvsUYW6mQNpDREQ7
         9TVQxVY6TJ6E5AeUhIee5MoVDFL2/7ngXmhZbPOetydlzULDf3bB/5i8PfgrVqGDiFT1
         eWRw==
X-Gm-Message-State: AOJu0YxiwOLoJAWRdiHGmXCRLC0JFhjzkvJvFVeFOf+nqt+Pmigt9frD
	fex/1xSNj204Z9LbwPq/77UfyHbAFG/H6uYOKKLTNg==
X-Google-Smtp-Source: AGHT+IE/GRdj3trkHeWb0q6Np9BiEmWcoBnRbDJkV611sGF2pCUtD/PRM8q7s5uNmx8PQTIXk9z8Gw/WlDvq7Dh+GlM=
X-Received: by 2002:a05:6214:d4c:b0:67a:259d:8ce0 with SMTP id
 12-20020a0562140d4c00b0067a259d8ce0mr502846qvr.17.1700863420762; Fri, 24 Nov
 2023 14:03:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-12-peter.griffin@linaro.org> <8f7430b4056092552acaa323250709ba1c2bf605.camel@linaro.org>
In-Reply-To: <8f7430b4056092552acaa323250709ba1c2bf605.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Nov 2023 22:03:29 +0000
Message-ID: <CADrjBPoRp6q5WArvJFo+oBQt54OZSxhHRZMcD-odQqCeYAqbTQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/19] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Tue, 21 Nov 2023 at 14:30, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Mon, 2023-11-20 at 21:20 +0000, Peter Griffin wrote:
> > [...]
> > +     /* HSI2 */
> > +     MUX(CLK_MOUT_HSI2_BUS, "mout_cmu_hsi2_bus", mout_cmu_hsi2_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 2),
> > +     MUX(CLK_MOUT_HSI2_PCIE, "mout_cmu_hsi2_pcie", mout_cmu_hsi2_pcie0=
_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE, 0, 2),
> > +     MUX(CLK_MOUT_HSI2_UFS_EMBD, "mout_cmu_hsi2_ufs_embd",
> > +         mout_cmu_hsi2_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMB=
D,
> > +         0, 2),
> > +     MUX(CLK_MOUT_HSI2_MMC_CARD, "mout_cmu_hsi2_mmc_card",
> > +         mout_cmu_hsi2_mmc_card_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CAR=
D,
> > +         0, 2),
> > +     /* CSIS */
> > +     MUX(CLK_MOUT_CSIS, "mout_cmu_csis_bus", mout_cmu_csis_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS, 0, 2),
> > +     /* PDP */
> > +     MUX(CLK_MOUT_PDP_BUS, "mout_cmu_pdp_bus", mout_cmu_pdp_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_PDP_BUS, 0, 2),
> > +     /* PDP */
>
> you have the /* PDP */ commend twice here.

I've removed these comments in the next version
>
> > +     MUX(CLK_MOUT_PDP_VRA, "mout_cmu_pdp_vra", mout_cmu_pdp_vra_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_PDP_VRA, 0, 2),
> > +     /* IPP */
> > +     MUX(CLK_MOUT_IPP_BUS, "mout_cmu_ipp_bus", mout_cmu_ipp_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_IPP_BUS, 0, 2),
> > +     /* G3AA */
> > +     MUX(CLK_MOUT_G3AA, "mout_cmu_g3aa_g3aa", mout_cmu_g3aa_g3aa_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 0, 2),
> > +     /* ITP */
> > +     MUX(CLK_MOUT_ITP, "mout_cmu_itp_bus", mout_cmu_itp_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_ITP_BUS, 0, 2),
> > +     /* DNS */
> > +     MUX(CLK_MOUT_DNS_BUS, "mout_cmu_dns_bus", mout_cmu_dns_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_DNS_BUS, 0, 2),
> > +     /* TNR */
> > +     MUX(CLK_MOUT_TNR_BUS, "mout_cmu_tnr_bus", mout_cmu_tnr_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 2),
> > +     /* MCSC*/
> > +     MUX(CLK_MOUT_MCSC_ITSC, "mout_cmu_mcsc_itsc", mout_cmu_mcsc_itsc_=
p,
> > +         CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC, 0, 2),
> > +     MUX(CLK_MOUT_MCSC_MCSC, "mout_cmu_mcsc_mcsc", mout_cmu_mcsc_mcsc_=
p,
> > +         CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC, 0, 2),
> > +     /* GDC */
> > +     MUX(CLK_MOUT_GDC_SCSC, "mout_cmu_gdc_scsc", mout_cmu_gdc_scsc_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC, 0, 2),
> > +     MUX(CLK_MOUT_GDC_GDC0, "mout_cmu_gdc_gdc0", mout_cmu_gdc_gdc0_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0, 0, 2),
> > +     MUX(CLK_MOUT_GDC_GDC1, "mout_cmu_gdc_gdc1", mout_cmu_gdc_gdc1_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1, 0, 2),
> > +     /* MFC */
> > +     MUX(CLK_MOUT_MFC_MFC, "mout_cmu_mfc_mfc", mout_cmu_mfc_mfc_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 2),
> > +     /* DDRPHY0/1/2/3 */
> > +     MUX(CLK_MOUT_MIF_SWITCH, "mout_cmu_mif_switch", mout_cmu_mif_swit=
ch_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 2),
> > +     /* MIF0/1/2/3 */
> > +     MUX(CLK_MOUT_MIF_BUS, "mout_cmu_mif_busp", mout_cmu_mif_busp_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP, 0, 2),
> > +     /* MISC */
> > +     MUX(CLK_MOUT_MISC_BUS, "mout_cmu_misc_bus", mout_cmu_misc_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_MISC_BUS, 0, 2),
> > +     MUX(CLK_MOUT_MISC_SSS, "mout_cmu_misc_sss", mout_cmu_misc_sss_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_MISC_SSS, 0, 2),
> > +     /* PERI0 */
> > +     MUX(CLK_MOUT_PERIC0_IP, "mout_cmu_peric0_ip", mout_cmu_peric0_ip_=
p,
> > +         CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
> > +     MUX(CLK_MOUT_PERIC0_BUS, "mout_cmu_peric0_bus", mout_cmu_peric0_b=
us_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
> > +     /* PERI1 */
> > +     MUX(CLK_MOUT_PERIC1_IP, "mout_cmu_peric1_ip", mout_cmu_peric1_ip_=
p,
> > +         CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
> > +     MUX(CLK_MOUT_PERIC1_BUS, "mout_cmu_peric1_bus", mout_cmu_peric1_b=
us_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
> > +     /* TPU */
> > +     MUX(CLK_MOUT_TPU_TPU, "mout_cmu_tpu_tpu", mout_cmu_tpu_tpu_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_TPU_TPU, 0, 2),
> > +     MUX(CLK_MOUT_TPU_TPUCTL, "mout_cmu_tpu_tpuctl", mout_cmu_tpu_tpuc=
tl_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL, 0, 2),
> > +     MUX(CLK_MOUT_TPU_BUS, "mout_cmu_tpu_bus", mout_cmu_tpu_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_TPU_BUS, 0, 2),
> > +     MUX(CLK_MOUT_TPU_UART, "mout_cmu_tpu_uart", mout_cmu_tpu_uart_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_TPU_UART, 0, 2),
> > +     /* BO */
> > +     MUX(CLK_MOUT_BO_BUS, "mout_cmu_bo_bus", mout_cmu_bo_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_BO_BUS, 0, 2),
> > +};
> > +
> > +static const struct samsung_div_clock cmu_top_div_clks[] __initconst =
=3D {
> > +     /* CMU_TOP_PURECLKCOMP */
> > +     DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_pll=
",
> > +         CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
> > +     DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_pll=
",
> > +         CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
> > +     DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "mout_shared0_pll=
",
> > +         CLK_CON_DIV_PLL_SHARED0_DIV5, 0, 2),
> > +     DIV(CLK_DOUT_SHARED0_DIV4, "dout_shared0_div4", "dout_shared0_div=
2",
> > +         CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
> > +     DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_pll=
",
> > +         CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
> > +     DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_pll=
",
> > +         CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
> > +     DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "mout_shared1_pll=
",
> > +         CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
> > +     DIV(CLK_DOUT_SHARED2_DIV2, "dout_shared2_div2", "mout_shared2_pll=
",
> > +         CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
> > +     DIV(CLK_DOUT_SHARED3_DIV2, "dout_shared3_div2", "mout_shared3_pll=
",
> > +         CLK_CON_DIV_PLL_SHARED3_DIV2, 0, 1),
> > +     /* BUS0 */
> > +     DIV(CLK_DOUT_BUS0_BUS, "dout_cmu_bus0_bus_div", "gout_cmu_bus0_bu=
s",
> > +         CLK_CON_DIV_CLKCMU_BUS0_BUS, 0, 4),
> > +     DIV(CLK_DOUT_CMU_BOOST, "dout_cmu_boost", "gout_cmu_cmu_boost",
> > +         CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
> > +     /* BUS1 */
> > +     DIV(CLK_DOUT_BUS1_BUS, "dout_cmu_bus1_bus", "gout_cmu_bus1_bus",
> > +         CLK_CON_DIV_CLKCMU_BUS1_BUS, 0, 4),
> > +     /* BUS2 */
> > +     DIV(CLK_DOUT_BUS2_BUS, "dout_cmu_bus2_bus", "gout_cmu_bus2_bus",
> > +         CLK_CON_DIV_CLKCMU_BUS2_BUS, 0, 4),
> > +     /* CORE */
> > +     DIV(CLK_DOUT_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
> > +         CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> > +     /* EH */
> > +     DIV(CLK_DOUT_EH_BUS, "dout_cmu_eh_bus", "gout_cmu_eh_bus",
> > +         CLK_CON_DIV_CLKCMU_EH_BUS, 0, 4),
> > +     /* CPUCL{0,1,2,} */
> > +     DIV(CLK_DOUT_CPUCL2_SWITCH, "dout_cmu_cpucl2_switch",
> > +         "gout_cmu_cpucl2_switch", CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH, 0=
, 3),
> > +     DIV(CLK_DOUT_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch",
> > +         "gout_cmu_cpucl1_switch", CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH, 0=
, 3),
> > +     DIV(CLK_DOUT_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch",
> > +         "gout_cmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0=
, 3),
> > +     DIV(CLK_DOUT_CPUCL0_DBG, "dout_cmu_cpucl0_dbg", "gout_cmu_cpucl0_=
dbg",
> > +         CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 4),
> > +     DIV(CLK_DOUT_CMU_HPM, "dout_cmu_hpm", "gout_cmu_hpm",
> > +         CLK_CON_DIV_CLKCMU_HPM, 0, 2),
> > +     /* G3D */
> > +     DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_switch", "gout_cmu_g3d_swi=
tch",
> > +         CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
> > +     DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd"=
,
> > +         CLK_CON_DIV_CLKCMU_G3D_BUSD, 0, 4),
> > +
>
> accidental extra empty line

will fix
>
> > +     DIV(CLK_DOUT_G3D_GLB, "dout_cmu_g3d_glb", "gout_cmu_g3d_glb",
> > +         CLK_CON_DIV_CLKCMU_G3D_GLB, 0, 4),
> > +     /* DPU */
> > +     DIV(CLK_DOUT_DPU_BUS, "dout_cmu_dpu_bus", "gout_cmu_dpu_bus",
> > +         CLK_CON_DIV_CLKCMU_DPU_BUS, 0, 4),
> > +     /* DISP */
> > +     DIV(CLK_DOUT_DISP_BUS, "dout_cmu_disp_bus", "gout_cmu_disp_bus",
> > +         CLK_CON_DIV_CLKCMU_DISP_BUS, 0, 4),
> > +     /* G2D */
> > +     DIV(CLK_DOUT_G2D_G2D, "dout_cmu_g2d_g2d", "gout_cmu_g2d_g2d",
> > +         CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
> > +     DIV(CLK_DOUT_G2D_MSCL, "dout_cmu_g2d_mscl", "gout_cmu_g2d_mscl",
> > +         CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
> > +     /* HSI0 */
> > +     DIV(CLK_DOUT_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd",
> > +         "gout_cmu_hsi0_usb31drd", CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0=
, 5),
> > +     DIV(CLK_DOUT_HSI0_BUS, "dout_cmu_hsi0_bus", "gout_cmu_hsi0_bus",
> > +         CLK_CON_DIV_CLKCMU_HSI0_BUS, 0, 4),
> > +     DIV(CLK_DOUT_HSI0_DPGTC, "dout_cmu_hsi0_dpgtc", "gout_cmu_hsi0_dp=
gtc",
> > +         CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 4),
> > +     /* TODO register exists but all lower bits are reserved */
> > +     DIV(CLK_DOUT_HSI0_USBDPDGB, "dout_cmu_hsi0_usbdpdbg",
> > +         "gout_cmu_hsi0_usbdpdbg", CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG, 0=
, 0),
> > +     /* HSI1 */
> > +     DIV(CLK_DOUT_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
> > +         CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 4),
> > +     DIV(CLK_DOUT_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pcie=
",
> > +         CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 3),
> > +     /* HSI2 */
> > +     DIV(CLK_DOUT_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
> > +         CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
> > +     DIV(CLK_DOUT_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie=
",
> > +         CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 3),
> > +     DIV(CLK_DOUT_HSI2_UFS_EMBD, "dout_cmu_hsi2_ufs_embd",
> > +         "gout_cmu_hsi2_ufs_embd", CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD, 0=
, 4),
> > +     DIV(CLK_DOUT_HSI2_MMC_CARD, "dout_cmu_hsi2_mmc_card",
> > +         "gout_cmu_hsi2_mmc_card", CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD, 0=
, 9),
> > +     /* CSIS */
> > +     DIV(CLK_DOUT_CSIS, "dout_cmu_csis_bus", "gout_cmu_csis_bus",
> > +         CLK_CON_DIV_CLKCMU_CSIS_BUS, 0, 4),
> > +     /* PDP */
> > +     DIV(CLK_DOUT_PDP_BUS, "dout_cmu_pdp_bus", "gout_cmu_pdp_bus",
> > +         CLK_CON_DIV_CLKCMU_PDP_BUS, 0, 4),
> > +     DIV(CLK_DOUT_PDP_VRA, "dout_cmu_pdp_vra", "gout_cmu_pdp_vra",
> > +         CLK_CON_DIV_CLKCMU_PDP_VRA, 0, 4),
> > +     /* IPP */
> > +     DIV(CLK_DOUT_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
> > +         CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
> > +     /* G3AA */
> > +     DIV(CLK_DOUT_G3AA, "dout_cmu_g3aa_g3aa", "gout_cmu_g3aa_g3aa",
> > +         CLK_CON_DIV_CLKCMU_G3AA_G3AA, 0, 4),
> > +     /* ITP */
> > +     DIV(CLK_DOUT_ITP, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
> > +         CLK_CON_DIV_CLKCMU_ITP_BUS, 0, 4),
> > +     /* DNS */
> > +     DIV(CLK_DOUT_DNS_BUS, "dout_cmu_dns_bus", "gout_cmu_dns_bus",
> > +         CLK_CON_DIV_CLKCMU_DNS_BUS, 0, 4),
> > +     /* TNR */
> > +     DIV(CLK_DOUT_TNR_BUS, "dout_cmu_tnr_bus", "gout_cmu_tnr_bus",
> > +         CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
> > +     /* MCSC*/
> > +     DIV(CLK_DOUT_MCSC_ITSC, "dout_cmu_mcsc_itsc", "gout_cmu_mcsc_itsc=
",
> > +         CLK_CON_DIV_CLKCMU_MCSC_ITSC, 0, 4),
> > +     DIV(CLK_DOUT_MCSC_MCSC, "dout_cmu_mcsc_mcsc", "gout_cmu_mcsc_mcsc=
",
> > +         CLK_CON_DIV_CLKCMU_MCSC_MCSC, 0, 4),
> > +     /* GDC */
> > +     DIV(CLK_DOUT_GDC_SCSC, "dout_cmu_gdc_scsc", "gout_cmu_gdc_scsc",
> > +         CLK_CON_DIV_CLKCMU_GDC_SCSC, 0, 4),
> > +     DIV(CLK_DOUT_GDC_GDC0, "dout_cmu_gdc_gdc0", "gout_cmu_gdc_gdc0",
> > +         CLK_CON_DIV_CLKCMU_GDC_GDC0, 0, 4),
> > +     DIV(CLK_DOUT_GDC_GDC1, "dout_cmu_gdc_gdc1", "gout_cmu_gdc_gdc1",
> > +         CLK_CON_DIV_CLKCMU_GDC_GDC1, 0, 4),
> > +     /* MFC */
> > +     DIV(CLK_DOUT_MFC_MFC, "dout_cmu_mfc_mfc", "gout_cmu_mfc_mfc",
> > +         CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
> > +     /* MIF0/1/2/3 */
> > +     DIV(CLK_DOUT_MIF_BUS, "dout_cmu_mif_busp", "gout_cmu_mif_busp",
> > +         CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
> > +     /* MISC */
> > +     DIV(CLK_DOUT_MISC_BUS, "dout_cmu_misc_bus", "gout_cmu_misc_bus",
> > +         CLK_CON_DIV_CLKCMU_MISC_BUS, 0, 4),
> > +     DIV(CLK_DOUT_MISC_SSS, "dout_cmu_misc_sss", "gout_cmu_misc_sss",
> > +         CLK_CON_DIV_CLKCMU_MISC_SSS, 0, 4),
> > +     /* PERI0 */
> > +     DIV(CLK_DOUT_PERIC0_BUS, "dout_cmu_peric0_bus", "gout_cmu_peric0_=
bus",
> > +         CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
> > +     DIV(CLK_DOUT_PERIC0_IP, "dout_cmu_peric0_ip", "gout_cmu_peric0_ip=
",
> > +         CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
> > +     /* PERI1 */
> > +     DIV(CLK_DOUT_PERIC1_BUS, "dout_cmu_peric1_bus", "gout_cmu_peric1_=
bus",
> > +         CLK_CON_DIV_CLKCMU_PERIC1_BUS, 0, 4),
> > +     DIV(CLK_DOUT_PERIC1_IP, "dout_cmu_peric1_ip", "gout_cmu_peric1_ip=
",
> > +         CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
> > +     /* TPU */
> > +     DIV(CLK_DOUT_TPU_TPU, "dout_cmu_tpu_tpu", "gout_cmu_tpu_tpu",
> > +         CLK_CON_DIV_CLKCMU_TPU_TPU, 0, 4),
> > +     DIV(CLK_DOUT_TPU_TPUCTL, "dout_cmu_tpu_tpuctl", "gout_cmu_tpu_tpu=
ctl",
> > +         CLK_CON_DIV_CLKCMU_TPU_TPUCTL, 0, 4),
> > +     DIV(CLK_DOUT_TPU_BUS, "dout_cmu_tpu_bus", "gout_cmu_tpu_bus",
> > +         CLK_CON_DIV_CLKCMU_TPU_BUS, 0, 4),
> > +     DIV(CLK_DOUT_TPU_UART, "dout_cmu_tpu_uart", "gout_cmu_tpu_uart",
> > +         CLK_CON_DIV_CLKCMU_TPU_UART, 0, 4),
> > +     /* BO */
> > +     DIV(CLK_DOUT_BO_BUS, "dout_cmu_bo_bus", "gout_cmu_bo_bus",
> > +         CLK_CON_DIV_CLKCMU_BO_BUS, 0, 4),
> > +};
> > +
> > +static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst=
 =3D {
> > +     /* BUS0 */
> > +     GATE(CLK_GOUT_BUS0_BUS, "gout_cmu_bus0_bus", "mout_cmu_bus0_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS, 21, 0, 0),
> > +     /* BUS1 */
> > +     GATE(CLK_GOUT_BUS1_BUS, "gout_cmu_bus1_bus", "mout_cmu_bus1_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS, 21, 0, 0),
> > +     /* BUS2 */
> > +     GATE(CLK_GOUT_BUS2_BUS, "gout_cmu_bus2_bus", "mout_cmu_bus2_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS, 21, 0, 0),
> > +     /* CORE */
> > +     GATE(CLK_GOUT_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_CORE_BUS, 21, 0, 0),
> > +     /* EH */
> > +     GATE(CLK_GOUT_EH_BUS, "gout_cmu_eh_bus", "mout_cmu_eh_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_EH_BUS, 21, 0, 0),
> > +     /* CPUCL{0,1,2,} */
> > +     GATE(CLK_GOUT_CPUCL2_SWITCH, "gout_cmu_cpucl2_switch",
> > +          "mout_cmu_cpucl2_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWI=
TCH,
> > +          21, 0, 0),
> > +     GATE(CLK_GOUT_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch",
> > +          "mout_cmu_cpucl1_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWI=
TCH,
> > +          21, 0, 0),
> > +     GATE(CLK_GOUT_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch",
> > +          "mout_cmu_cpucl0_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWI=
TCH,
> > +          21, 0, 0),
> > +     GATE(CLK_GOUT_CPUCL0_DBG, "gout_cmu_cpucl0_dbg", "mout_cmu_cpucl0=
_dbg",
> > +          CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS, 21, 0, 0),
> > +     GATE(CLK_GOUT_CMU_HPM, "gout_cmu_hpm", "mout_cmu_hpm",
> > +          CLK_CON_GAT_GATE_CLKCMU_HPM, 21, 0, 0),
> > +     /* G3D */
> > +     GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_switch", "mout_cmu_g3d_sw=
itch",
> > +          CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH, 21, 0, 0),
> > +     GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_busd", "mout_cmu_g3d_busd=
",
> > +          CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD, 21, 0, 0),
> > +     GATE(CLK_GOUT_G3D_GLB, "gout_cmu_g3d_glb", "mout_cmu_g3d_glb",
> > +          CLK_CON_GAT_GATE_CLKCMU_G3D_GLB, 21, 0, 0),
> > +     /* DPU */
> > +     GATE(CLK_GOUT_DPU_BUS, "gout_cmu_dpu_bus", "mout_cmu_dpu_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_DPU_BUS, 21, 0, 0),
> > +     /* DISP */
> > +     GATE(CLK_GOUT_DISP_BUS, "gout_cmu_disp_bus", "mout_cmu_disp_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_DISP_BUS, 21, 0, 0),
> > +     /* G2D */
> > +     GATE(CLK_GOUT_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
> > +          CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
> > +     GATE(CLK_GOUT_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl",
> > +          CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL, 21, 0, 0),
> > +     /* HSI0 */
> > +     GATE(CLK_GOUT_HSI0_USB31DRD, "gout_cmu_hsi0_usb31drd",
> > +          "mout_cmu_hsi0_usb31drd", CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31=
DRD,
> > +          21, 0, 0),
> > +     GATE(CLK_GOUT_HSI0_BUS, "gout_cmu_hsi0_bus", "mout_cmu_hsi0_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS, 21, 0, 0),
> > +     GATE(CLK_GOUT_HSI0_DPGTC, "gout_cmu_hsi0_dpgtc", "mout_cmu_hsi0_d=
pgtc",
> > +          CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC, 21, 0, 0),
> > +     GATE(CLK_GOUT_HSI0_USBDPDGB, "gout_cmu_hsi0_usbdpdbg",
> > +          "mout_cmu_hsi0_usbdpdbg", CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDP=
DBG,
> > +          21, 0, 0),
> > +     /* HSI1 */
> > +     GATE(CLK_GOUT_HSI1_BUS, "gout_cmu_hsi1_bus", "mout_cmu_hsi1_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS, 21, 0, 0),
> > +     GATE(CLK_GOUT_HSI1_PCIE, "gout_cmu_hsi1_pcie", "mout_cmu_hsi1_pci=
e",
> > +          CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE, 21, 0, 0),
> > +     /* HSI2 */
> > +     GATE(CLK_GOUT_HSI2_BUS, "gout_cmu_hsi2_bus", "mout_cmu_hsi2_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS, 21, 0, 0),
> > +     GATE(CLK_GOUT_HSI2_PCIE, "gout_cmu_hsi2_pcie", "mout_cmu_hsi2_pci=
e",
> > +          CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE, 21, 0, 0),
> > +     GATE(CLK_GOUT_HSI2_UFS_EMBD, "gout_cmu_hsi2_ufs_embd",
> > +          "mout_cmu_hsi2_ufs_embd", CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_E=
MBD,
> > +          21, 0, 0),
> > +     GATE(CLK_GOUT_HSI2_MMC_CARD, "gout_cmu_hsi2_mmc_card",
> > +          "mout_cmu_hsi2_mmc_card", CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCA=
RD,
> > +          21, 0, 0),
> > +     /* CSIS */
> > +     GATE(CLK_GOUT_CSIS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
> > +     /* PDP */
> > +     GATE(CLK_GOUT_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
> > +          CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> > +
>
> and here

will fix

Peter.

