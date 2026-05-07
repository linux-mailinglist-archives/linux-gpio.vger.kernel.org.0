Return-Path: <linux-gpio+bounces-36369-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIJLEJGB/GkcQwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36369-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 14:12:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F64E8066
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 14:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38170302260C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 12:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136653B9DA6;
	Thu,  7 May 2026 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/+RP04f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F73D4105;
	Thu,  7 May 2026 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155824; cv=none; b=E1RPCxYwfXmavQyB4ggozcM+y46M3T0rblF62d4A9Ml0p1lC/FVNZ4cTC3Sgi4K+nMpABUvX67pjZj7+KbUeyGXMddhV66DcRFJW6ysGHbxDU5PvJilw4MxH9rL/6V8nQ7SAkPFrMEFuPPbyqUd8fG3d6LT+ZrbB/2Jw/DdPiEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155824; c=relaxed/simple;
	bh=zdZbWTpCZIZyjmwOO6XJfDF3O7OcP/3yuvUnbgckPw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W3vcHkdD71bgxQJS6RPHJulRf250+u9hP+u4gCtm5rZitgRW3UTnh1TgmI78K9UpyeH4wqzS7HLv9c95kpidJAQcFTsXVjJcRhqu2l/eI0UH8FVBDC5obAYgyfpRxBplccN1G8zRwFsy3NUYeQD14Qej1UKXhLEwS4lOdA7m+SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/+RP04f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E75C2BCB2;
	Thu,  7 May 2026 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778155823;
	bh=zdZbWTpCZIZyjmwOO6XJfDF3O7OcP/3yuvUnbgckPw4=;
	h=From:Date:Subject:To:Cc:From;
	b=X/+RP04fGEHM1GXKxR4TKH35N3UDTuqjd/W1g905quOhnrlxPaWozfPX8PfLfAWvq
	 Iji6+UAzpwTJh2MvTgDSb6VvznjRJmr07o9THS+mjSPW9F81aeMvs52HF4/JtmaHsg
	 KFGz/Q6AN+1OG5Cnmt00eg3v/IyZ03T2UR6opWpdl9n6JLJ2XC8LCOwtqOyRCNuo+O
	 1y041kr91bbCgwknxu12E+Clc426KYw2SKOkkIkPXBTz88ORsL2gDB7vmLORX96qJl
	 PGzt3qQwPe2vyQIL2J+qmRy34jcW0C0jWQIVATiOB9GG4Y1gual8/BBsd876lM1TcX
	 Y32iAKCD1wW7Q==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 07 May 2026 14:10:18 +0200
Subject: [PATCH] gpio: regmap: Support sparsed fixed direction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-regmap-gpio-sparse-fixed-dir-v1-1-a2e5855e2701@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQBlrBq4iLmPxNR7ANM1qE0
 rub0OXHg7eTQQVGt24nxSYm61LRXzqKc1gyWFI1eedHN7grK/I7FM5FVrYS1MCT/JA4iXKfhui
 Sh4/jRHVRFC22/f1x2r7PF+KnPek4/vcD22WAAAAA
X-Change-ID: 20260507-regmap-gpio-sparse-fixed-dir-1d5c0d2e2c6f
To: Michael Walle <mwalle@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alex Elder <elder@riscstar.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 934F64E8066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36369-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:email]
X-Rspamd-Action: no action

On some regmapped GPIOs apparently only a sparser selection
of the lines (not all) are actually fixed direction.

Support this situation by adding an optional bitmap indicating
which GPIOs are actually fixed direction and which are not.

Cc: Alex Elder <elder@riscstar.com>
Link: https://lore.kernel.org/linux-gpio/20260501155421.3329862-10-elder@riscstar.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpio/gpio-regmap.c  | 38 +++++++++++++++++++++++++++++++++-----
 include/linux/gpio/regmap.h |  7 +++++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 9ae4a41a2427..37568dc611f5 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned long *fixed_direction_sparse;
 	unsigned long *fixed_direction_output;
 
 #ifdef CONFIG_REGMAP_IRQ
@@ -138,14 +139,27 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
 	return regmap_write(gpio->regmap, reg, mask);
 }
 
+static bool gpio_regmap_fixed_direction(struct gpio_regmap *gpio,
+					unsigned int offset)
+{
+	if (!gpio->fixed_direction_output)
+		return false;
+
+	/* In this case only some GPIOs are fixed as input/output */
+	if (gpio->fixed_direction_sparse &&
+	    !test_bit(offset, gpio->fixed_direction_sparse))
+		return false;
+
+	return true;
+}
+
 static int gpio_regmap_get_direction(struct gpio_chip *chip,
 				     unsigned int offset)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	unsigned int base, val, reg, mask;
 	int invert, ret;
-
-	if (gpio->fixed_direction_output) {
+	if (gpio_regmap_fixed_direction(gpio, offset)) {
 		if (test_bit(offset, gpio->fixed_direction_output))
 			return GPIO_LINE_DIRECTION_OUT;
 		else
@@ -302,12 +316,23 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			goto err_free_gpio;
 	}
 
+	if (config->fixed_direction_sparse) {
+		gpio->fixed_direction_sparse = bitmap_alloc(chip->ngpio,
+							    GFP_KERNEL);
+		if (!gpio->fixed_direction_sparse) {
+			ret = -ENOMEM;
+			goto err_free_gpio;
+		}
+		bitmap_copy(gpio->fixed_direction_sparse,
+			    config->fixed_direction_sparse, chip->ngpio);
+	}
+
 	if (config->fixed_direction_output) {
 		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
 							    GFP_KERNEL);
 		if (!gpio->fixed_direction_output) {
 			ret = -ENOMEM;
-			goto err_free_gpio;
+			goto err_free_bitmap_sparse;
 		}
 		bitmap_copy(gpio->fixed_direction_output,
 			    config->fixed_direction_output, chip->ngpio);
@@ -329,7 +354,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	ret = gpiochip_add_data(chip, gpio);
 	if (ret < 0)
-		goto err_free_bitmap;
+		goto err_free_bitmap_output;
 
 #ifdef CONFIG_REGMAP_IRQ
 	if (config->regmap_irq_chip) {
@@ -355,8 +380,10 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 err_remove_gpiochip:
 	gpiochip_remove(chip);
-err_free_bitmap:
+err_free_bitmap_output:
 	bitmap_free(gpio->fixed_direction_output);
+err_free_bitmap_sparse:
+	bitmap_free(gpio->fixed_direction_sparse);
 err_free_gpio:
 	kfree(gpio);
 	return ERR_PTR(ret);
@@ -376,6 +403,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
 
 	gpiochip_remove(&gpio->gpio_chip);
 	bitmap_free(gpio->fixed_direction_output);
+	bitmap_free(gpio->fixed_direction_sparse);
 	kfree(gpio);
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 12d154732ca9..ff00b4aeaf1c 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -38,6 +38,12 @@ struct regmap;
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
  *			is used.
+ * @fixed_direction_sparse:
+ *			(Optional) Bitmap representing the GPIO lines that
+ *			make use of the @fixed_direction_output list to
+ *			enforce direction of the GPIO. If this is NULL
+ *			and @fixed_direction_output is defined, ALL GPIOs
+ *			are assumed to be fixed direction (out or in).
  * @fixed_direction_output:
  *			(Optional) Bitmap representing the fixed direction of
  *			the GPIO lines. Useful when there are GPIO lines with a
@@ -89,6 +95,7 @@ struct gpio_regmap_config {
 	int reg_stride;
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
+	unsigned long *fixed_direction_sparse;
 	unsigned long *fixed_direction_output;
 
 #ifdef CONFIG_REGMAP_IRQ

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260507-regmap-gpio-sparse-fixed-dir-1d5c0d2e2c6f

Best regards,
--  
Linus Walleij <linusw@kernel.org>


