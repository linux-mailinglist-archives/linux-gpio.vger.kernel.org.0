Return-Path: <linux-gpio+bounces-941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDC802EB4
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36D931F211BC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E681A733;
	Mon,  4 Dec 2023 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JRRbyB69"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B8D109
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:19 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c039e9719so20646345e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682517; x=1702287317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7P6Y0m2hGBRRFmWFTt/dmCRHf+pQxLzAw7kKW52hRs=;
        b=JRRbyB69kiCLpu/4ZG4DzhiF/GZvns/kelMSC/ykVyX1XYkXMpRtb7VCDhqMZAKy+0
         KJONePiulejgrDDvoe93uT4kd65FXJ0y70pjYxy353zUCKS/DuupHHtehJEqXnu2P7g7
         p7Nz5i6aucvfuzR73L3HOgYHOfnVqiSPvWYm05h9hLOFMKAcM5cgB554Mv2AgeFsEM2W
         L+lHxtGoMTkH33cSqvVc/E7Yc/+WcImUEX/MyugubJ0u1SbkoO8cLbhLynpCK+mSQKqz
         Rz2QpBAoJ7o77LSAtFPDRKkvcudACDr/CP3OJ29I/7JXatavob0yJLuhkRix8i6GxX1E
         P2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682517; x=1702287317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7P6Y0m2hGBRRFmWFTt/dmCRHf+pQxLzAw7kKW52hRs=;
        b=nNrqxeQ3gataBWkxEIGoU75y6BcWs6jTvPVoPjuFqq0aZXO1ZvZQ/78vIrikLK1kIP
         HSvFR4+LeFzShVTeLLeQCtoMQ1PIjEhOJPEf1FdYYUfCM/Mm2Ote1PbxhjDzdsdRee4i
         Y2TbpddwKIGBn3CV+mwwmtJo600jMs7NMLtnDoBqLMumBGhJ+VWrM5j6HUD+yKrf4AGK
         bA7ADNFXWsP2nwoeXm1YgOhtQqEOy9IA+havOP4vNtnzGil2Oi87ecykb2H8i9/QRTfy
         P1u0zhcpeigdvX/yQj2EnGoH2nIW409UaIoP8LoeqbLg8pNKqzXmpdf8NsPpwP3WBg+C
         ZOCw==
X-Gm-Message-State: AOJu0YxMQz8ITE5kK0x9mQHRNfQx15wU9NFnZYVdPPKmaFZOkaFBHMpS
	8eJvB9FUES1G5+uHMtABKvXjcA==
X-Google-Smtp-Source: AGHT+IGdNMxWu9CAp1B8+hOKkvU9FEsYEEb9kAiU357IxEvD2zDpahJNZN4dV+3wpjhH/7lMeBVJ7A==
X-Received: by 2002:a05:600c:524f:b0:40b:5e21:ec2a with SMTP id fc15-20020a05600c524f00b0040b5e21ec2amr2044570wmb.92.1701682517494;
        Mon, 04 Dec 2023 01:35:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 04/10] gpio: stmpe: use gpiochip_dup_line_label()
Date: Mon,  4 Dec 2023 10:35:03 +0100
Message-Id: <20231204093509.19225-5-brgl@bgdev.pl>
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


