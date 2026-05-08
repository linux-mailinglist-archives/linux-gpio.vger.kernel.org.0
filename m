Return-Path: <linux-gpio+bounces-36462-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI3sIjbd/Wn0jwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36462-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 14:55:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E49644F699C
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 14:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30EB930ABE12
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 12:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2473A3E1CFF;
	Fri,  8 May 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKUyhf6a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DBD3DFC92;
	Fri,  8 May 2026 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244692; cv=none; b=M1NbGAx+tmf/BI1GflBH5XrL4BOAQ4waHOfU5ljuEVKGz/+qSEwetTsh39IsjYhAFWAgwM9ShGR4Nb2Vz8NO/z5wA38e3APURvUHp9ITi4f+NwUv3kbMDJ8lZNOfl+s6vfwywz+OGCKbF2U6EU5j17CXFEmHKjOWScEO9+0B21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244692; c=relaxed/simple;
	bh=Z4d/UAJ3M/A/sbfOgSOipQRQ0aIMTxR/C/kevDeLGxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bHt5SfuF9pYegBKujLWwTMQrdvrf3WmtA1wZ1WyLuNaWJdpLyE5dRBPmejbS4qy48sgZy1L1Tcj0CYNaSie9AnLSPVh4SUEKoHBQyKlm9DnRmXCYuT34JK2PdUxTk3Ggj7RYcjphomU7wRnj9mIsHLQN9Q/ZAePtFtOGtJgaSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKUyhf6a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DC9C2BCC7;
	Fri,  8 May 2026 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778244692;
	bh=Z4d/UAJ3M/A/sbfOgSOipQRQ0aIMTxR/C/kevDeLGxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FKUyhf6aEYY/o1EdFVCeQCxr6Yi1+RaEskmn0l6hwp5p5pvLn21uINwH60p1B/q7t
	 7cUQZuCYXYU2nnC9BZqSxL1NeuAhbmp1uRjXf0MmTCfr30VeQs9TiJawFgF6oY1a/s
	 UEoyh6zf37dV1Sim8ejtSFqk5zpD0Yh6BhG4FQpmbPL9FgctP9792IY7x0U1H0mxoO
	 ZwAPEYOrKV3+ZlkAk1Kl+wu5ERk5Cc987ygRlHlg6CDAcg+NqsabcxnaetaHABDuow
	 nyGINvFDHk+EsHhd+FpcAIUsEk0dZG16JYgch71xRwTMYDumqxZ+jhQLoL7I13UYwU
	 zGdnmwFNvmZ0w==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 08 May 2026 14:51:26 +0200
Subject: [PATCH v2 1/2] gpio: regmap: Support sparsed fixed direction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-regmap-gpio-sparse-fixed-dir-v2-1-deee84df3027@kernel.org>
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
In-Reply-To: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
To: Michael Walle <mwalle@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: E49644F699C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36462-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On some regmapped GPIOs apparently only a sparser selection
of the lines (not all) are actually fixed direction.

Support this situation by adding an optional bitmap indicating
which GPIOs are actually fixed direction and which are not.

Cc: Alex Elder <elder@riscstar.com>
Link: https://lore.kernel.org/linux-gpio/20260501155421.3329862-10-elder@riscstar.com/
Tested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpio/gpio-regmap.c  | 37 +++++++++++++++++++++++++++++++++----
 include/linux/gpio/regmap.h |  7 +++++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 9ae4a41a2427..f45a432e8ebe 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned long *fixed_direction_sparse;
 	unsigned long *fixed_direction_output;
 
 #ifdef CONFIG_REGMAP_IRQ
@@ -138,6 +139,20 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
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
@@ -145,7 +160,7 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
-	if (gpio->fixed_direction_output) {
+	if (gpio_regmap_fixed_direction(gpio, offset)) {
 		if (test_bit(offset, gpio->fixed_direction_output))
 			return GPIO_LINE_DIRECTION_OUT;
 		else
@@ -302,12 +317,23 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
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
@@ -329,7 +355,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	ret = gpiochip_add_data(chip, gpio);
 	if (ret < 0)
-		goto err_free_bitmap;
+		goto err_free_bitmap_output;
 
 #ifdef CONFIG_REGMAP_IRQ
 	if (config->regmap_irq_chip) {
@@ -355,8 +381,10 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
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
@@ -376,6 +404,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
 
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

-- 
2.54.0


