Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3531B25FD35
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 17:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730119AbgIGPct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 11:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730088AbgIGPcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 11:32:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33FDEC061573
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 08:32:33 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1kFJ8A-0003iH-L1; Mon, 07 Sep 2020 17:32:30 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1kFJ89-0000sv-Jp; Mon, 07 Sep 2020 17:32:29 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Thorsten Scherer <t.scherer@eckelmann.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     tglx@linutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpio: siox: explicitly support only threaded irqs
Date:   Mon,  7 Sep 2020 17:31:35 +0200
Message-Id: <20200907153135.3307-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio-siox driver uses handle_nested_irq() to implement its
interrupt support. This is only capable of handling threaded irq
actions. For a hardirq action it triggers a NULL pointer oops.
(It calls action->thread_fn which is NULL then.)

Prevent registration of a hardirq action by setting
gpio_irq_chip::threaded to true.

Cc: u.kleine-koenig@pengutronix.de
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  reworded commit message (Uwe)
---
 drivers/gpio/gpio-siox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 26e1fe092304..f8c5e9fc4bac 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -245,6 +245,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	girq->chip = &ddata->ichip;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
+	girq->threaded = true;
 
 	ret = devm_gpiochip_add_data(dev, &ddata->gchip, NULL);
 	if (ret)
-- 
2.28.0

