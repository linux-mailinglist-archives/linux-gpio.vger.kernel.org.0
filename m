Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 601E817007A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2020 14:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgBZNxe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Feb 2020 08:53:34 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46660 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbgBZNxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2020 08:53:34 -0500
Received: by mail-wr1-f68.google.com with SMTP id j7so3069704wrp.13
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2020 05:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3cxtMG4sZ4y/Scu1ZO3icRIO3At+4PfcH7Mul3RpG0=;
        b=zzpVCXjGnNVaBg/Rk4JA9XUtDzvNEn48i7Iszdb+rdrxketdQqCn6Eh7w91livJIDn
         +KxvOa3eKPt/Wn044/IZFFvBcUv7KR474fr/fRUbwSlVIf6KCBM2QJbWnafPNT6FeEAw
         +rXE7gXDNVHwC6qYtHAmOSwiyhXAWHXtMqeeJ43QmPB63KhUmwsQ2s4nbt13gTvHKNbT
         R+fFt8e0qK1bGGIRPZwDSrKD42zZmUtfi4y9m6TzbANVQ3fmm5ep4ykVT4PSPGM9XKuh
         kvcoAuSPF4YTup3lajgudLJ413ewI/bnuec4RqvkQfn9Rh4oY6NNYOQFPHZTO5eYcgER
         LoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3cxtMG4sZ4y/Scu1ZO3icRIO3At+4PfcH7Mul3RpG0=;
        b=ZJcO0lJZdptBRiGRUV0YpksAYIZkJZOwmyUmwpC43I3kgOx6Gexjsa2Ro9ORlPHoJm
         eLrpqOzxawbWdW1mbI09+nCRZPqbav4g8FxBkKmuZDXjx05S4tBGlFO+o/zhFPQ8rNVK
         D6l6wwD0uQkD++fWEyPeBiXGmzfGh6LBE0y3ip9yoYxNzCeNnnn0Fsf28m+PfpxpZQIC
         /jsL9CGqZS2c35fRBnv/MU9J2qeJI49KAwTiE9HU4zsE65+G06WGKqz5EJPncssEvBCQ
         p5l5PjcnWYG8VvY23eLBy1ZtpoHqzcdy2NStR3L9LrCOi6R5msNzg8e1QijSgHZXa0Mq
         EF4A==
X-Gm-Message-State: APjAAAWI+JQ1x7p/KcUK27YdvFfLaRlNzQAhkjYUvI3DVeCTgNy5V3eB
        jwJcS00Epv8IUpvaxADDVvZvR2lhaiM=
X-Google-Smtp-Source: APXvYqwId0MNOOSohhYiwMOwoBaxQal9aFkn9RfJOajEiRd99TeuRJKBFRwtdq4N/vks3d9Yq2ZzZw==
X-Received: by 2002:adf:8294:: with SMTP id 20mr6074492wrc.175.1582725211286;
        Wed, 26 Feb 2020 05:53:31 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id w19sm2832783wmc.22.2020.02.26.05.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 05:53:30 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpiolib: fix bitmap operations related to line event watching
Date:   Wed, 26 Feb 2020 14:53:23 +0100
Message-Id: <20200226135323.1840-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

When operating on the bits of watched_lines bitmap, we're using
desc_to_gpio() which returns the GPIO number from the global numberspace.
This leads to all sorts of memory corruptions and invalid behavior. We
should switch to using gpio_chip_hwgpio() instead.

Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes in line info")
Reported-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a5cd1b4abe6f..5cc80f6f79e0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1261,7 +1261,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			return -EFAULT;
 
 		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL)
-			set_bit(desc_to_gpio(desc), priv->watched_lines);
+			set_bit(gpio_chip_hwgpio(desc), priv->watched_lines);
 
 		return 0;
 	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
@@ -1276,7 +1276,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		clear_bit(desc_to_gpio(desc), priv->watched_lines);
+		clear_bit(gpio_chip_hwgpio(desc), priv->watched_lines);
 		return 0;
 	}
 	return -EINVAL;
@@ -1304,7 +1304,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	struct gpio_desc *desc = data;
 	int ret;
 
-	if (!test_bit(desc_to_gpio(desc), priv->watched_lines))
+	if (!test_bit(gpio_chip_hwgpio(desc), priv->watched_lines))
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
-- 
2.25.0

