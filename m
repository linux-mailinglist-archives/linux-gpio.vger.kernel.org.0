Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9BD4A616
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 18:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbfFRQBt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 12:01:49 -0400
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:34395 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbfFRQBs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 12:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1560873708; x=1592409708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=5dxPM2jebBBl2HqfGDgN1kkUGse4zSbBuv7sLIXFwD0=;
  b=YT6nFSrNBaKjQ2G7yo9v4DyZ1N0WiyDEM2MNdp2VK55taAqd9c88eLv5
   a7bCwgz3Y7ARU13dbxhWHMBwuobDDcDQQNgIRgB9sO6cAB/RTUc+roJ1Q
   +KRnE7v3zKpGgdfFWux6rOtUBnidPe4tUMhgTUwifyuGlpH3qLvYqZtn4
   w=;
X-IronPort-AV: E=Sophos;i="5.62,389,1554768000"; 
   d="scan'208";a="811117649"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.22.34])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 18 Jun 2019 16:01:45 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS id CED09A2373;
        Tue, 18 Jun 2019 16:01:40 +0000 (UTC)
Received: from EX13D21UWB001.ant.amazon.com (10.43.161.108) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Jun 2019 16:01:22 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D21UWB001.ant.amazon.com (10.43.161.108) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Jun 2019 16:01:22 +0000
Received: from 8c859006a84e.ant.amazon.com (172.26.203.28) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 18 Jun 2019 16:01:20 +0000
From:   <alpawi@amazon.com>
CC:     Benjamin Herrenschmidt <benh@amazon.com>,
        Patrick Williams <alpawi@amazon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] pinctrl: armada-37xx: fix control of pins 32 and up
Date:   Tue, 18 Jun 2019 11:01:05 -0500
Message-ID: <20190618160105.26343-3-alpawi@amazon.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20190618160105.26343-1-alpawi@amazon.com>
References: <20190618160105.26343-1-alpawi@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Patrick Williams <alpawi@amazon.com>

The 37xx configuration registers are only 32 bits long, so
pins 32-35 spill over into the next register.  The calculation
for the register address was done, but the bitmask was not, so
any configuration to pin 32 or above resulted in a bitmask that
overflowed and performed no action.

Fix the register / offset calculation to also adjust the offset.

Signed-off-by: Patrick Williams <alpawi@amazon.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 00598b6f5c2a..82c980c5cccd 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -221,11 +221,11 @@ static const struct armada_37xx_pin_data armada_37xx_pin_sb = {
 };
 
 static inline void armada_37xx_calc_reg_offset(unsigned int *reg,
-					       unsigned int offset)
+					       unsigned int *offset)
 {
 	/* We never have more than 2 registers */
-	if (offset >= GPIO_PER_REG) {
-		offset -= GPIO_PER_REG;
+	if (*offset >= GPIO_PER_REG) {
+		*offset -= GPIO_PER_REG;
 		*reg += sizeof(u32);
 	}
 }
@@ -376,7 +376,7 @@ static inline void armada_37xx_irq_update_reg(unsigned int *reg,
 {
 	int offset = irqd_to_hwirq(d);
 
-	armada_37xx_calc_reg_offset(reg, offset);
+	armada_37xx_calc_reg_offset(reg, &offset);
 }
 
 static int armada_37xx_gpio_direction_input(struct gpio_chip *chip,
@@ -386,7 +386,7 @@ static int armada_37xx_gpio_direction_input(struct gpio_chip *chip,
 	unsigned int reg = OUTPUT_EN;
 	unsigned int mask;
 
-	armada_37xx_calc_reg_offset(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, &offset);
 	mask = BIT(offset);
 
 	return regmap_update_bits(info->regmap, reg, mask, 0);
@@ -399,7 +399,7 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
 	unsigned int reg = OUTPUT_EN;
 	unsigned int val, mask;
 
-	armada_37xx_calc_reg_offset(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, &offset);
 	mask = BIT(offset);
 	regmap_read(info->regmap, reg, &val);
 
@@ -413,7 +413,7 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	unsigned int reg = OUTPUT_EN;
 	unsigned int mask, val, ret;
 
-	armada_37xx_calc_reg_offset(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, &offset);
 	mask = BIT(offset);
 
 	ret = regmap_update_bits(info->regmap, reg, mask, mask);
@@ -434,7 +434,7 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	unsigned int reg = INPUT_VAL;
 	unsigned int val, mask;
 
-	armada_37xx_calc_reg_offset(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, &offset);
 	mask = BIT(offset);
 
 	regmap_read(info->regmap, reg, &val);
@@ -449,7 +449,7 @@ static void armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	unsigned int reg = OUTPUT_VAL;
 	unsigned int mask, val;
 
-	armada_37xx_calc_reg_offset(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, &offset);
 	mask = BIT(offset);
 	val = value ? mask : 0;
 
-- 
2.17.2 (Apple Git-113)

