Return-Path: <linux-gpio+bounces-1168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8D780B7F7
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 00:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B63F11F21029
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 23:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AE03218D;
	Sat,  9 Dec 2023 23:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KO97+Trr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA353D60
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 15:31:40 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c26a45b2dso17989475e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 15:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164699; x=1702769499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKjdEgpEXrW+Vxxavwk/sAmHZPIPjACT3GXQf40mCiU=;
        b=KO97+TrrWpEUZk8GU0JlQh1YR0FEkkiotZsGDJBF14QjuAqLfbkM/4ZtqJzDDB3yKc
         /meiHorWmtCGNNgiV+CUtfSVYuVArWycqa+SaqAqk+RM1aBhW13B3xE7jr/BHb96CKqU
         +eWMcB3vSeya20jK+Lib+8rU9p7f5Pe9R6FAqQqrzcEK+WHtXwiQHbrFbC88+xsoP2pU
         PEicupJEXsy6dEVgf2iO9X7Y5UtXAKhuEAtdbOHzhqj1uSSYoz8N5HIjODivG5p72tzb
         JYsZrqiH980JSGmk9tL5jPznaowhHLKBAx/WeiA9sqsRMG1yH00OkGCNV4Lc1KSXdHGT
         vAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164699; x=1702769499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKjdEgpEXrW+Vxxavwk/sAmHZPIPjACT3GXQf40mCiU=;
        b=RSLhljXG1djywCJ8K/W5nCvvMHUM/D1WfVilTB56wJQYBANLSqt5DDeMriK4b3KgHX
         LokQ7xFq2veICNHWAZU9ZVKAe3NRDWGZwhbFlxoWaNb5vImkzXZgXGv1i5pYSI9s7/cI
         NT0kOwHROHK3kqeWBRbW65nVloEoXVvHikPiiTGjyghg9hmWPiNQtcIGoJGMZ+C/DtSt
         AXskqUCEUAVmxNYoh1RGhH7cdATWeIgHGVtuV74GsT/o7pvFLyLSvxpRI2577XV+VjBh
         E557JX18/CwUejUDlifWWUriVbfUdkjrgNshIU1vDzBPMyCWDSmmajC8mR9ejl+w4E0M
         ykYg==
X-Gm-Message-State: AOJu0YwGuuCRW/8Tk5sgWZfFmxEj4+JO2xANrA5oTXkhpbah7l17lPZz
	6pUtgINjhM7Wwb1sXiUaBTGDvw==
X-Google-Smtp-Source: AGHT+IHG0h9fWeJZoWe96F9odEDDHNPogAVg5BKBSqAOmxsv2w9oH2Z31W4Ae/TWa8jV2Dp1VpIp3w==
X-Received: by 2002:a05:600c:45cd:b0:40b:5e56:7b6c with SMTP id s13-20020a05600c45cd00b0040b5e567b6cmr997863wmo.181.1702164699187;
        Sat, 09 Dec 2023 15:31:39 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:38 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 16/20] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
Date: Sat,  9 Dec 2023 23:31:02 +0000
Message-ID: <20231209233106.147416-17-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the compatibles and drvdata for the Google
gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.

Similar to Exynos850 it has two watchdog instances, one for
each cluster and has some control bits in PMU registers.

gs101 also has the dbgack_mask bit in wtcon register, so
we also enable QUIRK_HAS_DBGACK_BIT.

Tested-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 49 ++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index b7a03668f743..ae4457a39c77 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -69,6 +69,13 @@
 #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
 #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
 
+#define GS_CLUSTER0_NONCPU_OUT			0x1220
+#define GS_CLUSTER1_NONCPU_OUT			0x1420
+#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
+#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
+#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
+#define GS_RST_STAT_REG_OFFSET			0x3B44
+
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
  *
@@ -270,6 +277,32 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
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
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_CNT_EN | QUIRK_HAS_WTCLRINT_REG |
+		  QUIRK_HAS_DBGACK_BIT,
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
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_CNT_EN | QUIRK_HAS_WTCLRINT_REG |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
@@ -285,6 +318,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos850_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
+	{ .compatible = "google,gs101-wdt",
+	  .data = &drv_data_gs101_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -605,9 +640,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	}
 
 #ifdef CONFIG_OF
-	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
+	/* Choose Exynos9 SoC family driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
-	    variant == &drv_data_exynosautov9_cl0) {
+	    variant == &drv_data_exynosautov9_cl0 ||
+	    variant == &drv_data_gs101_cl0) {
 		u32 index;
 		int err;
 
@@ -620,9 +656,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
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
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
-- 
2.43.0.472.g3155946c3a-goog


