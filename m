Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F1A2D469E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 17:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729938AbgLIQVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 11:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731867AbgLIQVG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 11:21:06 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78918C061794
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 08:20:25 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id a9so3902057lfh.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7X9rUZ65w07hA71iqsnhuPeCNSTLCg8P+q1cHZKW2Q=;
        b=h4Euud5GoxgAedvtzBu4G/WaLolf/rxJa1S+tSdLI5Y7pyz4M3gJMad6SCoZx6dszC
         /xsSoHOAF9YrXl0OG1Ye3VpkiAVfrtnWtYFwZnTQHsYu01Y5ein8VZhOw5aWACpHm+ZP
         VmuqoAu6yS7dbpZz5mWEGOgFjB89e7FfKXDjqgz5OYzgzqXaZyh2A1d2dw8Mv8jbAZWg
         +/1m2TJw9ou4ZbT3WCeKDLwwMDSryICzpzTkUzgMY5beXjyURLjICfUcCY8NpVn2vhOJ
         a6bAOmMEm8V2xTSiixn12AX/2rSv0XQIP23Y6W2D9jH7fkuRlWHamu3EPFBbOnxbZ9C3
         u/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7X9rUZ65w07hA71iqsnhuPeCNSTLCg8P+q1cHZKW2Q=;
        b=iwuzLAmc5uxWPtgMpI3tbYRW4yRYp/pRu7H2Lnh5SW8yTyDOIlJUPKtPFJh5DKQFZJ
         wYJlGxwHFgcrbCEZaKjabUzqrXEDlvxAaaSlWN4g0BlBZoWvuHDDC6uMbd/UZXFQR5XS
         croNvwaHDizy2zS7S0rAS8ytfAnk4Qd6W9/Q0fGVQsOXw75l6Tx4uUpqEtiTY8n7KeRE
         DGDk6LdiTlEY06nubtUA70szqUNaw3c5RCEqf0iKzP1SOROJl6xhYzkPDRxqPAUY9DTx
         ENRjKBUhvH5bHRaC1co2ZBCa42xP5k1g0rC66NBrSdPvwMOuBklz63c8zBW4/Q1SgZZn
         Chtg==
X-Gm-Message-State: AOAM533EyqNOLJCErvYKTRwoNNPPHc+DQKUcunMGI/wlgOm1OoCQBf4u
        +YIFz9t7Wmyo+IuEC7jOu/bCFkZ4jCfs7NfL
X-Google-Smtp-Source: ABdhPJziA0wKD8Vjt2vPji0tvCLEOO+FEzlwqgJ/b0dkGrm7AHVzeC8WwM8PV1Cv2xqYahz/o2PFJA==
X-Received: by 2002:ac2:4576:: with SMTP id k22mr1256188lfm.110.1607530823854;
        Wed, 09 Dec 2020 08:20:23 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c6sm216301lfi.301.2020.12.09.08.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:20:23 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH] gpio: sysfs: Try numbered exports if symbolic names fail
Date:   Wed,  9 Dec 2020 17:18:21 +0100
Message-Id: <20201209161821.92931-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If a GPIO line cannot be exported using a symbolic name from
the .names array in the gpiochip, fall back to using the
"gpioN" naming system instead of just failing.

Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 728f6c687182..a5a0e9238217 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -627,10 +627,24 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	if (chip->names && chip->names[offset])
 		ioname = chip->names[offset];
 
-	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), data, gpio_groups,
-					ioname ? ioname : "gpio%u",
-					desc_to_gpio(desc));
+	/*
+	 * If we have a symbolic name for the GPIO we try to use that
+	 * for the exported sysfs device/file, as legacy scripts depend
+	 * on it. If we don't have a symbolic name or if there is a
+	 * namespace collision, we stick with the "gpioN" name.
+	 */
+	dev = NULL;
+	if (ioname)
+		dev = device_create_with_groups(&gpio_class, &gdev->dev,
+						MKDEV(0, 0), data, gpio_groups,
+						ioname,
+						desc_to_gpio(desc));
+	if (IS_ERR_OR_NULL(dev))
+		dev = device_create_with_groups(&gpio_class, &gdev->dev,
+						MKDEV(0, 0), data, gpio_groups,
+						"gpio%u",
+						desc_to_gpio(desc));
+
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);
 		goto err_free_data;
-- 
2.28.0

