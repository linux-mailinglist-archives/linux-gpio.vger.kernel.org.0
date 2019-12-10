Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E34F117D9A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 03:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfLJCPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 21:15:53 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44247 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfLJCPx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2019 21:15:53 -0500
Received: by mail-pg1-f195.google.com with SMTP id x7so8068140pgl.11;
        Mon, 09 Dec 2019 18:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GQ27vds6K6xy/R1eo6hlJxEYMhnm8WZmX1KVY2NhyVo=;
        b=qCtNVB18l4AXH3spU0ssTTWN9LziniY+tGLO5PgmoQBm4LP2kr+u/IstmffKCZ199+
         tOVBNiCcnXHk9jnv8HAozN/t8h1b59cHEZRCxBx9YzTnEZVe7f/LX1efff9NM7OG7UHR
         66XR/yfafX6snheRcg+Yj6jo8rVHZ4JqzC0DdnH200Z5LbVaxzs6VAOE327E9r/9KO0d
         np81G6P60lGqE+BOII9bDmZVQTSCtQORPqDq43lmZzX41w1I24y6dJq5F6uc4ZUaDqV3
         ZxBG/QnLQ+PBSgXEhGWRP/z/RVdWoqG+/6hwAbEHG3rxjmyXH/pgplvucJJ5hc0x2xJ5
         n9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GQ27vds6K6xy/R1eo6hlJxEYMhnm8WZmX1KVY2NhyVo=;
        b=jwAAEQD5vKJJgxfiwBxxJsKYcY6W7dVuMeKhgOdqxuLFcR1dAHU/cwVq7OzFV/ce3x
         v3bgcDjCMVnbt0bid5Dwb7Vah76EXAqVaaLQZgqQB+dm2eOpWIffgy5ppDbXVaOZEBRS
         j0Fei5GZIqYoSBMUCUhHTDH50YXP3Y+uin1ukamZ6KkZBgEsT+i32h+wjQlC3Ip4eJki
         ontnpdaQ12n5LXS9Zga9VeVw5rkVzKlWsbAJqNn+xtIte26X/aq6jHJa8DGTA6kgziiF
         uTbM5LWBP9EY2SDDwEGX2od+D4aWu3NJMU66hmHyZDh6nOxgCWH7w1vdN7U8JA6YF35B
         kLpw==
X-Gm-Message-State: APjAAAXKFQ5kk0Hr+WwqDvLrLLfOGWDpMCAXPZU0vqYzi8eQham9F7kZ
        K/Zp6W8sW34LHmdxi7PjGZd4kw8F
X-Google-Smtp-Source: APXvYqy0qwnCTB1mskWQjDuVFXOnTeLnHaka5/VTEI+Bs7ZCHYEqRCkGA0QcpPA+DbJVCWkzmd+F2g==
X-Received: by 2002:a62:1d55:: with SMTP id d82mr32879494pfd.165.1575944152488;
        Mon, 09 Dec 2019 18:15:52 -0800 (PST)
Received: from sol.lan (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id m13sm790391pga.70.2019.12.09.18.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 18:15:51 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        bamv2005@gmail.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpio: gpio-mockup: Fix usage of new GPIO_LINE_DIRECTION
Date:   Tue, 10 Dec 2019 10:15:25 +0800
Message-Id: <20191210021525.13455-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Restore the external behavior of gpio-mockup to what it was prior to the
change to using GPIO_LINE_DIRECTION.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Fix a regression introduced in v5.5-rc1.

The change to GPIO_LINE_DIRECTION reversed the polarity of the
dir field within gpio-mockup.c, but overlooked inverting the value on
initialization and when returned by gpio_mockup_get_direction.
The latter is a bug.
The former is a problem for tests which assume initial conditions,
specifically the mockup used to initialize chips with all lines as inputs.
That superficially appeared to be the case after the previous patch due
to the bug in gpio_mockup_get_direction.

 drivers/gpio/gpio-mockup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 56d647a30e3e..c4fdc192ea4e 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -226,7 +226,7 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
 	int direction;
 
 	mutex_lock(&chip->lock);
-	direction = !chip->lines[offset].dir;
+	direction = chip->lines[offset].dir;
 	mutex_unlock(&chip->lock);
 
 	return direction;
@@ -395,7 +395,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	struct gpio_chip *gc;
 	struct device *dev;
 	const char *name;
-	int rv, base;
+	int rv, base, i;
 	u16 ngpio;
 
 	dev = &pdev->dev;
@@ -447,6 +447,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (!chip->lines)
 		return -ENOMEM;
 
+	for (i = 0; i < gc->ngpio; i++)
+		chip->lines[i].dir = GPIO_LINE_DIRECTION_IN;
+
 	if (device_property_read_bool(dev, "named-gpio-lines")) {
 		rv = gpio_mockup_name_lines(dev, chip);
 		if (rv)
-- 
2.24.0

