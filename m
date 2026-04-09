Return-Path: <linux-gpio+bounces-34974-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3n5mI5wc2GmZXwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34974-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 23:39:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D42CD3CFF8E
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 23:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9106301225A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 21:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA29D2FF66B;
	Thu,  9 Apr 2026 21:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RX5o7PZF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95940855;
	Thu,  9 Apr 2026 21:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770775; cv=none; b=j05KRNwJaqQKaRpQtnc/7nNXfnfWboD5bFIaMMK+WnjRO4xJ/fztJZ6i20Jzibzm7lSziwPBOYHSpTdt1/pFiSn4xZnUoljXZ3xDQmMRgVgxj3xBHVH0Z6tTLv+3NBtxuAbKjaBU7JyW223GRsbEfcJQMpUPcCegcQ6mXAc9jlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770775; c=relaxed/simple;
	bh=Mw3j+pn6gNDmP0jA4E9YsNWuK/Isk58FfQaD0/dB3eY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BucCkjF0WYrNuo32Bl8wwNWrO1jmA2cuhAjBmLPd61miCfdgSlpEN+8IO6Hp0sFRrqJjR4XJe4T/Q+BkbZb50FVr5/NdJRd+V53IsyovXXqifhZZsg4lflLH5Ds3nEoVvZf7My1m1aVxVP3ebXIJ11Q2z4tGGQB9i0enRU2GTGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RX5o7PZF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D155C4CEF7;
	Thu,  9 Apr 2026 21:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775770775;
	bh=Mw3j+pn6gNDmP0jA4E9YsNWuK/Isk58FfQaD0/dB3eY=;
	h=From:Date:Subject:To:Cc:From;
	b=RX5o7PZFuGf8el3Ep97OQyc3dWMd4q7qQLCPEOfqjrEmrLj81zz7Y0KJXCR9GybQ9
	 54g/V9afYcBWky1d7AiJlmzE+36uINgcku1Eh9/drIHVGd8Ta/UNnrWlHKVsmhLTLs
	 PzaXLK3DZnkPbLQxu+t/fJ+c6NRdd2iG+MHAGO16VcJEHVLt74chPqS4+aoSmci+cj
	 WKFQ9j6kOXyYn5VGWdSzWAruDH4I8F7eth8rvYCZ63Lf3TLNUEYyYRuSKHhVz/Yjo4
	 8S/5wFj6ukaVXofwN8dR7BWbsSVberiF22oitzJfLSJC6/SwH4OQKwnvSB8HjWXFR/
	 9zZ0TnWkr4W3w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 09 Apr 2026 23:39:31 +0200
Subject: [PATCH v3] ASoC: uda1380: Modernize the driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-asoc-uda1380-v3-1-b3d5a53f31be@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBRF0a00jMXAp5biyH0YBxQ+LdGUBpRom
 u5d2onRxOF7ybkzSRg9JnKsZhIx++TDWIbYVcQMeuyRels2AQYNEyCpTsHQh9VctIwKZxoppYB
 aaVLIFNH555Y7X8oefLqH+Nrqma/vn1DmlFPXOMU7VJ107emKccTbPsSerKUMH10z9aOh6BosA
 yYVGnv40suyvAH7vEMH5wAAAA==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34974-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D42CD3CFF8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This codec driver depended on the legacy GPIO API, and nothing
in the kernel is defining the platform data, so get rid of this.

Two in-kernel device trees are defining this codec using
undocumented device tree properties, so support these for now.
The same properties can be defined using software nodes if board
files are desired. The device tree use the "-gpio" rather than
"-gpios" suffix but the GPIO DT parser will deal with that.

Since there may be out of tree users, migrate to GPIO descriptors,
drop the platform data that is unused, and assign the dac_clk the
value that was used in all platforms found in a historical dig,
and support setting the clock to the PLL using the undocumented
device tree property.

Add some menuconfig so the codec can be selected and tested.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
This makes the driver usable on contemporary Linux, maybe it will
even work, I can't test it.
---
Changes in v3:
- Drop dereference of platform data and check for its
  presence from probe()
- Scratch my head wondering why that compiled despite I had
  deleted the platform data struct in the same commit... I guess
  C thinks it's fine since it was just treating it as
  "some anonymous pointer" without even a forward-declaration.
- Link to v2: https://lore.kernel.org/r/20260409-asoc-uda1380-v2-1-42d02079ecd5@kernel.org

Changes in v2:
- Update commit message referencing existing device trees.
- Make sure the (undocumented) DT properties will work.
- Add clk source handling for the undocumented DT property as
  well while we're at it.
- Mention LPC32xx in the Kconfig.
- Link to v1: https://lore.kernel.org/r/20260327-asoc-uda1380-v1-1-f6f91be9b7f8@kernel.org
---
 include/sound/uda1380.h    | 19 --------------
 sound/soc/codecs/Kconfig   |  6 +++--
 sound/soc/codecs/uda1380.c | 65 ++++++++++++++++++++++++----------------------
 3 files changed, 38 insertions(+), 52 deletions(-)

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
index adb3fb923be3..71fd4e219604 100644
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
+	  Samsung reference boards, as well as the LPC32xx series.
 
 config SND_SOC_WCD_CLASSH
 	tristate
diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 9e9c540a45ca..d8a23a84b9e6 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -16,16 +16,19 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/property.h>
 #include <linux/workqueue.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/initval.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
-#include <sound/uda1380.h>
+
+#define UDA1380_DAC_CLK_SYSCLK 0
+#define UDA1380_DAC_CLK_WSPLL  1
 
 #include "uda1380.h"
 
@@ -36,6 +39,8 @@ struct uda1380_priv {
 	struct work_struct work;
 	struct i2c_client *i2c;
 	u16 *reg_cache;
+	struct gpio_desc *power;
+	struct gpio_desc *reset;
 };
 
 /*
@@ -150,13 +155,12 @@ static void uda1380_sync_cache(struct snd_soc_component *component)
 
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
 
@@ -589,9 +593,9 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	struct uda1380_priv *uda1380 = snd_soc_component_get_drvdata(component);
 	int pm = uda1380_read_reg_cache(component, UDA1380_PM);
 	int reg;
-	struct uda1380_platform_data *pdata = component->dev->platform_data;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -601,8 +605,8 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
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
@@ -612,10 +616,10 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
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
@@ -694,13 +698,12 @@ static struct snd_soc_dai_driver uda1380_dai[] = {
 
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
@@ -709,7 +712,7 @@ static int uda1380_probe(struct snd_soc_component *component)
 	INIT_WORK(&uda1380->work, uda1380_flush_work);
 
 	/* set clock input */
-	switch (pdata->dac_clk) {
+	switch (uda1380->dac_clk) {
 	case UDA1380_DAC_CLK_SYSCLK:
 		uda1380_write_reg_cache(component, UDA1380_CLK, 0);
 		break;
@@ -741,31 +744,31 @@ static const struct snd_soc_component_driver soc_component_dev_uda1380 = {
 
 static int uda1380_i2c_probe(struct i2c_client *i2c)
 {
-	struct uda1380_platform_data *pdata = i2c->dev.platform_data;
+	struct device *dev = &i2c->dev;
 	struct uda1380_priv *uda1380;
 	int ret;
 
-	if (!pdata)
-		return -EINVAL;
-
 	uda1380 = devm_kzalloc(&i2c->dev, sizeof(struct uda1380_priv),
 			       GFP_KERNEL);
 	if (uda1380 == NULL)
 		return -ENOMEM;
 
-	if (gpio_is_valid(pdata->gpio_reset)) {
-		ret = devm_gpio_request_one(&i2c->dev, pdata->gpio_reset,
-			GPIOF_OUT_INIT_LOW, "uda1380 reset");
-		if (ret)
-			return ret;
-	}
-
-	if (gpio_is_valid(pdata->gpio_power)) {
-		ret = devm_gpio_request_one(&i2c->dev, pdata->gpio_power,
-			GPIOF_OUT_INIT_LOW, "uda1380 power");
-		if (ret)
-			return ret;
-	}
+	uda1380->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(uda1380->reset))
+		return dev_err_probe(dev, PTR_ERR(uda1380->reset),
+				     "error obtaining reset GPIO\n");
+	gpiod_set_consumer_name(uda1380->reset, "uda1380 reset");
+
+	uda1380->power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
+	if (IS_ERR(uda1380->power))
+		return dev_err_probe(dev, PTR_ERR(uda1380->power),
+				     "error obtaining power GPIO\n");
+	gpiod_set_consumer_name(uda1380->power, "uda1380 power");
+
+	/* This is just some default */
+	uda1380->dac_clk = UDA1380_DAC_CLK_SYSCLK;
+	if (device_property_match_string(dev, "dac-clk", "wspll") >= 0)
+		uda1380->dac_clk = UDA1380_DAC_CLK_WSPLL;
 
 	uda1380->reg_cache = devm_kmemdup_array(&i2c->dev, uda1380_reg, ARRAY_SIZE(uda1380_reg),
 						sizeof(uda1380_reg[0]), GFP_KERNEL);

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260327-asoc-uda1380-3fc67773249a

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


