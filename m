Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D479133F2CD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhCQOiX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbhCQOiJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:09 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BF3C06174A;
        Wed, 17 Mar 2021 07:38:08 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id g25so1641081wmh.0;
        Wed, 17 Mar 2021 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C0TvtEEP48Zgzs74E4VbkJs6YSKaxZPIWYY6W83ftUM=;
        b=OrWVI3sg1uH8iX4kit/E2ktQ0i6Wb+3hNhcTrcP/9T0jOeESaG++L313WgIEapSgjc
         gQ8XDi6QkoFCu1ywUUkvx4/fj9qQry25K09TvQXmbsliPRkdDbwPjeauVdUuzmFoVhNu
         n2wPBrx1BdBdeywqIt2a49VBGcuaMQHuT+QayUBfpmPDNkJ6Dtz1PCv5sk263i42R5HK
         mi1zwYTw+XA++jzpFXI1BfGpcETozJmnF4lS9yaoyuovk0VhBGanclLiJ2mi+a+FmGIm
         +zN7TiEQ47YqUptoBAHVQEIj6ldOhvrLKG1iZ6if6DwAFv9y3su5ZP5oVPgXs633B0FT
         FJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0TvtEEP48Zgzs74E4VbkJs6YSKaxZPIWYY6W83ftUM=;
        b=I0WwebhP5DRSKTNufgJxiKfnk9tmMl1mTFKrnuQqq+E8JeKlFSTju1HLEQJ30pcKOD
         Z1bAILjm2BhueeK8k3aSSk1EPDtTkXmqYCmzo4Fe+l7fWWrvOIQAGXcrFJ4OnqPNMIM5
         opn2fAmVTJEYitF3OnosX2G1IMi4So7QJRsHEa2mNpAISmhofMObhb0UVOSXgumcyw9M
         TDJwVYfIYC0ELRQ34E/ttfQtXKt0b032oHxF3h1DTwIZRzjVx9VD9av1zb8vzWSOGS8y
         3kePdtG4Ls/XpP0PugmRS9Xg+YKmyRjwQGPAyH+UjUTSU3WDWoz6oCcME52UkogHgaz4
         7SUA==
X-Gm-Message-State: AOAM532haZMlSTG4pmofLXbk1Xv204T+8PZxo3rto5EbNw0qsrmZdfJI
        hL645o3vPs3wcqvN8esYuJI=
X-Google-Smtp-Source: ABdhPJzbQHAySX1aqpq881n9VhSrbcA+iAz5agaJa1A7+7oS1ePqto52QZGX28Z7OLXvoKF23hYapg==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr3945391wmj.54.1615991887560;
        Wed, 17 Mar 2021 07:38:07 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:07 -0700 (PDT)
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
Subject: [PATCH v8 02/22] gpio: regmap: set gpio_chip of_node
Date:   Wed, 17 Mar 2021 15:37:43 +0100
Message-Id: <20210317143803.26127-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
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
 v8: no changes
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

