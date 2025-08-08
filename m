Return-Path: <linux-gpio+bounces-24091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F6B1EBDC
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D972E18844D6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709372857F7;
	Fri,  8 Aug 2025 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsI4smAA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293922836A4;
	Fri,  8 Aug 2025 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666564; cv=none; b=KgJ5EwlVjtwaWjcnlFsj/Qz8E5nQEtgA66BZ3DYc8CqFQF1Vwk5xbEHDEc+Lmdb1lwxlZ6lu5zwaUQpVYn4f0D52duyFVPuJT4FDazbgJBilQ3qki52FkVXPxOiFwSAuhiNd6y4KCQ5gu1VeCdaixLY6Uez3o+tc/dwrvKdZbFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666564; c=relaxed/simple;
	bh=zmHMo93j0L5Snrv0b67PtRKhF2uXz8MO7dYX49srANA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lzInjya0dfZJUdK3c2epWfPuCvcetmC9xCvBaUQb8c4E74Af6xXl1J5voNbe/b0rtDPUiA0RilTh/oQJBF/z392AXBq7vECxGe4no22oyg8yc6Gi1zEFTaw83DpplYixN1wLcmb9yB+wTrl6w0i5nxOkiNV0Vd/wz3J+kvj/dG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsI4smAA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56BAC4CEED;
	Fri,  8 Aug 2025 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666563;
	bh=zmHMo93j0L5Snrv0b67PtRKhF2uXz8MO7dYX49srANA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZsI4smAADw7Mj0ZHDY+AAyS4BD7Q69MT4wmaP8sOLCsH73gnLHQvZmH/4xOz96hX9
	 a6vHRUMq3QHHb1xkLeLWq4okKm4dT3iM0miv3Iv7dfM8uU6kwRN+YtHXC6GSBs3yRh
	 fhQ39dbxrbNt/xtS7Rh1nbl6DdpHedgzrFq2llleBOUaaLXyO0sHDYydj9tprQWFaT
	 cTtsTiPNtOrLpoaSe0LF4GbMcDQta7j2hhT3MV+TBCHMzpR3qMt7XGhajaAF7XltkF
	 vohbWZOlb9zulLkMUYpSpt92qG2b3nVsX943eITVLKfMEVrFukAOl6XIIFntkVWN4y
	 hZoEOs8k9bdCA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 12/21] mfd: arizona: make legacy gpiolib interface optional
Date: Fri,  8 Aug 2025 17:17:56 +0200
Message-Id: <20250808151822.536879-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The only machine that still uses the old gpio number based interface
is the wlf_cragg_6410 board file. In order to remove the dependency
on the interfaces, add #ifdef blocks here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mfd/arizona-irq.c         |  5 ++++-
 include/linux/mfd/arizona/pdata.h |  6 ++++++
 sound/soc/codecs/arizona-jack.c   | 17 ++++++++++++++++-
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index 3f8622ee0e59..544016d420fe 100644
--- a/drivers/mfd/arizona-irq.c
+++ b/drivers/mfd/arizona-irq.c
@@ -136,7 +136,7 @@ static irqreturn_t arizona_irq_thread(int irq, void *data)
 			dev_err(arizona->dev,
 				"Failed to read main IRQ status: %d\n", ret);
 		}
-
+#ifdef CONFIG_GPIOLIB_LEGACY
 		/*
 		 * Poll the IRQ pin status to see if we're really done
 		 * if the interrupt controller can't do it for us.
@@ -150,6 +150,7 @@ static irqreturn_t arizona_irq_thread(int irq, void *data)
 			   !gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
 			poll = true;
 		}
+#endif
 	} while (poll);
 
 	pm_runtime_put_autosuspend(arizona->dev);
@@ -349,6 +350,7 @@ int arizona_irq_init(struct arizona *arizona)
 		goto err_map_main_irq;
 	}
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	/* Used to emulate edge trigger and to work around broken pinmux */
 	if (arizona->pdata.irq_gpio) {
 		if (gpio_to_irq(arizona->pdata.irq_gpio) != arizona->irq) {
@@ -368,6 +370,7 @@ int arizona_irq_init(struct arizona *arizona)
 			arizona->pdata.irq_gpio = 0;
 		}
 	}
+#endif
 
 	ret = request_threaded_irq(arizona->irq, NULL, arizona_irq_thread,
 				   flags, "arizona", arizona);
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index 2d13bbea4f3a..f72e6d4b14a7 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -117,8 +117,10 @@ struct arizona_pdata {
 	/** Check for line output with HPDET method */
 	bool hpdet_acc_id_line;
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	/** GPIO used for mic isolation with HPDET */
 	int hpdet_id_gpio;
+#endif
 
 	/** Channel to use for headphone detection */
 	unsigned int hpdet_channel;
@@ -129,8 +131,10 @@ struct arizona_pdata {
 	/** Extra debounce timeout used during initial mic detection (ms) */
 	unsigned int micd_detect_debounce;
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	/** GPIO for mic detection polarity */
 	int micd_pol_gpio;
+#endif
 
 	/** Mic detect ramp rate */
 	unsigned int micd_bias_start_time;
@@ -184,8 +188,10 @@ struct arizona_pdata {
 	/** Haptic actuator type */
 	unsigned int hap_act;
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	/** GPIO for primary IRQ (used for edge triggered emulation) */
 	int irq_gpio;
+#endif
 
 	/** General purpose switch control */
 	unsigned int gpsw;
diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 22f9c431a0e5..6b55610ad535 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -461,7 +461,11 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 			       bool *mic)
 {
 	struct arizona *arizona = info->arizona;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	int id_gpio = arizona->pdata.hpdet_id_gpio;
+#else
+	int id_gpio = 0;
+#endif
 
 	if (!arizona->pdata.hpdet_acc_id)
 		return 0;
@@ -472,6 +476,7 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 	 */
 	info->hpdet_res[info->num_hpdet_res++] = *reading;
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	/* Only check the mic directly if we didn't already ID it */
 	if (id_gpio && info->num_hpdet_res == 1) {
 		dev_dbg(arizona->dev, "Measuring mic\n");
@@ -489,6 +494,7 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 				   ARIZONA_HP_POLL, ARIZONA_HP_POLL);
 		return -EAGAIN;
 	}
+#endif
 
 	/* OK, got both.  Now, compare... */
 	dev_dbg(arizona->dev, "HPDET measured %d %d\n",
@@ -529,7 +535,9 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 {
 	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	int id_gpio = arizona->pdata.hpdet_id_gpio;
+#endif
 	int ret, reading, state, report;
 	bool mic = false;
 
@@ -585,8 +593,10 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	arizona_extcon_hp_clamp(info, false);
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	if (id_gpio)
 		gpio_set_value_cansleep(id_gpio, 0);
+#endif
 
 	/* If we have a mic then reenable MICDET */
 	if (state && (mic || info->mic))
@@ -1317,6 +1327,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
 				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	if (pdata->micd_pol_gpio > 0) {
 		if (info->micd_modes[0].gpio)
 			mode = GPIOF_OUT_INIT_HIGH;
@@ -1332,7 +1343,9 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 		}
 
 		info->micd_pol_gpio = gpio_to_desc(pdata->micd_pol_gpio);
-	} else {
+	} else
+#endif
+	{
 		if (info->micd_modes[0].gpio)
 			mode = GPIOD_OUT_HIGH;
 		else
@@ -1353,6 +1366,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 		}
 	}
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	if (arizona->pdata.hpdet_id_gpio > 0) {
 		ret = devm_gpio_request_one(dev, arizona->pdata.hpdet_id_gpio,
 					    GPIOF_OUT_INIT_LOW,
@@ -1364,6 +1378,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 			return ret;
 		}
 	}
+#endif
 
 	return 0;
 }
-- 
2.39.5


