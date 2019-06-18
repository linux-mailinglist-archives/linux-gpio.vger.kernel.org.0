Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACB84A60D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 18:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbfFRQB0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 12:01:26 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:26691 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729563AbfFRQBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 12:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1560873685; x=1592409685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=5D1InVqe8HFg9rHcH4d9F3uig3vBIGfWCBEB8Dy5q08=;
  b=ZU8HnA7vfmQBAuFpMj6UGKxdg/phOi3S1zT9069ek2KowTtpP4JBWeFc
   SOQPWf61KmB6qXx9eNI8bFk8vbF/8jHokEvQ4PmgCSHU9QdZJGhc9ee5N
   7TVEQ+QjtLYZdZ0p5s2njB+MoBxTJW3hjRAsBnmwkx82OPntKl9E/aUNK
   M=;
X-IronPort-AV: E=Sophos;i="5.62,389,1554768000"; 
   d="scan'208";a="401230186"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 18 Jun 2019 16:01:23 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS id 05422C06EB;
        Tue, 18 Jun 2019 16:01:20 +0000 (UTC)
Received: from EX13D02UWB003.ant.amazon.com (10.43.161.48) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Jun 2019 16:01:20 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D02UWB003.ant.amazon.com (10.43.161.48) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Jun 2019 16:01:20 +0000
Received: from 8c859006a84e.ant.amazon.com (172.26.203.28) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 18 Jun 2019 16:01:18 +0000
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
Subject: [PATCH 1/2] pinctrl: armada-37xx: rename reg-offset function
Date:   Tue, 18 Jun 2019 11:01:04 -0500
Message-ID: <20190618160105.26343-2-alpawi@amazon.com>
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

The previously named function 'armada_37xx_update_reg'
implies that it updates the hardware register, but it
only calculates a register offset.  Rename to match
functionality.

Signed-off-by: Patrick Williams <alpawi@amazon.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 6462d3ca7ceb..00598b6f5c2a 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -220,8 +220,8 @@ static const struct armada_37xx_pin_data armada_37xx_pin_sb = {
 	.ngroups = ARRAY_SIZE(armada_37xx_sb_groups),
 };
 
-static inline void armada_37xx_update_reg(unsigned int *reg,
-					  unsigned int offset)
+static inline void armada_37xx_calc_reg_offset(unsigned int *reg,
+					       unsigned int offset)
 {
 	/* We never have more than 2 registers */
 	if (offset >= GPIO_PER_REG) {
@@ -376,7 +376,7 @@ static inline void armada_37xx_irq_update_reg(unsigned int *reg,
 {
 	int offset = irqd_to_hwirq(d);
 
-	armada_37xx_update_reg(reg, offset);
+	armada_37xx_calc_reg_offset(reg, offset);
 }
 
 static int armada_37xx_gpio_direction_input(struct gpio_chip *chip,
@@ -386,7 +386,7 @@ static int armada_37xx_gpio_direction_input(struct gpio_chip *chip,
 	unsigned int reg = OUTPUT_EN;
 	unsigned int mask;
 
-	armada_37xx_update_reg(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, offset);
 	mask = BIT(offset);
 
 	return regmap_update_bits(info->regmap, reg, mask, 0);
@@ -399,7 +399,7 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
 	unsigned int reg = OUTPUT_EN;
 	unsigned int val, mask;
 
-	armada_37xx_update_reg(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, offset);
 	mask = BIT(offset);
 	regmap_read(info->regmap, reg, &val);
 
@@ -413,7 +413,7 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	unsigned int reg = OUTPUT_EN;
 	unsigned int mask, val, ret;
 
-	armada_37xx_update_reg(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, offset);
 	mask = BIT(offset);
 
 	ret = regmap_update_bits(info->regmap, reg, mask, mask);
@@ -434,7 +434,7 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	unsigned int reg = INPUT_VAL;
 	unsigned int val, mask;
 
-	armada_37xx_update_reg(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, offset);
 	mask = BIT(offset);
 
 	regmap_read(info->regmap, reg, &val);
@@ -449,7 +449,7 @@ static void armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	unsigned int reg = OUTPUT_VAL;
 	unsigned int mask, val;
 
-	armada_37xx_update_reg(&reg, offset);
+	armada_37xx_calc_reg_offset(&reg, offset);
 	mask = BIT(offset);
 	val = value ? mask : 0;
 
-- 
2.17.2 (Apple Git-113)

