Return-Path: <linux-gpio+bounces-34233-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLeqJXs7xmm7HgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34233-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:10:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2503340C90
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1F37304D263
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 08:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D260938839E;
	Fri, 27 Mar 2026 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTpDLsLO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CE13CD8DE;
	Fri, 27 Mar 2026 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598752; cv=none; b=cLB9z+0Yd5CRlH0aroMUkQ6aOkbqhXFqjLTq98AHznrjSlOlNGdnVODtb9TZ0frcNWwgKSHL2yDhcu1fMrj8zT+71k/94p1cUS96cGPYgjEu3eIFyHRIG/pC09srf7dNFEDGaNTPFGFwCr8n2pb4H4xbAOHVmMO730vajfhzb5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598752; c=relaxed/simple;
	bh=Bv4/Y8lJ6NAbAEPN6r/5Z3DUXsK0z/ia4RMACrqi9ZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dsN88Gov6RFkKcDSOdrDHov3Pf0WQmWLqGEXBcb3a4f2WZWcAdh6Lj1E1PjCPa8cjgaV8V5MqFe6ig3rgimArxtwcqLHMF1s+vXgTKc1U83ivJFfJRslE1y2tI3oQvhN1wJ+3fQmHgdnrHywAXqOm2xIRzkcLZGAnZj6JPXDPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTpDLsLO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839B8C19423;
	Fri, 27 Mar 2026 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774598751;
	bh=Bv4/Y8lJ6NAbAEPN6r/5Z3DUXsK0z/ia4RMACrqi9ZU=;
	h=From:Date:Subject:To:Cc:From;
	b=eTpDLsLO6Cd65yxoP3gzCMOhkjhmxEGSkuoop5OPlbLZO9y9H+CTeHiPB8oVHlyjE
	 FuDO0yzqhcC/lamg86m45VpoyWxdrZnHgjlWbnwc/kfUMiDPfJw9eJzy7dMC8GtnZf
	 rxfbwUhML5Wxl1bKKtm8Sx7hBbY5g2+W8a01VZ2joWLMviKdWK4jY5Dp9OOHseRqgD
	 yEdm4og4laxBs3Qa7GRoDepx1H+71XuVIxUM3EB7ZEie6nx+1jWpZcYNzjrarY4M3R
	 qwcDB1YHR4I0hWtY2Wz+49QPAU2I8EH6nNrBrYh1rT2z/bmTEr+NNc3Qf/2JkSnf30
	 8+gNLj6kgqLBA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 09:05:47 +0100
Subject: [PATCH] ASoC: uda1380: Modernize the driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-asoc-uda1380-v1-1-f6f91be9b7f8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNz3cTi/GTd0pREQ2MLA13jtGQzc3NzYyMTy0QloJaCotS0zAqwcdG
 xtbUA38MAml4AAAA=
X-Change-ID: 20260327-asoc-uda1380-3fc67773249a
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34233-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[pengutronix.de,perex.cz,suse.com,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2503340C90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This codec driver depended on the legacy GPIO API, and nothing
in the kernel is defining the platform data.

Since there may be out of tree users, migrate to GPIO descriptors,
drop the platform data that is unused, and assign the dac_clk the
value that was used in all platforms found in a historical dig.

Add some menuconfig so the codec can be selected and tested.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Maybe this driver should rather be deleted if there are no
real users left, but that can be done after this patch if
so desired. This makes the driver usable on contemporary Linux.
---
 include/sound/uda1380.h    | 19 ----------------
 sound/soc/codecs/Kconfig   |  6 +++--
 sound/soc/codecs/uda1380.c | 56 +++++++++++++++++++++++++---------------------
 3 files changed, 34 insertions(+), 47 deletions(-)

diff --git a/include/sound/uda1380.h b/include/sound/uda1380.h
deleted file mode 100644
index 2e42ea2d0cfd..000000000000
--- a/include/sound/uda1380.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * UDA1380 ALSA SoC Codec driver
- *
- * Copyright 2009 Philipp Zabel
- */
-
-#ifndef __UDA1380_H
-#define __UDA1380_H
-
-struct uda1380_platform_data {
-	int gpio_power;
-	int gpio_reset;
-	int dac_clk;
-#define UDA1380_DAC_CLK_SYSCLK 0
-#define UDA1380_DAC_CLK_WSPLL  1
-};
-
-#endif /* __UDA1380_H */
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index adb3fb923be3..c374a50fb6e0 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2364,9 +2364,11 @@ config SND_SOC_UDA1342
 	  mic inputs), stereo audio DAC, with basic audio processing.
 
 config SND_SOC_UDA1380
-	tristate
+	tristate "Philips UDA1380 CODEC"
 	depends on I2C
-	depends on GPIOLIB_LEGACY
+	help
+	  The UDA1380 codec is used in the HTC Magician and on a number of
+	  Samsung reference boards.
 
 config SND_SOC_WCD_CLASSH
 	tristate
diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 9e9c540a45ca..421ae6cb7d8d 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -16,7 +16,7 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/workqueue.h>
@@ -25,7 +25,9 @@
 #include <sound/initval.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
-#include <sound/uda1380.h>
+
+#define UDA1380_DAC_CLK_SYSCLK 0
+#define UDA1380_DAC_CLK_WSPLL  1
 
 #include "uda1380.h"
 
@@ -36,6 +38,8 @@ struct uda1380_priv {
 	struct work_struct work;
 	struct i2c_client *i2c;
 	u16 *reg_cache;
+	struct gpio_desc *power;
+	struct gpio_desc *reset;
 };
 
 /*
@@ -150,13 +154,12 @@ static void uda1380_sync_cache(struct snd_soc_component *component)
 
 static int uda1380_reset(struct snd_soc_component *component)
 {
-	struct uda1380_platform_data *pdata = component->dev->platform_data;
 	struct uda1380_priv *uda1380 = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(pdata->gpio_reset)) {
-		gpio_set_value(pdata->gpio_reset, 1);
+	if (uda1380->reset) {
+		gpiod_set_value(uda1380->reset, 1);
 		mdelay(1);
-		gpio_set_value(pdata->gpio_reset, 0);
+		gpiod_set_value(uda1380->reset, 0);
 	} else {
 		u8 data[3];
 
@@ -589,9 +592,9 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	struct uda1380_priv *uda1380 = snd_soc_component_get_drvdata(component);
 	int pm = uda1380_read_reg_cache(component, UDA1380_PM);
 	int reg;
-	struct uda1380_platform_data *pdata = component->dev->platform_data;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -601,8 +604,8 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
-			if (gpio_is_valid(pdata->gpio_power)) {
-				gpio_set_value(pdata->gpio_power, 1);
+			if (uda1380->power) {
+				gpiod_set_value(uda1380->power, 1);
 				mdelay(1);
 				uda1380_reset(component);
 			}
@@ -612,10 +615,10 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
 		uda1380_write(component, UDA1380_PM, 0x0);
 		break;
 	case SND_SOC_BIAS_OFF:
-		if (!gpio_is_valid(pdata->gpio_power))
+		if (!uda1380->power)
 			break;
 
-		gpio_set_value(pdata->gpio_power, 0);
+		gpiod_set_value(uda1380->power, 0);
 
 		/* Mark mixer regs cache dirty to sync them with
 		 * codec regs on power on.
@@ -694,13 +697,12 @@ static struct snd_soc_dai_driver uda1380_dai[] = {
 
 static int uda1380_probe(struct snd_soc_component *component)
 {
-	struct uda1380_platform_data *pdata =component->dev->platform_data;
 	struct uda1380_priv *uda1380 = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	uda1380->component = component;
 
-	if (!gpio_is_valid(pdata->gpio_power)) {
+	if (!uda1380->power) {
 		ret = uda1380_reset(component);
 		if (ret)
 			return ret;
@@ -709,7 +711,7 @@ static int uda1380_probe(struct snd_soc_component *component)
 	INIT_WORK(&uda1380->work, uda1380_flush_work);
 
 	/* set clock input */
-	switch (pdata->dac_clk) {
+	switch (uda1380->dac_clk) {
 	case UDA1380_DAC_CLK_SYSCLK:
 		uda1380_write_reg_cache(component, UDA1380_CLK, 0);
 		break;
@@ -742,6 +744,7 @@ static const struct snd_soc_component_driver soc_component_dev_uda1380 = {
 static int uda1380_i2c_probe(struct i2c_client *i2c)
 {
 	struct uda1380_platform_data *pdata = i2c->dev.platform_data;
+	struct device *dev = &i2c->dev;
 	struct uda1380_priv *uda1380;
 	int ret;
 
@@ -753,19 +756,20 @@ static int uda1380_i2c_probe(struct i2c_client *i2c)
 	if (uda1380 == NULL)
 		return -ENOMEM;
 
-	if (gpio_is_valid(pdata->gpio_reset)) {
-		ret = devm_gpio_request_one(&i2c->dev, pdata->gpio_reset,
-			GPIOF_OUT_INIT_LOW, "uda1380 reset");
-		if (ret)
-			return ret;
-	}
+	uda1380->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(uda1380->reset))
+		return dev_err_probe(dev, PTR_ERR(uda1380->reset),
+				     "error obtaining reset GPIO\n");
+	gpiod_set_consumer_name(uda1380->reset, "uda1380 reset");
 
-	if (gpio_is_valid(pdata->gpio_power)) {
-		ret = devm_gpio_request_one(&i2c->dev, pdata->gpio_power,
-			GPIOF_OUT_INIT_LOW, "uda1380 power");
-		if (ret)
-			return ret;
-	}
+	uda1380->power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
+	if (IS_ERR(uda1380->power))
+		return dev_err_probe(dev, PTR_ERR(uda1380->power),
+				     "error obtaining power GPIO\n");
+	gpiod_set_consumer_name(uda1380->power, "uda1380 power");
+
+	/* TODO: add device properties to make WPLL selectable here */
+	uda1380->dac_clk = UDA1380_DAC_CLK_SYSCLK;
 
 	uda1380->reg_cache = devm_kmemdup_array(&i2c->dev, uda1380_reg, ARRAY_SIZE(uda1380_reg),
 						sizeof(uda1380_reg[0]), GFP_KERNEL);

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260327-asoc-uda1380-3fc67773249a

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


