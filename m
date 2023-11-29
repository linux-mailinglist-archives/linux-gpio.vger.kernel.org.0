Return-Path: <linux-gpio+bounces-679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D667FD93F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C0871C209F9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA1131581;
	Wed, 29 Nov 2023 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cmui+8oU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C534DD
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:31 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9b77be7ceso22713781fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267869; x=1701872669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX1sqlEJJ4vEUK91SFq6mj5SEAnM+ha5YxcxRVGS6+w=;
        b=cmui+8oUvf4Ks+gTyWIBhQm5JG7ZMZ4iUa+RgGSbI1FOXXh9qfUqryLfKlHRm/NsR8
         3sTfsLnrqes8B593KPQegLIqTkPCQIOTPGwqmxWQsxxNfg4po7gJhejOJJdSe2w0u5wA
         6ulnaQENKCaSj9XjN1tQiW9dcMQ0iNIwMbLAsSqIAJXYeUAbjnLbB7m3sOJu18bNTQEG
         7MYUe/nOcN3msrJCjSoDfUBtJg1ZtYInl6Qz+zmigAqKSkk5BXJ/3WdTlpPRKbj9wqZq
         zqYKZIj7A78lP+mkRl1K6S7ahdKTqSzi3Umd2dqBup5tKd7kR/FglystB0cuEw+uMHc2
         dkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267869; x=1701872669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lX1sqlEJJ4vEUK91SFq6mj5SEAnM+ha5YxcxRVGS6+w=;
        b=pI7k6hB00ldZBbOuJ93lqypdOYCXtYgL1Nl5PyFO0dN7dq8Rwmck5U8eo6iDNDGuUC
         xUjjnn9D9+VZ+/JMudFC2OKh1TsPn9e6XZftoh1fuxkpjW6tYOq+YKpr3wgyUT1CqXI/
         7BC5iJkvXZotsbs+RDVOswmjZs1UJbuKIH6Mnpsy8nKKW9dFpev2I0dxGU+kl5vRT0Li
         7Lcjo1m0cfsusucpikJH8QmpJVzYb4+yukXIGZXaJEqRhbdZ+8hlvNIO4m4/EUMewuGw
         J6NI0kM8Pnd7zPeTHngd7CKSHRXd8uMpuAOgC2PUsALdHtm15jOMu429qHSU1luW8rnK
         ta4A==
X-Gm-Message-State: AOJu0YxmENFr+RU2/HF59pFrLsUQEFZ1vx+DijvhC1gai4BvVeDhw/6A
	gxj3HOYQJ/EMvr5yUJSZhoOkyg==
X-Google-Smtp-Source: AGHT+IFjEBWan0C97HdNCiQeMtPtXLlhZluROT5dGRXGCE0TfLtIbmQkWSsz4iIIEozMicZGD6j8hg==
X-Received: by 2002:a2e:9855:0:b0:2c9:c00a:c28e with SMTP id e21-20020a2e9855000000b002c9c00ac28emr1331701ljj.33.1701267869205;
        Wed, 29 Nov 2023 06:24:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 07/10] pinctrl: baytrail: use gpiochip_dup_line_label()
Date: Wed, 29 Nov 2023 15:24:08 +0100
Message-Id: <20231129142411.76863-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129142411.76863-1-brgl@bgdev.pl>
References: <20231129142411.76863-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the new gpiochip_dup_line_label() helper to safely retrieve the
descriptor label.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 3cd0798ee631..3c8c02043481 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -1173,7 +1174,6 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		const char *pull_str = NULL;
 		const char *pull = NULL;
 		unsigned long flags;
-		const char *label;
 		unsigned int pin;
 
 		pin = vg->soc->pins[i].number;
@@ -1200,9 +1200,10 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			seq_printf(s, "Pin %i: can't retrieve community\n", pin);
 			continue;
 		}
-		label = gpiochip_is_requested(chip, i);
-		if (!label)
-			label = "Unrequested";
+
+		char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
+		if (IS_ERR(label))
+			continue;
 
 		switch (conf0 & BYT_PULL_ASSIGN_MASK) {
 		case BYT_PULL_ASSIGN_UP:
@@ -1231,7 +1232,7 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		seq_printf(s,
 			   " gpio-%-3d (%-20.20s) %s %s %s pad-%-3d offset:0x%03x mux:%d %s%s%s",
 			   pin,
-			   label,
+			   label ?: "Unrequested",
 			   val & BYT_INPUT_EN ? "  " : "in",
 			   val & BYT_OUTPUT_EN ? "   " : "out",
 			   str_hi_lo(val & BYT_LEVEL),
-- 
2.40.1


