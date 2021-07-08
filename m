Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774F63BF5F0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 09:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhGHHH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 03:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhGHHHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 03:07:17 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAECC061760;
        Thu,  8 Jul 2021 00:04:34 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q17so6136565wrv.2;
        Thu, 08 Jul 2021 00:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0cYXJNeVgZpP/hW6to/t3J7jOfhWKeqEA89IWXaC5Ug=;
        b=qDZ/aJsgkd0mSiKwPSdBHNbOgx2VrLOeHfgBkSTxRjyCCZClj7cPeBeizJAVXlh38/
         DKYESVB7ByXTW3h9oQzZz+8xvx4WEpTAOkuIeymSf/Pm4G25Kl6clW70b+Ds0um8ivD9
         R7GvNcxW3tZ0fnkF0/eFWTdZV6/pagfSXatlml7U7AJzkPzWcD2+z6C9HCRrzk5mQ82z
         LH3xRwYtxyDz1/azyN5MzPdpN7yv9qEYk0kFO/iFPSzMj9wCmBH0tlF/B+PWsgHKi3Dj
         BMsrLddP5G44QT27aTgKy17FzqcXXp2R3XH03CFd/pvHbKN6grE00AfvOxq99eC4t7aS
         OhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0cYXJNeVgZpP/hW6to/t3J7jOfhWKeqEA89IWXaC5Ug=;
        b=AIMHZBahy3pE9cv8HMqaRNQ2TvZbjavOp9wSDKjZZI1CpHTniNoKa3/Q3ldJFuWDpZ
         mSWTU6q/BFJFEfGhY+rOn33RWe1d8wSQ92srbR/iAmfmKnga+Dci3/3t+A3lEtIn9fRN
         OdYnys5YdVmcO7nCyqYegPUFayyneBwAnJVCvhu6HqFmIRsdE1UJsRoni8xvg1YxELRM
         2uzCH+2rA/01WAn3Forh9O8A33WxrRojxzQ3yFMzAfO9I6twgCPbDeiJSmJKrR4vXMId
         xaG2dCSNmImm+VJEvS8+P44nIY2fIaiARlybPgPg77hEtHN6QBAzbiCt6ItTuUQcXi9d
         YTLQ==
X-Gm-Message-State: AOAM531iFAgNhw7T3wM0fmln3mg1+cO9skTYSBzANxZogld6k0fq0Pxi
        fav4YC+RrAfU+r9N/EKKxCByK2JAag6uWA==
X-Google-Smtp-Source: ABdhPJx0T7iLqBLryGo1YoR+ceHN4tAoSHOGBKGkEv/iL56BdLtVfdOAQLJNjeI3jHFb/Smn5DlSMA==
X-Received: by 2002:adf:f710:: with SMTP id r16mr31210880wrp.124.1625727872929;
        Thu, 08 Jul 2021 00:04:32 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id u15sm8093305wmq.1.2021.07.08.00.04.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jul 2021 00:04:32 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to support multiple gpiochip baks per device
Date:   Thu,  8 Jul 2021 09:04:27 +0200
Message-Id: <20210708070429.31871-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The default gpiolib-of implementation does not work with the multiple
gpiochip banks per device structure used for example by the gpio-mt7621
and gpio-brcmstb drivers. To fix these kind of situations driver code
is forced to fill the names to avoid the gpiolib code to set names
repeated along the banks. Instead of continue with that antipattern
fix the gpiolib core function to get expected behaviour for every
single situation adding a field 'offset' in the gpiochip structure.
Doing in this way, we can assume this offset will be zero for normal
driver code where only one gpiochip bank per device is used but
can be set explicitly in those drivers that really need more than
one gpiochip.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpiolib.c      | 34 ++++++++++++++++++++++++++++------
 include/linux/gpio/driver.h |  4 ++++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 27c07108496d..f3f45b804542 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -382,11 +382,16 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 	if (count < 0)
 		return 0;
 
-	if (count > gdev->ngpio) {
-		dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
-			 count, gdev->ngpio);
-		count = gdev->ngpio;
-	}
+	/*
+	 * When offset is set in the driver side we assume the driver internally
+	 * is using more than one gpiochip per the same device. We have to stop
+	 * setting friendly names if the specified ones with 'gpio-line-names'
+	 * are less than the offset in the device itself. This means all the
+	 * lines are not present for every single pin within all the internal
+	 * gpiochips.
+	 */
+	if (count <= chip->offset)
+		return 0;
 
 	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
 	if (!names)
@@ -400,8 +405,25 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 		return ret;
 	}
 
+	/*
+	 * When more that one gpiochip per device is used, 'count' can
+	 * contain at most number gpiochips x chip->ngpio. We have to
+	 * correctly distribute all defined lines taking into account
+	 * chip->offset as starting point from where we will assign
+	 * the names to pins from the 'names' array. Since property
+	 * 'gpio-line-names' cannot contains gaps, we have to be sure
+	 * we only assign those pins that really exists since chip->ngpio
+	 * can be different of the chip->offset.
+	 */
+	count = (count > chip->offset) ? count - chip->offset : count;
+	if (count > chip->ngpio) {
+		dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
+			 count, chip->ngpio);
+		count = chip->ngpio;
+	}
+
 	for (i = 0; i < count; i++)
-		gdev->descs[i].name = names[i];
+		gdev->descs[i].name = names[chip->offset + i];
 
 	kfree(names);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 3a268781fcec..a0f9901dcae6 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -312,6 +312,9 @@ struct gpio_irq_chip {
  *	get rid of the static GPIO number space in the long run.
  * @ngpio: the number of GPIOs handled by this controller; the last GPIO
  *	handled is (base + ngpio - 1).
+ * @offset: when multiple gpio chips belong to the same device this
+ *	can be used as offset within the device so friendly names can
+ *	be properly assigned.
  * @names: if set, must be an array of strings to use as alternative
  *      names for the GPIOs in this chip. Any entry in the array
  *      may be NULL if there is no alias for the GPIO, however the
@@ -398,6 +401,7 @@ struct gpio_chip {
 
 	int			base;
 	u16			ngpio;
+	u16			offset;
 	const char		*const *names;
 	bool			can_sleep;
 
-- 
2.25.1

