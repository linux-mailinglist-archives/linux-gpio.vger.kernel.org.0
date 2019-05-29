Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BBC2E039
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 16:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfE2Ox2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 10:53:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55890 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfE2Ox2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 10:53:28 -0400
Received: by mail-wm1-f66.google.com with SMTP id u78so1890954wmu.5;
        Wed, 29 May 2019 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Eo12RsqaIZEB4DcZum/qkV+9uFDwNoVvbATba2eQvo=;
        b=QCpg0iOMU/pMoKF/WyHga2prxmzVTDoiklq49JKzhmlVe3tmicQMeqb70wJ/mgRJL9
         ImOb77i1l2DGHpcZNFGDvLH//i++mzft2OpL7TguRXGWlojAqq5Ia/TlfyhSX2cG4+zY
         w0SYYaNkX1dXdW0rNyPoEQtV0K3OQXqqmI8ZGSIw8+RpXg2zbEv4rCuIoCin45kicI0J
         kRYNAN4MpFjA61MJVtB/dQRW1XDO4e+E0F0HJBrqrmclaC5bo5FHqeepdT2bsP52qEVm
         MG9FYRRfkVQ0Wh6J3RoT0toPI9l+9NEe1RGR010LeyF1+q0Hv1LyCQvpV44meZZsYf86
         2g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Eo12RsqaIZEB4DcZum/qkV+9uFDwNoVvbATba2eQvo=;
        b=WBkBdOyoAkSS+XteCDC09L183zO6ljC2C4SQ+ZRfUgvuYW0nmmdme19wdE5ADoU7TH
         APxH4echKtZ6YoS+i4vdgMIPUYkXF/sjOljuDIrYzVUZP6MMyYM1S6LvWdGavHjzkmML
         4q727JkvyjG9O/tUvGIYDr4brYsx/6QCse6Lgm/GZpE/tT41fpooYJnwam5ss4gWo2MI
         D+HlAVO+yTxauTj9kuMjVSdtA/jugN8MOmFt0YUddis29zsVIc38i4TehEeHvIGHE9j+
         tZr0gpG+vFU3eUeO2pBdNY7MCsCty4YCxYkkK3wmVYA15M+fTpyt546cCu1vPx0svTc9
         T4AQ==
X-Gm-Message-State: APjAAAXRd4YTUKwcxuxrVhvE7Pxe1W5BdBb3rJDLnWoiTG+iuJlHdmZ4
        2nopSFCV30eKoqX7ETcCQ60=
X-Google-Smtp-Source: APXvYqy7AnAJHmbOhf67kLtaTrBe2xJBwcJXjY+OArbZSt8WSJ6+zIoWx0pdy6WlY/GLxniEmW41Cg==
X-Received: by 2002:a1c:9c42:: with SMTP id f63mr6746358wme.23.1559141606090;
        Wed, 29 May 2019 07:53:26 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id j9sm14696502wrr.90.2019.05.29.07.53.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 07:53:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Date:   Wed, 29 May 2019 16:53:21 +0200
Message-Id: <20190529145322.20630-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529145322.20630-1-thierry.reding@gmail.com>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hierarchical IRQ domains can be used to stack different IRQ controllers
on top of each other. One specific use-case where this can be useful is
if a power management controller has top-level controls for wakeup
interrupts. In such cases, the power management controller can be a
parent to other interrupt controllers and program additional registers
when an IRQ has its wake capability enabled or disabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
- add missing kerneldoc for new parent_domain field
- keep IRQ_DOMAIN dependency for clarity

Changes in v2:
- select IRQ_DOMAIN_HIERARCHY to avoid build failure
- move more code into the gpiolib core

 drivers/gpio/Kconfig        |  1 +
 drivers/gpio/gpiolib.c      | 33 +++++++++++++++++++++++++++++----
 include/linux/gpio/driver.h |  8 ++++++++
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 62f3fe06cd2f..b87cc36005d8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -45,6 +45,7 @@ config GPIO_ACPI
 
 config GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
 	bool
 
 config DEBUG_GPIO
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..6b64bfa90089 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1825,9 +1825,22 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
+	struct irq_domain *domain = chip->irq.domain;
+
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
 
+	if (irq_domain_is_hierarchy(domain)) {
+		struct irq_fwspec spec;
+
+		spec.fwnode = domain->fwnode;
+		spec.param_count = 2;
+		spec.param[0] = offset;
+		spec.param[1] = IRQ_TYPE_NONE;
+
+		return irq_create_fwspec_mapping(&spec);
+	}
+
 	return irq_create_mapping(chip->irq.domain, offset);
 }
 
@@ -1936,7 +1949,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->to_irq = gpiochip_to_irq;
+	/*
+	 * Allow GPIO chips to override the ->to_irq() if they really need to.
+	 * This should only be very rarely needed, the majority should be fine
+	 * with gpiochip_to_irq().
+	 */
+	if (!gpiochip->to_irq)
+		gpiochip->to_irq = gpiochip_to_irq;
+
 	gpiochip->irq.default_type = type;
 	gpiochip->irq.lock_key = lock_key;
 	gpiochip->irq.request_key = request_key;
@@ -1946,9 +1966,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 	else
 		ops = &gpiochip_domain_ops;
 
-	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
-						     gpiochip->irq.first,
-						     ops, gpiochip);
+	if (gpiochip->irq.parent_domain)
+		gpiochip->irq.domain = irq_domain_add_hierarchy(gpiochip->irq.parent_domain,
+								0, gpiochip->ngpio,
+								np, ops, gpiochip);
+	else
+		gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
+							     gpiochip->irq.first,
+							     ops, gpiochip);
 	if (!gpiochip->irq.domain)
 		return -EINVAL;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a1d273c96016..472f2c127bf6 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -48,6 +48,14 @@ struct gpio_irq_chip {
 	 */
 	const struct irq_domain_ops *domain_ops;
 
+	/**
+	 * @parent_domain:
+	 *
+	 * If non-NULL, will be set as the parent of this GPIO interrupt
+	 * controller's IRQ domain to establish a hierarchy.
+	 */
+	struct irq_domain *parent_domain;
+
 	/**
 	 * @handler:
 	 *
-- 
2.21.0

