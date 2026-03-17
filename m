Return-Path: <linux-gpio+bounces-33602-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oABvItEfuWmergEAu9opvQ
	(envelope-from <linux-gpio+bounces-33602-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:33:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40C2A6D3F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0B8130E3C53
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C02E35E92C;
	Tue, 17 Mar 2026 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgWVuYBh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AEB35E932;
	Tue, 17 Mar 2026 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739720; cv=none; b=hrfU6y6JWWNOWerf0gaacgNdO/L6JCfDl+yhaZF333dsgLh9XtR0gzANG36xwceILVVfyvc59DpvYwvHhEvzvYZCg5OibUweS4auGWkTsROqxpE6C++tNeg4YBVU63U9sF6uevgwJgabW1B04rjlZuMzxx2UmaIrEWMUCQoaSqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739720; c=relaxed/simple;
	bh=0XadDfVDtlWCn1GA2CM/7sC5VbJYfQ7TO6u8LyC1810=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAYnpxoO2Jni7mt4s+S3j8Ab0gqRcquqi+4WVF7/pLGq+x6I3+JrYXiQPG+D13LPsw9fMK7BU9P6A9zjj0La00nufoj3hl7JD6Wiv+CuiIAqa8zWQuyWaSKLcgyMEC681f8oQbXyyO+/l3VZlXqQxln4wIriukpXjQMJY3uhwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgWVuYBh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1433FC2BCB6;
	Tue, 17 Mar 2026 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739719;
	bh=0XadDfVDtlWCn1GA2CM/7sC5VbJYfQ7TO6u8LyC1810=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LgWVuYBhi5A1A6oMHQNbL7i0ztVQbIqVWXlezjmcHKj2W7gSVoA21VHs6ZzPGBQtQ
	 zoPLa4vSg3/r9u/lStn3/2HJGN+xft+068Nsr8qEDW46LWs1ENsn/C5zjqVS5v+sY3
	 e7rSBb8oUlwp1GDAvgdr2tjXwQoxVGyuQFDYrpzzusacY3vr8ysMfeHmwdcCUz1uzl
	 bNyUYtJxewY70iNm6lueeWvqXgtW/S6p3xYlCttttK3tVZsR26X9Vqy/rCfdLYIekm
	 nG8lBPiolCK/xnTcP1QdiKxRpJEcCpYBEtGrmxWQ5kPxDObe4BxaCFRDWY9FZuYz+p
	 1AOkKtSFCdbGQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Mar 2026 10:28:32 +0100
Subject: [PATCH v2 2/2] mfd: arizona: Convert GPIO IRQ handling to
 descriptors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-mfd-arizona-irq-v2-2-9ea546f517dc@kernel.org>
References: <20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org>
In-Reply-To: <20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33602-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B40C2A6D3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the arizona polling GPIO handling to use a GPIO descripor
instead of passing a global GPIO number as platform data.

This mechanism is not used in the kernel, but let's preserve
the mechanism to be nice.

Users can define "irq-gpios" in the devicetree or software node
for the Arizona chip to provide the GPIO line corresponding to
the IRQ.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/mfd/arizona-irq.c         | 45 ++++++++++++++++++---------------------
 include/linux/mfd/arizona/core.h  |  2 ++
 include/linux/mfd/arizona/pdata.h |  5 -----
 3 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index 544016d420fe..b6f63031268e 100644
--- a/drivers/mfd/arizona-irq.c
+++ b/drivers/mfd/arizona-irq.c
@@ -136,21 +136,19 @@ static irqreturn_t arizona_irq_thread(int irq, void *data)
 			dev_err(arizona->dev,
 				"Failed to read main IRQ status: %d\n", ret);
 		}
-#ifdef CONFIG_GPIOLIB_LEGACY
 		/*
 		 * Poll the IRQ pin status to see if we're really done
 		 * if the interrupt controller can't do it for us.
 		 */
-		if (!arizona->pdata.irq_gpio) {
+		if (!arizona->irq_gpiod) {
 			break;
 		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_RISING &&
-			   gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
+			   gpiod_get_value_cansleep(arizona->irq_gpiod)) {
 			poll = true;
 		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_FALLING &&
-			   !gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
+			   !gpiod_get_value_cansleep(arizona->irq_gpiod)) {
 			poll = true;
 		}
-#endif
 	} while (poll);
 
 	pm_runtime_put_autosuspend(arizona->dev);
@@ -350,27 +348,25 @@ int arizona_irq_init(struct arizona *arizona)
 		goto err_map_main_irq;
 	}
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	/* Used to emulate edge trigger and to work around broken pinmux */
-	if (arizona->pdata.irq_gpio) {
-		if (gpio_to_irq(arizona->pdata.irq_gpio) != arizona->irq) {
-			dev_warn(arizona->dev, "IRQ %d is not GPIO %d (%d)\n",
-				 arizona->irq, arizona->pdata.irq_gpio,
-				 gpio_to_irq(arizona->pdata.irq_gpio));
-			arizona->irq = gpio_to_irq(arizona->pdata.irq_gpio);
-		}
-
-		ret = devm_gpio_request_one(arizona->dev,
-					    arizona->pdata.irq_gpio,
-					    GPIOF_IN, "arizona IRQ");
-		if (ret != 0) {
-			dev_err(arizona->dev,
-				"Failed to request IRQ GPIO %d:: %d\n",
-				arizona->pdata.irq_gpio, ret);
-			arizona->pdata.irq_gpio = 0;
+	/*
+	 * Used to emulate edge trigger and to work around broken pinmux
+	 * define "irq-gpios" in device tree or software node.
+	 */
+	arizona->irq_gpiod = devm_gpiod_get_optional(arizona->dev, "irq",
+						     GPIOD_IN);
+	if (IS_ERR(arizona->irq_gpiod)) {
+		ret = PTR_ERR(arizona->irq_gpiod);
+		dev_err(arizona->dev, "error getting IRQ GPIO (%d)\n", ret);
+		goto err_irq_gpiod;
+	}
+	if (arizona->irq_gpiod) {
+		if (gpiod_to_irq(arizona->irq_gpiod) != arizona->irq) {
+			dev_warn(arizona->dev, "IRQ %d is not right GPIO\n",
+				 arizona->irq);
+			arizona->irq = gpiod_to_irq(arizona->irq_gpiod);
 		}
+		gpiod_set_consumer_name(arizona->irq_gpiod, "arizona IRQ");
 	}
-#endif
 
 	ret = request_threaded_irq(arizona->irq, NULL, arizona_irq_thread,
 				   flags, "arizona", arizona);
@@ -409,6 +405,7 @@ int arizona_irq_init(struct arizona *arizona)
 	arizona_free_irq(arizona, ARIZONA_IRQ_BOOT_DONE, arizona);
 err_boot_done:
 	free_irq(arizona->irq, arizona);
+err_irq_gpiod:
 err_main_irq:
 	regmap_del_irq_chip(irq_find_mapping(arizona->virq,
 					     ARIZONA_MAIN_IRQ_INDEX),
diff --git a/include/linux/mfd/arizona/core.h b/include/linux/mfd/arizona/core.h
index 6d6f96b2b29f..7129651c9af6 100644
--- a/include/linux/mfd/arizona/core.h
+++ b/include/linux/mfd/arizona/core.h
@@ -11,6 +11,7 @@
 #define _WM_ARIZONA_CORE_H
 
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
 #include <linux/regmap.h>
@@ -136,6 +137,7 @@ struct arizona {
 	struct irq_domain *virq;
 	struct regmap_irq_chip_data *aod_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
+	struct gpio_desc *irq_gpiod;
 
 	bool hpdet_clamp;
 	unsigned int hp_ena;
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index f72e6d4b14a7..20118bad869a 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -188,11 +188,6 @@ struct arizona_pdata {
 	/** Haptic actuator type */
 	unsigned int hap_act;
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	/** GPIO for primary IRQ (used for edge triggered emulation) */
-	int irq_gpio;
-#endif
-
 	/** General purpose switch control */
 	unsigned int gpsw;
 };

-- 
2.53.0


