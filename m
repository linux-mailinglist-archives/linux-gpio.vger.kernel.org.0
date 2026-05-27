Return-Path: <linux-gpio+bounces-37587-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD2BIfQGF2qn1gcAu9opvQ
	(envelope-from <linux-gpio+bounces-37587-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:00:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEB95E667A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 737473071ECA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C18428850;
	Wed, 27 May 2026 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d+JT5x/4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B33426EB7
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893869; cv=none; b=UyHWfC0RUFZJBEMlnX/+fmm7jzVeXTq1PNGAYduErM+DNo+eaKDqcj3Fjel3wvGNPzsffVxw0bKmXNisKHbhEMJTbKwuyds/FyifsZwbEy92756pHdWLBFPggkt6NeeuEMKGf/IkLDKyqh5ut4zGJ0xJnbv+bqWmVBc/CbYUIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893869; c=relaxed/simple;
	bh=o+TFkbndq/o4Ss9RinaIc021Ojy6VANVwf2Flpoy4uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3Uz3/4yRQrcgc1Q+y1m8tsB0uzgZvjIw24paEW/XMHaZEA45mrRA5VieX5lWXsqZT7z3GBsAH66kn1b5YcXg66VWXws30ZzbwUjHisr7DxuaWauZx4vWmunLU0JGiiPueabtAink5HRFlMrL/dazcKfoSphkoK19PsGoa8lPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d+JT5x/4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ed9336049so1542520f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779893866; x=1780498666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImWCef9z6+kluxiKKkBP6H9+GhVkTkz2HHrfBtNTuoE=;
        b=d+JT5x/4WUNcAsFqf/4f8WAvEaR7apaAEEaIm48BfCmCWj9SQHBWUYYF5lpfiPo/4C
         DFho/37qe9fP5ZxOIVyphawfeE4S5FNP0oinonNbLVm2JLYdPSTRsmEIz7OC0K2FrucM
         eCyM3uV7oK/rCMW0pb2RMSFLBTAjrwUKT2hM7T5Q//v9p18F9qDOWnjFkzr03B8+hQK6
         nRm8zxgwJfZjwTDvWHcwfp000t1N4quLJj/RJLN/FxQseqn9Em0h7cFpN+UGpsoihzx0
         RQWfvzvkOq0B3A+WqoEaJluuRcGI5SelWtiQ8bRkY82rfDXEkSKmquHj7TEM7hDzTJKO
         Q6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893866; x=1780498666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ImWCef9z6+kluxiKKkBP6H9+GhVkTkz2HHrfBtNTuoE=;
        b=CB91ZIJo9domrImIFrsuxKFLfKpxGue3AnHtZjyRperLXQIlOzmJoSMTGgnMheOst2
         rXoLVxOBcOjIX65vyl9H9X2RB+ZR0yFsilI/UIDbYPGOj84WzsnHjqtVDsrjQR2n/X0n
         y4P42l+iLYU9hXTnovzYYYT37b9g/1iwrfjIHdiywHGbmkcBZEJrblTcAUJykhn/bpHX
         wQZrqSYB6vCAsuJhuLusb/apW3rSMSCYgKTTqkyez+7OIHgI0xBEQ/ZOs4qHOBFKuAgg
         p6L2jlK5EkNlUpuh6wNy5Wctm72zA/mbygBkZH7I2fmUii9SlMj98RA9YAWmiem6yain
         /BtA==
X-Forwarded-Encrypted: i=1; AFNElJ9WQB5qziKQLnGcXUTOom87ue+4HHD3ZmXqbpAAvaImdkHzrtKZW0Gd8bipkYpSEqFVNN8jg/MYbJW2@vger.kernel.org
X-Gm-Message-State: AOJu0YxxABLmIcjVnC1ufh4a/ruEomqYohUyXo5d0DFy4Fz5obPkvkuD
	J9QyrDJql4a7VZVKAa7ydHh4RrZp8GRs2GKEoFHxdmwpZvw3YfkrxhyV8XFBsVRCcB0=
X-Gm-Gg: Acq92OFfySDPSmBvq3uu/JqnJrxNWHoERIS+HWe/WQIVqPrhcCjWlaY1O8UrBQvOiGD
	WXPaX314D+hVFFwm7BA8tP8SRYhIBFXs/+ji+DBp6r3K0u88C9mlX0RPejHn4vdd8FIW+zdtXp9
	gnJW5YIMgD8s7mP9Z3gG5kDQ53NcyA7qRojZLaoXAlXuuz53dU8Dy48D5dD8EDIxW+SEKF9FBVa
	r5bKRXPS+Njm/MO3qUbBsaLUTNoQvYId23uA/rnIOBddrwab03V6iu85LWbzdVo4RoePSKMGjP/
	yGHJ+uQJHG+R+6pFaIZNWuCsicbg4wgs886FzPhQD8Lne5x6FY6AyGHLVXppd/1du3R7X6RtjPx
	XEGiYULlheJYnATe29U+0rOKNPpM1qp9ZPwxSgZS/C5mIgNz6hfZfQYnd1tY+lmON2nPfbuOMGj
	zZf7VAlxJI3uI3rtBRJ7+arkNAohpLO0KS6gem611taiytyThpFAAVqL37Wil6D24YwCnLWMMTz
	TfmybXKTKq4GPnwqBDmPtTB2A==
X-Received: by 2002:a05:6000:2688:b0:43d:309b:9c4f with SMTP id ffacd0b85a97d-45eb3670427mr38938952f8f.6.1779893865649;
        Wed, 27 May 2026 07:57:45 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb5584b8sm6370603f8f.11.2026.05.27.07.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:57:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 2/3] gpio: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 16:57:28 +0200
Message-ID:  <b8f7581e9311d5579447304ac4f2d557b29e4f9d.1779893336.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8518; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=o+TFkbndq/o4Ss9RinaIc021Ojy6VANVwf2Flpoy4uk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwZbB7Eak1LiYGHAwg1JWoScC3thLpl3d28Jm Q9U0xAb8bGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcGWwAKCRCPgPtYfRL+ TpHGB/4j1C7u7X/59S5wfibYkTySyLAStDNZSyHn8eGa3zp8jwHWu9ZcR/BeL6Z51EeWSdfwgmF H+DjaAstWVryjLLoWXQ5qJmU/4GQOfJz+ZFoTFjVxCcMLPtktsyZE4JiDxvWRCy3RddNl+/7X5j D4gLT1zECljc57XINzSvXAZ288CZLo2WQ3z9hzJTdaDxwf0LCcBKnYxNlO/DsLU2U8GRUgaOCHB Oup3MmyEQt8X30pm+VVFWqVcMwnTsmnMHy3fc5CXe/hJ2gm72w1oFBXFbRRRQabnprjEYVypNyV hTMp+2ss4VqB1lAqHONbu2dSOib6sT58sEr2ek3fy5zRwMhF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37587-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,linaro.org,free.fr,iki.fi,kemnade.info,baylibre.com,kernel.org,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5CEB95E667A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous unit.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-adp5585.c   |  4 ++--
 drivers/gpio/gpio-bd72720.c   |  4 ++--
 drivers/gpio/gpio-bd9571mwv.c |  4 ++--
 drivers/gpio/gpio-lp873x.c    |  2 +-
 drivers/gpio/gpio-lp87565.c   |  2 +-
 drivers/gpio/gpio-max77759.c  |  2 +-
 drivers/gpio/gpio-pxa.c       | 18 +++++++++---------
 drivers/gpio/gpio-tps65086.c  |  2 +-
 drivers/gpio/gpio-tps65218.c  |  2 +-
 drivers/gpio/gpio-tps65219.c  |  4 ++--
 drivers/gpio/gpio-tps65912.c  |  2 +-
 drivers/gpio/gpio-ts5500.c    |  8 ++++----
 12 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-adp5585.c b/drivers/gpio/gpio-adp5585.c
index 0fd3cc26d017..6f10fc646008 100644
--- a/drivers/gpio/gpio-adp5585.c
+++ b/drivers/gpio/gpio-adp5585.c
@@ -507,8 +507,8 @@ static const struct adp5585_gpio_chip adp5589_gpio_chip_info = {
 };
 
 static const struct platform_device_id adp5585_gpio_id_table[] = {
-	{ "adp5585-gpio", (kernel_ulong_t)&adp5585_gpio_chip_info },
-	{ "adp5589-gpio", (kernel_ulong_t)&adp5589_gpio_chip_info },
+	{ .name = "adp5585-gpio", .driver_data = (kernel_ulong_t)&adp5585_gpio_chip_info },
+	{ .name = "adp5589-gpio", .driver_data = (kernel_ulong_t)&adp5589_gpio_chip_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, adp5585_gpio_id_table);
diff --git a/drivers/gpio/gpio-bd72720.c b/drivers/gpio/gpio-bd72720.c
index d0f936ed80af..306e23411209 100644
--- a/drivers/gpio/gpio-bd72720.c
+++ b/drivers/gpio/gpio-bd72720.c
@@ -263,8 +263,8 @@ static int gpo_bd72720_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd72720_gpio_id[] = {
-	{ "bd72720-gpio" },
-	{ },
+	{ .name = "bd72720-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd72720_gpio_id);
 
diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index cc5b1746f2fe..f829fc40c02b 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -110,8 +110,8 @@ static int bd9571mwv_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd9571mwv_gpio_id_table[] = {
-	{ "bd9571mwv-gpio", ROHM_CHIP_TYPE_BD9571 },
-	{ "bd9574mwf-gpio", ROHM_CHIP_TYPE_BD9574 },
+	{ .name = "bd9571mwv-gpio", .driver_data = ROHM_CHIP_TYPE_BD9571 },
+	{ .name = "bd9574mwf-gpio", .driver_data = ROHM_CHIP_TYPE_BD9574 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, bd9571mwv_gpio_id_table);
diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index f4413fa5a811..0d1bd9df265a 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -156,7 +156,7 @@ static int lp873x_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id lp873x_gpio_id_table[] = {
-	{ "lp873x-gpio", },
+	{ .name = "lp873x-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, lp873x_gpio_id_table);
diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index 0f337c1283b2..3ac78f2b0fa7 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -171,7 +171,7 @@ static int lp87565_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id lp87565_gpio_id_table[] = {
-	{ "lp87565-q1-gpio", },
+	{ .name = "lp87565-q1-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, lp87565_gpio_id_table);
diff --git a/drivers/gpio/gpio-max77759.c b/drivers/gpio/gpio-max77759.c
index 3bf9f23d1532..c6bdac7fb44a 100644
--- a/drivers/gpio/gpio-max77759.c
+++ b/drivers/gpio/gpio-max77759.c
@@ -502,7 +502,7 @@ static const struct of_device_id max77759_gpio_of_id[] = {
 MODULE_DEVICE_TABLE(of, max77759_gpio_of_id);
 
 static const struct platform_device_id max77759_gpio_platform_id[] = {
-	{ "max77759-gpio", },
+	{ .name = "max77759-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77759_gpio_platform_id);
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 664cf1eef494..5d61053e0596 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -708,15 +708,15 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id gpio_id_table[] = {
-	{ "pxa25x-gpio",	(unsigned long)&pxa25x_id },
-	{ "pxa26x-gpio",	(unsigned long)&pxa26x_id },
-	{ "pxa27x-gpio",	(unsigned long)&pxa27x_id },
-	{ "pxa3xx-gpio",	(unsigned long)&pxa3xx_id },
-	{ "pxa93x-gpio",	(unsigned long)&pxa93x_id },
-	{ "mmp-gpio",		(unsigned long)&mmp_id },
-	{ "mmp2-gpio",		(unsigned long)&mmp2_id },
-	{ "pxa1928-gpio",	(unsigned long)&pxa1928_id },
-	{ },
+	{ .name = "pxa25x-gpio",	.driver_data = (unsigned long)&pxa25x_id },
+	{ .name = "pxa26x-gpio",	.driver_data = (unsigned long)&pxa26x_id },
+	{ .name = "pxa27x-gpio",	.driver_data = (unsigned long)&pxa27x_id },
+	{ .name = "pxa3xx-gpio",	.driver_data = (unsigned long)&pxa3xx_id },
+	{ .name = "pxa93x-gpio",	.driver_data = (unsigned long)&pxa93x_id },
+	{ .name = "mmp-gpio",		.driver_data = (unsigned long)&mmp_id },
+	{ .name = "mmp2-gpio",		.driver_data = (unsigned long)&mmp2_id },
+	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
+	{ }
 };
 
 static struct platform_driver pxa_gpio_driver = {
diff --git a/drivers/gpio/gpio-tps65086.c b/drivers/gpio/gpio-tps65086.c
index df770ecf28bc..f29d8485ab33 100644
--- a/drivers/gpio/gpio-tps65086.c
+++ b/drivers/gpio/gpio-tps65086.c
@@ -91,7 +91,7 @@ static int tps65086_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65086_gpio_id_table[] = {
-	{ "tps65086-gpio", },
+	{ .name = "tps65086-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65086_gpio_id_table);
diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 3b4c41f5ef55..bf85663349fb 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -201,7 +201,7 @@ static const struct of_device_id tps65218_dt_match[] = {
 MODULE_DEVICE_TABLE(of, tps65218_dt_match);
 
 static const struct platform_device_id tps65218_gpio_id_table[] = {
-	{ "tps65218-gpio", },
+	{ .name = "tps65218-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65218_gpio_id_table);
diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 158f63bcf10c..457fd8a589e8 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -249,8 +249,8 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps6521x_gpio_id_table[] = {
-	{ "tps65214-gpio", TPS65214 },
-	{ "tps65219-gpio", TPS65219 },
+	{ .name = "tps65214-gpio", .driver_data = TPS65214 },
+	{ .name = "tps65219-gpio", .driver_data = TPS65219 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index 7a2c5685c2fd..cf3fa49a7097 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -115,7 +115,7 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65912_gpio_id_table[] = {
-	{ "tps65912-gpio", },
+	{ .name = "tps65912-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65912_gpio_id_table);
diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
index 3c7f2efe10fd..8583931a9fb8 100644
--- a/drivers/gpio/gpio-ts5500.c
+++ b/drivers/gpio/gpio-ts5500.c
@@ -422,10 +422,10 @@ static void ts5500_dio_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ts5500_dio_ids[] = {
-	{ "ts5500-dio1", TS5500_DIO1 },
-	{ "ts5500-dio2", TS5500_DIO2 },
-	{ "ts5500-dio-lcd", TS5500_LCD },
-	{ "ts5600-dio-lcd", TS5600_LCD },
+	{ .name = "ts5500-dio1", .driver_data = TS5500_DIO1 },
+	{ .name = "ts5500-dio2", .driver_data = TS5500_DIO2 },
+	{ .name = "ts5500-dio-lcd", .driver_data = TS5500_LCD },
+	{ .name = "ts5600-dio-lcd", .driver_data = TS5600_LCD },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, ts5500_dio_ids);
-- 
2.47.3


