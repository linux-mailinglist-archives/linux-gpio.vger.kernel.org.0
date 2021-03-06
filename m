Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7328D32FB89
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 16:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhCFP5r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 10:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhCFP5R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 10:57:17 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1DEC06174A;
        Sat,  6 Mar 2021 07:57:16 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id w11so5930636wrr.10;
        Sat, 06 Mar 2021 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i2/CD8od2LVeeQI8j9cSShPFvLURIkZli5+jweOumGs=;
        b=BC8UnkuuvYHiJYmTRuzg2weD9srUtY6Pj3ykzemMW7rA1pcoDHbmTMeM3FGJugFbHZ
         Vs7DMi6gchiknFBReddn2WSuMXt6DmCo+wViu+nHnLr0Abos3Jo+SmQMoPws0pT/lmVT
         NM46VbWhLqEgEYtMv8zoEsZfpqR7fJjyMVuT0DC4z084RDMkd5nYZ/jZ0ce0IWLilORq
         XeTxn+5zPRq9/7MNR6cTP4d+p1ArYXLCLgPTY/CqqX7HzO6P6UueM3miCAhRCmQt+/Es
         4w4B037kd8hs5rBe3XUEQW3ki+BMK+VsBxNuNpvPcbRmDPRJPUYmntp19vjQLG3UO7/z
         3UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i2/CD8od2LVeeQI8j9cSShPFvLURIkZli5+jweOumGs=;
        b=fr6bmT+MTiOoG7ajNTgDpaQe/gAVBfoGYgwFDowwCGYAjB4WVj8g/ABGvlUO5GaJGT
         hFBUK4E9FE51hvWlHsJ2b6zNsU5SrnFk+SnP59vfgkKuC64sFrBK4vXYBjJKD2rNUYhA
         UqtVzWH9CDFbrOu06SHBsW6yttU/ri+llcNcoN11ZPMj5tzARrxbISwWDRQJdUIYHHRw
         VEsadf2wuHq8hkaZCoOxacZdETbGwraCtkly40tyZN56q3UmnT35gZk6j+icmGdL+wXv
         2Wj4uhnjkd3GpIdsYwaKhtx33a0RLFa1bzyrmLk7o3gSV5MupW/DxUq+X7W6HItN8q2A
         xOfQ==
X-Gm-Message-State: AOAM530/5QxyhUTSXichd+hxPRZK0Q/L2HX3kaNTGM1vqBJWFAXpq5sC
        Ru05NU0P/mjg4do9yGoDQIk=
X-Google-Smtp-Source: ABdhPJwL/h4+/NswiGP/6Nf6hKisVVxQU4suYN1jE/z2P769HUCaRenm5PODvzOxjGIOxJO6wTi5xw==
X-Received: by 2002:a5d:6a86:: with SMTP id s6mr15070069wru.307.1615046235687;
        Sat, 06 Mar 2021 07:57:15 -0800 (PST)
Received: from skynet.lan (224.red-2-138-103.dynamicip.rima-tde.net. [2.138.103.224])
        by smtp.gmail.com with ESMTPSA id p6sm9315188wru.2.2021.03.06.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:57:15 -0800 (PST)
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
Subject: [PATCH v5 02/15] gpio: regmap: set gpio_chip of_node
Date:   Sat,  6 Mar 2021 16:56:59 +0100
Message-Id: <20210306155712.4298-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306155712.4298-1-noltari@gmail.com>
References: <20210306155712.4298-1-noltari@gmail.com>
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
 v5: switch to fwnode
 v4: fix documentation
 v3: introduce patch needed for properly parsing gpio-range

 drivers/gpio/gpio-regmap.c  | 4 ++++
 include/linux/gpio/regmap.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 5412cb3b0b2a..626433934d69 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -249,6 +249,10 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
+	if (config->fwnode)
+		chip->of_node = to_of_node(config->fwnode);
+	else
+		chip->of_node = dev_of_node(config->parent);
 	chip->base = -1;
 	chip->ngpio = config->ngpio;
 	chip->names = config->names;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index ad76f3d0a6ba..c12e8d1d171b 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -4,6 +4,7 @@
 #define _LINUX_GPIO_REGMAP_H
 
 struct device;
+struct fwnode_handle;
 struct gpio_regmap;
 struct irq_domain;
 struct regmap;
@@ -16,6 +17,7 @@ struct regmap;
  * @parent:		The parent device
  * @regmap:		The regmap used to access the registers
  *			given, the name of the device is used
+ * @fwnode:		(Optional) The firmware node
  * @label:		(Optional) Descriptive name for GPIO controller.
  *			If not given, the name of the device is used.
  * @ngpio:		Number of GPIOs
@@ -57,6 +59,7 @@ struct regmap;
 struct gpio_regmap_config {
 	struct device *parent;
 	struct regmap *regmap;
+	struct fwnode_handle *fwnode;
 
 	const char *label;
 	int ngpio;
-- 
2.20.1

