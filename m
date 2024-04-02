Return-Path: <linux-gpio+bounces-4990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EE895210
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 13:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E89A21F21E9E
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 11:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875F66995D;
	Tue,  2 Apr 2024 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vyQAQvjz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8CA6519D
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712058130; cv=none; b=p80blqHZodvPe4RSXJyLWKgFQZNDvVWGIhymlr+pYtd2JiyRZEKl5LkPynxiCBvlouPhfYPzSua8I5CVm/bGwTL+GlsZbngMt8sxwjXEed3iB4lHM2KbW31Q5eQWKLIod0E24Q9Apu4tNN/juDs/Ba+5i2AMrmVnK9NTn1lVVkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712058130; c=relaxed/simple;
	bh=4JZgCjJUm3vYm3YzQEvW4qxgetUWkPZYeaBKSxKI9SM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jQJDOg9XOfiD7fpwdZbbVkKpF2zDd5d+glqjUU9E0ENJEaY43vpcdpA6RwPtCSJ5Hp4LK5LWLjaSX2mA0KUhrcih9wfCsAvWZ00KPD4PIYRTjYaVxdb9zDZ7CKYM8aAm7MPa9qoRQhUOLxcd9R4+xo1tfdUHA5SrYr3dp0Qgj5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vyQAQvjz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4161eb1aea7so614875e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712058126; x=1712662926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCosdLqhfQl3fw66HOWtcsInpfXJnB5cNYDVDMw2WSI=;
        b=vyQAQvjzOhcZjIoQSb1pJBJp69T77RkzVbCP00fi8WzG5mesmSSpnQxzJIPFxGYIc3
         ZISCC73UIp2+N4SXjS+ad20mTTf908vECJLCTe5oJaIy8yRx7Gpq8c7lGsrVSn8SLK+a
         9rOmvaYkBZfue7WphAw+4PvN9MR8MVdl+eaiqc0sMsT1aqcZz7FMDYKtOOJtUBlFV4CN
         QiYsQpoEwcyOJAbeGGFEAymLUvyxoc1CEsFcqMXIi5nB22vnXXOJXHCEW23IIY3bz95u
         iAsCn3DkJRmI6uUi4ZZiWnPwRV5JPgk+eSP6YaKM+jFvUixvYpBX0+OHKzaG9+tBCT6u
         bNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712058126; x=1712662926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCosdLqhfQl3fw66HOWtcsInpfXJnB5cNYDVDMw2WSI=;
        b=qyMgtpjmyCjyIhdxLxWx3xKABpm4Scti9s0Dn5qNOXDIaa53P6i7I5lzlbz6hA7z0n
         AqR/sJhlZrJE4HdO+ma58gtLPtZN6Qv2vLIAzuCVtLNmnpyKm6zRQW3JrzsjCy3sVJBh
         ElA0AGIHlmhYzZgBfMm01lnDOOOmagBDR+LXh7ckgi7dv5Z8swuJpKQeX8fwPBkSNbb9
         +hmWelk8/P9PLcsNTFApj3EG9eQAwbcWC5b9DL8TXmDWeINkPVhudZfFEyBZZRiTee24
         6qTbtfdl/cnaZjBGb+69S1m8eIpmm/lpv04EqljkM/1NKPKBH4XXPlouFymZJ5J/13Jx
         AJHQ==
X-Gm-Message-State: AOJu0Yz/Y5lUYsKgBNJOJC0CwvSwc6ix+V4a83AOM1MYv/9c9aou2iJL
	ptxQaJQuoNgpfMVgfxHp3LuRSA/hkR7wEWN78X/s6HkHB9FJa4ItLx5CYFL3qhc=
X-Google-Smtp-Source: AGHT+IFXB2QwBRnINWQare9T4ey+AHwU7Qtcx5TtMce6E0RHGApROYLfjdwlFyKGfSKX+HUQkjSu0A==
X-Received: by 2002:a05:600c:35d5:b0:414:1363:539f with SMTP id r21-20020a05600c35d500b004141363539fmr9360988wmq.8.1712058125519;
        Tue, 02 Apr 2024 04:42:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d26c:f9fe:8de3:38f5])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b00414887d9329sm17631524wmb.46.2024.04.02.04.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 04:42:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	stable@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH] gpio: cdev: check for NULL labels when sanitizing them for irqs
Date: Tue,  2 Apr 2024 13:41:59 +0200
Message-Id: <20240402114159.32920-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We need to take into account that a line's consumer label may be NULL
and not try to kstrdup() it in that case but rather pass the NULL
pointer up the stack to the interrupt request function.

To that end: let make_irq_label() return NULL as a valid return value
and use ERR_PTR() instead to signal an allocation failure to callers.

Cc: stable@vger.kernel.org
Fixes: b34490879baa ("gpio: cdev: sanitize the label before requesting the interrupt")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/lkml/20240402093534.212283-1-naresh.kamboju@linaro.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index fa9635610251..1426cc1c4a28 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1085,7 +1085,16 @@ static u32 gpio_v2_line_config_debounce_period(struct gpio_v2_line_config *lc,
 
 static inline char *make_irq_label(const char *orig)
 {
-	return kstrdup_and_replace(orig, '/', ':', GFP_KERNEL);
+	char *new;
+
+	if (!orig)
+		return NULL;
+
+	new = kstrdup_and_replace(orig, '/', ':', GFP_KERNEL);
+	if (!new)
+		return ERR_PTR(-ENOMEM);
+
+	return new;
 }
 
 static inline void free_irq_label(const char *label)
@@ -1158,8 +1167,8 @@ static int edge_detector_setup(struct line *line,
 	irqflags |= IRQF_ONESHOT;
 
 	label = make_irq_label(line->req->label);
-	if (!label)
-		return -ENOMEM;
+	if (IS_ERR(label))
+		return PTR_ERR(label);
 
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(irq, edge_irq_handler, edge_irq_thread,
@@ -2217,8 +2226,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_le;
 
 	label = make_irq_label(le->label);
-	if (!label) {
-		ret = -ENOMEM;
+	if (IS_ERR(label)) {
+		ret = PTR_ERR(label);
 		goto out_free_le;
 	}
 
-- 
2.40.1


