Return-Path: <linux-gpio+bounces-2955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56E8496AD
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B7D1C24B0A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A96517C6D;
	Mon,  5 Feb 2024 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HU9Nb2/u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613A61759F
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125682; cv=none; b=W/hFDxJ8YQ7h8heu8VMOIKxJ57sX4v60yYozUWt41qbruiVnHb9NrLQ1BNsL6Uk4fEI7M0jJ0jmTBZ+ajWNUvQiJeUAI7HejmXa42DIsm3ekiyke3ScuNz9WqOOXcuUXUkPcNuoSUqQyaT1tlJ2BIX4IvhQUC40CKsHCzDiDqqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125682; c=relaxed/simple;
	bh=yLFHAeDDaUuIFRqdSf+MG12ymiBBzwEskiNkeG6cKEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l3ANzdS6MWxuQeHffxISzlSTynbva+blVEBHpa8Hl7fr6v7lGOYeaax2TlQDnNp1uPaJyq89Y6Ehhc/xelTtnRNOB+B98DxgBv062WZDjNRpmEvpgx33s9XPHauUKpUR+fkX2tSzabKErQuhO/pqTIKD8+e+lp2r4wNriuNYNTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HU9Nb2/u; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-511531f03f6so397001e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125678; x=1707730478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsALcY7SVXjN//VI/pQguwi8KjWlDmDQg/LjiqJYZd0=;
        b=HU9Nb2/uyHGQwalTZDAF9Pk53iHHcGQmSFF3R+DwkIp3akQljNzZzkhAeZjoiAKnlw
         KWWSGf4BDMR7jSowS51HVJFA+K1SOTV6wxgSJhWpLfoM5gR0gZY+/C8upIopDm9MiTP3
         dBkNJT0UErgrQe/IGr1zEovflTcNW8W0OS58pde+ctdqgDIu+PLeDsAtC5Qf225th4Jv
         ME3zodHI6gEO5jE0rKRO9dETanET90ep7/GvGvL1FvIUWZqwFsGFPKcA2q0FdGSWwFer
         ZI93Gi55Iukg5IUqlw6e+cw4w9Znm9lkjdOO18P3svoDY2rpy40mTWFUQgzBvNAXAiyl
         /9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125678; x=1707730478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsALcY7SVXjN//VI/pQguwi8KjWlDmDQg/LjiqJYZd0=;
        b=VNtKPIewJyByJOOs/cMsB7cxpGIJ1I57ge2NSs3kxJWGNqrmlQDPE1WJPa02N3pM2L
         EzquIQsXRPHxzi+DAYPmeRTlFAZXQdP05Mmd5D0VZ8qaTkWsHsxYHndXMwU+2C0KsFjR
         Hycc0yavORG5sTypRXOzpglrA6Dq0eAoinsz1Ae0ntleAT91DDxULkUXGGaIL9kU88I7
         grMLeXe61unzJEOTZxUW54+uNYoVGSiLAnNG2cbPYADZEgC1JNajn1ubs8+HX6Orllf3
         WW+StvTgWkVsMWvrPfInJxqv/LqpVGc7O211MgBD7ExilJdY/f/KtiUMmjTVsU66mPBt
         E11Q==
X-Gm-Message-State: AOJu0YwHyg5kAE61Dnc0Or+n2HqBL22tvyT/13ZOV+uc92Eg9RG3voua
	VpUTcg702xnKbtl/vK4LnUFMpqXxpoagctViYRcv6ffJPLM1lFU3RFmMrGdF8gw=
X-Google-Smtp-Source: AGHT+IHJSPbTzeawrSm1nAoPiS4N3G71Ns86R6QPG9cspUSWjZVEyhsD2m1pxHBJmfCPkCAmQllpZg==
X-Received: by 2002:a19:e058:0:b0:511:553a:a963 with SMTP id g24-20020a19e058000000b00511553aa963mr234884lfj.46.1707125678325;
        Mon, 05 Feb 2024 01:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXTHkt/qB5FXU75JA1jOYrtC+7TPevSXOu647eXrUYKxxCr1lss+Tz7tEhMBCZMheoh1VgOSfnyR48SNftUuoObspzJ4U6YMtYp8Xlb3zVzsG9ceD2B1fDwCNkhBNs90EAUoEYYyj37VzclnsG4bqiMp4TqH5FqU0KZSPiDxE3q0cc0AS5qC0/ngPCp9347dK/67/lxRHOpQ4o0GlswOOLW6i4C6JtMonyL3Hul7DOkyOAcLuUWL1/bO7YdHGkXgvG7Fdqz+uLjzXxdNxmp2ZoaR6KHVt9+ui/iE8+txviUdrNRZZ9Y7omDdq1voIY8Cx1KZt5G4MgWOEGv0+1CyYJOnwf1rha82Q==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:37 -0800 (PST)
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
Subject: [PATCH v2 14/23] gpio: cdev: replace gpiochip_get_desc() with gpio_device_get_desc()
Date: Mon,  5 Feb 2024 10:34:09 +0100
Message-Id: <20240205093418.39755-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205093418.39755-1-brgl@bgdev.pl>
References: <20240205093418.39755-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpio_device_get_desc() is the safer alternative to gpiochip_get_desc().
As we don't really need to dereference the chip pointer to retrieve the
descriptors in character device code, let's use it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 3588aaf90e45..8e37e3befa08 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -332,7 +332,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	/* Request each GPIO */
 	for (i = 0; i < handlereq.lines; i++) {
 		u32 offset = handlereq.lineoffsets[i];
-		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
+		struct gpio_desc *desc = gpio_device_get_desc(gdev, offset);
 
 		if (IS_ERR(desc)) {
 			ret = PTR_ERR(desc);
@@ -1739,7 +1739,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	/* Request each GPIO */
 	for (i = 0; i < ulr.num_lines; i++) {
 		u32 offset = ulr.offsets[i];
-		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
+		struct gpio_desc *desc = gpio_device_get_desc(gdev, offset);
 
 		if (IS_ERR(desc)) {
 			ret = PTR_ERR(desc);
@@ -2123,7 +2123,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	lflags = eventreq.handleflags;
 	eflags = eventreq.eventflags;
 
-	desc = gpiochip_get_desc(gdev->chip, offset);
+	desc = gpio_device_get_desc(gdev, offset);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
@@ -2419,7 +2419,7 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
 		return -EFAULT;
 
 	/* this doubles as a range check on line_offset */
-	desc = gpiochip_get_desc(cdev->gdev->chip, lineinfo.line_offset);
+	desc = gpio_device_get_desc(cdev->gdev, lineinfo.line_offset);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
@@ -2456,7 +2456,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 	if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
 		return -EINVAL;
 
-	desc = gpiochip_get_desc(cdev->gdev->chip, lineinfo.offset);
+	desc = gpio_device_get_desc(cdev->gdev, lineinfo.offset);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
-- 
2.40.1


