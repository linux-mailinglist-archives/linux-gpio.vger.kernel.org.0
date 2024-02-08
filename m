Return-Path: <linux-gpio+bounces-3082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D984DD99
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20F511F29910
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D945763F1;
	Thu,  8 Feb 2024 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dHfD2vBf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093BC762CB
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386385; cv=none; b=CrzxdZXPuPrJkqk5dif8E4K6Z4j8mjWLPbP6eOIlxPQJetnE12jbmWGfUlua4/8unb9IGs8QHGcUseVDikaOkocM+DtVYWQjKfXJUWAdlfPQMI20VK71jifj3W8vdtI6N4E2y8z32Tq/yFH00GQYBxdjhwRTOCOM4HB5Qw/o1Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386385; c=relaxed/simple;
	bh=4pcqVR2UKNjNb7TNBpVrhzZAcEAKto4VhymTx/E7Yb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDyPgF1Fq19JZ9j1HCoZpaQCGREMsv3hLe8LURPdEvkR8oJ5msljtxIGCxnQa7oZC5P/EBoDApEQXDLWdGX2jUDf6yjdChDGi4t577eveZDfr9VL18urZum8qq8AB/8UJRqTHYHNqwKO91aaFIPSUbnxaiq0OwOGleSMag1V6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dHfD2vBf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33b586e38f7so257338f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386382; x=1707991182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXQKcxTvr8ZEuMd3OtlDIObv0psz6oUY1P/Gu9NpG0o=;
        b=dHfD2vBfPwL8OXB08vMdVm9oMlWtHJafy8ZR0UMcyy9FJMavnjAtEsJAVpsX6/n6eN
         IwWbKqxsFsvDQUc0Ny8/bdY/7Qym+onbgyZ+LgEv2E8NBujyBowBawtiQR3KxTxDiH7u
         BnNoq+XV4xY61jVW0KDrQ3xHwi3XaeKInooaLzUiKY02QB6p7twIkFOnKmO/+IJlMn5D
         uD7LElW1anyBnV+yXQYV7Sz11OCAPPGjeeSWJijJjs8pBzDatD2mfbRHrbM1exZ70lCU
         e3xbvXJ/aMtFpZu/dO6zlaE6XkmoZB38VpGew8q0No3qYuqvSaWLBVQl94NSMuGZWFJ7
         /kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386382; x=1707991182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXQKcxTvr8ZEuMd3OtlDIObv0psz6oUY1P/Gu9NpG0o=;
        b=u9+CGKv2xs7mHvb3Eawwh5bY7hX8yQr6LNO6g3uhzCkz1KVBmzQKHAVFmuTjCHAgXj
         nDLHu0lsitwN/YgsIsGTmnwagGMsvY0I3TgFWsQCl+E/lB/aW34IEHbtjCLCdojhJOn0
         ReJNM+ph/Ljy30Gbn9hXM8rKbvhKl7c7uxPTwPRqLBCVkouh4gvNKQ0EqYvSnhwuiGpd
         VMt2SSyTB73jQnDdb5gAGEURScHRDH6tnAqiwitOTucR0OsiSJeraEhmYFiBMBA25u1P
         7dkEPNuiQbbuNNCVNqbN5TYaHlwYE8/F2bwR8aixtl42ZUQEsBfYfvWxT9czJPnA0wRJ
         Qlpw==
X-Gm-Message-State: AOJu0YxYc85Oad5WT6Vh197WpaUK7paJCB66Muc211m6qYSjP41oXQHa
	rqkCd3r3DJT+MkC2Eburxs9gqxIfY3XoFEIYhZGl6ak5Cpb8q3Tv2ogP6vOCHug=
X-Google-Smtp-Source: AGHT+IGWTHEe/i1Wmkb7L2L6RlK0ZbynRzx7eNQzssOSfrF6qS+pTlPhms6IddPzGCRIN3coN8yWNw==
X-Received: by 2002:adf:e501:0:b0:33a:e828:c3e6 with SMTP id j1-20020adfe501000000b0033ae828c3e6mr5766414wrm.30.1707386382236;
        Thu, 08 Feb 2024 01:59:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtUJ52Q8n40X2maKICeeuBN9bIYW5VfpWSOtWES22IXTX0RRT3Cr6oCiJM5XIWez0KAI/+Q2HqOntqRIGh/HIfWtLCOkIPmaE6f9MwbuifW+ceYfeF1IGKnI15eYwMt3n5CjN4zManxJXh8htl98wZrOfd+o+HVe2yrqx3z3aCZj977gEPuSeeo8IVOsa+OC7SkIdX+1MGfubv4JHFlug5E/6jxs3kJPdFjrk1NieAtttCChV2mYEwGzAPIUIOAPRz6ZEUcQIv/QuY8v/ty+G7irUWbqU8eotAqtM3GbVAPUs4tdWlopEeFA+Xua7m7BtZmwWeGxvmDkJ9la73vsArcTz5jZqlNw==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:41 -0800 (PST)
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
Subject: [PATCH v3 16/24] gpio: sysfs: don't access gdev->chip if it's not needed
Date: Thu,  8 Feb 2024 10:59:12 +0100
Message-Id: <20240208095920.8035-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208095920.8035-1-brgl@bgdev.pl>
References: <20240208095920.8035-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't dereference gdev->chip if the same information can be obtained
from struct gpio_device.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index b46d50ac2452..2e3edf41e853 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -403,7 +403,7 @@ static ssize_t base_show(struct device *dev,
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%d\n", gdev->chip->base);
+	return sysfs_emit(buf, "%d\n", gdev->base);
 }
 static DEVICE_ATTR_RO(base);
 
@@ -412,7 +412,7 @@ static ssize_t label_show(struct device *dev,
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%s\n", gdev->chip->label ?: "");
+	return sysfs_emit(buf, "%s\n", gdev->label);
 }
 static DEVICE_ATTR_RO(label);
 
@@ -421,7 +421,7 @@ static ssize_t ngpio_show(struct device *dev,
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%u\n", gdev->chip->ngpio);
+	return sysfs_emit(buf, "%u\n", gdev->ngpio);
 }
 static DEVICE_ATTR_RO(ngpio);
 
-- 
2.40.1


