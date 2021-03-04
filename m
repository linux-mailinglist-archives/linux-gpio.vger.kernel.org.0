Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5698832CEFE
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236954AbhCDI6G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236972AbhCDI55 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:57:57 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696E0C06175F;
        Thu,  4 Mar 2021 00:57:17 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id i9so7313623wml.0;
        Thu, 04 Mar 2021 00:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E9tYG5sQpt2PxFnt3/G3HRCcKTojRNxY1UpckrJvdZU=;
        b=dv5O19c02XYvno7CjRrWVr4T9RKmM6f5XLDVahZm/T+22AVCQGLXd2Etlg3m6j3Ji/
         Fet04yWwPwMc4vewUcpJQMio/k+4wY3jZyDuEw28TESuwDhbtmXIdJFYd0ylK0B2j8Qx
         gliSYuh0V/Huu+HPA72TXh7KdnqanRspyhTbEPeFWq84puJXiQftcs7m7eu+pdYsE/2D
         lIv0A1X/ajoa2zKQIGOyIaeD5JiU+MbbRWGC8qf+YVtnxGatTPrlXFCNwfsirhnme2Fe
         hvr4jpPfhYWYcvduuVbVikmX4TJZJu4ighX0/CNriObH6hMRTHVACWF9a5UjuqEKG5KB
         E3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E9tYG5sQpt2PxFnt3/G3HRCcKTojRNxY1UpckrJvdZU=;
        b=fgWCx/uNVOxpZcpFsXk9q+RkYUQq2wu7P1orCMUSW64gzPALyGrUPGDrItHlJjPRxN
         EZAxuDNM1j4PDIWcywxWbW6ErDX7ZlNAGQcKXXqm7hYfhEUHGe/GODpsHW7uOJOr0kAk
         p0qU7PhHc/XfR+1g7RVzhdeiRklcmwgoZnVgTkiK7FMAUrhSpftVuSlMwhPhrhD0vnuo
         /oB9oVQKByW0PqzGUsHeeDAqJiDQppRbQKEQ2gfsO05ezKWP1mQ8VlLC91RWUeruO6Qj
         6f2mCuxyHXJjy0D9bDFGlfxlg05pnH6SYOMH1rbVmzJyKUObJs0aPplZ0Ec9GlpCZAP2
         UdLg==
X-Gm-Message-State: AOAM531HTrGSVG/gw4rOqsWy262t7LULfChzyIs2tO4/zKP5oTH2WoWf
        qJeiVskjPvE00tF99IGCpmE=
X-Google-Smtp-Source: ABdhPJzXVGVsVnspZcI6+3UBOmTI2LvrmNpSzAeX/D6htwS6MlR3CnIEAaxqi2kaxwl6k76c4fmIug==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id l12mr2791652wmq.16.1614848236185;
        Thu, 04 Mar 2021 00:57:16 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm2828976wrx.56.2021.03.04.00.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:57:15 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
Date:   Thu,  4 Mar 2021 09:56:57 +0100
Message-Id: <20210304085710.7128-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304085710.7128-1-noltari@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is needed for properly registering gpio regmap as a child of a regmap
pin controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 v4: fix documentation
 v3: introduce patch needed for properly parsing gpio-ranges

 drivers/gpio/gpio-regmap.c  | 1 +
 include/linux/gpio/regmap.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 5412cb3b0b2a..1a43a90024bb 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
+	chip->of_node = config->of_node ?: dev_of_node(config->parent);
 	chip->base = -1;
 	chip->ngpio = config->ngpio;
 	chip->names = config->names;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index ad76f3d0a6ba..73105ff830fb 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -4,6 +4,7 @@
 #define _LINUX_GPIO_REGMAP_H
 
 struct device;
+struct device_node;
 struct gpio_regmap;
 struct irq_domain;
 struct regmap;
@@ -16,6 +17,7 @@ struct regmap;
  * @parent:		The parent device
  * @regmap:		The regmap used to access the registers
  *			given, the name of the device is used
+ * @of_node:		(Optional) The device node
  * @label:		(Optional) Descriptive name for GPIO controller.
  *			If not given, the name of the device is used.
  * @ngpio:		Number of GPIOs
@@ -57,6 +59,7 @@ struct regmap;
 struct gpio_regmap_config {
 	struct device *parent;
 	struct regmap *regmap;
+	struct device_node *of_node;
 
 	const char *label;
 	int ngpio;
-- 
2.20.1

