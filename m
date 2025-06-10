Return-Path: <linux-gpio+bounces-21175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A6AD365B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E1B37AAF53
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2D9295523;
	Tue, 10 Jun 2025 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zbHGwptJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39125294A19
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558808; cv=none; b=iIqJEXzg5HBVVB6//13j/DdE3OXN/gNlNJW6vYiWaUwVyMpH7LFpSHqEbHQyguhW1Ub9Qjy2rFsJQ1algWjxHHUnzlH7nwWaB5VL5UtoLWb5+kxl7iYvuIn/h54GkdIyWNvb/yGUo0ZBcTMbT+Fmh6SuVB5BCuLp+phXEdzErEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558808; c=relaxed/simple;
	bh=nygEAepek5StAfde9/dswNCLDOlRBZWC0ZkAHODgTos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyzqfJhgyFBPfMXU58MBLqTYuRjJL3XFW3CGsTcIvebY7/t5CCF1DyaZsCMAkV3kqZb0kI3B8dBXBEIGMQbPazmt3F2A7EIuwKj043BBuHyumOJ216Jj+TOQGBT0YQMB17N9wXezN+F6TiI2fCSbFq0J99LaDwd5/kNphaz59xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zbHGwptJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4f71831abso5075175f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558804; x=1750163604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNc8thwf36Hc/crv6zEElCG/dHhZG4znGHrJi9L7hvE=;
        b=zbHGwptJV3d/dnbHPHxlJmOEg2koIiWy2/X/7/vnEVizpFK9ok2lZCN9yNBuFpWXt7
         8BV4mS7yHiTu6bhBddWwzFqkeUhR32G1cy6sWebvU6/9luycuGLpk1fBtz0i6ECKeBGq
         xKoPhaW9ROy0KooszAd4GRp8DDpFUSocgWOBW+9e4e/ewbtX5P3F1/uoOede5Gd6zq7Y
         JXGk0yoZiioZFWx5DtKKSwCPMh0R7sbZBVLmrHainFsP525aF6Y7GXS3UGEqzKq7YDy+
         EKT4qhVt5JDi+wyahY9XLO/+/xxF42lTDLZAShMHh130fCOKlRKWRR0al1ZC+7z5/UHa
         5A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558804; x=1750163604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNc8thwf36Hc/crv6zEElCG/dHhZG4znGHrJi9L7hvE=;
        b=DfxWtvljNRAFDPS6m+Hq8sqkh6zd4auEIBh2TecOv8xcDjLhsrG6d6d4N0HSeHQ+tS
         78eYODc8Hib8xREP9KbGBhdZFfqVQtdPoT0ACdAtpv0D+YnRuRmzE4Hy9eBG3X+5AF2A
         za5YZLH+7QN55Kc2dcKpWLXzw50Y//2CTlOhAyfvOMaSIldDFLG4X3cw9gmkO0j7Jb+q
         E6Nlv79XTlKZYrJZM9Aq8DNbX56FVFlDGQXWxObLIqpLKgMnsAJ/OK4weUhV2ovelF8r
         yRbXMzHXuY1N1G73yondQ3XEN2RMkirobR5zF1cpjQm6chf7YasB+cPRjHoBJHsZhhXS
         GbCQ==
X-Gm-Message-State: AOJu0YzCJmHgpzJbJbY9N8K5kEKLiXiyayo66Pd05JjiP1iS7yIs8OY0
	Tv9qoTo5Vi5Tn+H+egQLe6BXMILl2p9ZdEz+hL3uLvtmWoQXDmOX2jWvhLisq/aSWMyxWPiSK1L
	mPplL
X-Gm-Gg: ASbGncuO0yDxk8wbO5vPu5u+iCTdW5ga9ihDiBnEQftA7G54w+R68d6RqiSfu78o01N
	J4mK2wA48mPul47e0y60XN6ZjiMy9FZJ7+dxAo4RnKZ+kUHwG15BZ9Q6+JmJqQjR94rLArq9AkD
	X0BntW8jN7LPju2CYW8ZP5dynaROGsfhOnCX1jPTNCBGcZD0zXASfpkbL5XlsdaQlBizQ2rJeNF
	aqKCGQ2YO7oxssdCfWMzqnmRqzYDiXj0z1EmgQjfLxQRHVkpkUW/utIhvJRKKvQAAkaVhq0LF68
	H1UDtMQWVLM8v3kxJCQ4pvozlZuSQXWmt5AaSbWFjilKpUXI5fEaUA==
X-Google-Smtp-Source: AGHT+IGV3Vn6yhZaRUVNvlMafFgkrcv+bSXbOKrnS2PqVCasr+PxmHXeoHC+wE2lIVXIMNJyFwWweg==
X-Received: by 2002:a05:6000:2504:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a5318822demr15550216f8f.5.1749558803465;
        Tue, 10 Jun 2025 05:33:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:11 +0200
Subject: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4849;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/UH4x/fbI0BIFJX3mIEzmmNo36J/N7bN+pZNnL+oU7M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYOFAEvwIEsxV1MXfRknm+eXRkQlcJgIZH4/
 +1R9Xhb0bKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 cmxBD/4hi6WLQtzhS7/j0anJqFfcC06CXtfOJaLR+lYY6czknEMDeGFb+xLjlYIn4qRsoBWf85I
 drjoL1zNnkc7/SSy+dFT35KteOcWxXiAvJ5iRFuiQbUF0yyNvLP10Ee8/G91k49QfuQ8fRvCT/D
 jQVS1Q8NtvK2xD19vjsPWYvufNHB+CV1QiL/nB9PH5aVCLnrmfqHP7oXIebxMFTd5UyM6CV8u6+
 xxj6tpMDW17Idokc90HfORu+kEHNvJTH6pAiQXPUbN2OH8AGzNSRQnrHBPtSwNg2nNTsCX1kTg/
 JNZzoIy409MxDnaxREy6Zv1bsQv4gjInQXmp2v2IVtiF52H6mxNqydzNCswYmhOaXbjOflt2lT+
 R23/z9U1J1kDbEr2hbA2N8BKFRXNmc1rVTylsrzniQxCyHZIxRNXmA3gJ3zjDqXqH+0xT66ht+2
 QCNpNf2hD/r7aOyJoRRM1biGgO98Y1b5XgTH3Xui51nBMJNGcC75zIay96zEsz5XDv8KehN47xg
 CKLzxQzZtCPVgBe7LRiEmYBdjPJWuW0Rb72XsB4n3gcp4WylME3gGn1SGIAtwcjyUbT8MFoNW4s
 oHaokbunFa/lEpVFYZbi6gW1I28Hkpy4BsFekKQ7s2IZfh39C4/O3IoEx35s8GWtxzvhuhCj/uN
 /FpOY/4Ggy1QTnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494054b1e009f16eee7f 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
 {
+	return 0;
 }
 
-static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
@@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	gc->write_reg(gc->reg_dat, gc->bgpio_data);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
 }
 
-static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
-				 int val)
+static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
+				int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 
@@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 		gc->write_reg(gc->reg_set, mask);
 	else
 		gc->write_reg(gc->reg_clr, mask);
+
+	return 0;
 }
 
-static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long mask = bgpio_line2mask(gc, gpio);
 	unsigned long flags;
@@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	gc->write_reg(gc->reg_set, gc->bgpio_data);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
 }
 
 static void bgpio_multiple_get_masks(struct gpio_chip *gc,
@@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
-static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			       unsigned long *bits)
 {
 	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
+
+	return 0;
 }
 
-static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
-				   unsigned long *bits)
+static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
+				  unsigned long *bits)
 {
 	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
+
+	return 0;
 }
 
-static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
-					  unsigned long *mask,
-					  unsigned long *bits)
+static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
+					 unsigned long *mask,
+					 unsigned long *bits)
 {
 	unsigned long set_mask, clear_mask;
 
@@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
 		gc->write_reg(gc->reg_set, set_mask);
 	if (clear_mask)
 		gc->write_reg(gc->reg_clr, clear_mask);
+
+	return 0;
 }
 
 static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
@@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
 	if (set && clr) {
 		gc->reg_set = set;
 		gc->reg_clr = clr;
-		gc->set = bgpio_set_with_clear;
-		gc->set_multiple = bgpio_set_multiple_with_clear;
+		gc->set_rv = bgpio_set_with_clear;
+		gc->set_multiple_rv = bgpio_set_multiple_with_clear;
 	} else if (set && !clr) {
 		gc->reg_set = set;
-		gc->set = bgpio_set_set;
-		gc->set_multiple = bgpio_set_multiple_set;
+		gc->set_rv = bgpio_set_set;
+		gc->set_multiple_rv = bgpio_set_multiple_set;
 	} else if (flags & BGPIOF_NO_OUTPUT) {
-		gc->set = bgpio_set_none;
-		gc->set_multiple = NULL;
+		gc->set_rv = bgpio_set_none;
+		gc->set_multiple_rv = NULL;
 	} else {
-		gc->set = bgpio_set;
-		gc->set_multiple = bgpio_set_multiple;
+		gc->set_rv = bgpio_set;
+		gc->set_multiple_rv = bgpio_set_multiple;
 	}
 
 	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
@@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	}
 
 	gc->bgpio_data = gc->read_reg(gc->reg_dat);
-	if (gc->set == bgpio_set_set &&
+	if (gc->set_rv == bgpio_set_set &&
 			!(flags & BGPIOF_UNREADABLE_REG_SET))
 		gc->bgpio_data = gc->read_reg(gc->reg_set);
 

-- 
2.48.1


