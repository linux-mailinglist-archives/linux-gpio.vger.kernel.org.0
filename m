Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BCF32C7D5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237996AbhCDAc4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383514AbhCCOjL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 09:39:11 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CB4C06178B;
        Wed,  3 Mar 2021 06:23:14 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u14so23894048wri.3;
        Wed, 03 Mar 2021 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3k/UlbIlaZqVA1OB09fPNikh0yRBoWCfl4QqOSDPCJA=;
        b=IyI8umlfIJrjrLecHQjrTsgqdv0RFBvsDSvlq5kMzE4PB+c7pt511XuqWCvlEQQc8v
         RrSXVMxY+zU3j+pcUBwoZBMlj6gaduk2QkgHMI6qZTQM4dhjgncYltfIOIfQOEQWw0GM
         4IH7qwK1395oVYcqe/xdmm7AsH2GNbjkeFwMYO0fttmUUT/YFQZPvc2Ww9Lch4yD9HUZ
         8O+ywIec7Ihluk6xIl00LF8LtDXNAlcO0wEZh5JVmmMDFvjmujIaiWQVXQky5hOOCBvg
         oMEBXvyoexWpCNz1FCzQdI3FsZI7bxKVFMCu1cbbZ+7o88GMJSSCeUicl0Unuy/QQqqt
         oTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3k/UlbIlaZqVA1OB09fPNikh0yRBoWCfl4QqOSDPCJA=;
        b=YFK/hnneamk0KsL+mrPFh8iGJ+xZQl6wFQ4vSl4f8E0/W++HMtXhB6T265UEAccSa2
         kpEZ5xn3R8vGDYzCSAF/4bQCWnfwZhhyBYCD/eLXEBNKv3/jw5e4ONz9qbZDkCjSk9pg
         X2jIgXCU2fwwFBlr4GhzwN8+xoLjTDj95D13SVw90L1bkCRkfhwp/WzW2tE/NJldwLhH
         JcuChANaFe1q1CljDduFZxh7JQWmhzZhBs8zVyvU9sXobN6GaFjFjHYYvyDm3lxHV28c
         ixuN1mVvRNdtpkOtYVO2d0V2G3kaZFIEGlhSNNk2XUmErzuad+Z7BnsM7JJfKXhxWC5x
         8NmQ==
X-Gm-Message-State: AOAM533t0il9oVdfJIYUl8jEEd+Qy3df4nDegqOP2SgdJnvoYikfOOjn
        zSXtB4LCho71YIWVSnSRcpo=
X-Google-Smtp-Source: ABdhPJwWR/RXw7bSdoAVEod4SyUbLMqlB49UrOMNq0FbWkpnnnevxDlHdNSmaG9IRmucZH72TuEfwg==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr25619040wro.206.1614781393043;
        Wed, 03 Mar 2021 06:23:13 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b15sm7876219wmd.41.2021.03.03.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:23:12 -0800 (PST)
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
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/14] gpio: regmap: set gpio_chip of_node
Date:   Wed,  3 Mar 2021 15:22:57 +0100
Message-Id: <20210303142310.6371-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303142310.6371-1-noltari@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is needed for properly registering gpio regmap as a child of a regmap
pin controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: introduce patch needed for properly parsing gpio-ranges.

 drivers/gpio/gpio-regmap.c  | 1 +
 include/linux/gpio/regmap.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 5412cb3b0b2a..752ccd780b7d 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
+	chip->of_node = config->of_node;
 	chip->base = -1;
 	chip->ngpio = config->ngpio;
 	chip->names = config->names;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index ad76f3d0a6ba..f6e638e32d2a 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -4,6 +4,7 @@
 #define _LINUX_GPIO_REGMAP_H
 
 struct device;
+struct device_node;
 struct gpio_regmap;
 struct irq_domain;
 struct regmap;
@@ -14,6 +15,7 @@ struct regmap;
 /**
  * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
  * @parent:		The parent device
+ * @of_node:		The device node
  * @regmap:		The regmap used to access the registers
  *			given, the name of the device is used
  * @label:		(Optional) Descriptive name for GPIO controller.
@@ -56,6 +58,7 @@ struct regmap;
  */
 struct gpio_regmap_config {
 	struct device *parent;
+	struct device_node *of_node;
 	struct regmap *regmap;
 
 	const char *label;
-- 
2.20.1

