Return-Path: <linux-gpio+bounces-779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DD37FF091
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E323F282289
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85610482DB;
	Thu, 30 Nov 2023 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZTsTAUO8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DBB1700
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:44 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40859dee28cso7874025e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701352003; x=1701956803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NPguL+egm1B/3hLyNOqRomxlJRtvAY3YVXSaylJwM0=;
        b=ZTsTAUO8Q5uQn33PwH90C0RCvf/d9jvERfPGPlJwgjE2f2UWjBaVy5KPIOpfvtUzOL
         zVA6S0UoM195MZr7cRWQz2g24tFJp/tg7DoN8qRtUd5mgr6+RyDZPgNjQyqUhz8L5xwn
         RTqqNYQmW2M8BUpfuNiuZD9pYl5oEjgoIgxfilf75+UGvc680VAok4QuHfiG7F0YjsKW
         PfSk7UW55TqmKvuykMhlZbryg7mX72hRc0Mv+Cd4NGbnQtRIcDWPe3poYU2U8Bw1Kecf
         +q+EuACXDr2HjP4pLhX990eAUw7h4rT0VLIUIeQptXzc5wKY3l+FNqkxDN0p0D6f4Rrl
         lj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352003; x=1701956803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NPguL+egm1B/3hLyNOqRomxlJRtvAY3YVXSaylJwM0=;
        b=WrSacOOmIR436HuFoP3+Vrc5lS1MrDA93ZTwfqs7mY0ZXhoWwEOh9QVDIZiUu6S1F/
         O41IT37gXkRnzd9lw3CfKAZG9SfrFLx2wrfLZ3b20KNFyGD68jsTba+V3B0tLw/Milyr
         uEfdw7j/nmV7FNGKaCCxZklo6+JXLb6VUUHJw2B53KoSPJ3Ie3G9s8fiwzN3uZXTd9Fk
         xSsFUc8Fekkb5C0BV2EYXuGBtbb1UayoqVekVoSlEMfEJr817zOCcgj9lSTESzO4Z31I
         LKVZCNfW+ngs6lGPB6A4WdOREu5910Tg3v4GOcXstqPVsTHlrbD+ApnGITLp+rgIQ7DH
         +hgw==
X-Gm-Message-State: AOJu0YzICy453PiUZyz8RPD2PnzjBFeJBqNqoU4dfxr93Xmox1XbW7C2
	OcinyLw3kREuwomNNaET17wc5A==
X-Google-Smtp-Source: AGHT+IF49lqrlVpVqkD0E02GQZF9bH8Vo6dbPgCqchTj1uNhj8pD7rKcwX/9BEAelWIERBkgSTt5dw==
X-Received: by 2002:a05:600c:4592:b0:40b:26f1:57a2 with SMTP id r18-20020a05600c459200b0040b26f157a2mr16362430wmo.27.1701352003401;
        Thu, 30 Nov 2023 05:46:43 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 06/10] pinctrl: nomadik: use gpiochip_dup_line_label()
Date: Thu, 30 Nov 2023 14:46:26 +0100
Message-Id: <20231130134630.18198-7-brgl@bgdev.pl>
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
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 863732287b1e..7911353ac97d 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2011-2013 Linus Walleij <linus.walleij@linaro.org>
  */
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -917,7 +918,6 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 	struct pinctrl_dev *pctldev, struct gpio_chip *chip,
 	unsigned offset, unsigned gpio)
 {
-	const char *label = gpiochip_is_requested(chip, offset);
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 	int mode;
 	bool is_out;
@@ -934,6 +934,10 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 		[NMK_GPIO_ALT_C+4]	= "altC4",
 	};
 
+	char *label = gpiochip_dup_line_label(chip, offset);
+	if (IS_ERR(label))
+		return;
+
 	clk_enable(nmk_chip->clk);
 	is_out = !!(readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset));
 	pull = !(readl(nmk_chip->addr + NMK_GPIO_PDIS) & BIT(offset));
-- 
2.40.1


