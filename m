Return-Path: <linux-gpio+bounces-1167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D5780B7F3
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 00:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA72280FC5
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 23:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66112FE20;
	Sat,  9 Dec 2023 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y98xTg5Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C628410D9
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 15:31:37 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c317723a8so24298185e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 15:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164696; x=1702769496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY3NZW1VVkhHi97yDb7wuKAvdZxLolGu7v09v2ECEzA=;
        b=Y98xTg5QVyARyasvgaBkw5qmaseWQmY3bX7nyzlM3MEnmT/lecrutNkfTBs17WjVjD
         HLJy3/RE0OmaT5cMI5qLMqzWuFjKsC33u5ND60r7BVOexxN1ch8en8hPlMwIqwBZSRUV
         D+ds47sXqJlc3OoDNunfr5cVWOmxoiahR1RCxRs/PGyG5Q4eRckkhIGCYfkOvDF2kkp/
         m4FyewmXo4MvKOYvky2PdnaGVGeXIp+RKX/ql029VOWQwSdSZRbL7C5xHlNxweHyCGrq
         wOtQRMlDhZEEmA3oAgBwK/99QYaMTX5M6+GRDS1IoQf//bLnyAj05yQDBBvR4XPHnfLw
         lTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164696; x=1702769496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY3NZW1VVkhHi97yDb7wuKAvdZxLolGu7v09v2ECEzA=;
        b=W4VckM2WxjOD0dYU+ZFXXUfb2JcrHcntUnJA9KEbPuOPvkY4B5UeB0WVlvUmIula9H
         EgP44rxIF03F4FXfaK3rx7A9YaeXGYb/DjBdK3P5SB3hLtmbaIMXABkV7OIU4BYs5ABD
         mZ4P+Ha9IBMFkVUuG2m8LzOK1RyFUvDfrf6XWjN0TOCuMPljeq7JiaWNPmq5GDRMXCpB
         U+Iy2P+XRrXy7HWujQWiJV/mqUDmG9+xs/aTKyYcqnMLf91+hLMLVtQnb84Iy31nIA/Z
         7gpjUrVaEf11Mdm8ryUzFCR3EE0PXzCwKJQ+B5uhWl4ghsDDJcisxJCHP/Gj7DdWY1B7
         umag==
X-Gm-Message-State: AOJu0YxQ6uERMFYY2GUbNEoh3n7x0GC7xYtkZeJJQ+u3p6EHEG1ryq1G
	lS/5sQkCJGAVPT2RimeocNbUZA==
X-Google-Smtp-Source: AGHT+IFpxiBnjxiNR92R4x5iC6HtJiyfHvaodh3vNRVQdNujCiOwBYwPF2MXq71Ww9sAvMF66Hl4Ng==
X-Received: by 2002:a1c:6a16:0:b0:40c:25f6:4585 with SMTP id f22-20020a1c6a16000000b0040c25f64585mr997465wmc.73.1702164696220;
        Sat, 09 Dec 2023 15:31:36 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:35 -0800 (PST)
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
Subject: [PATCH v6 14/20] watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
Date: Sat,  9 Dec 2023 23:31:00 +0000
Message-ID: <20231209233106.147416-15-peter.griffin@linaro.org>
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

The WDT uses the CPU core signal DBGACK to determine whether the SoC
is running in debug mode or not. If the DBGACK signal is asserted and
DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
(disabled).

Presence of the DBGACK_MASK bit is determined by adding a new
QUIRK_HAS_DBGACK_BIT quirk. Also update to use BIT macro to avoid
checkpatch --strict warnings.

Tested-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 0b4bd883ff28..7ecb762a371d 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -9,6 +9,7 @@
  *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
@@ -34,9 +35,10 @@
 
 #define S3C2410_WTCNT_MAXCNT	0xffff
 
-#define S3C2410_WTCON_RSTEN	(1 << 0)
-#define S3C2410_WTCON_INTEN	(1 << 2)
-#define S3C2410_WTCON_ENABLE	(1 << 5)
+#define S3C2410_WTCON_RSTEN		BIT(0)
+#define S3C2410_WTCON_INTEN		BIT(2)
+#define S3C2410_WTCON_ENABLE		BIT(5)
+#define S3C2410_WTCON_DBGACK_MASK	BIT(16)
 
 #define S3C2410_WTCON_DIV16	(0 << 3)
 #define S3C2410_WTCON_DIV32	(1 << 3)
@@ -100,12 +102,17 @@
  * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
  * with "watchdog counter enable" bit. That bit should be set to make watchdog
  * counter running.
+ *
+ * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
+ * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
+ * Debug mode is determined by the DBGACK CPU signal.
  */
 #define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
 #define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
 #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
 #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
+#define QUIRK_HAS_DBGACK_BIT			BIT(5)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -375,6 +382,19 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
 	return 0;
 }
 
+/* Disable watchdog outputs if CPU is in debug mode */
+static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt)
+{
+	unsigned long wtcon;
+
+	if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
+		return;
+
+	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
+	wtcon |= S3C2410_WTCON_DBGACK_MASK;
+	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
+}
+
 static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
@@ -700,6 +720,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
 	wdt->wdt_device.parent = dev;
 
+	s3c2410wdt_mask_dbgack(wdt);
+
 	/*
 	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
 	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
-- 
2.43.0.472.g3155946c3a-goog


