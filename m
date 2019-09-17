Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 942B1B4C6E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 12:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfIQK7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 06:59:09 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57071 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfIQK7I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 06:59:08 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iABCK-0006HM-Uq; Tue, 17 Sep 2019 12:59:04 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iABCK-0000Nw-Hg; Tue, 17 Sep 2019 12:59:04 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, support.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/3] mfd: da9062: add support for the DA9062 GPIOs in the core
Date:   Tue, 17 Sep 2019 12:59:01 +0200
Message-Id: <20190917105902.445-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917105902.445-1-m.felsch@pengutronix.de>
References: <20190917105902.445-1-m.felsch@pengutronix.de>
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

