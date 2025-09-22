Return-Path: <linux-gpio+bounces-26443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05650B8FE2C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 11:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F89A421FA9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 09:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864032FCC1B;
	Mon, 22 Sep 2025 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YMd5Vvqa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE132F5A08
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535129; cv=none; b=bSpvCtUz0daivRCw65NWqIbW3DRIWnF27lzivOC74xSrzz9XcsegmTrTVz1O6mkR0Q35sANITXOGhuJnqnEeykZqfNyIBiy5mpvsYvXBPzCHeHy9n/AihXeSARHZcIe9A0KCFLNY6dIKv3+H6oDbcxXPnZaA+0zjFXj6QfDgUn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535129; c=relaxed/simple;
	bh=zWPNj0RNAceSF22TSQ0IDW3EbGOYMdo93t/FZbvvlww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2yiVZQ6mR74WKGFmNXcAlrJpn2DC+BaKxAGzmnWQEfNoWgyQdzEq1y1EyNEkjqyg3g2I9jOW9s0tZpDnJDISmomSXdR5AJUIrfbLHaRPO7Xj586alCG5Q4YzHamXNVuu2JlB4V3MYiNYmISjIxPneHl7vXQszczkscdEQ5FJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YMd5Vvqa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso2204233f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758535126; x=1759139926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nSZRXEJpJYIJ7RPipWafSLvYkrPeHLjEAHBfYF7qoM4=;
        b=YMd5VvqalawgeYNlhsEo6p79eBEMK8M00xo6Xhu11BmsyfV0Nmv+UQF3HIk7pbthHN
         jMu8P4z1E72a4e90fObExfnZtEi+/wrCjMRMFQ2QXcksZ3SD7klSygoBFp6JwjrYQtki
         HHDQL/znCROyKt+a4NGVENVJS0pMkZ/bu0CXMoYtrqK4m+8qcL9o7VC5RWzfD4pDd4YM
         8S/fYA5MQdzHwnGQvOcJamsM/d1mUbsT816GcpvlBnx7Gs4JegHhvc2DyyTYm36pkzMJ
         xgi6DTpU9LU+1X+XTFAdRE2q7nWe0zExuwFVU4zTratFz1oK5MZNmMXapLhSZfH69JnR
         yBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535126; x=1759139926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSZRXEJpJYIJ7RPipWafSLvYkrPeHLjEAHBfYF7qoM4=;
        b=a0tydG/feOWoC+i0tJbtd00Lwq8dTFXUTHQjxfyMd+8P+E6BZ2dCI4EqSZEqoFw/cb
         W/q9mmEYGXkZd1A6SD3g7RWwMqKkuttwcUbouBRgSLbmPxzfwkJDvp8tp22flrr1pDKQ
         Jpln/Z/W3MppXRBD74+t7LMyJPLWkwR2KAlX2yFdJ5msPHIy3PsRY5xhUZfCJG+MuOqH
         iAKkdcVkkmHLRgYv4LX79884vtMsFGYLqdfIktpsO0yMMKaFiGCESyJa0UURidg841xR
         h5Pz0kHGQPMvrtmh3fVaKGPE7vrdZvJYaP5RWhLhYAnVRxkK2o8sB9TC2P49gVhYvcnG
         h3BA==
X-Gm-Message-State: AOJu0YxrFAuiQr6xnN1Jqp5vvt/Uw8lQddlttm+xZMCIKdtBdxBLXk1E
	XQGcHZUfNcD3hDMXV0I4lL1TD5urro76yiW4SFoTNWhrgs7Savsa83cWgTLM5YrFpfQ=
X-Gm-Gg: ASbGncsRIKC5VOOi6Q6h8VSWEjZteAGrO+BqM3ZipvpvsoF+4+8j1u8MJBRoGOyF6+P
	G/BGt6k6pbuld9q1tl7G7WWhmFkksblw4HCjdimZtnLpanVub/vg0010C4hYhIW/WSkS0CkW3Mz
	5ch0+kBtAmnSDxql3xxKbPJWfNmgnsae4WOKZtFd5dkbJjLpRga1BKLKj5BcuoBImG+y2wuE9jU
	R/39BZR5raZj1HHpvXgihhjBN5sPAqw87lfc9R6hh5EvmtVMymyBCcWN2ph79MUSFLuhGvX+KM8
	njMayw8wdjxB+EwZtTk2R4F+8raDAzP8lQcgEctjhLx1GfBQ/Y1Vb3oJ4o7Xy8SVwyh9ks1/i5O
	WQ2MmPynqQtCWOQ9S0F7aYWM=
X-Google-Smtp-Source: AGHT+IFC7YOxNiZosfAq2ySehVzFtcxAUO/OP5OGtBiL3ZvhNpMo+4gv1HpkEL9ZjVRzo3egBOBdhA==
X-Received: by 2002:a05:6000:22c7:b0:3ee:1357:e18f with SMTP id ffacd0b85a97d-3ee7bad15e4mr10289789f8f.12.1758535125927;
        Mon, 22 Sep 2025 02:58:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:824c:ead0:65a5:c51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7460sm19423401f8f.31.2025.09.22.02.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:58:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: virtuser: check the return value of gpiod_set_value()
Date: Mon, 22 Sep 2025 11:58:41 +0200
Message-ID: <20250922095841.52330-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We converted gpiod_set_value() and its variants to return an integer to
indicate failures. Check the return value where it's ignored currently
so that user-space agents controlling the virtual user module can get
notified about errors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-virtuser.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index a10eab7d2617..37f2ce20f1ae 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -500,9 +500,7 @@ static int gpio_virtuser_value_set(void *data, u64 val)
 	if (val > 1)
 		return -EINVAL;
 
-	gpiod_set_value_cansleep(ld->ad.desc, (int)val);
-
-	return 0;
+	return gpiod_set_value_cansleep(ld->ad.desc, (int)val);
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(gpio_virtuser_value_fops,
@@ -543,7 +541,7 @@ static void gpio_virtuser_set_value_atomic(struct irq_work *work)
 	struct gpio_virtuser_irq_work_context *ctx =
 			to_gpio_virtuser_irq_work_context(work);
 
-	gpiod_set_value(ctx->desc, ctx->val);
+	ctx->ret = gpiod_set_value(ctx->desc, ctx->val);
 	complete(&ctx->work_completion);
 }
 
@@ -562,7 +560,7 @@ static int gpio_virtuser_value_atomic_set(void *data, u64 val)
 
 	gpio_virtuser_irq_work_queue_sync(&ctx);
 
-	return 0;
+	return ctx.ret;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(gpio_virtuser_value_atomic_fops,
-- 
2.48.1


