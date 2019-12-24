Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97AA712A11C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfLXMID (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:08:03 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39204 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfLXMHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:24 -0500
Received: by mail-wm1-f65.google.com with SMTP id 20so2330655wmj.4
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RF8DMEiIOiCZXGcqB/d87PY1debd4x/7fTb1Nr5izog=;
        b=A0jHUOV3ih62WkyW72xaeNmDZY6Hv/Cu2TzvtJQFsOJP6ilkXgpknoYH46E2oxfMyb
         X/UUpj2G/WvkNHvpNgW0e27hHJQAwsuibDZhObvXCFnbpuSLGFzkqXB0JDz5oevoNqtm
         q8XDHQpO6MAdYyPglTI7vEI4jHL2E7Q7E1srfq4Skwtq3m7nQ1+T3mcgjSczsZDQznK7
         eoQJjzrGCMDNygRWhRtb7NZHW6fL3p6+9llUrLOo6rI2BY1KKsdVdgq4lfqXD8n1YcuC
         ZmnuX+qVRpbPn7rd8GEdZoJspCJrPCZEPy7Mli7xr8W4iCwvzqbEGAeF7qllkgNoejn0
         blqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RF8DMEiIOiCZXGcqB/d87PY1debd4x/7fTb1Nr5izog=;
        b=BFnHUf36IihKn2STjaFQudXtmXyEY5YeFPV2Zs8PLzn7MOPSw9GzFMB3dIH+EGEFSd
         NmAW2/7MxW/yuAjbTfsW9AbitoYfylkeHOYwSwnyCUcpcDu3LeqJk92nyHVQCunGbXmQ
         kghv0jc7aR02KAYJHydJ4ES6yJ2nhuFgAJatlFwUZLGTAUYyhxHw+bhhH6TZfkGkzYt4
         EjSSwGbAMeL8aNrm1Hj5kMWUnG8F6kPA2UgwoyJzwXda44O7sSsRx0dalgg8aoPx5EmS
         HE+RUngCHwH1rrT2FZmZojV5mo8X0uSY8dmjNvTwjw4Ajnf/kKoxX0+ndDAnaEhglsm6
         JGaw==
X-Gm-Message-State: APjAAAWKduDPuLS70Cl7WmMqIN40WQRWIWpWf0WxFA+beIIN0pyScohR
        GTdWg30o9IUNVR7wJA7FZy+6tw==
X-Google-Smtp-Source: APXvYqzc7xw2byEmSEkkLzaL+93WllV3MBCJRo9VYYM0apZV2n+xtKSADt4xwNIA+MCgFCnnRpAplg==
X-Received: by 2002:a1c:b456:: with SMTP id d83mr3883612wmf.172.1577189242517;
        Tue, 24 Dec 2019 04:07:22 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 05/13] gpiolib: use gpiochip_get_desc() in lineevent_create()
Date:   Tue, 24 Dec 2019 13:07:01 +0100
Message-Id: <20191224120709.18247-6-brgl@bgdev.pl>
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

Unduplicate the ngpio check by simply calling gpiochip_get_desc() and
checking its return value.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fcec8b090677..007f16fdf782 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1009,8 +1009,9 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	lflags = eventreq.handleflags;
 	eflags = eventreq.eventflags;
 
-	if (offset >= gdev->ngpio)
-		return -EINVAL;
+	desc = gpiochip_get_desc(gdev->chip, offset);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 
 	/* Return an error if a unknown flag is set */
 	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
@@ -1048,7 +1049,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
-	desc = &gdev->descs[offset];
 	ret = gpiod_request(desc, le->label);
 	if (ret)
 		goto out_free_label;
-- 
2.23.0

