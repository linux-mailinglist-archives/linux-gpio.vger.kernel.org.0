Return-Path: <linux-gpio+bounces-5069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0941898436
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C6B41C26B7C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 09:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E4982D8E;
	Thu,  4 Apr 2024 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1jUiGQsi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B3081AB5
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712223220; cv=none; b=NGL+SiTxdbfvnTGpvESQes23ZyAdC0vkexhsElKAL5xNNoFGDLy/z5diqfMxjlb7fQVCgAGCySUSGuZcffK8qmP/+bAU1q1r6S3NZoiW7ZHT9jwwhLGYzrqC8SzO5cNl0ppJo1lWE+Au5bD03TfjG8dWrOGrq8svZgHnKat1OjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712223220; c=relaxed/simple;
	bh=4JZgCjJUm3vYm3YzQEvW4qxgetUWkPZYeaBKSxKI9SM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZeCiJ6qpErl0BbJB4ZoqFqDVH7tszsFc7eUHLiM+R+K763rftj4LhkH+cD4KmGmV4mnYaYja/g0y/YhHHrVKFfbn4rB+0NKdwv15rWKfNEafg2IiKg6jXPSe0AqeNWELLdRkNOcsSJiZTN4jrUSNj0fb+vpxVQakaphei9rG2w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1jUiGQsi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-343b7c015a8so472137f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712223216; x=1712828016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCosdLqhfQl3fw66HOWtcsInpfXJnB5cNYDVDMw2WSI=;
        b=1jUiGQsi+WWK+1+qAiUAoUpvA1zYUELalUXm33hqzTGxHHB1vtemRxaPWq0Vbtb+T2
         Oixd2UB70tbG9KoM+yXI5yr8p/UdswUnq1nH+BpzwSR2WnImV5my+woLLfEijx1MZtk+
         rc4EZgOtyIMsybjCHpO4BFP22Ath8ARdkQqe1JGRlGna8ztlHxmbtT5wNT5KkNtmUENQ
         J9xQeS1u9Be3y2SX02NokVwD+3m+K+A18uUMrTDP+QvI1pfg3Qf75VEVnFoVt1+ch2HS
         QEl2paJCG339pbpwJKDX0jBNt4eUWGmhV14TYiTMAe226xhpuxRfH0HZicb22pqEojA6
         tQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223216; x=1712828016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCosdLqhfQl3fw66HOWtcsInpfXJnB5cNYDVDMw2WSI=;
        b=PY/7dUcck0ySa62yxa3aQCbTClsT+zo5xPFRDZc6XqImcTe+Po4OEXmUIaTNNgLB+d
         hClmLRP9jRXCQNZJR7AEA+jUPiZnMTyQNppomEac5ut9ebBh3247x2lXxXkvDmCEmsoQ
         BqpzwW+Jv9qVIzc+U+wWvSK73d61Zl9Jkd+tu32jRJ4q1sRv/5BMvOj3hDMi89SpEEm4
         GPYQ9NZzpb1tn91eRFSf5vACiCyEPWTECNWlgdQ1KqFcW6LgXwGJmzRLlagxE8aJUe7x
         ZDOH+kbIUYudirYOoP54snJS+Lk+tQJw7sw7uZqwcSedih+vwNfmATkmhybQgEj9twSn
         NN1g==
X-Gm-Message-State: AOJu0YytgPiGiWUC7wQsBl7e/I79/jITnq88eE1v0tHOdreO/fz8Exim
	rXnIV48EJGJKLSsAsmGCQzM6oaUrWYslp8GufEOhfzpAVwyfu4DTVBpaPr2StET94kUBLnfDRoP
	0
X-Google-Smtp-Source: AGHT+IG/TIAUQlpBfX246W5n8aJB90Wlo9DLZd33LwoDVmI9J0u0/E/wz4hT0vsMAcQf6ic4xbbomA==
X-Received: by 2002:a5d:5242:0:b0:343:aeab:2cd9 with SMTP id k2-20020a5d5242000000b00343aeab2cd9mr1250422wrc.11.1712223215865;
        Thu, 04 Apr 2024 02:33:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:220a:565e:2927:8cf0])
        by smtp.gmail.com with ESMTPSA id dj13-20020a0560000b0d00b0033e9fca1e49sm19436385wrb.60.2024.04.04.02.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 02:33:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	stable@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2 1/2] gpio: cdev: check for NULL labels when sanitizing them for irqs
Date: Thu,  4 Apr 2024 11:33:27 +0200
Message-Id: <20240404093328.21604-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404093328.21604-1-brgl@bgdev.pl>
References: <20240404093328.21604-1-brgl@bgdev.pl>
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


