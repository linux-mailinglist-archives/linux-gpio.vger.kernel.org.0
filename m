Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98391A9645
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 10:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894432AbgDOIYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 04:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894416AbgDOIYE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 04:24:04 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4838CC061A0E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 01:24:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z6so17871243wml.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EobkudjeEirKaGgdWsk/CD8WOleZ+DP3gR06TTwb6wk=;
        b=bs3Z8EtMxZvpBwIchq8UtxwJizaNNzNokP+UGHuSBaEUXq7xAV3QKTkPn+7LwnWe5Y
         BLFOPueN01cLHBquoZTBpIZ0B+3D1yKOgup/T4iQ830/a0A0b4Gq1KTQ6J0uSGE5ndAN
         zZGg3Pd/O+Aqb4sW0MEBlmrOflpSpN07ce+np7CtjWokhkB4AQro2SYH2ouEXegI5Q7H
         wufvnSz62M1BADvZCXRaGK6ZjgcqR5fu8kjcmfcYOEJF2uKYF14ObFvXK8d54HUodunO
         YM4LkMH7/ACPGCwWF46pu634AMxsQoQx4y19p3mOekbiERK+Ws5N4xBSC/cYlNRv/Cli
         xEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EobkudjeEirKaGgdWsk/CD8WOleZ+DP3gR06TTwb6wk=;
        b=kIAaeSuXH8em04iY+izPL0XKK9/fHByIZbmLjAIEn/S0Eg7SHCDzDzKahTYerEevPp
         QA+WpUeYuYpTr3ZUKJesO8XISDREchtzZLC6cPt1SW0sP5DRG6z/ICxDz9rBK3L9xcQL
         fs27K/Lh+htt9VRhGd7ief2+QDJa86S0y8nzL/CoiGPYHPKolM/fwMpytMKKr62XUILT
         7EDGMpTCBYExCghLpVxOrehYfSaiwF2xU2RVLWn8sTHhen1RYxE0x2t5KLh/Okm7q2oT
         h+WVZ7ET7XjbNFYiwfcnexuLuMFvj1zeNqJlr2wBbnyZP+H0TXp0Ya3HfSVot6cuT0jJ
         6m9g==
X-Gm-Message-State: AGi0PuYHhB4yHTlndLeR9REazCb1S1cjgNzMwVG9myche0MHtfS6N8zE
        YfCVwVkx8ll3Fgt9iMGqBmstMw==
X-Google-Smtp-Source: APiQypL/4wlg57NoVsKljaiL1Y4FqjXf6bqEYqoWKKbjsZoMQY6CN22vxs05pWfQw6mQze9N+ac0dQ==
X-Received: by 2002:a1c:1bcb:: with SMTP id b194mr4189899wmb.4.1586939041929;
        Wed, 15 Apr 2020 01:24:01 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id w6sm18763373wrm.86.2020.04.15.01.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 01:24:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpiolib: improve the robustness of watch/unwatch ioctl()
Date:   Wed, 15 Apr 2020 10:23:59 +0200
Message-Id: <20200415082359.22152-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This makes the new ioctl() a bit more robust - we now check if a line
is already being watched and return -EBUSY if the user-space tries to
start watching it again. Same for unwatch - return -EBUSY if user-space
tries to unwatch a line that's not being watched.

Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes in line info")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 40f2d7f69be2..29f6abe84d2e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1227,6 +1227,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	void __user *ip = (void __user *)arg;
 	struct gpio_desc *desc;
 	__u32 offset;
+	int hwgpio;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
 	if (!gc)
@@ -1259,13 +1260,19 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
+		hwgpio = gpio_chip_hwgpio(desc);
+
+		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL &&
+		    test_bit(hwgpio, priv->watched_lines))
+			return -EBUSY;
+
 		gpio_desc_to_lineinfo(desc, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
 
 		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL)
-			set_bit(gpio_chip_hwgpio(desc), priv->watched_lines);
+			set_bit(hwgpio, priv->watched_lines);
 
 		return 0;
 	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
@@ -1280,7 +1287,12 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		clear_bit(gpio_chip_hwgpio(desc), priv->watched_lines);
+		hwgpio = gpio_chip_hwgpio(desc);
+
+		if (!test_bit(hwgpio, priv->watched_lines))
+			return -EBUSY;
+
+		clear_bit(hwgpio, priv->watched_lines);
 		return 0;
 	}
 	return -EINVAL;
-- 
2.25.0

