Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EDC34734B
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236067AbhCXIUM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233088AbhCXIT3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:29 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF06C061763;
        Wed, 24 Mar 2021 01:19:28 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v11so23454492wro.7;
        Wed, 24 Mar 2021 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lFz+2D7nsBaAJ+OWvlcX4/oaiVSFj8mrftl1vqct/ok=;
        b=jBoP+CYtFmJ86y5RlfUYyT2zwAI/FDy4LPd3IfP/puTQU7zHGu963JR29S4X4LpkNJ
         9qUza5bDfIn6hDOpJ2bzF8ikXhhkgoT1x79V02YGaK816+Z2ctsQJNGcvEdCmDw75obZ
         wm/hwYKPB9e0XRmldmhx9eUsFn7ARtNPsWmQdSIJzl6pr0MFy5R37JX7tMhg3xvGg86T
         TxAM0nlElwVWzRtrV7DQlSFbRrUC4dguvGcMSwKt1e4sSmM1brz43F/LCA+QYHLdbi+0
         RFmyKNQuLwHyMkWPPqIUhaPZ+gEhtP5+BTexNTkar3SKyMEWrpJyz8ZXuTqmPfk6cOkt
         YCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lFz+2D7nsBaAJ+OWvlcX4/oaiVSFj8mrftl1vqct/ok=;
        b=OMk5yd+NPIlvXFNGXUUbjF14fXEfsaQPdhhzuBRkTomkq7s7OZO6xgmI17ie0wlsRj
         Ck4Php4lvgut9VmpjNoSAlzfztGt9vPiR7eLnm8mWIOAMu39X6/ZPvE20AWbJBXhqSqv
         A1qLlSzCzQDM4sp77BVedpidT4U93Dtsfz3E3lfk+URqi7VzzICsVXw97w5vNqSfGsDW
         2fT4QjBVTaH6vcsA7d63pcUPhmzuw+BbOxlJbNwKHMTL5pSgUZurRzbbbCAsrPKXbVd0
         HCHf5Ef6VAnZrR5bFfErFMz9fGOuwAerchOHPpIC9nRNfUEMBvxIUfJqNYWWriQNatvH
         BR1w==
X-Gm-Message-State: AOAM531IoN0OAXEtrzj+05xSz/+t8X3owhCZw7gHhPZK9pgJ0MXvnPCt
        Cd6lDyzG3NuRZ0ALK2+lIAQ=
X-Google-Smtp-Source: ABdhPJw+S3U/f/vdrr8CtSESAp0hQqhFwh05tfG4srcbCJYbM5qX7m6mwa+N4IANpknjymRdChej1w==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr2107182wrt.255.1616573967593;
        Wed, 24 Mar 2021 01:19:27 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:27 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 02/22] gpio: regmap: set gpio_chip of_node
Date:   Wed, 24 Mar 2021 09:19:03 +0100
Message-Id: <20210324081923.20379-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
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
 v9: guard of_node assignment with CONFIG_OF_GPIO
 v8: no changes
 v7: add gpio-regmap.c comment
 v6: add comment and simplify of_node assignment
 v5: switch to fwnode
 v4: fix documentation
 v3: introduce patch needed for properly parsing gpio-range

 drivers/gpio/gpio-regmap.c  | 5 +++++
 include/linux/gpio/regmap.h | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 5412cb3b0b2a..134cedf151a7 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -254,6 +254,11 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	chip->names = config->names;
 	chip->label = config->label ?: dev_name(config->parent);
 
+#if defined(CONFIG_OF_GPIO)
+	/* gpiolib will use of_node of the parent if chip->of_node is NULL */
+	chip->of_node = to_of_node(config->fwnode);
+#endif /* CONFIG_OF_GPIO */
+
 	/*
 	 * If our regmap is fast_io we should probably set can_sleep to false.
 	 * Right now, the regmap doesn't save this property, nor is there any
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

