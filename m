Return-Path: <linux-gpio+bounces-777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895607FF092
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8B57B21049
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E97A482D2;
	Thu, 30 Nov 2023 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VIRvQo3R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81F910E5
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:41 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-409299277bbso7722545e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701352000; x=1701956800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7P6Y0m2hGBRRFmWFTt/dmCRHf+pQxLzAw7kKW52hRs=;
        b=VIRvQo3RT4aiG5EG4mKWHcQyV7GPvY5DBdbAPcDXbhbaKucRHdzGN4jts4uum9Yp+h
         MXxwwlcBEY3tAjPfQqiPovgDFo0WhertxXzvHgTixfkA0XUejUFeScHRjNg/EJChvwTM
         C2L/0X88tdGU7Bz7WOl/KsiMq0mPmLWbjBsSOo63tmZleFRRZuHITTFIOHtPv6NUfEOr
         xV/VbgrHCmiPRQqcPOyIcV9hAANERBqVAVPSzCN8CrMcD2YKh2c8GeNfTGzqwPTXG/Ea
         fxBMjec+osOQDklpJDk29qj42/3FkypLIViummhPNnLTqjmr2S0QSN3+hEK/Nzz0Srcy
         dCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352000; x=1701956800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7P6Y0m2hGBRRFmWFTt/dmCRHf+pQxLzAw7kKW52hRs=;
        b=cxAOCHLww05437Pb9GzQ5G+2ocLWWW5rYPLdFjaplAGFgsFb5+AX+iCNAqxbLsyp3K
         dMnNvVaLUCNkmMYO2YDW6VdqnzvinzR9cxXiiTv8CuBYJVBv+c3wnvAbqnjftLlLIW6W
         C7DpixbIqEjWcjj2NlxSOD1/tMUbGag6fRClrbCgnOHo3WTwbq7cmXWVfZSjKyTxD2LB
         bDhO5hHNlyVaBLIzTahI8HEU7HiHQB6U9MHpTQSvUbj61B7gCwx0ps49VJWY1ikzVUM1
         w26xnNr9xDgdvuPfg4x6+3bDNab32nRXUzQNwEKsBJcRuik03w7glL1KbSd9eeoWwUMr
         Z+vQ==
X-Gm-Message-State: AOJu0YxVS9Df7Ja/przwDuKZSpDCHvtB4166jASVUE9GrFRxdMxtZyZI
	zVhrQ7z8hKtC3+OCHjPfSgmA5H+JhXmIo8/YHjs=
X-Google-Smtp-Source: AGHT+IGWQ3w4OgWs+eiKlT4hgKInIw5/57JyahFF8EAqF3mDoy9KOsBP9slLYl+6MDnBdXrI1X7t4g==
X-Received: by 2002:a05:600c:46ce:b0:405:37bb:d942 with SMTP id q14-20020a05600c46ce00b0040537bbd942mr16123768wmo.4.1701352000315;
        Thu, 30 Nov 2023 05:46:40 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 04/10] gpio: stmpe: use gpiochip_dup_line_label()
Date: Thu, 30 Nov 2023 14:46:24 +0100
Message-Id: <20231130134630.18198-5-brgl@bgdev.pl>
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
 drivers/gpio/gpio-stmpe.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 27cc4da53565..6c5ee81d71b3 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -5,6 +5,7 @@
  * Author: Rabin Vincent <rabin.vincent@stericsson.com> for ST-Ericsson
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -255,7 +256,6 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
-	const char *label = gpiochip_is_requested(gc, offset);
 	bool val = !!stmpe_gpio_get(gc, offset);
 	u8 bank = offset / 8;
 	u8 dir_reg = stmpe->regs[STMPE_IDX_GPDR_LSB + bank];
@@ -263,6 +263,10 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 	int ret;
 	u8 dir;
 
+	char *label __free(kfree) = gpiochip_dup_line_label(gc, offset);
+	if (IS_ERR(label))
+		return;
+
 	ret = stmpe_reg_read(stmpe, dir_reg);
 	if (ret < 0)
 		return;
-- 
2.40.1


