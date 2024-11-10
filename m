Return-Path: <linux-gpio+bounces-12791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C219C34A9
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 22:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3FB41C2192A
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 21:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620AA158851;
	Sun, 10 Nov 2024 21:01:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BF1531C0
	for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731272468; cv=none; b=XB1CgHmFRUV7DOM9zDLTS0eZSI8ZXBk2t5nmZMctertFYtUd2XykKvKhi0f2KKBUZLme97EVGYnF2fx+EHHNinMpvuhPUC2lBfz7wcuSeX44rKPx8Z/tbR9O6uFW3MPeIJF4+6nNA3FgFLs+ASBsch2vuKIOMxhpKkm1YdDSFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731272468; c=relaxed/simple;
	bh=I1PF87o/v3duEmVol3hK5Hn3dWDF6plXuD4SahJVq1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDHUe3rkI6z63U+ZItf0sKTN8AmASrN3LFSP0VEutx9kQPIcKCYN1pclF3IXGfNJyTUu/GohthZTSKsAGaY1ve0sCWt5m1edf07kVQf20x+BRc92wuuslrVR/EodvwJ9kzm1C3B+qUmB+l2xsk1+K3GfQpIJ+bTnejoHsYI3jM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id df906ca3-9fa6-11ef-8874-005056bdd08f;
	Sun, 10 Nov 2024 23:00:53 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 5/6] pinctrl: cy8c95x0: embed iterator to the for-loop
Date: Sun, 10 Nov 2024 22:59:45 +0200
Message-ID: <20241110210040.18918-6-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110210040.18918-1-andy.shevchenko@gmail.com>
References: <20241110210040.18918-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we iterate through nports the iterator variable is effectively
being not used outside of the loop. Make it clear by moving its definition
into the for-loop. This makes code cleaner as well.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 36 +++++++++++++-----------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 8b118fd09e9e..8c611abd4745 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -159,7 +159,7 @@ struct cy8c95x0_pinctrl {
 	DECLARE_BITMAP(irq_trig_high, MAX_LINE);
 	DECLARE_BITMAP(push_pull, MAX_LINE);
 	DECLARE_BITMAP(shiftmask, MAX_LINE);
-	int nport;
+	unsigned int nport;
 	struct gpio_chip gpio_chip;
 	unsigned long driver_data;
 	struct device *dev;
@@ -610,9 +610,8 @@ static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	DECLARE_BITMAP(tmask, MAX_LINE);
 	DECLARE_BITMAP(tval, MAX_LINE);
 	int write_val;
-	int ret = 0;
-	int i;
 	u8 bits;
+	int ret;
 
 	/* Add the 4 bit gap of Gport2 */
 	bitmap_andnot(tmask, mask, chip->shiftmask, MAX_LINE);
@@ -623,7 +622,7 @@ static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	bitmap_shift_left(tval, tval, 4, MAX_LINE);
 	bitmap_replace(tval, tval, val, chip->shiftmask, BANK_SZ * 3);
 
-	for (i = 0; i < chip->nport; i++) {
+	for (unsigned int i = 0; i < chip->nport; i++) {
 		/* Skip over unused banks */
 		bits = bitmap_get_value8(tmask, i * BANK_SZ);
 		if (!bits)
@@ -632,15 +631,13 @@ static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 		write_val = bitmap_get_value8(tval, i * BANK_SZ);
 
 		ret = cy8c95x0_regmap_update_bits(chip, reg, i, bits, write_val);
-		if (ret < 0)
-			goto out;
+		if (ret < 0) {
+			dev_err(chip->dev, "failed writing register %d, port %u: err %d\n", reg, i, ret);
+			return ret;
+		}
 	}
-out:
 
-	if (ret < 0)
-		dev_err(chip->dev, "failed writing register %d, port %d: err %d\n", reg, i, ret);
-
-	return ret;
+	return 0;
 }
 
 static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
@@ -650,9 +647,8 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	DECLARE_BITMAP(tval, MAX_LINE);
 	DECLARE_BITMAP(tmp, MAX_LINE);
 	int read_val;
-	int ret = 0;
-	int i;
 	u8 bits;
+	int ret;
 
 	/* Add the 4 bit gap of Gport2 */
 	bitmap_andnot(tmask, mask, chip->shiftmask, MAX_LINE);
@@ -663,15 +659,17 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	bitmap_shift_left(tval, tval, 4, MAX_LINE);
 	bitmap_replace(tval, tval, val, chip->shiftmask, BANK_SZ * 3);
 
-	for (i = 0; i < chip->nport; i++) {
+	for (unsigned int i = 0; i < chip->nport; i++) {
 		/* Skip over unused banks */
 		bits = bitmap_get_value8(tmask, i * BANK_SZ);
 		if (!bits)
 			continue;
 
 		ret = cy8c95x0_regmap_read(chip, reg, i, &read_val);
-		if (ret < 0)
-			goto out;
+		if (ret < 0) {
+			dev_err(chip->dev, "failed reading register %d, port %u: err %d\n", reg, i, ret);
+			return ret;
+		}
 
 		read_val &= bits;
 		read_val |= bitmap_get_value8(tval, i * BANK_SZ) & ~bits;
@@ -682,11 +680,7 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	bitmap_shift_right(tmp, tval, 4, MAX_LINE);
 	bitmap_replace(val, tmp, tval, chip->shiftmask, MAX_LINE);
 
-out:
-	if (ret < 0)
-		dev_err(chip->dev, "failed reading register %d, port %d: err %d\n", reg, i, ret);
-
-	return ret;
+	return 0;
 }
 
 static int cy8c95x0_gpio_direction_input(struct gpio_chip *gc, unsigned int off)
-- 
2.47.0


