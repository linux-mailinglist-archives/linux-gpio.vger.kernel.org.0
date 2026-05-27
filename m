Return-Path: <linux-gpio+bounces-37581-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPtvBenvFmrsxgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37581-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:21:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7125E4D44
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF467305EE7F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 13:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D1B40C5DF;
	Wed, 27 May 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2h1ng5T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E840C5CC;
	Wed, 27 May 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887130; cv=none; b=JRZtWusAbwXBoF8bitdLdhartvTqr3RQF/mJc70FgwGO5N4IsLfDmn36lOGIRD1K2D8eKhDR/sqsc1BIUT+bvDbAonWjttsUsaSXq4HehDLNAY0JX2I400Ruezx3Mb5XsBLM5McMy1vqqrjGAoetbaNzLfuNIiReKMpZ5nTK/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887130; c=relaxed/simple;
	bh=p8ecWyRncMPcGe+3/f4BVz47AqFWY/j6H2zjImhf72A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCRaU1squCS8Y2gjIDSoSgJL73u0aPFAYksIBRxYeoG0gF1Tft9w6ZRBOGNt2KcND1NfJxCaLd0I/jG5UVwoFnZzcwzaQYlYJDWrL8w0NEtbG7fne3sBZAX661djPcsYh2MNgUCjlJp3N0XCPyueGDPSI93PVVBI8mzoM1Nkbd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2h1ng5T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ED31F00A3A;
	Wed, 27 May 2026 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887129;
	bh=lLQv8H71OHeKYkoMQOaGRtmNZqYzRq0dXYVUq94IW2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m2h1ng5TT1zfgfuEOAa/nBa8xyhDHA3cugeuJ+lS0QdFohuJdsp91xbmrpbESOZ2j
	 aSFwrr0ucmVw4t8/mimjGBo5AdeFxou6CGEy7yae4vAcaUsVD20UhjBY5spkSd2ekQ
	 aVZDhM7Fce6xw1hZ3T/oiHk9b3NzO93DFUuDduGJdGtCfN6qBsZRjMUs5cZkL7m7uv
	 /1jzeDunqp3a/yT36D5ndFVjnOkzI9FxBEhhVtYmk4DfvK8AahV65dKVBBrNSULB8u
	 J3nRhKGMN5Hvi39dUjlOQdWqvxj6n8LdtR1ZgRwynegPcENYCV0v1oQ5BvX7xzfNEB
	 Cn9PsIHLwFJPw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:05:17 +0200
Subject: [PATCH v5 2/2] mfd: arizona: Convert GPIO IRQ handling to
 descriptors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-mfd-arizona-irq-v5-2-ebeda2e925da@kernel.org>
References: <20260527-mfd-arizona-irq-v5-0-ebeda2e925da@kernel.org>
In-Reply-To: <20260527-mfd-arizona-irq-v5-0-ebeda2e925da@kernel.org>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37581-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3F7125E4D44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the arizona polling GPIO handling to use a GPIO descriptor
instead of passing a global GPIO number as platform data.

This mechanism is not used in the kernel, but let's preserve
the mechanism to be nice.

Users can define "irq-gpios" in the devicetree or software node
for the Arizona chip to provide the GPIO line corresponding to
the IRQ.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/mfd/arizona-irq.c         | 50 +++++++++++++++++++++------------------
 include/linux/mfd/arizona/core.h  |  2 ++
 include/linux/mfd/arizona/pdata.h |  5 ----
 3 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index 544016d420fe..cf8e42662585 100644
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
@@ -210,6 +208,7 @@ int arizona_irq_init(struct arizona *arizona)
 	const struct regmap_irq_chip *aod, *irq;
 	struct irq_data *irq_data;
 	unsigned int virq;
+	int gpio_irq;
 
 	arizona->ctrlif_error = true;
 
@@ -350,27 +349,32 @@ int arizona_irq_init(struct arizona *arizona)
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
+	/*
+	 * Used to emulate edge trigger and to work around broken pinmux
+	 * define "irq-gpios" in device tree or software node.
+	 */
+	arizona->irq_gpiod = devm_gpiod_get_optional(arizona->dev, "irq",
+						     GPIOD_IN);
+	if (IS_ERR(arizona->irq_gpiod)) {
+		ret = dev_err_probe(arizona->dev,
+				    PTR_ERR(arizona->irq_gpiod),
+				    "Error getting IRQ GPIO\n");
+		goto err_main_irq;
+	}
+	if (arizona->irq_gpiod) {
+		gpio_irq = gpiod_to_irq(arizona->irq_gpiod);
+		if (gpio_irq < 0) {
+			ret = dev_err_probe(arizona->dev, gpio_irq,
+					    "GPIO IRQ line is invalid\n");
+			goto err_main_irq;
 		}
-
-		ret = devm_gpio_request_one(arizona->dev,
-					    arizona->pdata.irq_gpio,
-					    GPIOF_IN, "arizona IRQ");
-		if (ret != 0) {
-			dev_err(arizona->dev,
-				"Failed to request IRQ GPIO %d:: %d\n",
-				arizona->pdata.irq_gpio, ret);
-			arizona->pdata.irq_gpio = 0;
+		if (gpio_irq != arizona->irq) {
+			dev_warn(arizona->dev, "IRQ %d does not match GPIO's IRQ %d\n",
+				 arizona->irq, gpio_irq);
+			arizona->irq = gpio_irq;
 		}
+		gpiod_set_consumer_name(arizona->irq_gpiod, "arizona IRQ");
 	}
-#endif
 
 	ret = request_threaded_irq(arizona->irq, NULL, arizona_irq_thread,
 				   flags, "arizona", arizona);
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
index d465dcd8c90a..2f980d51cdfa 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -178,11 +178,6 @@ struct arizona_pdata {
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
2.54.0


