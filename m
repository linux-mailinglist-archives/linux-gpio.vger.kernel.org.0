Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4EC612A11A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfLXMH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:59 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52838 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfLXMHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:25 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so2264577wmc.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mz8L4Lt49G62seSrgK4yK746p50+Z1piYFhJRAF8PTU=;
        b=1ctErHlCXj0LHw9fSbHRDNvyy0282E54F8kPgEYWs/gUR5so4AOy2w6mraAl3zWcZs
         6Abv5b097LP7786/IdbQDcEk54IppMe6AyT66mwIQEOgHd6g1YQmdOnrPkmRWwqXBm95
         suOSVMNmr9gxrrSfSm7dc6FPz6AdCSDGg0utf3DXEeeGJmBPWhQ/6ptZ+m5OHGVQ6gJC
         3FStMfuag1M9CogknkLdA5+YhqpBXbE8pZcFLhG6VjCYl770nFFyV7AnLTn1aDuKuvv6
         xdYgnZS31zySbhmy0VOEIWPFM6Sc/MWITkWH7BRA6MEl7WPmXC2ypAAOgze/8+I3brFm
         zHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mz8L4Lt49G62seSrgK4yK746p50+Z1piYFhJRAF8PTU=;
        b=tLUtVwmhPOld7PToaf220snGpGPM+vKfFVOHulKXqXrDwH77T/aCWPsWtPreeTW+DJ
         CrBIv1VKSk+eXnbTVU98PzWjNxWoypDWOxssxISCFhna9QNOzbqSWfkk25799T996f3i
         YsBm8Gs1LI95KAzRtEEFKqgDydHGEYXNheQl/INjl4Dy9R+P4kDbcqf1FNxjic/4CVHo
         5Wom6MYC4cVBe3+NExP0BttyqgtvkUidaKXtcRoiSvpWaQ06gQAaH3WHdc/AuZ6nLpe1
         93CEC8eg7CILV3zuhsxdsdGioKOYHwsXfPxGckWWfGthhNFbWDtV698tffJ+tTPJTzRW
         C+RQ==
X-Gm-Message-State: APjAAAXz86wecyh89po+NkT66xeKwwN8U4vIBkz62s6npplx+UyqbVPL
        NLW2O7XT6Ez+91FM7/9Vr0ZcSw==
X-Google-Smtp-Source: APXvYqx6H+V3XXlrgcnZ5bJlmLgjaXFmx8wQ9PyJP+zBULWP0t3ogFFagIjhhXnah8PgMnS3g24EgA==
X-Received: by 2002:a1c:7508:: with SMTP id o8mr3862612wmc.74.1577189243537;
        Tue, 24 Dec 2019 04:07:23 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 06/13] gpiolib: use gpiochip_get_desc() in gpio_ioctl()
Date:   Tue, 24 Dec 2019 13:07:02 +0100
Message-Id: <20191224120709.18247-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191224120709.18247-1-brgl@bgdev.pl>
References: <20191224120709.18247-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Unduplicate the offset check by simply calling gpiochip_get_desc() and
checking its return value.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 007f16fdf782..81d5eda4de7d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1175,10 +1175,11 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
-		if (lineinfo.line_offset >= gdev->ngpio)
-			return -EINVAL;
 
-		desc = &gdev->descs[lineinfo.line_offset];
+		desc = gpiochip_get_desc(chip, lineinfo.line_offset);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
 		if (desc->name) {
 			strncpy(lineinfo.name, desc->name,
 				sizeof(lineinfo.name));
-- 
2.23.0

