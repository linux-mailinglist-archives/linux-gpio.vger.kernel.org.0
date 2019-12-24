Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A0612A10A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfLXMHU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:20 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35444 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfLXMHU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so2355253wmb.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GO3zXMZimp5dVxXCLQ2FW62+17mQ9omxCxnoqXW9B+A=;
        b=E6T59StLaXs/q74XsZyplYGF+eHEQ2/kAL+qf3Z4NWGYiyRvJgyO4BvGCvS1Vu2a41
         RBv83RYJc/LjSIguLNmztjayizflhtnhyzdcHW0Vzc6o6N1xqUz+v0i3F30xm4YOxR28
         qMdFeeh8nJLe4VVftFrzhLffpu+pAkPgjQ/yexM5rWZdqB8w7chMxbxOEAQZArfV22BB
         94sw52DNaZ1jQsQodMv5OHEIMrSJrY/Vm/a8xPXriGj/jS/KOujG4R+44xs4aKRey/VR
         0kjakXh2oYMGiKEsRrplc0Tnk1GEjLIghYXZHboTDLccLYM1vpebSFd9g2fqMBD/uHvY
         bWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GO3zXMZimp5dVxXCLQ2FW62+17mQ9omxCxnoqXW9B+A=;
        b=bL/73Z7bOalmf6oW/wYCX9RMf0m7eIZ3FG6nv8GXC0RxLXCRcq3pydyN+L6OQYCCQ2
         tl/wzQfqMULJRINFsWjJnzdVc1qAZJR6KrXSdv6kIoSf3lXxe9x7lAGh+IsvwpmabBXF
         RbFPQaV8fHe4kUBuz2xvu1ePp6tylSapqm3KQxIzcvcuLUrF0+jEXwtNWpuqESVRxR95
         hlJkSwNrF0iRYfIJ8vgpH6f+2oryIW2ARvz0aMsMpjjnUAfrMVdswUz8c7ZBJsgtIWpO
         pGwP5j9EZvU5WxlwxBs75X2tJk7B6a1C/dKLqVZ5oaGjMglcAAQJaHarQ+nbYPSys9K7
         6upg==
X-Gm-Message-State: APjAAAXydhlcXHCotpA0PcctCOBAqrxHo1joQSlIwbLMPTk2Ryn9nPQ5
        uNR4mUkd9+9gn2J4Bt6aNF12/Q==
X-Google-Smtp-Source: APXvYqy+hB4nZIysuBUiCvcu3BMLslJ/SswWIrfJ7nUG2VAsvcMTUmMXlaruuKmhqBbyCJHHE0/FHQ==
X-Received: by 2002:a1c:5444:: with SMTP id p4mr3917068wmi.33.1577189238229;
        Tue, 24 Dec 2019 04:07:18 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 01/13] gpiolib: use 'unsigned int' instead of 'unsigned' in gpio_set_config()
Date:   Tue, 24 Dec 2019 13:06:57 +0100
Message-Id: <20191224120709.18247-2-brgl@bgdev.pl>
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

Checkpatch complains about using 'unsigned' instead of 'unsigned int'.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9913886ede90..e5d101ee9ada 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3042,7 +3042,7 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
  * rely on gpio_request() having been called beforehand.
  */
 
-static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
+static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			   enum pin_config_param mode)
 {
 	unsigned long config;
-- 
2.23.0

