Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE23D33B15F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhCOLmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhCOLmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:20 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335B7C061574;
        Mon, 15 Mar 2021 04:42:20 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g8so7932264wmd.4;
        Mon, 15 Mar 2021 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8p2sRr73izT3MD3Slfxb4OEVn7AXvUcs0YwW7of8/6E=;
        b=al8HSrrpctWOAl0Cok55UGPRu1EkYMKzjy4V8Yu/mydPEMhZSioCeDdO9e9Jt2Gsu/
         eH8UzTCBWspY+CEz3+x8lSCX9FlaC6FeMvTjivsSabmzfSFODY81soFBTa4WWgs+5MXO
         zk0N/mJ3HcZ7ISErJwX3rh9njHaNow847Qyy7s2lJ5FPSLD8+CnbBTbeHEi5AZVsSRpe
         SmeNzSK7MrHbRQPO0qCkfS+SORCcMw+tBlXO0n7AOFRw5Zk2+rVlljTEuvWyDF73nXMw
         dHU9s0y/FxqnYbwk/m81+2LoRQzJu0MYRxgxrcK89bKMThrHN0ji5k5Tpuqxom1gW6MF
         tS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8p2sRr73izT3MD3Slfxb4OEVn7AXvUcs0YwW7of8/6E=;
        b=evLXQgo8mOg0V+JWUprO8+zWIJAd1dU4kfSOIcWXhBLnOW15boJUP0LNJ4aD8DqLFv
         pJFkleCrybw00Hg/t3GLjweZO04dtmUpc3e28C4cknXYj6S3itR+3/zn6pmzwh5ll5x/
         J1Bn+/WehDpNgJRw8dr/1yEJYGJ5XwxaJwT91wHeg/SmwquMh2/tFE5Ut8E6efwPKe9Y
         T/5sdA/8+FIARHBPLtrbcxaGR0lrkOYFqPciyNYqXFi8jUAm+HuHmWTz4xVuw38SThFS
         WPbTdaTwocIqu8j91/B3+s2f1nnqq8h85ELteZ9B22zOe3/YrDnv5PCZ1vwayfp87kye
         6a+g==
X-Gm-Message-State: AOAM533Uo1jjf7wQe1uP4EBHeenptHrPZu+d2vzHI2wlF6ZpFRYl5nF0
        nbmu1ZE2FeDDJ5pwNi8cbPk=
X-Google-Smtp-Source: ABdhPJwyTWVEOLAJO+TLh3kueXLO11+bPQPE2bmeQFiIWusEGPtL4QMTlJ0r0VzGkLp+5FZBVRJ6bA==
X-Received: by 2002:a05:600c:2053:: with SMTP id p19mr25641528wmg.87.1615808538919;
        Mon, 15 Mar 2021 04:42:18 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:18 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/22] gpio: regmap: set gpio_chip of_node
Date:   Mon, 15 Mar 2021 12:41:54 +0100
Message-Id: <20210315114214.3096-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 v7: add gpio-regmap.c comment
 v6: add comment and simplify of_node assignment
 v5: switch to fwnode
 v4: fix documentation
 v3: introduce patch needed for properly parsing gpio-range

 drivers/gpio/gpio-regmap.c  | 2 ++
 include/linux/gpio/regmap.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 5412cb3b0b2a..2215d712da08 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -249,6 +249,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
+       /* gpiolib will use of_node of the parent if chip->of_node is NULL */
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

