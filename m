Return-Path: <linux-gpio+bounces-33443-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANotKr3ntWkT6wAAu9opvQ
	(envelope-from <linux-gpio+bounces-33443-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 23:57:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DC28F669
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 23:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3658E3019BB3
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 22:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2E637F737;
	Sat, 14 Mar 2026 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCKFpXVh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D140E2772D;
	Sat, 14 Mar 2026 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773529016; cv=none; b=TBx0Dn7c9yQHoHAM3Wx//KDH/jk1lTQeytVoA8rYd4NL6aL/D42Onz6L0VIiB8U5vxuwKyXu43JeHXLLiw0POlitbxTtq3kEk1NvYqmOEE4tO1V1u4JZBzWFk97FwY99nani/Vd9rSYzDx0xEaV0Zzj3X/HdKjTZxiFb9O4Be8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773529016; c=relaxed/simple;
	bh=HTBn76J+zrddAYfE5QCFlT+eHYur3YWWbRorIKZsH3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c6KU7TWSGcqHA1NJYGc5C5jjQVbfb9vp8H03qZlgPG0Bnmer5nYaiq38jULxXqbIc6L2m6ac6/2+Bi6EJStQEaHJ7cXl0DYurB+2yflc7dLB21G4WqSTmvIJQZ7LglTFL3ikQyDQiQOipgPFBbKoxhmQxcOvnDZI7tK4Bqt9PHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCKFpXVh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A79C116C6;
	Sat, 14 Mar 2026 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773529015;
	bh=HTBn76J+zrddAYfE5QCFlT+eHYur3YWWbRorIKZsH3E=;
	h=From:Date:Subject:To:Cc:From;
	b=cCKFpXVhrNM4vpHStdRLyUwRCcHinaMyRfIlmaNFrnFYhoInqLWPnjhD1aM0oYZXc
	 zF9RQkrDXn3jLoPAFp116s/mxwS5Y9RFoambA3UZbcO1sUJyGFM8hMd5hRqG21IV4U
	 bFLAlB7QNYl0NnICYleSn+EBhq1Zw5RBTEQpsAGINE4/KqRAUXC4+c2jQ8F4k9sMYk
	 hYAurn7BOeKpoWUfeDQ8yUcmwOOKSXcSrMG983aUc0s6yCT0fpdtFX35rtusFxoWZh
	 BCfsmOD9jaCUDGT4UYmOSDBFLTd2rW+MJGheQ3lWXnANtJkneQFsUA0eErYJWLyYfP
	 31TArudNLM8HQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 23:56:49 +0100
Subject: [PATCH] ASoC: codec: arizona: Convert to use GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MT3cTi/GTdxKLMqvy8RF1LCxMLc2Nj85RU8yQloJaCotS0zAqwcdG
 xtbUAAfs3+V4AAAA=
X-Change-ID: 20260314-asoc-arizona-98487337de7b
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,armlinux.org.uk,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33443-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 513DC28F669
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This converts the Arizona driver to use GPIO descriptors
exclusively, deletes the legacy code path an updates the
in-tree user of legacy GPIO.

The GPIO lines for mic detect polarity and headphone ID
detection are made exclusively descriptor-oriented. The
headphone ID detection could actually only be used by
the legacy GPIO code, but I converted it to use a
descriptor if someone would actually need it so we don't
just drop useful code.

The compatible "wlf,hpdet-id-gpio" is not in the device
tree bindings and only intended to be used by software
nodes if any. If someone insists I can try to add a
binding for it, but I doubt there is any real user so
it seems pointless.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
This patch hits all over the place, but I think merging it to
the ASoC tree would be the best.
---
 arch/arm/mach-s3c/mach-crag6410-module.c |  6 +-
 include/linux/mfd/arizona/pdata.h        | 10 ----
 sound/soc/codecs/arizona-jack.c          | 95 ++++++++++----------------------
 sound/soc/codecs/arizona.h               |  1 +
 4 files changed, 34 insertions(+), 78 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 4ffcf024b09d..14b0f9cc103e 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -239,7 +239,6 @@ static struct gpiod_lookup_table wm8994_gpiod_table = {
 static struct arizona_pdata wm5102_reva_pdata = {
 	.gpio_base = CODEC_GPIO_BASE,
 	.irq_flags = IRQF_TRIGGER_HIGH,
-	.micd_pol_gpio = CODEC_GPIO_BASE + 4,
 	.micd_rate = 6,
 	.gpio_defaults = {
 		[2] = 0x10000, /* AIF3TXLRCLK */
@@ -265,6 +264,8 @@ static struct gpiod_lookup_table wm5102_reva_gpiod_table = {
 	.table = {
 		GPIO_LOOKUP("GPION", 7,
 			    "wlf,ldoena", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("arizona", 4,
+			    "wlf,micd-pol", GPIO_ACTIVE_HIGH),
 		{ },
 	},
 };
@@ -272,7 +273,6 @@ static struct gpiod_lookup_table wm5102_reva_gpiod_table = {
 static struct arizona_pdata wm5102_pdata = {
 	.gpio_base = CODEC_GPIO_BASE,
 	.irq_flags = IRQF_TRIGGER_HIGH,
-	.micd_pol_gpio = CODEC_GPIO_BASE + 2,
 	.gpio_defaults = {
 		[2] = 0x10000, /* AIF3TXLRCLK */
 		[3] = 0x4,     /* OPCLK */
@@ -297,6 +297,8 @@ static struct gpiod_lookup_table wm5102_gpiod_table = {
 	.table = {
 		GPIO_LOOKUP("GPION", 7,
 			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("arizona", 2,
+			    "wlf,micd-pol", GPIO_ACTIVE_HIGH),
 		{ },
 	},
 };
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index f72e6d4b14a7..d465dcd8c90a 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -117,11 +117,6 @@ struct arizona_pdata {
 	/** Check for line output with HPDET method */
 	bool hpdet_acc_id_line;
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	/** GPIO used for mic isolation with HPDET */
-	int hpdet_id_gpio;
-#endif
-
 	/** Channel to use for headphone detection */
 	unsigned int hpdet_channel;
 
@@ -131,11 +126,6 @@ struct arizona_pdata {
 	/** Extra debounce timeout used during initial mic detection (ms) */
 	unsigned int micd_detect_debounce;
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	/** GPIO for mic detection polarity */
-	int micd_pol_gpio;
-#endif
-
 	/** Mic detect ramp rate */
 	unsigned int micd_bias_start_time;
 
diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 303c1d44ebd8..a9063bac2752 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -11,7 +11,6 @@
 #include <linux/interrupt.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/input.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -459,11 +458,6 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 			       bool *mic)
 {
 	struct arizona *arizona = info->arizona;
-#ifdef CONFIG_GPIOLIB_LEGACY
-	int id_gpio = arizona->pdata.hpdet_id_gpio;
-#else
-	int id_gpio = 0;
-#endif
 
 	if (!arizona->pdata.hpdet_acc_id)
 		return 0;
@@ -474,9 +468,8 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 	 */
 	info->hpdet_res[info->num_hpdet_res++] = *reading;
 
-#ifdef CONFIG_GPIOLIB_LEGACY
 	/* Only check the mic directly if we didn't already ID it */
-	if (id_gpio && info->num_hpdet_res == 1) {
+	if (info->hpdet_id_gpio && info->num_hpdet_res == 1) {
 		dev_dbg(arizona->dev, "Measuring mic\n");
 
 		regmap_update_bits(arizona->regmap,
@@ -486,13 +479,12 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 				   ARIZONA_ACCDET_MODE_HPR |
 				   info->micd_modes[0].src);
 
-		gpio_set_value_cansleep(id_gpio, 1);
+		gpiod_set_value_cansleep(info->hpdet_id_gpio, 1);
 
 		regmap_update_bits(arizona->regmap, ARIZONA_HEADPHONE_DETECT_1,
 				   ARIZONA_HP_POLL, ARIZONA_HP_POLL);
 		return -EAGAIN;
 	}
-#endif
 
 	/* OK, got both.  Now, compare... */
 	dev_dbg(arizona->dev, "HPDET measured %d %d\n",
@@ -514,7 +506,7 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 	/*
 	 * If we measure the mic as high impedance
 	 */
-	if (!id_gpio || info->hpdet_res[1] > 50) {
+	if (!info->hpdet_id_gpio || info->hpdet_res[1] > 50) {
 		dev_dbg(arizona->dev, "Detected mic\n");
 		*mic = true;
 		info->detecting = true;
@@ -533,9 +525,6 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 {
 	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
-#ifdef CONFIG_GPIOLIB_LEGACY
-	int id_gpio = arizona->pdata.hpdet_id_gpio;
-#endif
 	int ret, reading, state, report;
 	bool mic = false;
 
@@ -591,10 +580,8 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	arizona_extcon_hp_clamp(info, false);
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	if (id_gpio)
-		gpio_set_value_cansleep(id_gpio, 0);
-#endif
+	if (info->hpdet_id_gpio)
+		gpiod_set_value_cansleep(info->hpdet_id_gpio, 0);
 
 	/* If we have a mic then reenable MICDET */
 	if (state && (mic || info->mic))
@@ -1325,58 +1312,33 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
 				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	if (pdata->micd_pol_gpio > 0) {
-		if (info->micd_modes[0].gpio)
-			mode = GPIOF_OUT_INIT_HIGH;
-		else
-			mode = GPIOF_OUT_INIT_LOW;
-
-		ret = devm_gpio_request_one(dev, pdata->micd_pol_gpio,
-					    mode, "MICD polarity");
-		if (ret != 0) {
-			dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
-				pdata->micd_pol_gpio, ret);
-			return ret;
-		}
-
-		info->micd_pol_gpio = gpio_to_desc(pdata->micd_pol_gpio);
-	} else
-#endif
-	{
-		if (info->micd_modes[0].gpio)
-			mode = GPIOD_OUT_HIGH;
-		else
-			mode = GPIOD_OUT_LOW;
+	if (info->micd_modes[0].gpio)
+		mode = GPIOD_OUT_HIGH;
+	else
+		mode = GPIOD_OUT_LOW;
 
-		/* We can't use devm here because we need to do the get
-		 * against the MFD device, as that is where the of_node
-		 * will reside, but if we devm against that the GPIO
-		 * will not be freed if the extcon driver is unloaded.
-		 */
-		info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
-							 "wlf,micd-pol",
-							 mode);
-		if (IS_ERR(info->micd_pol_gpio)) {
-			ret = PTR_ERR(info->micd_pol_gpio);
-			dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
-			return ret;
-		}
+	/* We can't use devm here because we need to do the get
+	 * against the MFD device, as that is where the of_node
+	 * will reside, but if we devm against that the GPIO
+	 * will not be freed if the extcon driver is unloaded.
+	 */
+	info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
+						 "wlf,micd-pol",
+						 mode);
+	if (IS_ERR(info->micd_pol_gpio)) {
+		ret = PTR_ERR(info->micd_pol_gpio);
+		dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
+		return ret;
 	}
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	if (arizona->pdata.hpdet_id_gpio > 0) {
-		ret = devm_gpio_request_one(dev, arizona->pdata.hpdet_id_gpio,
-					    GPIOF_OUT_INIT_LOW,
-					    "HPDET");
-		if (ret != 0) {
-			dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
-				arizona->pdata.hpdet_id_gpio, ret);
-			gpiod_put(info->micd_pol_gpio);
-			return ret;
-		}
+	info->hpdet_id_gpio = gpiod_get_optional(arizona->dev,
+						 "wlf,hpdet-id-gpio",
+						 mode);
+	if (IS_ERR(info->hpdet_id_gpio)) {
+		ret = PTR_ERR(info->hpdet_id_gpio);
+		dev_err_probe(arizona->dev, ret, "getting headphone detect ID GPIO\n");
+		return ret;
 	}
-#endif
 
 	return 0;
 }
@@ -1385,6 +1347,7 @@ EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_probe);
 int arizona_jack_codec_dev_remove(struct arizona_priv *info)
 {
 	gpiod_put(info->micd_pol_gpio);
+	gpiod_put(info->hpdet_id_gpio);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_remove);
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index ecd8890eefc1..0703182d87b3 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -100,6 +100,7 @@ struct arizona_priv {
 	struct snd_soc_jack *jack;
 	struct regulator *micvdd;
 	struct gpio_desc *micd_pol_gpio;
+	struct gpio_desc *hpdet_id_gpio;
 
 	u16 last_jackdet;
 

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260314-asoc-arizona-98487337de7b

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


