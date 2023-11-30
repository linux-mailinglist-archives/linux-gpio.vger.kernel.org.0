Return-Path: <linux-gpio+bounces-778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C985A7FF090
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85312282317
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5410482D9;
	Thu, 30 Nov 2023 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gdSOQtao"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAECC10E3
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:43 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-333229dcebdso431165f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701352002; x=1701956802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cffjJvUFWsxdgp9qJiLVkij+XoF+TZsz38c1WQZlyho=;
        b=gdSOQtaof93nM5ia61UhuHXlJsyRqcru/G05JG7W8V1FssY7r+DAfHzJne1PEcTXsF
         YM5G9ExjsMk8Rr5qeYZ13DnVH3LBZCQMj91lpzi1sq1n066WUmZfO8ebjceDWiYMUv63
         lR+I6OhQSHuJ7HdTb24IX7LNdfcigyIVh0OtdsIfxfxVerKJuoblT1VITrUSZAyDf3n8
         S9l6zab1Q+hY+sewGCicanmYoVopw2XSSY026wmft/15dYC9N6tFojxW75jjA6olC7I8
         tkKVCiKU5496/SECyJMIPJAZc/ae9xT5PaCCWzEqo4elcsHb04oLQPIm7dmojCrOQrKQ
         Y0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352002; x=1701956802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cffjJvUFWsxdgp9qJiLVkij+XoF+TZsz38c1WQZlyho=;
        b=q53RibhyvcnS+UDA2/MPuOeaJgvnKoycOBcF7sEW/GP4baRyQh7NNyZItJrn+em7+6
         bA9CbCIywBJPksFFAKq9eVExbY9KZVo754tM5j0rsvrsdb2xeJDWlkTgbV4CX0vk9+7X
         ENKeCYCKjD+z+PHEDikLB1+qUjflw+ni4lfMnbZ70WBVys5JMhQwwARJPuckSIvRVJXn
         m1wINKYRGG8jhRnzbkx7bhq24X4uBsltNEeC412Ad1g+mYOAkyhGU+9jxvR2Ks2SEQmW
         klUFBywt5jE8OOiKhM2YiznZ+OwDpxOKT7aVy3CCktiOfL4Dm4SI+8byMBceR21N0PD+
         iLmA==
X-Gm-Message-State: AOJu0YzsWNpeSOrS5VaoV6phR/p9WZNE+n0TWp2b6UBolI4SeB4tT5ds
	w+7NGD/thCO65YP+97IhTd/WdQ==
X-Google-Smtp-Source: AGHT+IFqmZA1KQhwkSPcUaNoBMtUmaEHugbvUiR1Onas5XzwXX7zZR0pNya8Ie3NAxw5LM70WUUmrA==
X-Received: by 2002:a05:6000:36c:b0:333:18b9:27a6 with SMTP id f12-20020a056000036c00b0033318b927a6mr3490982wrf.30.1701352002295;
        Thu, 30 Nov 2023 05:46:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 05/10] pinctrl: abx500: use gpiochip_dup_line_label()
Date: Thu, 30 Nov 2023 14:46:25 +0100
Message-Id: <20231130134630.18198-6-brgl@bgdev.pl>
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
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index d3c32d809bac..80e3ac333136 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -6,7 +6,9 @@
  *
  * Driver allows to use AxB5xx unused pins to be used as GPIO
  */
+
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
@@ -453,12 +455,11 @@ static void abx500_gpio_dbg_show_one(struct seq_file *s,
 				     unsigned offset, unsigned gpio)
 {
 	struct abx500_pinctrl *pct = pinctrl_dev_get_drvdata(pctldev);
-	const char *label = gpiochip_is_requested(chip, offset - 1);
 	u8 gpio_offset = offset - 1;
 	int mode = -1;
 	bool is_out;
 	bool pd;
-	int ret;
+	int ret = -ENOMEM;
 
 	const char *modes[] = {
 		[ABX500_DEFAULT]	= "default",
@@ -474,6 +475,10 @@ static void abx500_gpio_dbg_show_one(struct seq_file *s,
 		[ABX500_GPIO_PULL_UP]		= "pull up",
 	};
 
+	char *label __free(kfree) = gpiochip_dup_line_label(chip, offset - 1);
+	if (IS_ERR(label))
+		goto out;
+
 	ret = abx500_gpio_get_bit(chip, AB8500_GPIO_DIR1_REG,
 			gpio_offset, &is_out);
 	if (ret < 0)
-- 
2.40.1


