Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD15443903
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 23:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhKBXAG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbhKBW7v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 18:59:51 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B914C061203;
        Tue,  2 Nov 2021 15:57:16 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id p4so675884qkk.0;
        Tue, 02 Nov 2021 15:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wN2KFMGBCaaawN3sgfetDAMy4kB6NLcD/RiHHtfbvIA=;
        b=IPtaLa2qKSGSzKmbS2WXsANBfr+/ZJL5ryk6BevHVHbZUrlsR+RgJk+sX8zmrZ+PgH
         HcLh2Zc2+Mdyvrxv3VXoTXgL1y5ZhHKReYbqcUyU3/5lGkR2U2frCjPMJscUdSflRQYp
         IFT+tKNjWkC4bCgE4lZllZ4Itp1q2ucVvoKSThq3lLW4dbqN+O+uWHWCAb8llnjEUIFh
         eTZfn7cNN9q4AnuPegdMtSO8c9SmSLbJumnnaEBly71q6Ea1fDYPsvBSxm0tGjzAx2db
         s4njjz1h6Ef73tdt7fkdbow2xvv37nT5MPkm9kTkSZJWEpznmvlnETTyu3Yt7oSvMt2r
         vOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wN2KFMGBCaaawN3sgfetDAMy4kB6NLcD/RiHHtfbvIA=;
        b=MsZ78Gj6t90ytIuDMADLJw0ijxE11Bhf7CcovHPKXYkkt8apg+dBErdE1y+OoXAF9V
         jDG4SQ9SXo41s1BIV1NjbkNO2eHFi6//NUAXvxJvLSxrekNI7+aO8aPS1IfS5TdtiUYC
         z+NwslkwDWAdKDSVIGH46GymRwLeZ7d8DmCB9H+XTrKhyIpuICiGmhH1/gvNwEtdAj1I
         GTDZ3FAfswhhtQ3PJAgWt0FkQ4mKnsk21OnlJgrLljPPxczxJcvQM4P5ipQrtwnN/J3j
         5PAPIm5C+NArZvoERc6jhkXN5R3Z/qc9hQZ8G77qqrdfi9R8QR4q2lSpAAOLpq6N7Cw4
         yrSg==
X-Gm-Message-State: AOAM532u9igRwXwYjiDWapkH4g0N16OuQJcV8plcySh8G1fYRZYx2zmw
        YiLP2vhTgWNPOei59Eh43D0=
X-Google-Smtp-Source: ABdhPJz42REhhOsFVZ4QisjQiSZ4k5Ei7/0697Jv3/lF64zDCV2YNZnZe4UFDEnc5W3FNPiHtQyYZQ==
X-Received: by 2002:a05:620a:2901:: with SMTP id m1mr13161411qkp.85.1635893835178;
        Tue, 02 Nov 2021 15:57:15 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:14 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v2 07/13] clk: imx: Add initial support for i.MXRT clock driver
Date:   Tue,  2 Nov 2021 18:56:55 -0400
Message-Id: <20211102225701.98944-8-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jesse Taube <mr.bossman075@gmail.com>

This patch adds initial clock driver support for the i.MXRT series.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* Kconfig: Add new line
* clk-imxrt.c: Remove unused const
* clk-imxrt.c: Remove set parents
* clk-imxrt.c: Use fsl,imxrt-anatop for anatop base address
---
 drivers/clk/imx/Kconfig     |   4 +
 drivers/clk/imx/Makefile    |   1 +
 drivers/clk/imx/clk-imxrt.c | 149 ++++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imxrt.c

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 47d9ec3abd2f..f83ba5fe8cd3 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -98,3 +98,7 @@ config CLK_IMX8QXP
 	select MXC_CLK_SCU
 	help
 	  Build the driver for IMX8QXP SCU based clocks.
+
+config CLK_IMXRT
+	def_bool SOC_IMXRT
+	select MXC_CLK
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index c24a2acbfa56..6a3fee6cd9af 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -45,3 +45,4 @@ obj-$(CONFIG_CLK_IMX6UL) += clk-imx6ul.o
 obj-$(CONFIG_CLK_IMX7D)  += clk-imx7d.o
 obj-$(CONFIG_CLK_IMX7ULP) += clk-imx7ulp.o
 obj-$(CONFIG_CLK_VF610)  += clk-vf610.o
+obj-$(CONFIG_CLK_IMXRT)  += clk-imxrt.o
diff --git a/drivers/clk/imx/clk-imxrt.c b/drivers/clk/imx/clk-imxrt.c
new file mode 100644
index 000000000000..8e235925cdb7
--- /dev/null
+++ b/drivers/clk/imx/clk-imxrt.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021
+ * Author(s):
+ * Jesse Taube <Mr.Bossman075@gmail.com>
+ * Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+#include <linux/mm.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/sizes.h>
+#include <soc/imx/revision.h>
+#include <dt-bindings/clock/imxrt1050-clock.h>
+
+#include "clk.h"
+#define ANATOP_BASE_ADDR	0x400d8000
+
+static const char * const pll_ref_sels[] = {"osc", "dummy", };
+static const char * const per_sels[] = {"ipg_pdof", "osc", };
+static const char * const pll1_bypass_sels[] = {"pll1_arm", "pll1_arm_ref_sel", };
+static const char * const pll2_bypass_sels[] = {"pll2_sys", "pll2_sys_ref_sel", };
+static const char * const pll3_bypass_sels[] = {"pll3_usb_otg", "pll3_usb_otg_ref_sel", };
+static const char * const pll5_bypass_sels[] = {"pll5_video", "pll5_video_ref_sel", };
+static const char *const pre_periph_sels[] = {
+	"pll2_sys", "pll2_pfd2_396m", "pll2_pfd0_352m", "arm_podf", };
+static const char *const periph_sels[] = { "pre_periph_sel", "todo", };
+static const char *const usdhc_sels[] = { "pll2_pfd2_396m", "pll2_pfd0_352m", };
+static const char *const lpuart_sels[] = { "pll3_80m", "osc", };
+static const char *const lcdif_sels[] = {
+	"pll2_sys", "pll3_pfd3_454_74m", "pll5_video", "pll2_pfd0_352m",
+	"pll2_pfd1_594m", "pll3_pfd1_664_62m", };
+
+static struct clk *clk[IMXRT1050_CLK_END];
+static struct clk_onecell_data clk_data;
+
+static void __init imxrt_clocks_common_init(void __iomem *base)
+{
+	/* Anatop clocks */
+	clk[IMXRT1050_CLK_DUMMY] = imx_clk_fixed("dummy", 0UL);
+
+	clk[IMXRT1050_CLK_PLL1_REF_SEL] = imx_clk_mux("pll1_arm_ref_sel",
+		base + 0x0, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clk[IMXRT1050_CLK_PLL2_REF_SEL] = imx_clk_mux("pll2_sys_ref_sel",
+		base + 0x30, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clk[IMXRT1050_CLK_PLL3_REF_SEL] = imx_clk_mux("pll3_usb_otg_ref_sel",
+		base + 0x10, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	clk[IMXRT1050_CLK_PLL5_REF_SEL] = imx_clk_mux("pll5_video_ref_sel",
+		base + 0xa0, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+
+	clk[IMXRT1050_CLK_PLL1_ARM] = imx_clk_pllv3(IMX_PLLV3_SYS, "pll1_arm",
+		"pll1_arm_ref_sel", base + 0x0, 0x7f);
+	clk[IMXRT1050_CLK_PLL2_SYS] = imx_clk_pllv3(IMX_PLLV3_GENERIC, "pll2_sys",
+		"pll2_sys_ref_sel", base + 0x30, 0x1);
+	clk[IMXRT1050_CLK_PLL3_USB_OTG] = imx_clk_pllv3(IMX_PLLV3_USB, "pll3_usb_otg",
+		"pll3_usb_otg_ref_sel", base + 0x10, 0x1);
+	clk[IMXRT1050_CLK_PLL5_VIDEO] = imx_clk_pllv3(IMX_PLLV3_AV, "pll5_video",
+		"pll5_video_ref_sel", base + 0xa0, 0x7f);
+
+	/* PLL bypass out */
+	clk[IMXRT1050_CLK_PLL1_BYPASS] = imx_clk_mux_flags("pll1_bypass", base + 0x0, 16, 1,
+		pll1_bypass_sels, ARRAY_SIZE(pll1_bypass_sels), CLK_SET_RATE_PARENT);
+	clk[IMXRT1050_CLK_PLL2_BYPASS] = imx_clk_mux_flags("pll2_bypass", base + 0x30, 16, 1,
+		pll2_bypass_sels, ARRAY_SIZE(pll2_bypass_sels), CLK_SET_RATE_PARENT);
+	clk[IMXRT1050_CLK_PLL3_BYPASS] = imx_clk_mux_flags("pll3_bypass", base + 0x10, 16, 1,
+		pll3_bypass_sels, ARRAY_SIZE(pll3_bypass_sels), CLK_SET_RATE_PARENT);
+	clk[IMXRT1050_CLK_PLL5_BYPASS] = imx_clk_mux_flags("pll5_bypass", base + 0xa0, 16, 1,
+		pll5_bypass_sels, ARRAY_SIZE(pll5_bypass_sels), CLK_SET_RATE_PARENT);
+
+	clk[IMXRT1050_CLK_VIDEO_POST_DIV_SEL] = imx_clk_divider("video_post_div_sel",
+		"pll5_video", base + 0xa0, 19, 2);
+	clk[IMXRT1050_CLK_VIDEO_DIV] = imx_clk_divider("video_div",
+		"video_post_div_sel", base + 0x170, 30, 2);
+
+	clk[IMXRT1050_CLK_PLL3_80M] = imx_clk_fixed_factor("pll3_80m",  "pll3_usb_otg", 1, 6);
+
+	clk[IMXRT1050_CLK_PLL2_PFD0_352M] = imx_clk_pfd("pll2_pfd0_352m", "pll2_sys", base + 0x100, 0);
+	clk[IMXRT1050_CLK_PLL2_PFD1_594M] = imx_clk_pfd("pll2_pfd1_594m", "pll2_sys", base + 0x100, 1);
+	clk[IMXRT1050_CLK_PLL2_PFD2_396M] = imx_clk_pfd("pll2_pfd2_396m", "pll2_sys", base + 0x100, 2);
+	clk[IMXRT1050_CLK_PLL3_PFD1_664_62M] = imx_clk_pfd("pll3_pfd1_664_62m", "pll3_usb_otg", base + 0xf0, 1);
+	clk[IMXRT1050_CLK_PLL3_PFD3_454_74M] = imx_clk_pfd("pll3_pfd3_454_74m", "pll3_usb_otg", base + 0xf0, 3);
+}
+
+static void __init imxrt1050_clocks_init(struct device_node *np)
+{
+	void __iomem *ccm_base;
+	void __iomem *pll_base;
+	struct device_node *anp;
+
+	clk[IMXRT1050_CLK_OSC] = of_clk_get_by_name(np, "osc");
+
+	anp = of_find_compatible_node(NULL, NULL, "fsl,imxrt-anatop");
+	pll_base = of_iomap(anp, 0);
+	WARN_ON(!pll_base);
+	imxrt_clocks_common_init(pll_base);
+	/* CCM clocks */
+	ccm_base = of_iomap(np, 0);
+	WARN_ON(!ccm_base);
+
+	clk[IMXRT1050_CLK_ARM_PODF] = imx_clk_divider("arm_podf", "pll1_arm", ccm_base + 0x10, 0, 3);
+	clk[IMXRT1050_CLK_PRE_PERIPH_SEL] = imx_clk_mux("pre_periph_sel", ccm_base + 0x18, 18, 2,
+		pre_periph_sels, ARRAY_SIZE(pre_periph_sels));
+	clk[IMXRT1050_CLK_PERIPH_SEL] = imx_clk_mux("periph_sel", ccm_base + 0x14, 25, 1,
+		periph_sels, ARRAY_SIZE(periph_sels));
+	clk[IMXRT1050_CLK_USDHC1_SEL] = imx_clk_mux("usdhc1_sel", ccm_base + 0x1c, 16, 1,
+		usdhc_sels, ARRAY_SIZE(usdhc_sels));
+	clk[IMXRT1050_CLK_USDHC2_SEL] = imx_clk_mux("usdhc2_sel", ccm_base + 0x1c, 17, 1,
+		usdhc_sels, ARRAY_SIZE(usdhc_sels));
+	clk[IMXRT1050_CLK_LPUART_SEL] = imx_clk_mux("lpuart_sel", ccm_base + 0x24, 6, 1,
+		lpuart_sels, ARRAY_SIZE(lpuart_sels));
+	clk[IMXRT1050_CLK_LCDIF_SEL] = imx_clk_mux("lcdif_sel", ccm_base + 0x38, 15, 3,
+		lcdif_sels, ARRAY_SIZE(lcdif_sels));
+	clk[IMXRT1050_CLK_PER_CLK_SEL] = imx_clk_mux("per_sel", ccm_base + 0x1C, 6, 1,
+		per_sels, ARRAY_SIZE(per_sels));
+
+	clk[IMXRT1050_CLK_AHB_PODF] = imx_clk_divider("ahb", "periph_sel", ccm_base + 0x14, 10, 3);
+	clk[IMXRT1050_CLK_IPG_PDOF] = imx_clk_divider("ipg", "ahb", ccm_base + 0x14, 8, 2);
+	clk[IMXRT1050_CLK_PER_PDOF] = imx_clk_divider("per", "per_sel", ccm_base + 0x1C, 0, 5);
+
+	clk[IMXRT1050_CLK_USDHC1_PODF] = imx_clk_divider("usdhc1_podf", "usdhc1_sel", ccm_base + 0x24, 11, 3);
+	clk[IMXRT1050_CLK_USDHC2_PODF] = imx_clk_divider("usdhc2_podf", "usdhc2_sel", ccm_base + 0x24, 16, 3);
+	clk[IMXRT1050_CLK_LPUART_PODF] = imx_clk_divider("lpuart_podf", "lpuart_sel", ccm_base + 0x24, 0, 6);
+	clk[IMXRT1050_CLK_LCDIF_PRED] = imx_clk_divider("lcdif_pred", "lcdif_sel", ccm_base + 0x38, 12, 3);
+	clk[IMXRT1050_CLK_LCDIF_PODF] = imx_clk_divider("lcdif_podf", "lcdif_pred", ccm_base + 0x18, 23, 3);
+
+	clk[IMXRT1050_CLK_USDHC1] = imx_clk_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
+	clk[IMXRT1050_CLK_USDHC2] = imx_clk_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
+	clk[IMXRT1050_CLK_LPUART1] = imx_clk_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
+	clk[IMXRT1050_CLK_LCDIF_APB] = imx_clk_gate2("lcdif", "lcdif_podf", ccm_base + 0x74, 10);
+	clk[IMXRT1050_CLK_DMA] = imx_clk_gate("dma", "ipg", ccm_base + 0x7C, 6);
+	clk[IMXRT1050_CLK_DMA_MUX] = imx_clk_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
+
+	imx_check_clocks(clk, ARRAY_SIZE(clk));
+	clk_data.clks = clk;
+	clk_data.clk_num = ARRAY_SIZE(clk);
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+	clk_prepare_enable(clk[IMXRT1050_CLK_PLL1_ARM]);
+	clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_SYS]);
+	clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_USB_OTG]);
+	clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_PFD1_664_62M]);
+	clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_PFD2_396M]);
+}
+CLK_OF_DECLARE(imxrt_ccm, "fsl,imxrt1050-ccm", imxrt1050_clocks_init);
-- 
2.33.1

