Return-Path: <linux-gpio+bounces-33854-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIPpJwJGvGkJwQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33854-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:52:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A42552D15FF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48C14300F280
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2832F351C0A;
	Thu, 19 Mar 2026 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVU55Kkh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51A39448C;
	Thu, 19 Mar 2026 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946238; cv=none; b=HQo074qkTU3Bb6TXL1g6/0WTwX0rJTCjsIgHLtFPHfvxN7bTx4MFM8j8sLSOuCjMGvh56MZe9dgqVKhSafYok+a3cyzgSwYCyeFBckgiyMVhUYggGFKpBgEFSczTViFxOHT584Zvl5qhkfHks4mINpbhColjivuv7m7GaFpuCjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946238; c=relaxed/simple;
	bh=6Ib9jU3aOH6lQGqlaGFj3oI/K4w2PhXn5cwJ3v7Ne6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JK4gP+TA2e0QVtNeG3Jvi06TrBkBTvvswhALz5/iKtnAWOb2eA4kz1jFLGed31d6arZbrcS3VNogq7AD4HMrR6R/pJiNS4QVpoxy0UwLFuhmMPgbIjOYUCbU2ib4HWN1NFUVr2Ku4hlHP0vOERyle7OaWgPB4zjGURBArTBE9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVU55Kkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF76C19424;
	Thu, 19 Mar 2026 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773946238;
	bh=6Ib9jU3aOH6lQGqlaGFj3oI/K4w2PhXn5cwJ3v7Ne6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jVU55KkhwTk/Y2kVlK69o3Gluf+r4Sud9ghKiBe3tsYoLpBmbatYmjwo8bGRQeD0k
	 /C4ITmSdOzNCA5nukKsAnsjZVArx01BtgFb3YTt7JFlerpyAXfUqFW0kVnqlcZnUwH
	 GvWoi9qFH+QesJBZndVPCDKOefNZv+VzMqVNGahjgPqenhRss3soVxRxfM9bLY0ZeF
	 2Q9D+vaMrt7MpV0LcVfsmlVuGyf8WieaZGcJN5+nBVWAKQJ62P7hEjwIHmI0Tj8zNo
	 AvXWMDorsIvgJVzQBZxAS2MbQAfUkfy0jxQYHWNwYLCXclagVy0uAVxSOKNGGK2npU
	 MNxpad1Ci2K5w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 19:50:30 +0100
Subject: [PATCH v3 2/2] mfd: arizona: Convert GPIO IRQ handling to
 descriptors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-mfd-arizona-irq-v3-2-24c251377ec2@kernel.org>
References: <20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org>
In-Reply-To: <20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33854-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A42552D15FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the arizona polling GPIO handling to use a GPIO descripor
instead of passing a global GPIO number as platform data.

This mechanism is not used in the kernel, but let's preserve
the mechanism to be nice.

Users can define "irq-gpios" in the devicetree or software node
for the Arizona chip to provide the GPIO line corresponding to
the IRQ.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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


