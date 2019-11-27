Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3C710B048
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 14:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfK0Nf3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 08:35:29 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38928 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfK0Nf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 08:35:28 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so23595551wrt.6
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 05:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PwQtKdAUQY+SBl5OsHs80mv2U9tLV35lkOjHDH8uz/U=;
        b=d2cdxQQ9QM6aWaCcpY6BPsgrz80U8Fwcf2w8R3J7+De+fTehFpP77InXdBpOshmtG+
         32etBPEhPm69z+HnzUbWIXJmqF88J66XAgQl8duvoOYffYObmQYfJqYiOgZsL+F8OGbM
         9J3aA3CJVF/GVScfiKoOkpwruakMZhbJgAta3PvgQtnlC2VTUGGDAqt0xceZ7b+jOZ/V
         B+2C9t+orE3i5/ixDEQByG2iCRCllJcKFVRZCBMIP6eMtvUShSkWMB8wRJ0VDuR1dh6r
         D2IrBbw4zC08FxiILk2FxWaw1TSMKAKJomt2K7GIEm/kbRTupkA8JCjd6W7ltZqQbB56
         Q0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PwQtKdAUQY+SBl5OsHs80mv2U9tLV35lkOjHDH8uz/U=;
        b=HAGztV1LT5t8y3UCUtK1ywztGSoehdqSKeTVPoyNVcHvqY8LzLWl40fNoGWm0E6a9u
         QLIYEKRjMQkQ5frlHCZCk/kXqCq2+JwI7Yzw716CogWRQshOJRCMpALNSv4tQQ2O6EXP
         lB3oCvNoAS96zT/SMkqEZ5QNgavySPdHk1k9CIQV5pJsKdrRLLUbzgDPeB0dy8L9IhFt
         tWF+VMb4J1eJ3NEZyQ49hezGh8Ox2C+xqVDeO8kt2JWeS1SLth0qpT1iTf3VbrdiDgY0
         N2rSDWJBd7o/SS1YPzyS+u53hZfP48asdpKkaEVYGljN+RAMF3UDi3Oc36xrKEG9Tzc5
         0/cg==
X-Gm-Message-State: APjAAAWwWhS77Y+ksDa6+HUkjFvItd420I3RPAGMQ5V82ZlHsQSzMgCU
        bSl7CqW8qre6RabM3WmFoRhwJg==
X-Google-Smtp-Source: APXvYqyY8p/I8uBCHcvNGF+XJfKMVeXXS67kHVI4ZRKWPfTZ/XQUA9ardXrExDJRQfWZ1TU2jqN73Q==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr20934477wrq.196.1574861725481;
        Wed, 27 Nov 2019 05:35:25 -0800 (PST)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id k18sm19663687wrm.82.2019.11.27.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 05:35:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 5/8] gpiolib: use gpiochip_get_desc() in lineevent_create()
Date:   Wed, 27 Nov 2019 14:35:07 +0100
Message-Id: <20191127133510.10614-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191127133510.10614-1-brgl@bgdev.pl>
References: <20191127133510.10614-1-brgl@bgdev.pl>
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
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6ef55cc1188b..17796437d7be 100644
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

