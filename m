Return-Path: <linux-gpio+bounces-2755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212184256B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94EDF1C276F9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2A71272C9;
	Tue, 30 Jan 2024 12:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nqt+jqLH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A482D76
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618938; cv=none; b=c6erwFv14NRnqJ3UEuczC1xvucm4D8XYPNUSkELAUlVW8hrwbEHS5Igblzn12vAseDduYOf3RHU9XwN8VrYS2YiC232GmTc9IGTPfFNdzpm+TdPArdCQZNOWyaP2Z4tmO4lNnvNXY1mok6JqqmbZVaMxsPzCiY09jM7WCsHVWAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618938; c=relaxed/simple;
	bh=QVo/CTmJ2SdqeWE+fgljqOPnJOFWojdFPsd6J4Dsi44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ERNdcoZ4Gt33tiNCWglaNWirWxERDyWnRviiTAKv2tL2bb1zsYCkwbM+j6Da63XnUW0ZBveuwqT61h5d+OWlEUIGvarB1sWtStGANfV/pJusZvpa9bfx0tBkJlRgaMzD1AdcYL5Ul3hocUv1zo/U90pL4V2tI6V0zJPV8QOSleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nqt+jqLH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33ae7ae1c32so1714577f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618934; x=1707223734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZQR/XN4GRu3/wJTfdJoRkgCMby6F/GXTuYUUB5qSXw=;
        b=nqt+jqLHUAAB+j8lJfU7zPBE0ucanWA3roumQj5S6vtw7ka//fO+G4+/YIkXydJgYZ
         gL96xoIZEucz6+UbEN9AmZB8ERzGDwPMk2i2a9V5oCcSIjPcQfyurm19TqoS6p/QeteZ
         aO7vzl3BfrztG5S1CVqwSOnCNYLSthu1ojd4OdKEtqTIieOi0/1ZZpy3/3ikzJJ4uMfi
         qm571vu1Ndbmn1QFSx4L/pYDl2+4rVmlQYvSPxvKW9/mM1X36FzQCzZtqXN1zYXUJlkY
         GxDhYwXUnTCc0slv8puIQSvQNvnu2veTnT/oWmj18fLnCagvnilv5yDXL52SmTqX7z+B
         f/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618934; x=1707223734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZQR/XN4GRu3/wJTfdJoRkgCMby6F/GXTuYUUB5qSXw=;
        b=NRJxoj8dxA2PHMKmeIlskQvCWtnj/HYlbDq1yHp1+BWNKuTz823sqhGqWfHtBAJL5H
         dYbHy9L73O9ILodeYVjnJq5p4S18aukhA16YpVq+0bYlbB6/uDwCh89+m11uRKYJxAnu
         h1VQbYYih9aHvejS6OMM72Nmied9REq0gZthwN1rzMx1p0XbaabXMpJ8aX8N2/A1hK5r
         bRYPDn0J41T+cvspnr6WGsPHsfcWFxof+TUGfTg6uO2Hp6m6JploxVJGH6Uxo9dzquvP
         XrHTgbvDXz7pUmM4v/K1Gt76hcnQT3wzg6lMknzmGY4Sp4r75XTxK7DNhj8u2xlQYONW
         avVA==
X-Gm-Message-State: AOJu0YwmhBwTDiaZ9bsLyKxAsA9LjZ1RjxH10LLwDricHsAKTzPV/17g
	qSYjRAvdKmBzM9FQrIViWrUXUtT5u5eUIgAad+TMavksHGE/wknljDrtrAjJvLM=
X-Google-Smtp-Source: AGHT+IG2xcdQMib4X46YL/5sPcLxktH8bxlVog7PKDJ/roDOSRITvPlfAtw0yUucsdAdx3S13yTQ+A==
X-Received: by 2002:a05:6000:1565:b0:33a:f00c:cb5 with SMTP id 5-20020a056000156500b0033af00c0cb5mr4542291wrz.6.1706618934215;
        Tue, 30 Jan 2024 04:48:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:53 -0800 (PST)
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
Subject: [PATCH 16/22] gpio: reduce the functionality of validate_desc()
Date: Tue, 30 Jan 2024 13:48:22 +0100
Message-Id: <20240130124828.14678-17-brgl@bgdev.pl>
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

Checking desc->gdev->chip for NULL without holding it in place with some
serializing mechanism is pointless. Remove this check. Also don't check
desc->gdev for NULL as it can never happen.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ddf7d93f8b76..0cb44578bc72 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2248,19 +2248,12 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 {
 	if (!desc)
 		return 0;
+
 	if (IS_ERR(desc)) {
 		pr_warn("%s: invalid GPIO (errorpointer)\n", func);
 		return PTR_ERR(desc);
 	}
-	if (!desc->gdev) {
-		pr_warn("%s: invalid GPIO (no device)\n", func);
-		return -EINVAL;
-	}
-	if (!desc->gdev->chip) {
-		dev_warn(&desc->gdev->dev,
-			 "%s: backing chip is gone\n", func);
-		return 0;
-	}
+
 	return 1;
 }
 
@@ -2336,12 +2329,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 
 void gpiod_free(struct gpio_desc *desc)
 {
-	/*
-	 * We must not use VALIDATE_DESC_VOID() as the underlying gdev->chip
-	 * may already be NULL but we still want to put the references.
-	 */
-	if (!desc)
-		return;
+	VALIDATE_DESC_VOID(desc);
 
 	if (!gpiod_free_commit(desc))
 		WARN_ON(1);
-- 
2.40.1


