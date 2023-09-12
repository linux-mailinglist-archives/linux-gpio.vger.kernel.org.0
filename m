Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5882179CD57
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 12:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234045AbjILKIq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 06:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234074AbjILKHt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 06:07:49 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7121994
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 03:07:45 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so2158519f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694513264; x=1695118064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MflPL+QKb28SLjr67nvfLFxWVRN50mSzldVQJo+IR1w=;
        b=iEP3Lt9EyU3b2KrO+GJiN3Yb+RnNRx9ciCxuP8MsS0SLIwrXRgZReq+a+AI0zrL9V7
         0LBWGMbRNHMxTXkfQnwT017RVqEdKmc/0AmjGU7L0SAOsZoKUxzHxqjxwt+KA39kZ9pv
         oYPIXhmZ7+tnEopx5gT4xFuixVS/ZrCGmmN+i5VaAtC01rQ5M+/xBve8WRvAuRPVAdwr
         wNYLVvFjkRo0htsKHWWmO8YTSb09vxMcsTjd10qQ8/QOHo8plK6gn6qWZTZsjwJKGOEl
         jXLRkelujB/imquKTyodR6+wGMdpCSQlVA4bVnIFjbK7GSTUpKgso8izMW6B7hVA1PNU
         Knbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694513264; x=1695118064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MflPL+QKb28SLjr67nvfLFxWVRN50mSzldVQJo+IR1w=;
        b=WMeMYcKOElSXWz/kARHK3KmxGtrTi03OMRo1x02szErC+yk5xyhXIL+bHkDQe9zACg
         p2UTdaQtAu+wlEbVC71Z4aDuW/s03I3XJ+ahomm6CrxpWaAZCaiyUo8sGpgM8M2RGJwT
         D26StyysWmpw+w92TNhRUjMXqY1nwpn4BbrbsHNVTeoNyfwczzBcFMDA7XH4LMSQ92xH
         QcEuBBVgSVsFHzTRIdPTPe9IRLfl9yP2tfctHRovpX2GQtd4kOVDg04QlIl20zmWEuk/
         j6+MaoDLwBEISGEa2if5IRFQ4wUu5u8uCvgtGD9xsltEeUm22omV4Rgp06SMmmegEqMz
         hEMA==
X-Gm-Message-State: AOJu0Yx4uKBgfW1CGhpdAH8dwyt45mvuFD5scE8I+OW0YjZ/HhW8Wjt2
        SWEm5SeXrsKPWTF1Cj5ooFL4aA==
X-Google-Smtp-Source: AGHT+IF6appF+Bc1SNs12WHBJet/EEUF/e9LtN/Bq72htXDMX5lzxciYf3JqP47+0WwTHb5z1IuJEA==
X-Received: by 2002:adf:eb46:0:b0:317:5a99:4549 with SMTP id u6-20020adfeb46000000b003175a994549mr9000560wrn.0.1694513264267;
        Tue, 12 Sep 2023 03:07:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:907f:4cd7:f0ae:6b2a])
        by smtp.gmail.com with ESMTPSA id h5-20020adfe985000000b0031ae8d86af4sm12351417wrm.103.2023.09.12.03.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 03:07:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 10/11] gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
Date:   Tue, 12 Sep 2023 12:07:26 +0200
Message-Id: <20230912100727.23197-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912100727.23197-1-brgl@bgdev.pl>
References: <20230912100727.23197-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're porting all users of gpiochip_find() to using gpio_device_find().
Update the swnode GPIO code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-swnode.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index b5a6eaf3729b..33c4b1a6c3c1 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -31,31 +31,26 @@ static void swnode_format_propname(const char *con_id, char *propname,
 		strscpy(propname, "gpios", max_size);
 }
 
-static int swnode_gpiochip_match_name(struct gpio_chip *chip, void *data)
+static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 {
-	return !strcmp(chip->label, data);
-}
+	const struct software_node *gdev_node;
+	struct gpio_device *gdev;
 
-static struct gpio_chip *swnode_get_chip(struct fwnode_handle *fwnode)
-{
-	const struct software_node *chip_node;
-	struct gpio_chip *chip;
-
-	chip_node = to_software_node(fwnode);
-	if (!chip_node || !chip_node->name)
+	gdev_node = to_software_node(fwnode);
+	if (!gdev_node || !gdev_node->name)
 		return ERR_PTR(-EINVAL);
 
-	chip = gpiochip_find((void *)chip_node->name, swnode_gpiochip_match_name);
-	return chip ?: ERR_PTR(-EPROBE_DEFER);
+	gdev = gpio_device_find_by_label((void *)gdev_node->name);
+	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }
 
 struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 				   const char *con_id, unsigned int idx,
 				   unsigned long *flags)
 {
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
 	const struct software_node *swnode;
 	struct fwnode_reference_args args;
-	struct gpio_chip *chip;
 	struct gpio_desc *desc;
 	char propname[32]; /* 32 is max size of property name */
 	int error;
@@ -77,12 +72,16 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 		return ERR_PTR(error);
 	}
 
-	chip = swnode_get_chip(args.fwnode);
+	gdev = swnode_get_gpio_device(args.fwnode);
 	fwnode_handle_put(args.fwnode);
-	if (IS_ERR(chip))
-		return ERR_CAST(chip);
+	if (IS_ERR(gdev))
+		return ERR_CAST(gdev);
 
-	desc = gpiochip_get_desc(chip, args.args[0]);
+	/*
+	 * FIXME: The GPIO device reference is put at return but the descriptor
+	 * is passed on. Find a proper solution.
+	 */
+	desc = gpio_device_get_desc(gdev, args.args[0]);
 	*flags = args.args[1]; /* We expect native GPIO flags */
 
 	pr_debug("%s: parsed '%s' property of node '%pfwP[%d]' - status (%d)\n",
-- 
2.39.2

