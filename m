Return-Path: <linux-gpio+bounces-286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279087F1F06
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 22:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49EC41C21686
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 21:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0480374F7;
	Mon, 20 Nov 2023 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zhjkwcs5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F88122
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:31 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso16831695e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515290; x=1701120090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK0jDddTxBnxILFTDM1zRnQ/zFRkhDEQfFfzD038F1U=;
        b=Zhjkwcs5A5J41joF3hzKDEZN6JtbLsL+y/di8/TYOffbhdZobWfR1JM0FtZmIobuSz
         ypUA/E9dZhjSNwH31KBH4Dnff2u2d8L7xmOO77vjnMTp5Tnd3JVkRci6LF70UhJF/7GN
         TlL/zU61I8XQVxH11AdZcmBLXXSSY4MtRiGpOkE31eTdn+GA1864EZ9V3OLBSxLK+JwX
         UIrIviTdjPgVyJf0H4gWyF2A4TJlgfnAXD/vd2FuM89gSaL6lGJ5TA94HqK2zieP4EKr
         tA1cUqLI5NbnLGE9rzut5BAPVUk8esfPTZRIkiSvh2LSa1pg3+n8CNQ0nDkTSbzoQOfd
         ysbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515290; x=1701120090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK0jDddTxBnxILFTDM1zRnQ/zFRkhDEQfFfzD038F1U=;
        b=Vn4HAAGR6xWFpW2GKtsi89dizNxoxtlqYjwjpCYtI3MxoR2M/jbrik97cndaHOIdlR
         EYMjAUYmHXLcvI8nAdGe+B+TJD0O2Yqf7a7MCPHQJSRIAYv0mbTueXel0+nvnXbWCkwC
         qXNC8MK/p2vD/MYDcIZQvmU/rTPbqYzH5FogH+/eleppi6lpdaSOzgvX05ILfAqUePD2
         /oQWpd9GeqgQjJ6wv0/oGPk3WeHoMXnyj+XeJ2OD2uXedy5MLz9jMiXzmbz43CNovrse
         9SO+wCaELJQw16AwYLWhtxs0shomyi5ihDdiVlrhSsi7gDBr5p4aR7sAF0Chd14EP1A1
         IUhw==
X-Gm-Message-State: AOJu0Yyp3Ae8NqenZAorl8WZY6upyVZxUWv1qfH6b7FBJj2mgQF/NHTK
	ggFwlFX7Cx4IFLfxMgGXdbpetg==
X-Google-Smtp-Source: AGHT+IFypLjwdZtZkl/0Hj5YY90Bg6DLP9s6VRmPco0RNEfZMj1azsng3SuZT4zxGq1II5yr5ZaTqg==
X-Received: by 2002:a05:600c:190e:b0:401:b6f6:d90c with SMTP id j14-20020a05600c190e00b00401b6f6d90cmr6336962wmq.35.1700515289781;
        Mon, 20 Nov 2023 13:21:29 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:29 -0800 (PST)
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
Subject: [PATCH v4 15/19] watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
Date: Mon, 20 Nov 2023 21:20:33 +0000
Message-ID: <20231120212037.911774-16-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WDT uses the CPU core signal DBGACK to determine whether the SoC
is running in debug mode or not. If the DBGACK signal is asserted and
DBGACK_MASK is enabled, then WDT output and interrupt is masked.

Presence of the DBGACK_MASK bit is determined by adding a new
QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
drv_data_gs101_cl1 quirks.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 08b8c57dd812..ed561deeeed9 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -34,9 +34,10 @@
 
 #define S3C2410_WTCNT_MAXCNT	0xffff
 
-#define S3C2410_WTCON_RSTEN	(1 << 0)
-#define S3C2410_WTCON_INTEN	(1 << 2)
-#define S3C2410_WTCON_ENABLE	(1 << 5)
+#define S3C2410_WTCON_RSTEN		(1 << 0)
+#define S3C2410_WTCON_INTEN		(1 << 2)
+#define S3C2410_WTCON_ENABLE		(1 << 5)
+#define S3C2410_WTCON_DBGACK_MASK	(1 << 16)
 
 #define S3C2410_WTCON_DIV16	(0 << 3)
 #define S3C2410_WTCON_DIV32	(1 << 3)
@@ -107,12 +108,16 @@
  * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
  * with "watchdog counter enable" bit. That bit should be set to make watchdog
  * counter running.
+ *
+ * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables masking
+ * WDT interrupt and reset request according to CPU core DBGACK signal.
  */
 #define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
 #define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
 #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
 #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
+#define QUIRK_HAS_DBGACK_BIT			(1 << 5)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -279,7 +284,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
 	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_WTCLRINT_REG,
+		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
@@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
 	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_WTCLRINT_REG,
+		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
@@ -408,6 +413,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
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
@@ -737,6 +757,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
 	wdt->wdt_device.parent = dev;
 
+	s3c2410wdt_mask_dbgack(wdt, true);
+
 	/*
 	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
 	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
-- 
2.43.0.rc1.413.gea7ed67945-goog


