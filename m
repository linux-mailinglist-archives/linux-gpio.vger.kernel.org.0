Return-Path: <linux-gpio+bounces-23404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA79B08DE2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 15:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D40B21A61AFF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 13:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A552D77F3;
	Thu, 17 Jul 2025 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kHccs5KP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3C2D6419
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752757889; cv=none; b=mhU013SkS2wivEDf050SXlN7AiYdAPYkGBwuX8nd3W+2Khf1e1bC7+2YpscOnDzx/XyU2fCcIQmizBGT6OO5HbACZyWdj0xmpYNIX9qIu0D+xZj8u5g8Fgiz0VPXLjSg5ZZyRVaqjRT0bDl/TgSGXc8nLrfya6HfZlTBdH7C3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752757889; c=relaxed/simple;
	bh=labfS1Gx2nRwHraou1bq+cAgZKWRTyU0IEkUZGJs+zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2FBXXUIT+CC+BUEHbtSU/CUgcMvBt0YtwSiyMDeW/IYYvzbxZsJtbu2avTStVkZWJeRBdG0gyh3SKokZnWpdEWE5I6rgQxFDaeTgtpB9O1QTRUWJVL8G8zf1pD67CS5RG549pqCOHM1bwqSXQfNC3x3wRXWW1c4lsMKfEStDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kHccs5KP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45619d70c72so17218735e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752757887; x=1753362687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83jCr416azYCn7ZWfoPtR/8LxsJq3XFvpEtFQFTIDfk=;
        b=kHccs5KPJ+vzt3U+IergzpTqZ7du+wiT7QAyjjlz6XvIbKa8kGDG8G393LqfKrpmcn
         MYP3rK3ZPK7/AIbynMncosU4aUmQPysiEGGKls+FxRQu1Cj3Tb3wmWPP5OURNjQfWmf+
         UpqrzMA1972YXLizVi8gtT2l+lokBFL4FNIVceQvrFcjehQ4RdxTMvHD5iciGtwvJ3su
         WCSbpw/lmDInk5+R7cCsljo+zsnf6ku699BD2l6SOehaYZdQazdAVAmUg9bfuUSbc9iH
         9dxEQi1eGyLdy0F4C5t348t6RhtNr8p16EojvcGagu/zOIOe5NJUwQ5k1+uvJYEQg0x6
         t3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757887; x=1753362687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83jCr416azYCn7ZWfoPtR/8LxsJq3XFvpEtFQFTIDfk=;
        b=hs+EPB0bJxPg8HHvGXYwNrn3TPZYisxbCqvhEG5h6nDVRg3yRJFucua24q/L10BRDU
         CFuXSnKfopNojxN7wfHCdVrzSH3e67pYNnLwyZcB/QNFZkqu+grVD2yU4a6/WDKm4prs
         6yc7nI7auIJGqwI5MpDukkPgeJXAIF7t11Tf7r3lHH4bq1j4UJRbcrxBNAKSyWQ6E8L5
         whJCTfipTX2VZJn/MUBXhnDIaaXywNP+yrQ/XTou9PJ3h8VOD0xz2i4SMg64qYnLpveT
         Q2vKd2ubGIOtoPmMKP2NBx/owz+BI31sZtlZJd16VqZ3xI2JUkO5sLRdNo/WyOS6v+nc
         CK4Q==
X-Gm-Message-State: AOJu0Yy7sJJ1XAl4yCNDuLjj2LM7IkOrAiG7esjDXTQLadlWS2N6gk63
	lZq1nzfsBkfr5NHhyRLF4SyAd52EsphNXvVMv0C0//z31xwUCdtsfuvN6iY11/2iI50=
X-Gm-Gg: ASbGncuMS3TWS9NK/pSPZvVapcyPCSYHXhe5UjWf6CYCY0mvRdVm0fI/X37y4tQBp3d
	mJE8PseOlZfv+jGt/dj2wwgGvlbatSq0fFNWdraML4cVLxu5YgI8wDGhOHFtJ4Y9Tx/9JOIh7Xk
	lAxy/O9CfMu+9bxV6+L+83aJOBnlcqjMRHD6Wfz58TlWRkOb8aHDKUbzbyMUiOefSuHEE+7FD0w
	jGly8fwitBHDEiexO77shBrXhDXlHd0xPJoqJ18a4MFWAElIW5gPS8rFVC09+ChnQQ63VgjzH/C
	RTocm69bQJVTetqWtq6HHxJDWr9TCs0eHLrJ7bTO3GBliTo7gbIEXTAxVAN9pTQ+qGPcak441ye
	tnK3ChMNWK44LCSfQ4VDMWdo=
X-Google-Smtp-Source: AGHT+IF4aBEVNkpFE5pxCAK/kMqSx3h6NcRIudrOPp6QMPOhm1KlysOl7H2KIJzmTsnV6O11EnwLsw==
X-Received: by 2002:a5d:64cf:0:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3b61395ca72mr2800801f8f.0.1752757886272;
        Thu, 17 Jul 2025 06:11:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9e61:4694:c621:5693])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc201asm20560565f8f.22.2025.07.17.06.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:11:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: xilinx: convert set_multiple() to the new API as well
Date: Thu, 17 Jul 2025 15:11:15 +0200
Message-ID: <20250717131116.53878-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The patch converting the driver to using new GPIO line value setters
only converted the set() callback and missed set_multiple(). Fix it now.

Fixes: 1919ea19a4ff ("gpio: xilinx: use new GPIO line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xilinx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index aaaa74117980..36d91cacc2d9 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -175,8 +175,8 @@ static int xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
  * This function writes the specified values into the specified signals of the
  * GPIO devices.
  */
-static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-			       unsigned long *bits)
+static int xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+			      unsigned long *bits)
 {
 	DECLARE_BITMAP(hw_mask, 64);
 	DECLARE_BITMAP(hw_bits, 64);
@@ -196,6 +196,8 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	bitmap_copy(chip->state, state, 64);
 
 	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
 }
 
 /**
@@ -605,7 +607,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.set_rv = xgpio_set;
 	chip->gc.request = xgpio_request;
 	chip->gc.free = xgpio_free;
-	chip->gc.set_multiple = xgpio_set_multiple;
+	chip->gc.set_multiple_rv = xgpio_set_multiple;
 
 	chip->gc.label = dev_name(dev);
 
-- 
2.48.1


