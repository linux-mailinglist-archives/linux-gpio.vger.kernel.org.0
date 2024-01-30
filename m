Return-Path: <linux-gpio+bounces-2754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE97842569
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B011C27629
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D0C85C7F;
	Tue, 30 Jan 2024 12:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JoQbW0b2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFE986131
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618938; cv=none; b=CDleIKKWZE8OWwvAynB+IzZa1uT1+Fr5OS7BDab28MLyM4J8fDUsejRFE6BoxicVB3OE3Za4JztrrtsBbOizsRiahDHA5JGpzQDVE14qy7tKB1iwcGc8R2c6JN+cEs3dR94ZcVKjEWJSuqSfW2lPPQnH8XQkQsDIl6ccrAIR8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618938; c=relaxed/simple;
	bh=LaQerTXZDNXuVhlcsCEXz3ET8J3KhiMTTHYjbnYAp3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QFvkQSrlgZYirj0MU1zgOd84mPYXMWxGb2Y66UwNQK8b5QLYebeZH0egfx+ACgpmz0/ZSTlZfBIg5ca3OeZbD68jr+85CxwXpqwVLzw5U2fP1+lNvufTyUzSaYN1ID/yt49saRTjrYH69r+bCqtTGxjZNbnvLmK8gXsw6Ot6tWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JoQbW0b2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33ae6f4fd78so1791551f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618935; x=1707223735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPtbqDu1XAZ6kVRzSRO7vRzzw+70U/8mDyJpTb8wshI=;
        b=JoQbW0b2TKzt8SXA/O50APKpt5ZpEOOuxKme7MbOx17Ql1oGYiNwvVlg9RBxiYLwuI
         awN4qPnbDGntVwD5QRw04J3VBuTV3wRS0DkbjXbixvltCx8+6NiN297TgYl0e2M7NVBe
         SeWyd+PjswiJuuhaRPxhyykCld4lHQTFcLf8CYF1C0TMm40Cx6/MRhBQs/KnxNLw5x4U
         Q0RJ1sG8RLndA/0/UqccYGtGZYt9axl09ekVXUz9NCgGRLNZkE6kpDGCfx6Nkcv6QZ4q
         yrkIibylVoI8jA7/wUQmOVLR55OPmeEGTOYJPMw7yQJ3AFEqHdqd60rdAXtr8aEiANxP
         XIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618935; x=1707223735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPtbqDu1XAZ6kVRzSRO7vRzzw+70U/8mDyJpTb8wshI=;
        b=fqn0/jvRKgu0lAX87JLEw/IYg21SA2TkAg2d3Mo0DFlHy0wWVxkocnbByvDpBW9Yx9
         2gfJNCWQKQ7qq33Hp79te1iZcxqDx2525cEedkHoWIZtB3RAShZd5j3xKQHQ88JFDlj/
         kkdRgiYk2cx85asLRt7mv+mrIE3ie+lS5JXP9sYdkqGZpcuEM+hBinPlq3Z1chIHnfBj
         DxjDNR4tWAElBCyabiuPCQ2LyskgkBkJhk9g75n8fREN+eEX7q8KubYmtoVPZhGMq7qa
         zMx/uNvrhUMJ3zAQBQC7mW12KRLZov8AwLWt4z2Ssd2i44OmZ3gOxDpcT7bLqzvZ65BT
         9/Rw==
X-Gm-Message-State: AOJu0Yx9JWYTWM7Jvu98opZBmIqAdvd9lAwQUxdXfB/txCo3/Amqomuo
	5JJiZH5bLPaUKnX3AB2I7XCsbRzUZdkvhX0CRDav0kVLV8x8nmd2B1ZTcl7k0ds=
X-Google-Smtp-Source: AGHT+IFfJPiibgd7hq0EyJPAYwKijq6h0nw/TedmlKqV4FcU6msnD4wLW7UDAvzNT1n7uEdGYrh1pg==
X-Received: by 2002:adf:f2c5:0:b0:33a:e6ca:e224 with SMTP id d5-20020adff2c5000000b0033ae6cae224mr4898295wrp.26.1706618935041;
        Tue, 30 Jan 2024 04:48:55 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:54 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 17/22] gpio: remove unnecessary checks from gpiod_to_chip()
Date: Tue, 30 Jan 2024 13:48:23 +0100
Message-Id: <20240130124828.14678-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130124828.14678-1-brgl@bgdev.pl>
References: <20240130124828.14678-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't need to check the gdev pointer in struct gpio_desc - it's
always assigned and never cleared. It's also pointless to check
gdev->chip before we actually serialize access to it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0cb44578bc72..e6b9f1c82a7d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -214,7 +214,7 @@ EXPORT_SYMBOL_GPL(desc_to_gpio);
  */
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
-	if (!desc || !desc->gdev)
+	if (!desc)
 		return NULL;
 	return desc->gdev->chip;
 }
@@ -3496,7 +3496,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	 * requires this function to not return zero on an invalid descriptor
 	 * but rather a negative error number.
 	 */
-	if (!desc || IS_ERR(desc) || !desc->gdev || !desc->gdev->chip)
+	if (!desc || IS_ERR(desc))
 		return -EINVAL;
 
 	gc = desc->gdev->chip;
-- 
2.40.1


