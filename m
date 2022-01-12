Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF8A48CD59
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 22:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiALVCJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 16:02:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37989 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229436AbiALVCH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 16:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642021325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Ta1ZCH1B+IaFAjdvPVN6azOMyzbNkcZOxe9YBSet9lI=;
        b=gYiLaz+7ENv/HB8nedhHiSI//hdc5kkSUMPDHQVRy4p6ijHc10YFRKvcGxa229QHaXcIdV
        SnJZ2getF2vI5WZ4bQldhQQvAsCD26zikCJeU6DobjLhucDu2o2LmbD0oiG2cK/9pFWraA
        1lZBKP9c+cR7TWyNXImD91+q67+pWq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-nHISihirOF2nUFLfignHIA-1; Wed, 12 Jan 2022 16:02:04 -0500
X-MC-Unique: nHISihirOF2nUFLfignHIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 485AA83DD22;
        Wed, 12 Jan 2022 21:02:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.89])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AB4C04BC7F;
        Wed, 12 Jan 2022 21:02:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org
Subject: [PATCH v4] pinctrl: baytrail: Clear direct_irq_en flag on broken configs
Date:   Wed, 12 Jan 2022 22:02:00 +0100
Message-Id: <20220112210200.265429-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some boards set the direct_irq_en flag in the conf0 register without
setting the correct trigger bits. The direct_irq_en flag just means that
the GPIO will send IRQs directly to the APIC instead of going through
the shared interrupt for the GPIO controller, in order for the pin to be
able to actually generate IRQs the trigger flags must configure the IRQ
as a level-high or level-low active IRQ.

Note testing shows that using edge trigger add the conf0 register level
does NOT work, instead edge triggering should be set at the IO-APIC level.

I believe that the direct_irq_en flag connects the output of the GPIO's IRQ
trigger block, which normally sets the status flag in the IRQ status reg at
0x800 to one of the IO-APIC pins according to the direct IRQ mux.

This means that the TRIG_LVL bit *must* be set, so that the GPIO's input
value is directly passed (1:1 or inverted) to the IO-APIC pin, if TRIG_LVL
is not set, selecting edge mode operation then on the first edge the
selected IO-APIC pin goes high, but since no write-to-clear write will be
done to the IRQ status reg at 0x800, the detected edge condition will never
get cleared.

This APIC pin stuck high condition can be observed with the pin configured
as level-high active, in the form of an interrupt storm. Clearing the
TRIG_MASK bits of conf0 stops the storm, reconfiguring them as edge again
results in a storm again as soon as the edge is triggered once.

Detect invalid trigger flags, log a FW_BUG warning when encountering this
and clear the direct_irq_en flag so that a driver can actually use the pin
as IRQ through gpiod_to_irq().

Specifically this allows the edt-ft5x06 touchscreen driver to use
INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
accompanied by the following new log message

byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing

The new byt_direct_irq_sanity_check() function also checks that the
pin is actually appointed to one of the 16 direct-IRQs which the GPIO
controller supports and on success prints debug messages like these:

byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (IO-APIC 67)
byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (IO-APIC 69)

This is useful to figure out the GPIO pin belonging to ACPI
resources like this one: "Interrupt () { 0x00000043 }" or
the other way around.

The strict checking of valid trigger flags this introduces does result in
FW_BUG messages on quite a few devices. E.g. on the Yoga Tablet 2 1051L:
 byt_gpio INT33FC:00: [Firmware Bug]: pin 92: direct_irq_en set but no IRQ assigned, clearing
 byt_gpio INT33FC:00: [Firmware Bug]: pin 93: direct_irq_en set but no IRQ assigned, clearing
  These 2 also have mux set to 7 and fall + rise + level trigger bits set,
  presumably something has written 0xffffffff to their conf0 registers
 byt_gpio INT33FC:02: Pin 3: uses direct IRQ 1 (IO-APIC 68)
 byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger (conf0: 2803cc00h), clearing
  Most tablets seem to have this, looking at DSDTs this seems intended for
  use with an I2C HID sensor-hub and is still set on devices without one.

To make sure this does not cause any regressions this has been tested,
including checking disabled direct-IRQs are not used in the DSDT,
on the following devices:

Asus ME176C
Asus TF103C
Chuwi Vi10 (with its Windows BIOS)
HP x2 10-n000nd
Lenovo Yoga Tablet 2 1050L (Android version, without EC, with buggy DSDT)
Lenovo Yoga Tablet 2 1051L (Windows version, with EC)

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Only level-high or level-low active conf0 trigger settings are valid for
  direct IRQs, make byt_direct_irq_sanity_check() check this
- Add a comment explaining why this is done, and also update the commit msg

Changes in v3:
- Rework code to check if the pin is assigned one of the 16 direct IRQs
  (new code suggested-by Andy)
- Drop dev_dbg of the (likely?) APIC IRQ, only log the direct IRQ index

Changes in v2:
- Add "FW_BUG pin %i: direct_irq_en set but no IRQ assigned, clearing" warning
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 55 +++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 4c01333e1406..ceee6c65dbc1 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -32,6 +32,7 @@
 #define BYT_VAL_REG		0x008
 #define BYT_DFT_REG		0x00c
 #define BYT_INT_STAT_REG	0x800
+#define BYT_DIRECT_IRQ_REG	0x980
 #define BYT_DEBOUNCE_REG	0x9d0
 
 /* BYT_CONF0_REG register bits */
@@ -1465,6 +1466,51 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 	chip->irq_eoi(data);
 }
 
+static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 conf0)
+{
+	int direct_irq, ioapic_direct_irq_base;
+	u8 *match, direct_irq_mux[16];
+	u32 trig;
+
+	memcpy_fromio(direct_irq_mux, vg->communities->pad_regs + BYT_DIRECT_IRQ_REG,
+		      sizeof(direct_irq_mux));
+	match = memchr(direct_irq_mux, pin, sizeof(direct_irq_mux));
+	if (!match) {
+		dev_warn(vg->dev, FW_BUG "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
+		return false;
+	}
+
+	direct_irq = match - direct_irq_mux;
+	/* Base IO-APIC pin numbers come from atom-e3800-family-datasheet.pdf */
+	ioapic_direct_irq_base = (vg->communities->npins == BYT_NGPIO_SCORE) ? 51 : 67;
+	dev_dbg(vg->dev, "Pin %i: uses direct IRQ %d (IO-APIC %d)\n", pin,
+		direct_irq, direct_irq + ioapic_direct_irq_base);
+
+	/*
+	 * Testing has shown that the way direct IRQs work is that the combination of the
+	 * direct-irq-en flag and the direct IRQ mux connect the output of the GPIO's IRQ
+	 * trigger block, which normally sets the status flag in the IRQ status reg at
+	 * 0x800, to one of the IO-APIC pins according to the mux registers.
+	 *
+	 * This means that:
+	 * 1. The TRIG_MASK bits must be set to configure the GPIO's IRQ trigger block
+	 * 2. The TRIG_LVL bit *must* be set, so that the GPIO's input value is directly
+	 *    passed (1:1 or inverted) to the IO-APIC pin, if TRIG_LVL is not set,
+	 *    selecting edge mode operation then on the first edge the IO-APIC pin goes
+	 *    high, but since no write-to-clear write will be done to the IRQ status reg
+	 *    at 0x800, the detected edge condition will never get cleared.
+	 */
+	trig = conf0 & BYT_TRIG_MASK;
+	if (trig != (BYT_TRIG_POS | BYT_TRIG_LVL) &&
+	    trig != (BYT_TRIG_NEG | BYT_TRIG_LVL)) {
+		dev_warn(vg->dev, FW_BUG "pin %i: direct_irq_en set without trigger (conf0: %xh), clearing\n",
+			 pin, conf0);
+		return false;
+	}
+
+	return true;
+}
+
 static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 				    unsigned long *valid_mask,
 				    unsigned int ngpios)
@@ -1492,8 +1538,13 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 
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

