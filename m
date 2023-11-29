Return-Path: <linux-gpio+bounces-676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A083C7FD940
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FB3EB2154B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2850431583;
	Wed, 29 Nov 2023 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fmMbM2Xq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC0FDD
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:27 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40b5155e154so8429335e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267866; x=1701872666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7P6Y0m2hGBRRFmWFTt/dmCRHf+pQxLzAw7kKW52hRs=;
        b=fmMbM2XquS3hB1agy/V7FOyts6vnMhNULjoxw3yQIOw30649AXKQNfFdu/Yh9+TYDH
         RSyMOtSvQ9PPxQ78bPtCbWpydycAS5/VouqSBEUpWV8OKHktZsGdzKpd8NwRKd1VBeQH
         0zsj+5mhPk+6aahgwNALOrFbSAYMTD9Ut1MIHUv9U2J8fgEOULgwwN2cImtuxtPsJ+uN
         EeV6BEWkM+GEeSF0ud2cj0n2p/5TxRlOxbbbYQ0PJJgI3coki+so9VXsyKKVEj3crfgw
         r3i+bD3n/rnVa9DyXcLlcvVS3fUlg+YDkARJPjnlz0VQZytJO/SHUkZM1ZVWqChKQ7KT
         kT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267866; x=1701872666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7P6Y0m2hGBRRFmWFTt/dmCRHf+pQxLzAw7kKW52hRs=;
        b=MQLDoa9kXSu9bm5JtllanpPi+3w/f87zRR1+APwNaTytar+wqry06aI6lhjH3Ve2ID
         M0dhAABkMjdJZEuaK55jHlEXjk578a1V4t4MWSzrna3rEGZcuQtU7peQsHjfmPdmmpXN
         0KNrM10AOb6uiQ1PO14P17QJgTy/0yPuIUDiqSKQddA/y6Sp3kSSBXzBB233wRuQngNC
         UJo8L9PE4kXMy/a7xhwlN4tV5ztMcflUh8VJIv4zzk3PUzXv/rAJD5Rh4L4qE87y8d2T
         QCVWN28+VcuTqXzTQPfVbRMSqJYKP/2tB1+gp6ehLRNpEXAUJZ9ZrM0ZleGKJcKtiejN
         p2Tw==
X-Gm-Message-State: AOJu0YzZr1AbFwbAadUoozrTc4eJ3odU2BifZVGGZmU8lcv7t0I3rNvE
	aID9IOM3pxJhwJjFF5hYcLk5Qw==
X-Google-Smtp-Source: AGHT+IE9BfsGxTjT5b568IE45xWg41xMIwavHOZrpDPhRpbyx+zNNYTDpinUA7Bc7rGGWxcYdxfPjw==
X-Received: by 2002:a05:600c:4f82:b0:40b:2b42:a1c9 with SMTP id n2-20020a05600c4f8200b0040b2b42a1c9mr12880421wmq.23.1701267866421;
        Wed, 29 Nov 2023 06:24:26 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 04/10] gpio: stmpe: use gpiochip_dup_line_label()
Date: Wed, 29 Nov 2023 15:24:05 +0100
Message-Id: <20231129142411.76863-5-brgl@bgdev.pl>
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


