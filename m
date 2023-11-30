Return-Path: <linux-gpio+bounces-781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EF7FF095
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2842CB20CF0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6466F47A7E;
	Thu, 30 Nov 2023 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O52R2/k6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73141704
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-332e7630a9dso689648f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701352005; x=1701956805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4oN2yBzcOb1+JXtPZKrl0tpOl2eK1zlq9JfJmTld4=;
        b=O52R2/k6OkskTQsBSvj/PTMwCFu3+2ETaBaUKYlr+AhO7mU950wIaLOvdbkqLYXtwC
         FNvvbW3vJwBDY3GGVBdFrWqhhyEMcch0+u6A0q15Y75qGntWN18Get/3ZWiFhENlIhN3
         H6ysmJdqT/OpBJ5JJjZblDE+8kvFtNZ3qMR9shrQaLnzaHJikcNbrlONwhY/QZikoMLR
         oS4NFXrfd1MrbaOdTfeqUcbccWPDpjJfX4vDpwz6l2bvYS5/Pb6VkTfM4GUYZ4g2TH/B
         wd75FZh9asf6VPD+U+0j/OPy3pBgKPkkV5zFUqcThO16qjsTshRWrDgTuvbmfP8MDeB2
         MNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352005; x=1701956805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQ4oN2yBzcOb1+JXtPZKrl0tpOl2eK1zlq9JfJmTld4=;
        b=S/EsAoW2V31IdY5hVd8IYQOuPPQZsWuAzXdSZzhWy4l85NX5aIcMVhPzaAn3MY8raF
         oBqSSD4VljLRE1W7bcZwXqvBpCWEZ5UjuPrkPRvsKZP+Hxl5ZU9jtruaaQ7Z4Qs6tdm3
         VD9QxdorXH1iEAre0//xISSDCrCUt3KaMNtRrYRD+xS6q4CryziecmLw5SZdWVl89Imw
         yzzufRF7T4P8HWzRLvHxPOycnNlSpVKeSjD7Cm7OZ5wDac9bn4bfBCA8SGJEqtWyf+GQ
         niYa3resbxQK6WPSiIGEJQepejrFeabZb8iioWwVmStlOtoFSuPSTy3CFm6jEFhu4hLE
         X83g==
X-Gm-Message-State: AOJu0YwyzO3hOtzHcXf9gaymoND4t5lSv3/NlmUlVAn7FMlOJ5cGNda7
	WJHBPycUAKHwCS1mE37uR8bCYZUg1mMAR1fa+bg=
X-Google-Smtp-Source: AGHT+IGPtG+1uFAas3OVjot2zm3XVUDLgeyXhw2GAlVFtUSUYqhhRLnAvXvRp9OLXomSy5i1jZKXyA==
X-Received: by 2002:a05:6000:114d:b0:333:2736:1e55 with SMTP id d13-20020a056000114d00b0033327361e55mr640974wrx.38.1701352005511;
        Thu, 30 Nov 2023 05:46:45 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 08/10] pinctrl: sppctl: use gpiochip_dup_line_label()
Date: Thu, 30 Nov 2023 14:46:28 +0100
Message-Id: <20231130134630.18198-9-brgl@bgdev.pl>
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
 drivers/pinctrl/sunplus/sppctl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index bb5ef391dbe4..ae156f779a16 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -4,6 +4,7 @@
  * Copyright (C) Sunplus Tech / Tibbo Tech.
  */
 
+#include <linux/cleanup.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -500,16 +501,15 @@ static int sppctl_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 static void sppctl_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	const char *label;
 	int i;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		label = gpiochip_is_requested(chip, i);
-		if (!label)
-			label = "";
+		char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
+		if (IS_ERR(label))
+			continue;
 
 		seq_printf(s, " gpio-%03d (%-16.16s | %-16.16s)", i + chip->base,
-			   chip->names[i], label);
+			   chip->names[i], label ?: "");
 		seq_printf(s, " %c", sppctl_gpio_get_direction(chip, i) ? 'I' : 'O');
 		seq_printf(s, ":%d", sppctl_gpio_get(chip, i));
 		seq_printf(s, " %s", sppctl_first_get(chip, i) ? "gpi" : "mux");
-- 
2.40.1


