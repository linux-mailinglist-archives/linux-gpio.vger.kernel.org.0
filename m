Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44985333CED
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 13:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhCJMze (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 07:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbhCJMzK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 07:55:10 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB562C061760;
        Wed, 10 Mar 2021 04:55:09 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id w11so23209810wrr.10;
        Wed, 10 Mar 2021 04:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PAJAtWRkOAd1GAbdY1wbENWkeMEKWY/41w1iBmNjTLI=;
        b=cazss+i4tQDmShbLOPgzyz+hTJ+DcsxQmLGpcenNbyn+nRyLZgYb4FEX6eQ6iH1sms
         6WuV1tFBGn3TJNXpphOQy5OZIp4fIJKNwV/bVwtjqz90sUs0N9aysxJ0mQeL462kRwoC
         jA5zJ8esGY4/t+V7r/PVR473ZtnppYJZCJMynJJZAxApOskbL9t/L2su9ZXAuwYNOK07
         HlTBNx77fR5yTUUG0bf8L2g/MXYuVU25HjSZjTnvIzZZFMHsDIhQb+db1Mfa875+XLvF
         UaOMY0XGlABF98uaGNIdDJUhZCVilazp+oVyT/GdFbyVJa5c5eLUixMkeqWYhQetm27i
         vF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PAJAtWRkOAd1GAbdY1wbENWkeMEKWY/41w1iBmNjTLI=;
        b=rWVKHy08cWhVeJKegYA0MXF9I5/F4Gax47AC0SuPK5CAHuh2HJ+VyZi5VXu5mNx9ae
         7oZc1anHgtxvDi3xoDTIFv0JuZ2x/mRd8O4R9Y0tlu4hG0Q5mf6hEgCq/Ogxqg13cipX
         EG6TZU0Yzi+jHciwyOG0XYw6WQmjAyecOLsBxtxR1fA4PpKKvJ4vvI8Ze+Pzhlrw8fgS
         lzFCCRLEsZSAm7Ahf7v4l/WhYlThSaRGysuK7b/rkN1yH82jVUO+FFnzwV/hbmq/WH7i
         oC50EzKazeBfWuRnXsEgS3F42IPToc8/lK3HIulcQTnzie6us48cYuz4jaUz4JEUOdpe
         c9xg==
X-Gm-Message-State: AOAM532b4ucH2yP0+UCnsoyKcYL3UXG4sr3lOlM3kcsw/V15Jyag78cz
        xIf6U1YXVU1i5DRU/jnjibs=
X-Google-Smtp-Source: ABdhPJzxO4akgYd8HXWjCFx0nCm0awc9dI0zGCOnlB0OxUCYnUMZ+9e8/904IpOxNxHlkV+9J9pf6A==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr3328286wrw.367.1615380908661;
        Wed, 10 Mar 2021 04:55:08 -0800 (PST)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v6sm29403398wrx.32.2021.03.10.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:55:08 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 02/15] gpio: regmap: set gpio_chip of_node
Date:   Wed, 10 Mar 2021 13:54:50 +0100
Message-Id: <20210310125504.31886-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310125504.31886-1-noltari@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is needed for properly registering GPIO regmap as a child of a regmap
pin controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 v6: add comment and simplify of_node assignment
 v5: switch to fwnode
 v4: fix documentation
 v3: introduce patch needed for properly parsing gpio-range

 drivers/gpio/gpio-regmap.c  | 1 +
 include/linux/gpio/regmap.h | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 5412cb3b0b2a..d4fc656e70b0 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
+	chip->of_node = to_of_node(config->fwnode);
 	chip->base = -1;
 	chip->ngpio = config->ngpio;
 	chip->names = config->names;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index ad76f3d0a6ba..334dd928042b 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -4,6 +4,7 @@
 #define _LINUX_GPIO_REGMAP_H
 
 struct device;
+struct fwnode_handle;
 struct gpio_regmap;
 struct irq_domain;
 struct regmap;
@@ -16,6 +17,8 @@ struct regmap;
  * @parent:		The parent device
  * @regmap:		The regmap used to access the registers
  *			given, the name of the device is used
+ * @fwnode:		(Optional) The firmware node.
+ *			If not given, the fwnode of the parent is used.
  * @label:		(Optional) Descriptive name for GPIO controller.
  *			If not given, the name of the device is used.
  * @ngpio:		Number of GPIOs
@@ -57,6 +60,7 @@ struct regmap;
 struct gpio_regmap_config {
 	struct device *parent;
 	struct regmap *regmap;
+	struct fwnode_handle *fwnode;
 
 	const char *label;
 	int ngpio;
-- 
2.20.1

