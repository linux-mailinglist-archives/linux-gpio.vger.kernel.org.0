Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80DE1E6513
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 16:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403955AbgE1O7Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 10:59:25 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:47803 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403962AbgE1O7W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 10:59:22 -0400
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 6C03F22FA7;
        Thu, 28 May 2020 16:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590677957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7np4wDKRiMQQf5ldFNBXoJfzP9Qd8PYygwxPlZayMKg=;
        b=mCN4khXktNI7x5hJbclV6LyZ1+iPcMtpLa2sPs/2NT3phaqrZGyxDrYp/zeZZyeujq4ulq
        CXOUGFUu9hwBOv+rKEQCnTY5iNSRDmZsGOKYyoPKbnbkyjVI8S6aeb6y9X6H2xgcWFlk8D
        I1r6Re7zR06q2Xu8jSolg4nZi8rZnAs=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v6 1/3] gpiolib: Introduce gpiochip_irqchip_add_domain()
Date:   Thu, 28 May 2020 16:58:43 +0200
Message-Id: <20200528145845.31436-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528145845.31436-1-michael@walle.cc>
References: <20200528145845.31436-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function connects an IRQ domain to a gpiochip and reuses
gpiochip_to_irq() which is provided by gpiolib.

gpiochip_irqchip_* and regmap_irq partially provide the same
functionality. This function will help to connect just the
minimal functionality of the gpiochip_irqchip which is needed to
work together with regmap-irq.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/gpio/gpiolib.c      | 20 ++++++++++++++++++++
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eaa0e209188d..d07f763c9c0b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2756,6 +2756,26 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gc,
 }
 EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
+/**
+ * gpiochip_irqchip_add_domain() - adds an irqdomain to a gpiochip
+ * @gc: the gpiochip to add the irqchip to
+ * @domain: the irqdomain to add to the gpiochip
+ *
+ * This function adds an IRQ domain to the gpiochip.
+ */
+int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
+				struct irq_domain *domain)
+{
+	if (!domain)
+		return -EINVAL;
+
+	gc->to_irq = gpiochip_to_irq;
+	gc->irq.domain = domain;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_domain);
+
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
 static inline int gpiochip_add_irqchip(struct gpio_chip *gc,
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 8c41ae41b6bb..ee30065b6f61 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -599,6 +599,9 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gc,
 bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
 				unsigned int offset);
 
+int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
+				struct irq_domain *domain);
+
 #ifdef CONFIG_LOCKDEP
 
 /*
-- 
2.20.1

