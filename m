Return-Path: <linux-gpio+bounces-942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC92802EB5
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24F171F21122
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495E31C6A5;
	Mon,  4 Dec 2023 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZQseQcjj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E616A188
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:21 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b399a6529so32413665e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682520; x=1702287320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NPguL+egm1B/3hLyNOqRomxlJRtvAY3YVXSaylJwM0=;
        b=ZQseQcjjE+vW5TPsgSz5KrYkfQTCIA6JQRU8NbwG8EpVeNocOrwzqc7U0UJ60XS6Ql
         aZfduINkqhk14CIRz9EtuRkJ5HxXKgZziDI109WUmJbDC1FP3IvZBPKfab8JCMlmNiaS
         J4qsMBI0fG9gPt0xBUPdZBazOjrFPNb9opGkN6ouytFKynm5mr7Nk6DzsTDW7vltbpwh
         6nxUBzZ76jyzMEH+jDpa13qurOt/e/CJjoH381HYQQVfhfNnlQZmK8H+F9fN4fjXvZTj
         lyB/i4P/1fsapV3gv/vhs8o3CEfjVm09AJRLjqMlncll6S6HsOqQ5Je2rLGE5LHxCtt+
         EmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682520; x=1702287320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NPguL+egm1B/3hLyNOqRomxlJRtvAY3YVXSaylJwM0=;
        b=u8f3Xc1Z/1T5M9/lZ4Jggc/OQpglJAmOm5FiMhoKpe0NBGcHAS8fzoOfYn5p38wmiJ
         m8ct1jwktjq26w93fLKZ3rHhsmsyKwNbTkXRFrZ80VClAQe7k7TebbjUnthwp+Riux1a
         wPb9bd5I57Fgwg/CE9dVC6kkWwEOGkB3CGzxWcWh9lUAqJGWJF23xLMLh/OI4MuPywuO
         xIPOafILV6YzhVXa9ETTqgGzG7FIDLU274ligz7cnboiUbfXmG8rJSYFUNW/gygeYypS
         hAOxq9YutYtu7cV2vMYFM5ByJVrbncj1XNFXn9k/1kCfwTjVll8IhJS+rshJxWRJl7Th
         npRA==
X-Gm-Message-State: AOJu0YxndkAIvECi45j9pxigjZgaQPPj+I/wdI3ZnUJcQVpXvE6nKYEn
	5yEfdkPjxBdUPerF8Udy2r6Wuut6moL+fcifkHk=
X-Google-Smtp-Source: AGHT+IGSQVKS9Qw36aNJcIn1j1pEaPabqfikmC6hB8VkbJSOX2WbEREh2ySrnlJFoeafL30Lhqj/pw==
X-Received: by 2002:a05:600c:44c7:b0:40b:5e4a:2376 with SMTP id f7-20020a05600c44c700b0040b5e4a2376mr2513988wmo.120.1701682520303;
        Mon, 04 Dec 2023 01:35:20 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:19 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 06/10] pinctrl: nomadik: use gpiochip_dup_line_label()
Date: Mon,  4 Dec 2023 10:35:05 +0100
Message-Id: <20231204093509.19225-7-brgl@bgdev.pl>
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


