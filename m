Return-Path: <linux-gpio+bounces-1240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FB780D163
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 17:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1598D1C21252
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67E14E1A6;
	Mon, 11 Dec 2023 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wT0aD8/H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243AE114
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:30 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-333536432e0so4425778f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311868; x=1702916668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY3NZW1VVkhHi97yDb7wuKAvdZxLolGu7v09v2ECEzA=;
        b=wT0aD8/HtvBpaEdcw7U0DHtxnpDMJO1shdxRQDV6dcSFDLRcp6K4pmxp//27OHWSKe
         nThRUBbmLy7xu4vMSIVpUWsaQshjYUnOvnHn2vhlP2XuUuW3C3oudLemtTvZ1jQFOugG
         ExStRb7HRebLEzwKwTDZCfvN4Ylyv6v4v02p0WAACcMNj01OZJsGguBltHIO5VnGJLBj
         BFUw6oGU5HBJnPdwGyWD/pFQ2ow/1wlyHxeqeEu7J6VBw7GiUR2c62gdu7FE1MQwihif
         Fgv0V6zclmFFzLWBjiLrsG7rsD2LofWi/s5K9CPzXUyBjU7GOXW3zHm/okEokJtW5+4B
         VTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311868; x=1702916668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY3NZW1VVkhHi97yDb7wuKAvdZxLolGu7v09v2ECEzA=;
        b=kPRBL+ds48LKkNfXKm4DLFAxQ0PBTtaSpImTj/GvAt4c3K6nrg/2KZruU7/R1dBHsp
         TfCLFrrq0D1FhyU4qU8P/cdLNeDVzXh3QtboQH4wADKbx6RhvaQojvaAv3LrlfcUT5Zi
         /UvSnIrmt0VMZ8tvoQH6ojZShwROGEBnhjRrHGUhxePxDHv1ODuofn+gSD35yuoLHjwW
         SU9Ce6bfJCcZQEdVreXdR7m1ClK8j9pkvXRBl+sM0PI4GedgnrLVeMPTkPqcAh1lubI7
         WJuRAs6JLOZ+v9lyea44xC9hTlRlbtEPRWutk+bSp9l75nvpyyldNjJq2774mWlWkk7b
         X4Ig==
X-Gm-Message-State: AOJu0Yzu8wLI6RAqa2e+V88aNAK/zH6VeKWvFNl0C4VHOrchB9VvLc4Z
	iRORCO4el5t0F+aRi/N6p8NuEQ==
X-Google-Smtp-Source: AGHT+IGh34RehzA4y7NRakQmyNCO0bWLmbphPvVU+MIJpWn33vd04o6AuYfkSllgaMbS9psWhNoYfQ==
X-Received: by 2002:adf:ee0f:0:b0:336:1a2d:2f35 with SMTP id y15-20020adfee0f000000b003361a2d2f35mr1584505wrn.130.1702311868567;
        Mon, 11 Dec 2023 08:24:28 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:28 -0800 (PST)
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
Subject: [PATCH v7 10/16] watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
Date: Mon, 11 Dec 2023 16:23:25 +0000
Message-ID: <20231211162331.435900-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
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


