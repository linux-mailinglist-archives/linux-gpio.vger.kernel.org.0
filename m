Return-Path: <linux-gpio+bounces-1166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9880180B7F6
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 00:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EDF6B20B8B
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 23:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A4B20DF5;
	Sat,  9 Dec 2023 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hOeOlSBf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A731706
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 15:31:39 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso11234585e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 15:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164697; x=1702769497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFN6xER1loihBa9uWQwup/JqyzQhajX2oH9kffaNe40=;
        b=hOeOlSBfMzazKzhmY3FrTHrdqkxtQVBsOAUW9IOUt5Xr759tedIuFGmYvQfCpBzNf5
         xMtXHlArBtQ65QPxIHAluVSYTuDBxMVrIIyrzC3MGutWWkAFlgbpeMLaB+xSqkQDYL/s
         A7i5SbPXQpOYPwQWeQUclkIsSTzZRCKRz6vUNvSgsSLZqlgTBicbJkrrrszxpzZDjHGT
         9uXQOpphPywmHPHkFpdBou7ARMVZ6AqHVbk6cctIg1T9gp/o8SRUy8B+oLuMbG28p4Wl
         bUChVZJRq8m/td0P6TSWfsPNH8LhNcOQExW+xAzsP1LTpvIyWCi1rjeVjXgzFgL0GIp2
         k+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164697; x=1702769497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFN6xER1loihBa9uWQwup/JqyzQhajX2oH9kffaNe40=;
        b=xDt+szVYlZphnlFZ2IwNwhmNzmVfDq7zB/7KMcac63uPy7QoS7kJzDMxVWXZxVHkm8
         KeiWPWC+G4WiPs/G5DddvhwrWMNituW4mQYE7GU7K9UQo4tofr5pGvlnFwduguPCQ0sL
         n2f2YUhOHpMnvx6WaQsSwbqj6bJPmSqe/gGmtVCOm+8ttauVodgG2PFMN1FKo2MAnz5r
         o0mp7KYny8DVAhv355TaVE/P35GBCNIrOO0VM/+rb17/81oNaj2oacXugKDVtntqWX4j
         kTTcaKfx7w+HKZk146rss5qZoMBtH9bON9JK4n2OGC5DQrntNSETiSFF11590YaJLGYK
         quZQ==
X-Gm-Message-State: AOJu0YyVRB8iwbKpiq33L+YhZxrXBeSlzNxrp3x1UKCXFrVV0r1mz7HJ
	l3G384je95lLFCwZ+9uNMDkkyQ==
X-Google-Smtp-Source: AGHT+IHlNWaNCCCVx46tnk9DPqNQxKSg2eKBcJFo3Qqg135ZJrQ+9HNnrazePrrKs5Bhv5Z8UV7hxA==
X-Received: by 2002:a7b:c850:0:b0:40c:2b16:1e3 with SMTP id c16-20020a7bc850000000b0040c2b1601e3mr782723wml.84.1702164697697;
        Sat, 09 Dec 2023 15:31:37 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:37 -0800 (PST)
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
Subject: [PATCH v6 15/20] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
Date: Sat,  9 Dec 2023 23:31:01 +0000
Message-ID: <20231209233106.147416-16-peter.griffin@linaro.org>
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

Update the remaining QUIRK macros to use the BIT macro.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 7ecb762a371d..b7a03668f743 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -107,11 +107,11 @@
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
  */
-#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
-#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
-#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
-#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
-#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
+#define QUIRK_HAS_WTCLRINT_REG			BIT(0)
+#define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
+#define QUIRK_HAS_PMU_RST_STAT			BIT(2)
+#define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
+#define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
 
 /* These quirks require that we have a PMU register map */
-- 
2.43.0.472.g3155946c3a-goog


