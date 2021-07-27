Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBDD3D78D4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236905AbhG0Ot2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236793AbhG0Osl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 10:48:41 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3A0C0613C1;
        Tue, 27 Jul 2021 07:48:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l4so15531133wrs.4;
        Tue, 27 Jul 2021 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GKYzv8RHexIKxq1W7JCHmTJo8Lmco0kUY34T+WPoGO4=;
        b=vY511bThwxDTbb+nGwkg7mk5H62aDSGwVkvD7nBrYgZb2Nr6XjYa+96uU4bFFTwq41
         b6Hv2rIo462Xie3ZbDg4AwvrJSbePjEn+TZHZIQfXc9sgNSC3MUeaW8Zyg1LRerh7Dqx
         E2s5zUHwWTxIjh5o0TKNSCFMWoKWm6dhAR5vA4rtAYgiZtYkO3+3J5cKNR34JudJcTms
         9RouyyKJp3OQH9uPj1T19WEqe7MYKRxHPyf8V/zr0aQia1QdC35CrLAWQ3Z39wckmIRI
         VWSn9yBZ1pOqxQNDX3ZCqYe0zjtUZ0dPHjYsXSFzhYcb5Y82N7DCWnJGFZHAfI0qgthD
         P0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GKYzv8RHexIKxq1W7JCHmTJo8Lmco0kUY34T+WPoGO4=;
        b=A2awDg/zU66teqx1/c+MXIndi10k2998aakm2Z+AoKHB6LO18zBYkSYG7PrDGr+31E
         d26Sf/y44PLe0IR6Z5EgCFzCS4IuI47u3MKXiFA+dgXnMyaj4SwV5BGofAEO1zqJG6K+
         L/JiN3kzcSTK+Ily8w2PP3cBbxsFrukSldgnNRz7zlUTu1q2xG/TLk/kIeU509LXG8Dc
         iKdHZk8cNhhjFgJNEh4qfHhHTaX/VhUvEl/b7iLajf7G2SzZT7PupyiHmNZ5YrDpiPj/
         Fbu9FTRNQ45qv+P3OmuL/xXdeArsafQpmhMhi/qEu0L4i2VtjMy1CQA/TMHIKx1Cz/b8
         Iavw==
X-Gm-Message-State: AOAM5314SvA6khUKE1Qx3XwPQCssHmx7vQTubtyJClmjH9isPiau6LJN
        V2bccSUuip6vZkTU+bPG9FjDJPWTJEnEjzyJ
X-Google-Smtp-Source: ABdhPJzhEyl8O+S/pQGh1Pr/MyWtHv68ZslchWLaTGkdAwLrHbu9555fBL3c9wqXnyKNYnYmwY1U/w==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr16261586wrp.144.1627397299827;
        Tue, 27 Jul 2021 07:48:19 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id o14sm3002555wmq.31.2021.07.27.07.48.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 07:48:19 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to support multiple gpiochip banks per device
Date:   Tue, 27 Jul 2021 16:48:14 +0200
Message-Id: <20210727144816.8697-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
References: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpiolib.c      | 33 ++++++++++++++++++++++++++++-----
 include/linux/gpio/driver.h |  4 ++++
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 27c07108496d..bdd96891e848 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -382,10 +382,19 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 	if (count < 0)
 		return 0;
 
-	if (count > gdev->ngpio) {
-		dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
-			 count, gdev->ngpio);
-		count = gdev->ngpio;
+	/*
+	 * When offset is set in the driver side we assume the driver internally
+	 * is using more than one gpiochip per the same device. We have to stop
+	 * setting friendly names if the specified ones with 'gpio-line-names'
+	 * are less than the offset in the device itself. This means all the
+	 * lines are not present for every single pin within all the internal
+	 * gpiochips.
+	 */
+	if (count <= chip->offset) {
+		dev_warn(&gdev->dev, "gpio-line-names too short (length %d) "
+			 "cannot map names for the gpiochip at offset %u\n",
+			 count, chip->offset);
+		return 0;
 	}
 
 	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
@@ -400,8 +409,22 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
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
+	if (count > chip->ngpio)
+		count = chip->ngpio;
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

