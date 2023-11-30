Return-Path: <linux-gpio+bounces-780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8007FF094
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C359EB2100F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24566482E8;
	Thu, 30 Nov 2023 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hPzNjZP3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36D419F
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:45 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-332eeb16e39so611881f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701352004; x=1701956804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX1sqlEJJ4vEUK91SFq6mj5SEAnM+ha5YxcxRVGS6+w=;
        b=hPzNjZP3MiHNlaiBNK5uHoOFDkljjmXAmcylnoFm60bgMec4QC4X5skCapr3qftKoj
         PgR9V1jJg3RAPnvw7nxRVZGHqVMrpqrAtH0pxO71h7Ihfy7hGyL700YhG6gWF4cIHFux
         +eCppziCbu5N52REsxeqWAonVjw497Af7hLBVoD/6VUFEbZ01bPwA4iMUAGUIJqsHNT/
         b1biUc5LuPW2PI3W0Yk+RSMcUmYAQoTPnAv24qPVsboxDUO12E915sDm9jcu18CYRRVl
         H8rjZCZFUlBL4z1GdJk6pSEkm282W9ZIiIotZQY9ZbNwicOCJOyxEc/qVeOi5ywpjYbi
         RgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352004; x=1701956804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lX1sqlEJJ4vEUK91SFq6mj5SEAnM+ha5YxcxRVGS6+w=;
        b=cNL3qEXw5OIl3cWA9zO3H+0+nngZhdlWE+6V7xFPjp0SKtC3xn6cWN5VM/ATmEMIXy
         AK6C0jf4shsItVBZ7BTjD/unqMS87zOpKUJvusvZstly2XU7jhxG4Ye5hykhalbLwLes
         6o4OHfQxASY2reAHToXH6U0ADWAvNpaVcvlv370u2Ww0XehlI+LB33XTUlF7B4nvJlZT
         8EGegat//dWH0mTk8syzzleJqjg5roHB3QJy2pq+gZbBuGeEFBVImB7zK4YHz6Md1nwR
         +BGg5wZpMTWHxbBKTuzLWwu+4szoY36xzUfp1yUNCa6QM//W76KvMQutVZpBK8xsFwHA
         SEMg==
X-Gm-Message-State: AOJu0YzJd1oktsDLCy+RMOW2DiTB1g2qb4QS12z/5hgn+Gu0tWHUG5R3
	kbBhU/UOPRLEBjIh83a/Kv+ZCA==
X-Google-Smtp-Source: AGHT+IEH8Mh7PFLu28rLEMPsJfxeGaU60dL2Y/lrZsr6Vmf/W1e5mS0Xhbaro9bpQTm02q7tKBDu7A==
X-Received: by 2002:adf:f305:0:b0:333:2e28:46f5 with SMTP id i5-20020adff305000000b003332e2846f5mr53628wro.1.1701352004522;
        Thu, 30 Nov 2023 05:46:44 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 07/10] pinctrl: baytrail: use gpiochip_dup_line_label()
Date: Thu, 30 Nov 2023 14:46:27 +0100
Message-Id: <20231130134630.18198-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130134630.18198-1-brgl@bgdev.pl>
References: <20231130134630.18198-1-brgl@bgdev.pl>
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


