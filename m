Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE422D5430
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 07:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387520AbgLJGvM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 01:51:12 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:33427 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730364AbgLJGvC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 01:51:02 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 0BA6lCla046149;
        Thu, 10 Dec 2020 14:47:12 +0800 (GMT-8)
        (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Dec
 2020 14:50:07 +0800
From:   Troy Lee <troy_lee@aspeedtech.com>
To:     <openbmc@lists.ozlabs.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <leetroy@gmail.com>, <troy_lee@aspeedtech.com>,
        <ryan_chen@aspeedtech.com>, <chiawei_wang@aspeedtech.com>
Subject: [PATCH] gpio: aspeed: Lock GPIO pin used as IRQ
Date:   Thu, 10 Dec 2020 14:50:13 +0800
Message-ID: <20201210065013.29348-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0BA6lCla046149
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO pins can be used as IRQ indicators. When they do,
those pins should be flaged with locks to avoid kernel
warning message.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index b966f5e28ebf..f5b3e1d89fbf 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -651,6 +651,13 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 		aspeed_gpio_copro_release(gpio, offset);
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
+	rc = gpiochip_lock_as_irq(&gpio->chip, d->hwirq);
+	if (rc) {
+		dev_err(gpio->chip.parent, "unable to lock GPIO %lu as IRQ\n",
+			d->hwirq);
+		return rc;
+	}
+
 	irq_set_handler_locked(d, handler);
 
 	return 0;
-- 
2.17.1

