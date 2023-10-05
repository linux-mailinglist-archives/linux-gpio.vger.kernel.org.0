Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF1D7BA457
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 18:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239835AbjJEQFL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 12:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237396AbjJEQEB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 12:04:01 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D3587D46
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 08:57:46 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405505b07dfso14147585e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521465; x=1697126265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xoonrjKWOZLwj8NrDcYCfH9KPmFeNjOTSTqB3hRNEM=;
        b=HqtPXBidUQXA0byFMZn9w9lz7htRoXuzz5eTXG1sf9xXTNkGpPbOMLLubn1lzLg54N
         iAnZqy5q4vLtxip/YjR79FOm7u7d1OscI4t2SzNP+QSUzrDTIyZbsNhNelKxzZT/TMVB
         F+Om9sfmulj+M/so5V86e4oJ/ijXhKLFZF5aCQG+5LMzuYp4x44YL0ZgNh/NhcGcisqk
         WYhPru27oDo25yGB2uJamqFMh4DlzNlBjtxLcYCUpfDydOhHXre2Fs5Lv71pwC5s34gB
         ZnvWOQJsDvM0zhpg9EGODQhu7427cmSAmtl0hdgRfrJ7+LTi0njQfesRMoQD9yhk/j8G
         dp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521465; x=1697126265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xoonrjKWOZLwj8NrDcYCfH9KPmFeNjOTSTqB3hRNEM=;
        b=IEnpCdh69xjHK8y9y9n/SSWcTJ6GcDQnyEd1lnPFqjG2KHDsdWL0BBSDh4F2ViYQ0w
         TC0VwFifYq2xPhrsUt9Qtu06FVvsEPqPQWKGEu+nTPFX3uiM6la9ukWO9buje7B/lE4K
         trmNtFE19WG2y4XzefpS7hLVCECBWCReVD2pZssm9UDPIGUMaSD4VuWBCpk8NeI1u5ba
         rnu1NNW7b1dKr0vKf/n8dgowIE7NtxRZujBUfGsNDlBsezuOnDQnEpVRuWLPuF7eTcV9
         fGm01QyKn2ybR45toSkRuwnQyiSoGh3KzLeVyMAGqhY+5Ma0Hqu0ar+JdjmNcFXOhSTJ
         Q3bA==
X-Gm-Message-State: AOJu0Yxd5/YxjKxFwIlnq+ojPFW61sjnFKIKSoT4CsjoQsaZALl8DNdA
        MTJmj41yl9OnSsFIIMkSdaChmQ==
X-Google-Smtp-Source: AGHT+IFsus89r1qsT+k05fF95QZF4pS6P/E6nTXHMzWyKE9+rdSlxCeuQHgoC4gC72Dl+9o8iTBpKw==
X-Received: by 2002:adf:fece:0:b0:329:2306:91a7 with SMTP id q14-20020adffece000000b00329230691a7mr1798772wrs.2.1696521465209;
        Thu, 05 Oct 2023 08:57:45 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:44 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 17/21] watchdog: s3c2410_wdt: Add support for Google tensor SoCs
Date:   Thu,  5 Oct 2023 16:56:14 +0100
Message-ID: <20231005155618.700312-18-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds the compatibles and drvdata for the Google
gs101 & gs201 SoCs found in Pixel 6 and Pixel 7 phones. Similar
to Exynos850 it has two watchdog instances, one for each cluster
and has some control bits in PMU registers.

The watchdog IP found in gs101 SoCs also supports a few
additional bits/features in the WTCON register which we add
support for and an additional register detailed below.

dbgack-mask - Enables masking WDT interrupt and reset request
according to asserted DBGACK input

windowed-mode - Enabled Windowed watchdog mode

Windowed watchdog mode also has an additional register WTMINCNT.
If windowed watchdog is enabled and you reload WTCNT when the
value is greater than WTMINCNT, it prompts interrupt or reset
request as if the watchdog time has expired.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 116 +++++++++++++++++++++++++++++----
 1 file changed, 105 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 0b4bd883ff28..4c23c7e6a3f1 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -31,12 +31,14 @@
 #define S3C2410_WTDAT		0x04
 #define S3C2410_WTCNT		0x08
 #define S3C2410_WTCLRINT	0x0c
-
+#define S3C2410_WTMINCNT	0x10
 #define S3C2410_WTCNT_MAXCNT	0xffff
 
-#define S3C2410_WTCON_RSTEN	(1 << 0)
-#define S3C2410_WTCON_INTEN	(1 << 2)
-#define S3C2410_WTCON_ENABLE	(1 << 5)
+#define S3C2410_WTCON_RSTEN		(1 << 0)
+#define S3C2410_WTCON_INTEN		(1 << 2)
+#define S3C2410_WTCON_ENABLE		(1 << 5)
+#define S3C2410_WTCON_DBGACK_MASK	(1 << 16)
+#define S3C2410_WTCON_WINDOWED_WD	(1 << 20)
 
 #define S3C2410_WTCON_DIV16	(0 << 3)
 #define S3C2410_WTCON_DIV32	(1 << 3)
@@ -61,12 +63,16 @@
 #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
 #define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
 #define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
-
 #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
 #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
 #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
 #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
-
+#define GS_CLUSTER0_NONCPU_OUT			0x1220
+#define GS_CLUSTER1_NONCPU_OUT			0x1420
+#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
+#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
+#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
+#define GS_RST_STAT_REG_OFFSET			0x3B44
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
  *
@@ -106,6 +112,8 @@
 #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
 #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
+#define QUIRK_HAS_DBGACK_BIT			(1 << 5)
+#define QUIRK_HAS_WTMINCNT_REG			(1 << 6)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -263,6 +271,54 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
 };
 
+static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
+	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 0,
+	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 8,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
+};
+
+static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
+	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 1,
+	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
+};
+
+static const struct s3c2410_wdt_variant drv_data_gs201_cl0 = {
+	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 0,
+	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 8,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
+};
+
+static const struct s3c2410_wdt_variant drv_data_gs201_cl1 = {
+	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 1,
+	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
@@ -278,6 +334,10 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos850_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
+	{ .compatible = "google,gs101-wdt",
+	  .data = &drv_data_gs101_cl0 },
+	{ .compatible = "google,gs201-wdt",
+	  .data = &drv_data_gs201_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -375,6 +435,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
 	return 0;
 }
 
+static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
+{
+	unsigned long wtcon;
+
+	if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
+		return;
+
+	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
+	if (mask)
+		wtcon |= S3C2410_WTCON_DBGACK_MASK;
+	else
+		wtcon &= ~S3C2410_WTCON_DBGACK_MASK;
+	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
+}
+
 static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
@@ -585,9 +660,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	}
 
 #ifdef CONFIG_OF
-	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
+	/* Choose Exynos850/ExynosAutov9/gsx01 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
-	    variant == &drv_data_exynosautov9_cl0) {
+	    variant == &drv_data_exynosautov9_cl0 ||
+	    variant == &drv_data_gs101_cl0 ||
+	    variant == &drv_data_gs201_cl0) {
 		u32 index;
 		int err;
 
@@ -600,9 +677,14 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 		case 0:
 			break;
 		case 1:
-			variant = (variant == &drv_data_exynos850_cl0) ?
-				&drv_data_exynos850_cl1 :
-				&drv_data_exynosautov9_cl1;
+			if (variant == &drv_data_exynos850_cl0)
+				variant = &drv_data_exynos850_cl1;
+			else if (variant == &drv_data_exynosautov9_cl0)
+				variant = &drv_data_exynosautov9_cl1;
+			else if (variant == &drv_data_gs101_cl0)
+				variant = &drv_data_gs101_cl1;
+			else if (variant == &drv_data_gs201_cl0)
+				variant = &drv_data_gs201_cl1;
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
@@ -700,6 +782,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
 	wdt->wdt_device.parent = dev;
 
+	s3c2410wdt_mask_dbgack(wdt, true);
+
 	/*
 	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
 	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
@@ -712,6 +796,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		s3c2410wdt_start(&wdt->wdt_device);
 		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
 	} else {
+		dev_info(dev, "stopping watchdog timer\n");
 		s3c2410wdt_stop(&wdt->wdt_device);
 	}
 
@@ -738,6 +823,15 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		 (wtcon & S3C2410_WTCON_RSTEN) ? "en" : "dis",
 		 (wtcon & S3C2410_WTCON_INTEN) ? "en" : "dis");
 
+	if (wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT)
+		dev_info(dev, "DBGACK %sabled\n",
+			 (wtcon & S3C2410_WTCON_DBGACK_MASK) ? "en" : "dis");
+
+	if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG)
+		dev_info(dev, "windowed watchdog %sabled, wtmincnt=%x\n",
+			 (wtcon & S3C2410_WTCON_WINDOWED_WD) ? "en" : "dis",
+			 readl(wdt->reg_base + S3C2410_WTMINCNT));
+
 	return 0;
 }
 
-- 
2.42.0.582.g8ccd20d70d-goog

