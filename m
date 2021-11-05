Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC78544617E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 10:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhKEJpS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 05:45:18 -0400
Received: from smtpcmd0987.aruba.it ([62.149.156.87]:52519 "EHLO
        smtpcmd0987.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbhKEJpP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 05:45:15 -0400
Received: from [192.168.153.129] ([146.241.216.221])
        by Aruba Outgoing Smtp  with ESMTPSA
        id ivjdmdpVVsfk3ivjfmPM8G; Fri, 05 Nov 2021 10:42:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1636105352; bh=1GP6cpeDo31RshdJGVY27pg4jdAQLLhr1b3EHvlqG9U=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=RdWsBvQOUh0y5sMKxC/8qFCZqAKgVNldIM4KBq+GnvYKRPU65iFvMatCxpaYtRjd1
         dBO645DPZ7Gl9iIyVBiIkepIRRddD4/oy6U95t3jSBNjDgN2CR1cfelwJHV9ES9k/P
         cBJWjEba0HW5ZGAqYREHOHLyt+JpPYyp5a9NErtbCOz6El3RU77PFBxSa3+vZ9tCvx
         PjNADZNdF3CYI1xtdHOIawJ+45Zi4+KBs5joppbNdfbDqstBLAfSKapdHvrN+YDdG8
         oH32WUPzflKxn21mjJM6NxBiccP0rzXximOAjhnBxly/9Xn58f9ViPAj16EA3s0/Oj
         4GxF0yr1c0n5Q==
Subject: Re: [PATCH v2 07/13] clk: imx: Add initial support for i.MXRT clock
 driver
To:     Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-8-Mr.Bossman075@gmail.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <01336852-e6fa-cfe6-21be-9c03cb567fde@benettiengineering.com>
Date:   Fri, 5 Nov 2021 10:42:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225701.98944-8-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGHZCGviNtSTv00RKTlbWw4QzIQHqj2J0gHEQJVYrIkWDxivZ2LS7bPvRjwyVHcSDYfpVwJpkj+AGOcq6htQ3mirYuJdnMDtXLXWapvNehq92jrNsHUK
 m7Kwml9wPX7+BzX9ImcYS+h5cfDTbUywzpUjtD0YLA2qq8DxB2CzpiQGi9ndy1awhC5+0syO378gLAtqjPFZCAfMYGWoOp8o6VALHQUGya3sgT+neZeYUxNQ
 k7I5s9fOg7iZHJnHzyTCoABl1u8C6FazaKEIbWwsi0Zl8FFf64c3WqJkqhcMtEfNUrhZd1Kk19X+Ga2DyQeXVF6i9y2Lvx09wgPy5+Mmblmv7fG5ly2HdvG4
 l1a4AhBKErOW1vFPstLToHlq5/hb0HpdyYK8EOL5BXg1K01KSTbJn34+u0PJGO2wp9Kq+/yHMzDM4GeAOIrBVyxc/RLt8P9rmgejkkHklHkriih7WK5iUOw7
 j5N910PqyCbjyFauy4dRqMCgEM14bt8/uY9mONpQdQi6gJXQ+JGtMQYoL6BSE8wNW+HXDAwsoQBFY6txyGC0o0L8jk37LUC/mBLu7UxhR1/CJ148JLpr/h0p
 dleOKGVAjijot+BarE3+s3cFROly7khgfHE2wZ0//tH2q3EMWAXceXAb3IRcUDK24cveUd8fZ7Na2xC3lgUTAjzvxNMLyD+TBZClsPA+sb9ZOZd4CAwJHfs4
 nBuhoEefmCxTpYFYgtIXikl2RthZWX+ozCAN6LH3xpvWPCRXjpuuKmIxJpRO99ut+EgtcDwZN+zfFHE0iQoJx/DwjfenLmbxT52K1h0+haU8FBYe6fgkiwfp
 dXLIcBlCLYdFIckrJjMWK5FVvngblxxZJrxJhm53696YB++iMmIQUJAysCRk2wtfM9GdXLEeozZ5H5bxn/ICkir1b4m1EESV81h1EZoithxsJLpYiTvTpjja
 1vEfRQ15G94yhSVV54KlyDg74O5s+D9aGG7F/4t/AI6mZDRj74uq5pZQOzFZw26V3IkuTiCGNBl5UK0sQFHeAyC0VkVpUN7fVbla1zBc1YwOv/vvwcs+J/SD
 QICKnQtBGtmj8+KPkiCthtkKo5EYWwkGMuOfYKx/+fK72712NJuT9xb5v+7Qz9vcJOA/SM0WB6AJiri2Jm3xgCHd90oF9dQ32Dg=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jesse, All,

this is a specific driver for imxrt1050, for example imxrt1020 is 
totally different while imxrt1060 is similar, so commit log needs to 
change to i.MXRT1050,

On 11/2/21 11:56 PM, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> This patch adds initial clock driver support for the i.MXRT series.

Here too ^^^

> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * Kconfig: Add new line
> * clk-imxrt.c: Remove unused const
> * clk-imxrt.c: Remove set parents
> * clk-imxrt.c: Use fsl,imxrt-anatop for anatop base address
> ---
>   drivers/clk/imx/Kconfig     |   4 +
>   drivers/clk/imx/Makefile    |   1 +
>   drivers/clk/imx/clk-imxrt.c | 149 ++++++++++++++++++++++++++++++++++++

Here we need this file ^^^ to be clk-imxrt1050.c

>   3 files changed, 154 insertions(+)
>   create mode 100644 drivers/clk/imx/clk-imxrt.c
> 
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index 47d9ec3abd2f..f83ba5fe8cd3 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -98,3 +98,7 @@ config CLK_IMX8QXP
>   	select MXC_CLK_SCU
>   	help
>   	  Build the driver for IMX8QXP SCU based clocks.
> +
> +config CLK_IMXRT

CLK_IMXRT1050

> +	def_bool SOC_IMXRT
> +	select MXC_CLK
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index c24a2acbfa56..6a3fee6cd9af 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -45,3 +45,4 @@ obj-$(CONFIG_CLK_IMX6UL) += clk-imx6ul.o
>   obj-$(CONFIG_CLK_IMX7D)  += clk-imx7d.o
>   obj-$(CONFIG_CLK_IMX7ULP) += clk-imx7ulp.o
>   obj-$(CONFIG_CLK_VF610)  += clk-vf610.o
> +obj-$(CONFIG_CLK_IMXRT)  += clk-imxrt.o

CONFIG_CLK_IMXRT1050

> diff --git a/drivers/clk/imx/clk-imxrt.c b/drivers/clk/imx/clk-imxrt.c
> new file mode 100644
> index 000000000000..8e235925cdb7
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imxrt.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2021
> + * Author(s):
> + * Jesse Taube <Mr.Bossman075@gmail.com>
> + * Giulio Benetti <giulio.benetti@benettiengineering.com>
> + */
> +#include <linux/mm.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/sizes.h>
> +#include <soc/imx/revision.h>
> +#include <dt-bindings/clock/imxrt1050-clock.h>

Indeed here the include is imxrt1050-clock.h and every macro below 
starts with IMXRT1050_ prefix

> +
> +#include "clk.h"
> +#define ANATOP_BASE_ADDR	0x400d8000
> +
> +static const char * const pll_ref_sels[] = {"osc", "dummy", };
> +static const char * const per_sels[] = {"ipg_pdof", "osc", };
> +static const char * const pll1_bypass_sels[] = {"pll1_arm", "pll1_arm_ref_sel", };
> +static const char * const pll2_bypass_sels[] = {"pll2_sys", "pll2_sys_ref_sel", };
> +static const char * const pll3_bypass_sels[] = {"pll3_usb_otg", "pll3_usb_otg_ref_sel", };
> +static const char * const pll5_bypass_sels[] = {"pll5_video", "pll5_video_ref_sel", };
> +static const char *const pre_periph_sels[] = {
> +	"pll2_sys", "pll2_pfd2_396m", "pll2_pfd0_352m", "arm_podf", };
> +static const char *const periph_sels[] = { "pre_periph_sel", "todo", };
> +static const char *const usdhc_sels[] = { "pll2_pfd2_396m", "pll2_pfd0_352m", };
> +static const char *const lpuart_sels[] = { "pll3_80m", "osc", };
> +static const char *const lcdif_sels[] = {
> +	"pll2_sys", "pll3_pfd3_454_74m", "pll5_video", "pll2_pfd0_352m",
> +	"pll2_pfd1_594m", "pll3_pfd1_664_62m", };
> +
> +static struct clk *clk[IMXRT1050_CLK_END];
> +static struct clk_onecell_data clk_data;
> +
> +static void __init imxrt_clocks_common_init(void __iomem *base)
> +{
> +	/* Anatop clocks */
> +	clk[IMXRT1050_CLK_DUMMY] = imx_clk_fixed("dummy", 0UL);
> +
> +	clk[IMXRT1050_CLK_PLL1_REF_SEL] = imx_clk_mux("pll1_arm_ref_sel",
> +		base + 0x0, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> +	clk[IMXRT1050_CLK_PLL2_REF_SEL] = imx_clk_mux("pll2_sys_ref_sel",
> +		base + 0x30, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> +	clk[IMXRT1050_CLK_PLL3_REF_SEL] = imx_clk_mux("pll3_usb_otg_ref_sel",
> +		base + 0x10, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> +	clk[IMXRT1050_CLK_PLL5_REF_SEL] = imx_clk_mux("pll5_video_ref_sel",
> +		base + 0xa0, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> +
> +	clk[IMXRT1050_CLK_PLL1_ARM] = imx_clk_pllv3(IMX_PLLV3_SYS, "pll1_arm",
> +		"pll1_arm_ref_sel", base + 0x0, 0x7f);
> +	clk[IMXRT1050_CLK_PLL2_SYS] = imx_clk_pllv3(IMX_PLLV3_GENERIC, "pll2_sys",
> +		"pll2_sys_ref_sel", base + 0x30, 0x1);
> +	clk[IMXRT1050_CLK_PLL3_USB_OTG] = imx_clk_pllv3(IMX_PLLV3_USB, "pll3_usb_otg",
> +		"pll3_usb_otg_ref_sel", base + 0x10, 0x1);
> +	clk[IMXRT1050_CLK_PLL5_VIDEO] = imx_clk_pllv3(IMX_PLLV3_AV, "pll5_video",
> +		"pll5_video_ref_sel", base + 0xa0, 0x7f);
> +
> +	/* PLL bypass out */
> +	clk[IMXRT1050_CLK_PLL1_BYPASS] = imx_clk_mux_flags("pll1_bypass", base + 0x0, 16, 1,
> +		pll1_bypass_sels, ARRAY_SIZE(pll1_bypass_sels), CLK_SET_RATE_PARENT);
> +	clk[IMXRT1050_CLK_PLL2_BYPASS] = imx_clk_mux_flags("pll2_bypass", base + 0x30, 16, 1,
> +		pll2_bypass_sels, ARRAY_SIZE(pll2_bypass_sels), CLK_SET_RATE_PARENT);
> +	clk[IMXRT1050_CLK_PLL3_BYPASS] = imx_clk_mux_flags("pll3_bypass", base + 0x10, 16, 1,
> +		pll3_bypass_sels, ARRAY_SIZE(pll3_bypass_sels), CLK_SET_RATE_PARENT);
> +	clk[IMXRT1050_CLK_PLL5_BYPASS] = imx_clk_mux_flags("pll5_bypass", base + 0xa0, 16, 1,
> +		pll5_bypass_sels, ARRAY_SIZE(pll5_bypass_sels), CLK_SET_RATE_PARENT);
> +
> +	clk[IMXRT1050_CLK_VIDEO_POST_DIV_SEL] = imx_clk_divider("video_post_div_sel",
> +		"pll5_video", base + 0xa0, 19, 2);
> +	clk[IMXRT1050_CLK_VIDEO_DIV] = imx_clk_divider("video_div",
> +		"video_post_div_sel", base + 0x170, 30, 2);
> +
> +	clk[IMXRT1050_CLK_PLL3_80M] = imx_clk_fixed_factor("pll3_80m",  "pll3_usb_otg", 1, 6);
> +
> +	clk[IMXRT1050_CLK_PLL2_PFD0_352M] = imx_clk_pfd("pll2_pfd0_352m", "pll2_sys", base + 0x100, 0);
> +	clk[IMXRT1050_CLK_PLL2_PFD1_594M] = imx_clk_pfd("pll2_pfd1_594m", "pll2_sys", base + 0x100, 1);
> +	clk[IMXRT1050_CLK_PLL2_PFD2_396M] = imx_clk_pfd("pll2_pfd2_396m", "pll2_sys", base + 0x100, 2);
> +	clk[IMXRT1050_CLK_PLL3_PFD1_664_62M] = imx_clk_pfd("pll3_pfd1_664_62m", "pll3_usb_otg", base + 0xf0, 1);
> +	clk[IMXRT1050_CLK_PLL3_PFD3_454_74M] = imx_clk_pfd("pll3_pfd3_454_74m", "pll3_usb_otg", base + 0xf0, 3);
> +}
> +
> +static void __init imxrt1050_clocks_init(struct device_node *np)
> +{
> +	void __iomem *ccm_base;
> +	void __iomem *pll_base;
> +	struct device_node *anp;
> +
> +	clk[IMXRT1050_CLK_OSC] = of_clk_get_by_name(np, "osc");
> +
> +	anp = of_find_compatible_node(NULL, NULL, "fsl,imxrt-anatop");
> +	pll_base = of_iomap(anp, 0);
> +	WARN_ON(!pll_base);
> +	imxrt_clocks_common_init(pll_base);
> +	/* CCM clocks */
> +	ccm_base = of_iomap(np, 0);
> +	WARN_ON(!ccm_base);
> +
> +	clk[IMXRT1050_CLK_ARM_PODF] = imx_clk_divider("arm_podf", "pll1_arm", ccm_base + 0x10, 0, 3);
> +	clk[IMXRT1050_CLK_PRE_PERIPH_SEL] = imx_clk_mux("pre_periph_sel", ccm_base + 0x18, 18, 2,
> +		pre_periph_sels, ARRAY_SIZE(pre_periph_sels));
> +	clk[IMXRT1050_CLK_PERIPH_SEL] = imx_clk_mux("periph_sel", ccm_base + 0x14, 25, 1,
> +		periph_sels, ARRAY_SIZE(periph_sels));
> +	clk[IMXRT1050_CLK_USDHC1_SEL] = imx_clk_mux("usdhc1_sel", ccm_base + 0x1c, 16, 1,
> +		usdhc_sels, ARRAY_SIZE(usdhc_sels));
> +	clk[IMXRT1050_CLK_USDHC2_SEL] = imx_clk_mux("usdhc2_sel", ccm_base + 0x1c, 17, 1,
> +		usdhc_sels, ARRAY_SIZE(usdhc_sels));
> +	clk[IMXRT1050_CLK_LPUART_SEL] = imx_clk_mux("lpuart_sel", ccm_base + 0x24, 6, 1,
> +		lpuart_sels, ARRAY_SIZE(lpuart_sels));
> +	clk[IMXRT1050_CLK_LCDIF_SEL] = imx_clk_mux("lcdif_sel", ccm_base + 0x38, 15, 3,
> +		lcdif_sels, ARRAY_SIZE(lcdif_sels));
> +	clk[IMXRT1050_CLK_PER_CLK_SEL] = imx_clk_mux("per_sel", ccm_base + 0x1C, 6, 1,
> +		per_sels, ARRAY_SIZE(per_sels));
> +
> +	clk[IMXRT1050_CLK_AHB_PODF] = imx_clk_divider("ahb", "periph_sel", ccm_base + 0x14, 10, 3);
> +	clk[IMXRT1050_CLK_IPG_PDOF] = imx_clk_divider("ipg", "ahb", ccm_base + 0x14, 8, 2);
> +	clk[IMXRT1050_CLK_PER_PDOF] = imx_clk_divider("per", "per_sel", ccm_base + 0x1C, 0, 5);
> +
> +	clk[IMXRT1050_CLK_USDHC1_PODF] = imx_clk_divider("usdhc1_podf", "usdhc1_sel", ccm_base + 0x24, 11, 3);
> +	clk[IMXRT1050_CLK_USDHC2_PODF] = imx_clk_divider("usdhc2_podf", "usdhc2_sel", ccm_base + 0x24, 16, 3);
> +	clk[IMXRT1050_CLK_LPUART_PODF] = imx_clk_divider("lpuart_podf", "lpuart_sel", ccm_base + 0x24, 0, 6);
> +	clk[IMXRT1050_CLK_LCDIF_PRED] = imx_clk_divider("lcdif_pred", "lcdif_sel", ccm_base + 0x38, 12, 3);
> +	clk[IMXRT1050_CLK_LCDIF_PODF] = imx_clk_divider("lcdif_podf", "lcdif_pred", ccm_base + 0x18, 23, 3);
> +
> +	clk[IMXRT1050_CLK_USDHC1] = imx_clk_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
> +	clk[IMXRT1050_CLK_USDHC2] = imx_clk_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
> +	clk[IMXRT1050_CLK_LPUART1] = imx_clk_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
> +	clk[IMXRT1050_CLK_LCDIF_APB] = imx_clk_gate2("lcdif", "lcdif_podf", ccm_base + 0x74, 10);
> +	clk[IMXRT1050_CLK_DMA] = imx_clk_gate("dma", "ipg", ccm_base + 0x7C, 6);
> +	clk[IMXRT1050_CLK_DMA_MUX] = imx_clk_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
> +
> +	imx_check_clocks(clk, ARRAY_SIZE(clk));
> +	clk_data.clks = clk;
> +	clk_data.clk_num = ARRAY_SIZE(clk);
> +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +	clk_prepare_enable(clk[IMXRT1050_CLK_PLL1_ARM]);
> +	clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_SYS]);
> +	clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_USB_OTG]);
> +	clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_PFD1_664_62M]);
> +	clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_PFD2_396M]);
> +}
> +CLK_OF_DECLARE(imxrt_ccm, "fsl,imxrt1050-ccm", imxrt1050_clocks_init);
> 

Thank you
and
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
