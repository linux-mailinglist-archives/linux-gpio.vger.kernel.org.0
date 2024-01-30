Return-Path: <linux-gpio+bounces-2749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE784255C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8E361C267E0
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81576D1BA;
	Tue, 30 Jan 2024 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pJ+juR9B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D276047
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618933; cv=none; b=EE2YXGlIhxcFbO8i31FOIJYkxtWLK0Jo8cE6735kb1deMErIMxw7rbIKPYFWRLZi8hkJlXvYH2r9ShFu0WteSmk0DwbkQDk2SPuyoExyp/Jrw7bXgqfXP60iUUyqK91tmE1XSSKxPa9II5mz7KpNTaeDupEp8hrg2j2REWp2cAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618933; c=relaxed/simple;
	bh=a77Z1wLtdi6HLoxovZ74UkubCjuphhC0bzLiTPATleI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h5/pxA6j2CaiUbL40U0brjdPKx+HIWsjAIoF4uAUp5grJXqWSpIY71AWIc/QmXIcQ77rz8Iuw+MoLEFue0CTbHWISdsiuIHfEirchREHX7f6AcvOh8ez8pd54zLyy1qEeeyWY7mO7XCBZd6nMoKh6pWEwQEksBm4fzQTYb6O5VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pJ+juR9B; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3394ca0c874so3295647f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618929; x=1707223729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9G7eHGhPK2p3/OACj21UoYDs98sUi0sEn+7lptLodw=;
        b=pJ+juR9Ba1ldEWviwCpWWQjN315R7Ig+u+yKJOqHDDpxblx+nid8APhIhyvKe2wIwl
         ahcjTx2F9zdYwwB13N8rPUq4mOuTQMR6fpZe6t6jiG96cZ5h5ibx22o6C3WO2ZXEoDFs
         hKSCkIr8sgeG/Gs22vfLLT6i9yoLlXHs/W1WGTeC4EUDaxrl/ovLNTAhJ5ilq8E7C/u3
         4fPlybeE3ww7g/g58JmCvZRj9k07T8ygI55bSobazreoMfCc/FhWHJDLTZHjuXLrhvz9
         owdwIXG6fFTdH7zSM087iBLflkLjwHBaqEQ3oujO9+JNrIjRuE+fQV7mMcOooowyL30m
         J1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618929; x=1707223729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9G7eHGhPK2p3/OACj21UoYDs98sUi0sEn+7lptLodw=;
        b=bNagfYA9oBJ6aN2+U1svfmsedIfN8sqni1B92KgbXxH5ys9E7tPZ+fCCGVAm7hkbxL
         O5QJ+p8rSQaujskJE+IcTMi6BA6fBrnxgvVbTFNxOsbxal+6cm81DrSF+S2eRwT0vjBP
         e7L3mL91XhSQV3HChoLw07ZmbDruS7MWzmG4FcWR5x0A8YyvSmpeNZlq3JX2a9zmOPxB
         OeLlMxL6T6ze/r2EFbE+qI+4vlyKhhF9b1CSEnULaVNvAWHMo5p9J4qqb23E4zsgaMQE
         36FMDnnvkXCLmhITZsX6+2purjE5DZY/1Chh5kiTtUrFhuiqGw2A7CPuywVcvHuTMfge
         meHA==
X-Gm-Message-State: AOJu0YwOaS/RDj3L1/eLx/NQgaemciI5nyzr9BYHDItkErxbayZol0X+
	k3ZUTOi68CIe98cKgEIj5KPDHuAjIjyqVgpZwa6o5/xwA9H9UrCLcSk3XoCXh0o=
X-Google-Smtp-Source: AGHT+IGYhVhdXvI0t2Yl9zELAaar3O0DzUsAkjzfptkbA/XB2Y8mn9JGci7qzVzwwXbLZwLax8+wLQ==
X-Received: by 2002:a05:6000:4208:b0:33a:e7b4:7a75 with SMTP id en8-20020a056000420800b0033ae7b47a75mr7422555wrb.34.1706618929674;
        Tue, 30 Jan 2024 04:48:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:49 -0800 (PST)
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
Subject: [PATCH 11/22] gpio: remove unneeded code from gpio_device_get_desc()
Date: Tue, 30 Jan 2024 13:48:17 +0100
Message-Id: <20240130124828.14678-12-brgl@bgdev.pl>
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

The GPIO chip pointer is unused. Let's remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f15b854bbcb2..ddf7d93f8b76 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -184,16 +184,6 @@ EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 struct gpio_desc *
 gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
 {
-	struct gpio_chip *gc;
-
-	/*
-	 * FIXME: This will be locked once we protect gdev->chip everywhere
-	 * with SRCU.
-	 */
-	gc = gdev->chip;
-	if (!gc)
-		return ERR_PTR(-ENODEV);
-
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
-- 
2.40.1


