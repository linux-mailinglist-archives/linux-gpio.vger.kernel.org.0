Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14BAA10AC02
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 09:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfK0InY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 03:43:24 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52830 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfK0InL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 03:43:11 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id Wwiu2100W5USYZQ01wiua3; Wed, 27 Nov 2019 09:43:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0000xj-Mm; Wed, 27 Nov 2019 09:42:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0004Ol-KQ; Wed, 27 Nov 2019 09:42:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 3/7] gpiolib: Add support for GPIO line table lookup
Date:   Wed, 27 Nov 2019 09:42:49 +0100
Message-Id: <20191127084253.16356-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127084253.16356-1-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently GPIOs can only be referred to by GPIO controller and offset in
GPIO lookup tables.

Add support for looking them up by line name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
If this is rejected, the GPIO Aggregator documentation and code must be
updated.

v3:
  - New.
---
 drivers/gpio/gpiolib.c       | 12 ++++++++++++
 include/linux/gpio/machine.h |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d24a3d79dcfe69ad..cb608512ad6bbded 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4475,6 +4475,18 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
 			continue;
 
+		if (p->chip_hwnum == (u16)-1) {
+			desc = gpio_name_to_desc(p->chip_label);
+			if (desc) {
+				*flags = p->flags;
+				return desc;
+			}
+
+			dev_warn(dev, "cannot find GPIO line %s, deferring\n",
+				 p->chip_label);
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+
 		chip = find_chip_by_name(p->chip_label);
 
 		if (!chip) {
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 1ebe5be05d5f81fa..84c1c097e55eefaf 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -31,7 +31,7 @@ enum gpio_lookup_flags {
  */
 struct gpiod_lookup {
 	const char *chip_label;
-	u16 chip_hwnum;
+	u16 chip_hwnum;			/* if -1, chip_label is named line */
 	const char *con_id;
 	unsigned int idx;
 	unsigned long flags;
-- 
2.17.1

