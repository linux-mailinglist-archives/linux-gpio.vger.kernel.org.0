Return-Path: <linux-gpio+bounces-2743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72744842550
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE0971F29861
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054586E2A1;
	Tue, 30 Jan 2024 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EMQivRYd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCFA6D1BB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618928; cv=none; b=m6xG/wgCFxrdk7IwVNsYDYD0rydSd8IDeR8qgLITBV4lv3aFlhWI4k9n4tFNCtfiQJqZHvuhiln471vzSHGuqr8ekadug7k3EGecxQTg3c8Q7LInlZalIUn9MrmY7y02kzI1OMrbFy9+Xk2nZ0/SDj+tsnfaY+UNUJVPtgeo6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618928; c=relaxed/simple;
	bh=w/6C0LXYSVlAEDD4c7gnkwzsfsPQEwhfaMmHG5iDNI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H1//Q1+1UHA6aPwAPKaNOSTL8+N9XBxKSb9ePArg77KKeR/Bmyz+cSUh93TI86Uz0VAhsNOieBFUjha2QrcssGIWaL863FrZ1njiW5mBxKi8C6zRln8MSh9Fu9tpPmx+isbfonrSzRenrAHIc4+iISFTqy7q4u5cUS8OhznJ3Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EMQivRYd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40eac352733so45554625e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618924; x=1707223724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJQAPHnGPqj4qq3a7VK5h6sk6j09P7jLPNzWXDjdei0=;
        b=EMQivRYdFIPwinLzRm//CK61LyWLJpzIte7H8LNBS+ANCwrIsVaZ3ENKTWruUqSgHn
         y4zqRNQsrSf5QE9OVYQygu6894D0j9FURmVntQIZPh+atmyNCez/jPpbxbzKTMIEzpK3
         R1RyWSKT2M5kgjCpIuxXp4rqkVFwrm+dmEGagEl9qcs85si2PwT8VZi+fksyOufn8FtX
         asdQhukreKwrjg/gm4pTiFEw2Fzeo2wcmwi4avriNx/X4LYyaPlOMOrbGjI+t8F8Vuya
         AtiiygK22Bd+qp5RrCOQRK2d1yW2smGpDGM4AeKtYg5slnNEivK6J/d2gN2ehiwUTCSm
         S4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618924; x=1707223724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJQAPHnGPqj4qq3a7VK5h6sk6j09P7jLPNzWXDjdei0=;
        b=a+SjZYsgDarj9/gnoO7wNq+bijBL3suVZzSboPjgRWeaLkqXfNb24/2H+PGoooiPY+
         o3a5npq5Tb9TDLY0taFl1isMuhtx5ejl/y7uNghmn9x5wQ4HDbGbU+gk8Pg4SXhr3iYT
         8ywqcYrqeDgBGpqruPoRuoGiER+VwUbZNIhBNYCg/nnmdM/wdbrqrveLVikPn069PYLq
         +apW7RHedJySQFP83VnsTW5wjmYG8YZB8yvWjJt7ojowzgWVcT1KdLKqnj7ItEYZU9If
         7Rzit1qhqb/YDTUXrWtSeXbJXYxuN6fUj2jI3juBkDsDjON252GPuOmSICku4Oki5obc
         kbxw==
X-Gm-Message-State: AOJu0YwhswnECrOGpQk4hy+B3QxOCmQYZnxTmwjb8QhuYzCQpAMJoqk9
	+Vn8zZP4WW9GxuTKSWh6sQljKG+EuETgD2AVKMxdmXATVbYNd5Y+ODqS1wAJrTs=
X-Google-Smtp-Source: AGHT+IHzB67OgTxI+fcR3wK5ROr7axGVhmXy3f6vdGpTdqUd1C43aAr+F+w+9hHdNQug5OAu33joOw==
X-Received: by 2002:a05:600c:5123:b0:40e:4806:f436 with SMTP id o35-20020a05600c512300b0040e4806f436mr7277977wms.3.1706618924403;
        Tue, 30 Jan 2024 04:48:44 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:44 -0800 (PST)
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
Subject: [PATCH 05/22] gpio: don't set label from irq helpers
Date: Tue, 30 Jan 2024 13:48:11 +0100
Message-Id: <20240130124828.14678-6-brgl@bgdev.pl>
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

We will soon serialize access to the descriptor label using SRCU. The
write-side of the protection will require calling synchronize_srcu()
which must not be called from atomic context. We have two irq helpers:
gpiochip_lock_as_irq() and gpiochip_unlock_as_irq() that set the label
if the GPIO is not requested but is being used as interrupt. They are
called with a spinlock held from the interrupt subsystem.

They must not do it if we are to use SRCU so instead let's move the
special corner case to a dedicated getter.

Let's use the flags of the descriptor to figure out whether we should
use the special "interrupt" label.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d0a2f014dacd..4e6b26b3febb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -107,7 +107,14 @@ static bool gpiolib_initialized;
 
 const char *gpiod_get_label(struct gpio_desc *desc)
 {
-	return desc->label;
+	unsigned long flags;
+
+	flags = READ_ONCE(desc->flags);
+	if (test_bit(FLAG_USED_AS_IRQ, &flags) &&
+	    !test_bit(FLAG_REQUESTED, &flags))
+		return "interrupt";
+
+	return test_bit(FLAG_REQUESTED, &flags) ? desc->label : NULL;
 }
 
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
@@ -3590,14 +3597,6 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
 	set_bit(FLAG_USED_AS_IRQ, &desc->flags);
 	set_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
 
-	/*
-	 * If the consumer has not set up a label (such as when the
-	 * IRQ is referenced from .to_irq()) we set up a label here
-	 * so it is clear this is used as an interrupt.
-	 */
-	if (!desc->label)
-		desc_set_label(desc, "interrupt");
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiochip_lock_as_irq);
@@ -3620,10 +3619,6 @@ void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset)
 
 	clear_bit(FLAG_USED_AS_IRQ, &desc->flags);
 	clear_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
-
-	/* If we only had this marking, erase it */
-	if (desc->label && !strcmp(desc->label, "interrupt"))
-		desc_set_label(desc, NULL);
 }
 EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
 
-- 
2.40.1


