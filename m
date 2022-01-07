Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C20E4878D9
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 15:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbiAGOXx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 09:23:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22623 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230324AbiAGOXw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jan 2022 09:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641565432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vsxllOmwTqbsnBhBtlTCVau64wziBnZUhdgoXMBsAmE=;
        b=B5EBuxV3rX9vYUC49w0ZfaDZ2QPPjuZwRRmjbtHkhhj45iBaOv+9AjJyk5IuhfWBrE1twU
        3NG14LLjaUCFCGV5+ZDliXY21RKGBPYc4sRWcHpRX2zXsqcB+1S5ic50Myk939nxJN5Vhi
        NBMcfsARZ+f60GMvLqBdwyoQNLa2asY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-yEfmojSDMmq1JQavBKgPhw-1; Fri, 07 Jan 2022 09:23:47 -0500
X-MC-Unique: yEfmojSDMmq1JQavBKgPhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC9FF108088A;
        Fri,  7 Jan 2022 14:23:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.21])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 675FA7E130;
        Fri,  7 Jan 2022 14:23:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: baytrail: Clear direct_irq_en flag on broken configs
Date:   Fri,  7 Jan 2022 15:23:43 +0100
Message-Id: <20220107142343.38560-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some boards set the direct_irq_en flag in the conf0 register without
setting any of the trigger bits. The direct_irq_en flag just means that
the GPIO will send IRQs directly to the APIC instead of going through
the shared interrupt for the GPIO controller, in order for the pin to
be able to actually generate IRQs the trigger flags must still be set.

So having the direct_irq_en flag set without any trigger flags is
non-sense, log a FW_BUG warning when encountering this and clear the flag
so that a driver can actually use the pin as IRQ through gpiod_to_irq().

Specifically this allows the edt-ft5x06 touchscreen driver to use
INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
accompanied by the following new log message:

byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing

The new byt_direct_irq_sanity_check() function also checks that the
pin is actually appointed to one of the 16 direct-IRQs which the
GPIO controller support and on success prints debug msg like these:

byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (APIC 67)
byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (APIC 69)

This is useful to figure out the GPIO pin belonging to ACPI
resources like this one: "Interrupt () { 0x00000043 }" or
the other way around.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add "FW_BUG pin %i: direct_irq_en set but no IRQ assigned, clearing" warning
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 38 ++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 4c01333e1406..a7179aa30b78 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -32,6 +32,7 @@
 #define BYT_VAL_REG		0x008
 #define BYT_DFT_REG		0x00c
 #define BYT_INT_STAT_REG	0x800
+#define BYT_DIRECT_IRQ_REG	0x980
 #define BYT_DEBOUNCE_REG	0x9d0
 
 /* BYT_CONF0_REG register bits */
@@ -1465,6 +1466,34 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 	chip->irq_eoi(data);
 }
 
+static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 value)
+{
+	void __iomem *reg;
+	int i, j;
+
+	if (!(value & (BYT_TRIG_POS | BYT_TRIG_NEG))) {
+		dev_warn(vg->dev,
+			 FW_BUG "pin %i: direct_irq_en set without trigger, clearing\n", pin);
+		return false;
+	}
+
+	reg = vg->communities->pad_regs + BYT_DIRECT_IRQ_REG;
+	for (i = 0; i < 16; i += 4) {
+		value = readl(reg + i);
+		for (j = 0; j < 4; j++) {
+			if (((value >> j * 8) & 0xff) == pin) {
+				dev_dbg(vg->dev, "Pin %i: uses direct IRQ %d (APIC %d)\n",
+					pin, i + j, 0x43 + i + j);
+				return true;
+			}
+		}
+	}
+
+	dev_warn(vg->dev,
+		 FW_BUG "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
+	return false;
+}
+
 static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 				    unsigned long *valid_mask,
 				    unsigned int ngpios)
@@ -1492,8 +1521,13 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 
 		value = readl(reg);
 		if (value & BYT_DIRECT_IRQ_EN) {
-			clear_bit(i, valid_mask);
-			dev_dbg(vg->dev, "excluding GPIO %d from IRQ domain\n", i);
+			if (byt_direct_irq_sanity_check(vg, i, value)) {
+				clear_bit(i, valid_mask);
+			} else {
+				value &= ~(BYT_DIRECT_IRQ_EN | BYT_TRIG_POS |
+					   BYT_TRIG_NEG | BYT_TRIG_LVL);
+				writel(value, reg);
+			}
 		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
 			byt_gpio_clear_triggering(vg, i);
 			dev_dbg(vg->dev, "disabling GPIO %d\n", i);
-- 
2.33.1

