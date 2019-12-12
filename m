Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3E211D1CB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbfLLQEX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:04:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44671 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729754AbfLLQEW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 11:04:22 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ifQwr-0003cY-KD; Thu, 12 Dec 2019 17:04:17 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ifQwr-0004LE-37; Thu, 12 Dec 2019 17:04:17 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [RESEND PATCH v3 2/3] mfd: da9062: add support for the DA9062 GPIOs in the core
Date:   Thu, 12 Dec 2019 17:04:12 +0100
Message-Id: <20191212160413.15232-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212160413.15232-1-m.felsch@pengutronix.de>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently the da9062 GPIO's aren't available. The patch adds the support
to make these available by adding a gpio device with the corresponding
irq resources. Furthermore the patch fixes a minor style issue for the
onkey device.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mfd/da9062-core.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index e69626867c26..5290bdc0ddcd 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -233,6 +233,14 @@ static struct resource da9062_onkey_resources[] = {
 	DEFINE_RES_NAMED(DA9062_IRQ_ONKEY, 1, "ONKEY", IORESOURCE_IRQ),
 };
 
+static struct resource da9062_gpio_resources[] = {
+	DEFINE_RES_NAMED(DA9062_IRQ_GPI0, 1, "GPI0", IORESOURCE_IRQ),
+	DEFINE_RES_NAMED(DA9062_IRQ_GPI1, 1, "GPI1", IORESOURCE_IRQ),
+	DEFINE_RES_NAMED(DA9062_IRQ_GPI2, 1, "GPI2", IORESOURCE_IRQ),
+	DEFINE_RES_NAMED(DA9062_IRQ_GPI3, 1, "GPI3", IORESOURCE_IRQ),
+	DEFINE_RES_NAMED(DA9062_IRQ_GPI4, 1, "GPI4", IORESOURCE_IRQ),
+};
+
 static const struct mfd_cell da9062_devs[] = {
 	{
 		.name		= "da9062-core",
@@ -266,7 +274,13 @@ static const struct mfd_cell da9062_devs[] = {
 		.name		= "da9062-onkey",
 		.num_resources	= ARRAY_SIZE(da9062_onkey_resources),
 		.resources	= da9062_onkey_resources,
-		.of_compatible = "dlg,da9062-onkey",
+		.of_compatible	= "dlg,da9062-onkey",
+	},
+	{
+		.name		= "da9062-gpio",
+		.num_resources	= ARRAY_SIZE(da9062_gpio_resources),
+		.resources	= da9062_gpio_resources,
+		.of_compatible	= "dlg,da9062-gpio",
 	},
 };
 
-- 
2.20.1

