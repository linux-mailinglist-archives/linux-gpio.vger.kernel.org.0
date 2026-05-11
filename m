Return-Path: <linux-gpio+bounces-36605-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKrvC+gxAmrSowEAu9opvQ
	(envelope-from <linux-gpio+bounces-36605-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:45:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DC1515398
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E32EF3018D79
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 19:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5503F4D2EF4;
	Mon, 11 May 2026 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2UD4GLG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D054D2EEE;
	Mon, 11 May 2026 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528629; cv=none; b=LPWZ2ZGmbXJUjTHVN+ufnUm64MltBI0Gxa/+/h6SM7kM7Fz0RqohtftZQnyCs/FlLyhkrZkIfaLTlarbC/QdavUy+xe0GX6pZSefkh/LoUQDhnDqv1dBGblS/wBUJxdFcGq5y3gezTGFZMMNSbqsHcBN1+UAs68JmSSfuUu/wew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528629; c=relaxed/simple;
	bh=nakEEFSh8eedU8POAflsYB7hCrkaiuXuVtw0PSIIZDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oY3f1woeen3gs3yi/0BMJwWZ2TOulUOKyMYN9zHzyj4WsPC7VJJakYJ3xtSEs9sp9JF09uAVbKn9Osw9GOStaEFRstTJZ61i7c9Y8s6ap4Ody96K5cTXv4C4/Q14WY33YNHbHrIWbVm53SkSShCQb+NTi71Oz3qbak4Aiva5LW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2UD4GLG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E491C2BCF5;
	Mon, 11 May 2026 19:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778528629;
	bh=nakEEFSh8eedU8POAflsYB7hCrkaiuXuVtw0PSIIZDM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P2UD4GLGGUG1fXxa3H4LVT/09qYUrYzsPFhqVjOkDLcnPhRBtqrlXLgtdq/ZYigiI
	 aT6pZd4FaHrJ3bq62bWWQvXpcN/N1t20jgLdf4AqKY+Xvbpw8sXX7w1dA2X0kqDfsP
	 HH8fL95xmGMt+YPS0v8k8fnEUkjPeRnR7fHxftIDMoicyH7rzuMHXQwfxgoRptHM8J
	 4YCzN6umhUZsqTnThw0JL/i3BX6dnJrK/cBvn+qqyhTkGla0HmEyzdk33KQq1MDX+e
	 /tiEyiBF93szNOK1E8qz3r+st6FQk/d1qRZ3xZ/tx3sucjKeaX9H/CioZPlWCdJ4EX
	 EWS/suqK0Xijg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 21:43:43 +0200
Subject: [PATCH v3 1/2] gpio: regmap: Support sparsed fixed direction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-regmap-gpio-sparse-fixed-dir-v3-1-1429ec453be7@kernel.org>
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
In-Reply-To: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
To: Alex Elder <elder@riscstar.com>, Michael Walle <mwalle@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 96DC1515398
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
	TAGGED_FROM(0.00)[bounces-36605-lists,linux-gpio=lfdr.de];
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
index 9ae4a41a2427..b3b4e77ec147 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned long *fixed_direction_mask;
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
+	if (gpio->fixed_direction_mask &&
+	    !test_bit(offset, gpio->fixed_direction_mask))
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
 
+	if (config->fixed_direction_mask) {
+		gpio->fixed_direction_mask = bitmap_alloc(chip->ngpio,
+							    GFP_KERNEL);
+		if (!gpio->fixed_direction_mask) {
+			ret = -ENOMEM;
+			goto err_free_gpio;
+		}
+		bitmap_copy(gpio->fixed_direction_mask,
+			    config->fixed_direction_mask, chip->ngpio);
+	}
+
 	if (config->fixed_direction_output) {
 		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
 							    GFP_KERNEL);
 		if (!gpio->fixed_direction_output) {
 			ret = -ENOMEM;
-			goto err_free_gpio;
+			goto err_free_bitmap_dirmask;
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
+err_free_bitmap_dirmask:
+	bitmap_free(gpio->fixed_direction_mask);
 err_free_gpio:
 	kfree(gpio);
 	return ERR_PTR(ret);
@@ -376,6 +404,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
 
 	gpiochip_remove(&gpio->gpio_chip);
 	bitmap_free(gpio->fixed_direction_output);
+	bitmap_free(gpio->fixed_direction_mask);
 	kfree(gpio);
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 12d154732ca9..06255756710d 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -38,6 +38,12 @@ struct regmap;
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
  *			is used.
+ * @fixed_direction_mask:
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
+	unsigned long *fixed_direction_mask;
 	unsigned long *fixed_direction_output;
 
 #ifdef CONFIG_REGMAP_IRQ

-- 
2.54.0


