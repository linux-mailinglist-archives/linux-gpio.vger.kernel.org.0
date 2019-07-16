Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEEE6A7D6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 13:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfGPL67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 07:58:59 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37930 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfGPL66 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 07:58:58 -0400
Received: by mail-lf1-f66.google.com with SMTP id h28so13487367lfj.5
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 04:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkc1jh95nH4uGus8z54x8VuUUo1FvsfXXyLOz9roJ1M=;
        b=POnvnwEDfT8XQ8UCwYrg2njlc66GKHcwNkunnk28IsHNUl0/+iKJ3+FeTlEBzNPerJ
         kbaxYF2uot0fwUO/wdb6d2ygQGwzW5q1Syj6vt2k//L/2jo8691cz/SoaVhy1eyTvDsN
         nVD3coRsD7PfeHQh+gAhRpWrHW+D+3Zm6BsyPGS/HHal2ZttBtrWw0v2P48V/YE2TkYs
         1He2GJ3o3rR7E11/rUqTBOJCMQD1H32us4Y5YxMUcMskW44Er9PVYDHBpo3F7knA8HCl
         KOmiNQ/hDMIJjEgT+XRrkMcHkoamsEk27ctF/7d3h3dseb7/oZm7TiuUACKH4wqkQuCj
         byDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkc1jh95nH4uGus8z54x8VuUUo1FvsfXXyLOz9roJ1M=;
        b=cHcRj+bCHPlLftjKubatqy2ddZxpzag5RnngN3YBGWMGv2YHE8kjLJioWCp+/P9VRc
         lFGgxUwvNhLNeloBZwcpbjs6Xj6duI3EiZLgNRsZ1W99ezwO8/wjkV4gJi6FP3gESZOq
         mUW7x5nHB0eXXHYIm5/lr7FsdNo1w0UwDUGgOBNGk0e/Sa1Rd4z3RY8mXEIUS8pfzUHD
         0OxXcmBRViuT5atqDBaK0TPquGf1MHua7VYShtfWfPG39MgAEYB3zGJsFvoGW33+3xcQ
         JResyyjY5UsnWk3iLTOruxCEZng9WKjIa9UlTxzp7YJOnhvTKfzh0pVd8OB+Wx6vyMJL
         WZkg==
X-Gm-Message-State: APjAAAXarBnHnlWamBWrA7aeea9V4CmH31V7SzoqXSwc0fwK2sAwv2Qb
        6dBhlVVDZmT6dBtS7ztwCpVsvXumpuA=
X-Google-Smtp-Source: APXvYqwnjWfl9vY0mVb/w0tzCcI9i9u5GBxuDmnOXuhEzboxD3a4pj9Znp6tS8jldOn1meqtQAHUfA==
X-Received: by 2002:ac2:518d:: with SMTP id u13mr14567102lfi.40.1563278336909;
        Tue, 16 Jul 2019 04:58:56 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id o17sm3723706ljg.71.2019.07.16.04.58.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 04:58:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: of: Normalize return code variable name
Date:   Tue, 16 Jul 2019 13:58:54 +0200
Message-Id: <20190716115854.12098-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is confusing to name return variables mixedly "status",
"err" or "ret". I just changed them all to "ret", by personal
preference, to lower cognitive stress.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f974075ff00e..2bc0bcd7a410 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -740,7 +740,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip) { return 0; }
 
 int of_gpiochip_add(struct gpio_chip *chip)
 {
-	int status;
+	int ret;
 
 	if (!chip->of_node)
 		return 0;
@@ -755,9 +755,9 @@ int of_gpiochip_add(struct gpio_chip *chip)
 
 	of_gpiochip_init_valid_mask(chip);
 
-	status = of_gpiochip_add_pin_range(chip);
-	if (status)
-		return status;
+	ret = of_gpiochip_add_pin_range(chip);
+	if (ret)
+		return ret;
 
 	/* If the chip defines names itself, these take precedence */
 	if (!chip->names)
@@ -766,13 +766,13 @@ int of_gpiochip_add(struct gpio_chip *chip)
 
 	of_node_get(chip->of_node);
 
-	status = of_gpiochip_scan_gpios(chip);
-	if (status) {
+	ret = of_gpiochip_scan_gpios(chip);
+	if (ret) {
 		of_node_put(chip->of_node);
 		gpiochip_remove_pin_ranges(chip);
 	}
 
-	return status;
+	return ret;
 }
 
 void of_gpiochip_remove(struct gpio_chip *chip)
-- 
2.21.0

