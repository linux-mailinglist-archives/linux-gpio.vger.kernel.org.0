Return-Path: <linux-gpio+bounces-35539-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEMDGJwi72lV7gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35539-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:47:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0746F55E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8DA8300C92D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5690139D6EA;
	Mon, 27 Apr 2026 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKv2mHC0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169542C1595;
	Mon, 27 Apr 2026 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279410; cv=none; b=IhMPGs6utmRHctaKm3AUGUVGz6wkvTuEJ9C9773s6wf5R6U9L7hkCYc0t5sEtabY/I4+DgjXB9qcwe5/NbGOyQ53hW6J8kaeZ9Nl1QfWmgU/COUsw1UxMr5886nxb+X8I74MG8lBYjQDXtff6LzrlTv5/2fcBmK/35BoEfWwGfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279410; c=relaxed/simple;
	bh=KCueZmmoHlvP4A3Xk2iIvGya+WKumH5loHUbnb/3clk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a+NK9thwdS6ljS0l8f/3wmxvwB/u0/LJdMDlgGscRs4nJkhZ2Stf+BrsGsGIiguc5J7qZtwa7h0xCQXV2qj7lJJTQz755X3uKUkbm9cmJq6vKVQhcme5mI7La3AsitehZq+imdMNNSv1vx13HFcSWQD8i3GGZigIwdH/9cC4yNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKv2mHC0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3AAC19425;
	Mon, 27 Apr 2026 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777279409;
	bh=KCueZmmoHlvP4A3Xk2iIvGya+WKumH5loHUbnb/3clk=;
	h=From:Date:Subject:To:Cc:From;
	b=LKv2mHC0JO7umYbDcD8B/P9XEjd3tPBb8ilMV30Zq7u7FdcEyWa3CA4vIBMU6PGge
	 XpbpxGK+//Ug+K9Bn61GZs0sFA6MYDHhOvPrD859XTPmFHE3oGUqMmnS1A84V+fzaQ
	 3gZv6aqL9PoI5V5gLRernrwSqaaVu/1Lf1qZUSvnkf0xfKkYHTc9arkR31Epg9RZav
	 37y+COkiWh/W0vuzRRbGRGGTrqpW1oUJisev1GWXWRhlsPbCmwPj7OJfs9JYhhmafs
	 vIAJHySLW5nnSsJvJK9ZgJTKhkSMfb7sl/V4uovTEsNCZbX/q6dGpW8QKxkQDJkApJ
	 atgoLT1bS74Zg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 10:43:21 +0200
Subject: [PATCH v2] ASoC: wsa881x: Move custom workaround to gpiolib-of
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMSwrCMBSF4a2UOzaSB02CI/chHcT0tg1KIjcSK
 yV7NxYcOPwPnG+DjBQww6nbgLCEHFJsIQ8d+MXFGVkYW4PkUnMlNXM5efbKzlqxMq2U92YyXCg
 J7fIgnMK6c5eh9RLyM9F714v4rj/I/ENFMMF6NXreW21QX883pIj3Y6IZhlrrB3TnKsGpAAAA
X-Change-ID: 20260326-asoc-wsa881x-633cc7f70132
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: F3D0746F55E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35539-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The WSA881x codec driver has a local workaround for old device
trees that have the "powerdown" GPIO flagged as active high,
despite it is active low.

This quirk can be replaced by a single quirk entry in
gpiolib-of.c

Drop all polarity inversion code and drop the surplus
gpiod_direction_output() call in probe() since we now set up
the line correctly when getting the GPIO.

Also drop the inclusion of the unused <linux/gpio.h>.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Perhaps this can be applied to ASoC directly we seldom add
things to these quirks so I think it'll be fine.

I was thinking of adding Fixes: but the current code is fine,
we don't really fix anything we just make it simpler.
---
Changes in v2:
- Property name needs to be "powerdown-gpios" not just "powerdown".
- Link to v1: https://lore.kernel.org/r/20260327-asoc-wsa881x-v1-1-53dc05867e6b@kernel.org
---
 drivers/gpio/gpiolib-of.c  |  8 ++++++++
 sound/soc/codecs/wsa881x.c | 35 ++++-------------------------------
 2 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2c923d17541f..90f6295ab338 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -240,6 +240,14 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 * treats it as "active low".
 		 */
 		{ "ti,tsc2005",		"reset-gpios",	false },
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_WSA881X)
+		/*
+		 * WSA881 powerdown is always active low, but some device trees
+		 * missed this when first contributed. It also has a very strange
+		 * compatible.
+		 */
+		{ "sdw10217201000",	"powerdown-gpios", false },
 #endif
 	};
 	unsigned int i;
diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 2fc234adca5f..d15fda648dad 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -3,7 +3,6 @@
 // Copyright (c) 2019, Linaro Limited
 
 #include <linux/bitops.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -672,11 +671,6 @@ struct wsa881x_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WSA881X_MAX_SWR_PORTS];
 	struct gpio_desc *sd_n;
-	/*
-	 * Logical state for SD_N GPIO: high for shutdown, low for enable.
-	 * For backwards compatibility.
-	 */
-	unsigned int sd_n_val;
 	int active_ports;
 	bool hw_init;
 	bool port_prepared[WSA881X_MAX_SWR_PORTS];
@@ -1121,31 +1115,11 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");
 
-	/*
-	 * Backwards compatibility work-around.
-	 *
-	 * The SD_N GPIO is active low, however upstream DTS used always active
-	 * high.  Changing the flag in driver and DTS will break backwards
-	 * compatibility, so add a simple value inversion to work with both old
-	 * and new DTS.
-	 *
-	 * This won't work properly with DTS using the flags properly in cases:
-	 * 1. Old DTS with proper ACTIVE_LOW, however such case was broken
-	 *    before as the driver required the active high.
-	 * 2. New DTS with proper ACTIVE_HIGH (intended), which is rare case
-	 *    (not existing upstream) but possible. This is the price of
-	 *    backwards compatibility, therefore this hack should be removed at
-	 *    some point.
-	 */
-	wsa881x->sd_n_val = gpiod_is_active_low(wsa881x->sd_n);
-	if (!wsa881x->sd_n_val)
-		dev_warn(dev, "Using ACTIVE_HIGH for shutdown GPIO. Your DTB might be outdated or you use unsupported configuration for the GPIO.");
-
 	dev_set_drvdata(dev, wsa881x);
 	wsa881x->slave = pdev;
 	wsa881x->dev = dev;
@@ -1158,7 +1132,6 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	pdev->prop.clk_stop_mode1 = true;
-	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
 
 	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
 	if (IS_ERR(wsa881x->regmap))
@@ -1181,7 +1154,7 @@ static int wsa881x_runtime_suspend(struct device *dev)
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
 
-	gpiod_direction_output(wsa881x->sd_n, wsa881x->sd_n_val);
+	gpiod_direction_output(wsa881x->sd_n, 1);
 
 	regcache_cache_only(regmap, true);
 	regcache_mark_dirty(regmap);
@@ -1196,13 +1169,13 @@ static int wsa881x_runtime_resume(struct device *dev)
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
 	unsigned long time;
 
-	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
+	gpiod_direction_output(wsa881x->sd_n, 0);
 
 	time = wait_for_completion_timeout(&slave->initialization_complete,
 					   msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(dev, "Initialization not complete, timed out\n");
-		gpiod_direction_output(wsa881x->sd_n, wsa881x->sd_n_val);
+		gpiod_direction_output(wsa881x->sd_n, 1);
 		return -ETIMEDOUT;
 	}
 

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260326-asoc-wsa881x-633cc7f70132

Best regards,
--  
Linus Walleij <linusw@kernel.org>


