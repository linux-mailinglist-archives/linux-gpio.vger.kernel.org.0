Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E974D7BB6F7
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 13:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbjJFLwA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 07:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjJFLv7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 07:51:59 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1141CE
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 04:51:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so2609391e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 04:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696593116; x=1697197916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9Fu9pZwHvbe3yOhUi4vBaHVRbGW0hT6b2oIce4vCFM=;
        b=j25lHW8tVld5f1597X5nkczjlroK+lMkJQ+S1vZSb16XXofGD3q5Fg6UF/vUaMIsQ1
         5kt3eQ7EsMY2h+YEpj1JriY5s6qPzcmf7OmW0ZTVfD2whR8J9A1kMo8GDz9lJ/NDZOOa
         P8sKxKWcss1OAGHKNLnir0TM46VUOAy+O6ByzUpOVDrpcf4wyIOrjwhTKDpbC09Zcwn+
         d5NnmbxTcdQNXtJMIkX7reqGGQK/PkLMYZikvnXpwom8kSICGsEDNaX3M+NIcSsCS3ry
         J54BAD1K5SoWEp1dAG1NJMBmTynj0m+HPdaU/V3A4GMheiF70KEdl6eYv3KqaDYm/vRK
         dFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696593116; x=1697197916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9Fu9pZwHvbe3yOhUi4vBaHVRbGW0hT6b2oIce4vCFM=;
        b=jJ2U857hHmisVD7NrNg8WYvK4uLxbCj76kkh1LC1e7rMjjV3ry/8R11j/bCWIMAPJB
         n5+dquwxl5TdjA+gQ+fQU4qVQB2zzr2V4fX2nspG30xOCHv2jFnyasTIf2Pmirs2Flud
         RGazvLsJRyUpQl71t1cQwxYmXU/5zXMjzzwY8wBjajuWZa+via7GWjDDtiQEr/+r/+2s
         HewGnC8HWkuJOYLmiv6WDcq+wxc7DNbuypK3lKsueYcNK6GJ7qlg/SVBziUlwX5CVyVi
         sA1o/Zqezi0OiRTAuBQfnGR2ENh4B+OrmsuCsu58FSzfzHLB+77jH04Y/bBEyYKh21Fk
         C9wg==
X-Gm-Message-State: AOJu0Yw0y5dgYpjQbNLY0pkn8P1E1WJUjcd1bi1/Wv149Tkhyu98tisY
        lrEW5cyPNbrNIzGnupiqVS9zGQ==
X-Google-Smtp-Source: AGHT+IFPR4swyIG+AUk+8DPiEdgxLmGYVlZGtc6867/z5zYIXVDN33m77/cCvbJar1vXIuxQGf6I/Q==
X-Received: by 2002:a05:6512:3488:b0:503:a76:4eeb with SMTP id v8-20020a056512348800b005030a764eebmr6317894lfr.16.1696593115805;
        Fri, 06 Oct 2023 04:51:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8160:8fdc:c61c:a0a6])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b004063d8b43e7sm5834057wmd.48.2023.10.06.04.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 04:51:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dipen Patel <dipenp@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC/RFT PATCH] gpiolib: reverse-assign the fwnode to struct gpio_chip
Date:   Fri,  6 Oct 2023 13:51:47 +0200
Message-Id: <20231006115147.18559-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip is not only used to carry the information needed to
set-up a GPIO device but is also used in all GPIOLIB callbacks and is
passed to the matching functions of lookup helpers.

In that last case, it is currently impossible to match a GPIO device by
fwnode unless it was explicitly assigned to the chip in the provider
code. If the fwnode is taken from the parent device, the pointer in
struct gpio_chip will remain NULL.

If we have a parent device but gc->fwnode was not assigned by the
provider, let's assign it ourselves so that lookup by fwnode can work in
all cases.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This is something that Dipen reported with one of the tegra drivers where
a GPIO lookup by fwnode does not work because the fwnode pointer in struct
gpio_chip is NULL. This patch addresses this use-case.

 drivers/gpio/gpiolib.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 191f9c87b4d0..a0e3d255fb73 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -782,6 +782,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *lock_key,
 			       struct lock_class_key *request_key)
 {
+	struct fwnode_handle *parent_fwnode;
 	struct gpio_device *gdev;
 	unsigned long flags;
 	unsigned int i;
@@ -806,10 +807,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * If the calling driver did not initialize firmware node,
 	 * do it here using the parent device, if any.
 	 */
-	if (gc->fwnode)
+	if (gc->fwnode) {
 		device_set_node(&gdev->dev, gc->fwnode);
-	else if (gc->parent)
-		device_set_node(&gdev->dev, dev_fwnode(gc->parent));
+	} else if (gc->parent) {
+		parent_fwnode = dev_fwnode(gc->parent);
+		device_set_node(&gdev->dev, parent_fwnode);
+		gc->fwnode = parent_fwnode;
+	}
 
 	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (gdev->id < 0) {
-- 
2.39.2

