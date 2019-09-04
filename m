Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E26A89AB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 21:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730507AbfIDPqj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 11:46:39 -0400
Received: from Chamillionaire.breakpoint.cc ([193.142.43.52]:47808 "EHLO
        Chamillionaire.breakpoint.cc" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728165AbfIDPqj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 11:46:39 -0400
Received: from bigeasy by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <bigeasy@linutronix.de>)
        id 1i5XUN-0004ZU-Bo; Wed, 04 Sep 2019 17:46:31 +0200
Date:   Wed, 4 Sep 2019 17:46:31 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexandre Courbot <acourbot@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] gpio: Move gpiochip_.*lock_as_irq() to the proper ifdef
Message-ID: <20190904154631.kjegnsk6cf473nr6@flow>
References: <20190822031817.32888-1-yuehaibing@huawei.com>
 <CACRpkdapgDbkm3JjywtPv=5gYKQCCXzdabDumVukFv5Dn5pomA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdapgDbkm3JjywtPv=5gYKQCCXzdabDumVukFv5Dn5pomA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In a recent commit the gpiochip_.*lock_as_irq() were moved and ended up
in the wrong `ifdef' section. Now for !CONFIG_GPIOLIB the function is
defined twice leading to an compile error.

Move the extern function declaration under CONFIG_GPIOLIB, the "static
inline" version is already under !CONFIG_GPIOLIB.

Fixes: c7663fa2a6631 ("gpio: Move gpiochip_lock/unlock_as_irq to gpio/driver.h")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/gpio/driver.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b74a3bee85e5d..fb134ff20f6b2 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -702,14 +702,14 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
 void devprop_gpiochip_set_names(struct gpio_chip *chip,
 				const struct fwnode_handle *fwnode);
 
-/* lock/unlock as IRQ */
-int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
-void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
-
 #ifdef CONFIG_GPIOLIB
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
+/* lock/unlock as IRQ */
+int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
+void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
+
 #else /* CONFIG_GPIOLIB */
 
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
-- 
2.23.0

