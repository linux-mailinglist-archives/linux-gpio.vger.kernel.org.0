Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C263A15073D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 14:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgBCNaf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 08:30:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40588 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgBCNaf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2020 08:30:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id j104so18130729wrj.7
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2020 05:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x1xJqaqAPEC794SAD7Tt6YXPm/qB2065vemTtgGyHK8=;
        b=LZqE8iUrg07qQSSghcH6r2uhuQys1bYFFy08ATpEC7Et1fhYnaKAZj6SzReNq2FN/s
         FSQ2z2IAojwof95jzWFXS2sEnF37ErJCWjQ+cq3OXp0PZ+lj2m7grzm5LAWlYnsfNlAX
         zA0jYiTWqpk3UlfrcqMGUjeeZ35uL0iQu6x/yYah/08bvCEa1yYtIFhlVe5kyp3u1wRg
         jDGhEbAf5tbLch8TSeD9E1kl4p0jLAaD/EA3JFIEfAWlVG+9SaKLbbsrkLvN1dsRyndd
         HhG+vwWPd0PYornZtWaJHlVhkvtXylne1iWlo4dYjUrvEHzLoGD/ehkCNCLM6LeydD0o
         yJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x1xJqaqAPEC794SAD7Tt6YXPm/qB2065vemTtgGyHK8=;
        b=EqocFMLqyuiUUJBrak1VEcV3kxn/acLvNNaqKcsW3CGF3zwEbha2qy4SXApqI53VGS
         70jNsmuR2SzmlJCGkJvTS1yOJ10WKrtYYgThaf7DhQqJkHOKCEBep1E3K9nT0pfHgpuB
         cuMhP4Hnhm9nFjA18Ydviy5l+3Pdwq9/Jjw3F4ESu4ePrrre6DPA2LkM/iAA+E56wJD+
         BIlRuXGu2amibh+PZc7cWHoW2ctnQ/56cgcSYbw9QqBHnETdKZUNVTKdOL+LaEgoJmhu
         BfFCuk0V+DUA55tJX6eRA79stlGRwJ4Kna+iK3yA5HU7RRYR+nynw1V104eHSn5hlQJk
         JK/g==
X-Gm-Message-State: APjAAAVsqXV3NExHJ5RGtsM678EGBqg+XW3DeJj3qcq46XwoMtFEBpcB
        jmzgUgPFl8IjdBhui3POCX3voA==
X-Google-Smtp-Source: APXvYqwpb5h+57G+AaJyFbBjUKenLrDEE6o8zM17QKKlB6PXdRXabKQvPh2C4N8tVfrcI4GjOGMY5w==
X-Received: by 2002:adf:fe83:: with SMTP id l3mr11550295wrr.41.1580736633291;
        Mon, 03 Feb 2020 05:30:33 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id l8sm7594540wmj.2.2020.02.03.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 05:30:32 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/3] Revert "gpiolib: remove set but not used variable 'config'"
Date:   Mon,  3 Feb 2020 14:30:25 +0100
Message-Id: <20200203133026.22930-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200203133026.22930-1-brgl@bgdev.pl>
References: <20200203133026.22930-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This reverts commit e5e42ad224a040f93bf112e96f82b3a0ed97ffab.

This patch came on top of another patch that introduced a regression.
Revert it before addressing the culprit.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0673daeaca00..13982056c14e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3047,6 +3047,7 @@ static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
 static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			   enum pin_config_param mode)
 {
+	unsigned long config;
 	unsigned arg;
 
 	switch (mode) {
@@ -3060,6 +3061,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		arg = 0;
 	}
 
+	config = PIN_CONF_PACKED(mode, arg);
 	return gpio_do_set_config(gc, offset, mode);
 }
 
-- 
2.23.0

