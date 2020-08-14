Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62967244819
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 12:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHNKcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Aug 2020 06:32:06 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:46758 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726012AbgHNKcF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Aug 2020 06:32:05 -0400
Received: from [188.210.212.0] (helo=localhost.localdomain)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1k6WZD-000572-7J; Fri, 14 Aug 2020 11:04:07 +0100
From:   Thomas Preston <thomas.preston@codethink.co.uk>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     thomas.preston@codethink.co.uk
Subject: [PATCH 2/3] pinctrl: mcp23s08: Remove interrupt-controller
Date:   Fri, 14 Aug 2020 11:03:56 +0100
Message-Id: <20200814100357.209340-3-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The mcp23s08 device and friends are interrupt /client/ nodes, and should
not reference the interrupt controller device tree property
"interrupt-controller" [0].

Fix the mcp23s08 driver so that it activates interrupts when it detects
the "interrupts" property instead, which is always present if we want
interrupts enabled.

[0] Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 7 +++----
 drivers/pinctrl/pinctrl-mcp23s08.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 0138638276e7..ac8926985c28 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -566,9 +566,8 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (ret < 0)
 		goto fail;
 
-	mcp->irq_controller =
-		device_property_read_bool(dev, "interrupt-controller");
-	if (mcp->irq && mcp->irq_controller) {
+	mcp->irq_enabled = device_property_present(dev, "interrupts");
+	if (mcp->irq && mcp->irq_enabled) {
 		mcp->irq_active_high =
 			device_property_read_bool(dev,
 					      "microchip,irq-active-high");
@@ -601,7 +600,7 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	if (mcp->irq && mcp->irq_controller) {
+	if (mcp->irq && mcp->irq_enabled) {
 		struct gpio_irq_chip *girq = &mcp->chip.irq;
 
 		girq->chip = &mcp->irq_chip;
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.h b/drivers/pinctrl/pinctrl-mcp23s08.h
index 90dc27081a3c..1aa9b11780fc 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.h
+++ b/drivers/pinctrl/pinctrl-mcp23s08.h
@@ -30,7 +30,7 @@ struct mcp23s08 {
 	u16			irq_rise;
 	u16			irq_fall;
 	int			irq;
-	bool			irq_controller;
+	bool			irq_enabled;
 	int			cached_gpio;
 	/* lock protects regmap access with bypass/cache flags */
 	struct mutex		lock;
-- 
2.26.2

