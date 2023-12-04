Return-Path: <linux-gpio+bounces-943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B089802EB6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13A2280F5A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128231A726;
	Mon,  4 Dec 2023 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k/nTLUCJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8DA10E
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:22 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b27726369so43225525e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682521; x=1702287321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX1sqlEJJ4vEUK91SFq6mj5SEAnM+ha5YxcxRVGS6+w=;
        b=k/nTLUCJ6LFc9jAbF3VrnIECocahF8qiCl/z5yo7XN8BhWPV4MqrYXm1vgrMQf9hKp
         Kx62gzrG2Bmqd1OM6YJAYO7ikSZKl9HmT+Mvpzl/OSOD8bNMIHISz+1u4FkHsRx96JMR
         /jSgoLGvuAOdP6Wu+UkZZGbM6k4KSqZ8NBXkhTG2LYbaix3MpYq+ePs/QeuMOlFoPb3a
         X9SaPchFsX+SoeesY2a/S9hA/JdZYspq1aLO77xjjKcc5Io8NY/aCRlKNr3Cg9Op7oU2
         ae5fB2BUZkrzx/XCwYx1hGU7yjKVUg9jE/IXc5M1z6POSgyNGfPR5cxPDWvJbPNzj/15
         vMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682521; x=1702287321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lX1sqlEJJ4vEUK91SFq6mj5SEAnM+ha5YxcxRVGS6+w=;
        b=KFKu23Z45JZEmqBwDcQlp0myrxD5bVKNBkuF83mx765gOdxmu4JXew8fpwRS+j+x+r
         uO5NTjZTNPbA7gDRoXucvO1yp0uZ+DH891Xx6G4/eKmzHWtb4gvDz0hNeV7vCzhvZMbE
         bdhbX9+cw2sQc20OLBEb8Gv1TCR/i2a5+/+0K79ZU8xadKpr5rjCVKh/OZxeuLbpfh0P
         yobiWd1JM7aIB6AuvOF7a7W2V2Ef00Zwa9b8A4yzmKpcKJ1EEF8Jq8JcQi+Ua5aWgHSS
         fhJyEczfGNa56IrRyisy1NHA63W7N2oDCU6G+5rMVQwsW77MBbF9/leNdOXdISI6TpvN
         1EVA==
X-Gm-Message-State: AOJu0YwXZwHIYPi/kpzFGLJVjNqDvFLCmEqZy5eamrvdSIrHDeAGQa+q
	I0eyjAWfp0II7VLnfVhoFK0JTi6PuYoBU/D+IwA=
X-Google-Smtp-Source: AGHT+IFq4DBJmONbEWfXXbKiJ3kXh0xlYz/lUO6kayLYCeDzWPU9D0Wqi96fSt/UQSxXSGG9l7QZlg==
X-Received: by 2002:a05:600c:4fce:b0:40c:902:dc25 with SMTP id o14-20020a05600c4fce00b0040c0902dc25mr1059951wmq.51.1701682521118;
        Mon, 04 Dec 2023 01:35:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 07/10] pinctrl: baytrail: use gpiochip_dup_line_label()
Date: Mon,  4 Dec 2023 10:35:06 +0100
Message-Id: <20231204093509.19225-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231204093509.19225-1-brgl@bgdev.pl>
References: <20231204093509.19225-1-brgl@bgdev.pl>
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


