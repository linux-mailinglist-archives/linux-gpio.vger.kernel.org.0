Return-Path: <linux-gpio+bounces-16060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C759A36D3F
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 11:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBBAC7A1C73
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 10:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2BA1A0BFE;
	Sat, 15 Feb 2025 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V8fxFeR9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C0C2ED
	for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739614132; cv=none; b=Ew+bPHgC3kiUFYJysqorcEoQ0Ro6cVUhVjVAYKnwkXsEmonOvAHVHgU5v+7UgnITA6WjsAPX3wvWzUy64vLPV5BFK5QMrtrQSgaOZzrR6/i8inWXK5PXytfo3Ub0Z9TrfqYj8zgIgVLEb6EApQLAAdU/YRzUiobSo/u6WI4DqvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739614132; c=relaxed/simple;
	bh=BRmwtD3g4MdASxOYlwvxiLLUj13AgRdVvwTDU+wMxCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVs87Ixp5ZeCLyi+cRVTMWXEG2CFe7U0uxtH8axcH+YLsiJCDuhis7YBZrCqRUVPlXIUcrNdLG7pbJjlb92vqUVrbTFL4vLbHQBCyg4viQ0saXd0OVt2Hslytbl5HBe+6nF4BgdSgrk137/0jRTAGZYz0xduChwVY7QJqopOb2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V8fxFeR9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f31f7732dso590918f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 02:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739614129; x=1740218929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONpnWz0CmHVgfVwLFdzwsY0uXxe9qG8gGGoClVT2HtQ=;
        b=V8fxFeR9FBNL2NfjASW4Qkwhckq8jR8lv6AldEXvHFqdhtYcESSN9msdipXv+3xrYy
         3lJWdApGBYdxsM+BqT0gmZw/cAJRza2vkeulktvrur1dZoktojaeWovw6ZNIEGFovvlv
         +VfZXEPZnvxPiVs2nCgHWxH5xCMh02IEjJUiGibQmlwdxey5/XqC/b7Yoth4d816ysVg
         gO8QPGxDFNKNtNm10Ai9sUmNMEZnMD7oeJsXZIzXogHfNIfHAtVpXN1Qe5xDU/bCGB5C
         Iw6yR7EdSsOZVTtFRzm1Gq516rtapBlYMUqoXuX5EP5yVY/4nUzkaH60wvCTVDYeq/ns
         fPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739614129; x=1740218929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONpnWz0CmHVgfVwLFdzwsY0uXxe9qG8gGGoClVT2HtQ=;
        b=ORvNJ+IViEsfCYb2I/NfD7KEO3dB6RySERjE6VGrj7E3qayKiirQOT2uMunKDc4Vof
         2HvcrUgD54bwcKaN7n338pMO7WX5ngUHTjcFAX0+BH+XgQJ5sb1X5W/w0BVqKl8WlCff
         7yeUyquPF4UfXQiAd7uwSoBGC5orVCS0kQwHNbS3aV2BsdKP84Be21gpBpevF6pC1zpj
         b/B1N+jkoNDyvpBjRaVDNszJ09oWryuof89m5/M2iZG7txE3ugFO01i06MKk3fxwZ64U
         Ly9/QQz8XvUkaNlorz+q10yMmx0LJ703kHDDMvBZ7f/YuFyEWt8+1Icq8/9dHu7INVS/
         nooQ==
X-Gm-Message-State: AOJu0YyGK3P90yinBV3HAPK94puodsjRouLptM9YQRFvfIFNpe9Gtrza
	yeeL04w6WHjV1wPiPP6rx9s9JZNCQUWu2sKLNX+xL9hMrnokMoQadg45UesZQ1U=
X-Gm-Gg: ASbGncu/0/Vze/o0Yr2TQy/zYpYrBDXd3UGoKODjGMygkaWvEkCL5iGF9JGJdkrM8v8
	LGcDIgpUq95JJnOTmDH+Y3VWUkDYcqZXqJYaUp60PLa4Fow826l2sDvdkQdRiTOjJhdmj6AUkto
	7pwNYrRmQYdbAARRdGGF2AlfSyB/0zFxRySuooebLHQAbglTEu9pms9cMoqWVuW4DzjQ5DUNwTs
	4udp1uBvQGb78Rfg11dLwFXOosevCa/OM4rIbhQhL976KHsLYOA/D8nrwPdUjG5mlbnHU7BEI92
	ev+VZ0ruVJJu
X-Google-Smtp-Source: AGHT+IGh6i3Dj+Choh+Ag1DxD3ZJRrsDaj224k4gzjS6anWZyky52EcQ9UvX1NzyoZ1iyfF1U5sC4g==
X-Received: by 2002:a05:6000:18a9:b0:38f:221c:2c8e with SMTP id ffacd0b85a97d-38f339d8907mr2947145f8f.6.1739614128977;
        Sat, 15 Feb 2025 02:08:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de0:6b3:d799:3d4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258cccdesm6862411f8f.26.2025.02.15.02.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 02:08:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: read descriptor flags once in gpiolib_dbg_show()
Date: Sat, 15 Feb 2025 11:08:47 +0100
Message-ID: <20250215100847.30136-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For consistency with most other code that can access requested
descriptors: read the flags once atomically and then test individual
bits from the helper variable. This avoids any potential discrepancies
should flags change during the debug print.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f4e14a7dbc87..7dd054f8141e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5003,6 +5003,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 	unsigned int gpio = gdev->base;
 	struct gpio_desc *desc;
 	struct gpio_chip *gc;
+	unsigned long flags;
 	int value;
 
 	guard(srcu)(&gdev->srcu);
@@ -5015,12 +5016,13 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 
 	for_each_gpio_desc(gc, desc) {
 		guard(srcu)(&desc->gdev->desc_srcu);
-		is_irq = test_bit(FLAG_USED_AS_IRQ, &desc->flags);
-		if (is_irq || test_bit(FLAG_REQUESTED, &desc->flags)) {
+		flags = READ_ONCE(desc->flags);
+		is_irq = test_bit(FLAG_USED_AS_IRQ, &flags);
+		if (is_irq || test_bit(FLAG_REQUESTED, &flags)) {
 			gpiod_get_direction(desc);
-			is_out = test_bit(FLAG_IS_OUT, &desc->flags);
+			is_out = test_bit(FLAG_IS_OUT, &flags);
 			value = gpio_chip_get_value(gc, desc);
-			active_low = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
+			active_low = test_bit(FLAG_ACTIVE_LOW, &flags);
 			seq_printf(s, " gpio-%-3u (%-20.20s|%-20.20s) %s %s %s%s\n",
 				   gpio, desc->name ?: "", gpiod_get_label(desc),
 				   is_out ? "out" : "in ",
-- 
2.45.2


