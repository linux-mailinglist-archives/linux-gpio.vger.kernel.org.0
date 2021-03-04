Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FE732CE77
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236732AbhCDI3t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:29:49 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:43941 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236831AbhCDI3r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:29:47 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id EE7E32223A;
        Thu,  4 Mar 2021 09:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614846546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1j4UMCrX0AEJRJZ4Ec8Gm1WvvUQka0jywWPtTgKs8UM=;
        b=snsS6CrlVkGwIZuCH5woq3zU1CIJ+LlhjN+CY34F/goxsEN8tpRxnaUzDy4HzsGqJhdaMi
        i1hOi1DHVafCl+jryzsIccFmUTD5mhv0NnOGgDWhegmlAdiCbujxnrooCruMZ3rO8s4STb
        J6U6jUZ2REYvgXTYFfP6ZRbnKEi9X0M=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 04 Mar 2021 09:29:05 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: regmap: disable IRQ domain without GPIOLIB_IRQCHIP
In-Reply-To: <20210304070501.30942-1-noltari@gmail.com>
References: <20210304070501.30942-1-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <265ad883fee30b799fd53954876dc567@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-04 08:05, schrieb Álvaro Fernández Rojas:
> The current code doesn't check if GPIOLIB_IRQCHIP is enabled, which 
> results in
> a compilation error when trying to build gpio-regmap without having 
> selected
> CONFIG_GPIOLIB_IRQCHIP.
> 
> Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using 
> regmap")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Nice catch.

However, instead of having that ifdef, commit 6a45b0e2589f ("gpiolib:
Introduce gpiochip_irqchip_add_domain()") could be fixed. That one is
missing a stub if CONFIG_GPIOLIB_IRQCHIP is not defined.

--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -624,8 +624,16 @@ void gpiochip_irq_domain_deactivate(struct 
irq_domain *domain,
  bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
                                 unsigned int offset);

+#ifdef CONFIG_GPIOLIB_IRQCHIP
  int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
                                 struct irq_domain *domain);
+#else
+static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
+                                             struct irq_domain *domain)
+{
+       return 0;
+}
+#endif /* CONFIG_GPIOLIB_IRQCHIP */

Linus, do you agree?

-michael
