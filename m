Return-Path: <linux-gpio+bounces-34227-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKziFky+xWkeBAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34227-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 00:16:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F933CF8E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 00:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BC64308FE7C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 23:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBFB34EF0C;
	Thu, 26 Mar 2026 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwcYaqRP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1AA346A1D;
	Thu, 26 Mar 2026 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566650; cv=none; b=Sk2FrY27xCREYq1sI1CuG6iI0WqIXzLxLA28uuvZI4vao30aGpWwKeZIBjvaMLNDwuiAJiUhcYTBczAf3N3/7mcm6t5sS+kmEt3nnO7T3D0sJptfKCRspTcp9sCgbIY1YZHJ+BFQrcLgUNiEhWn6JczYw6tdSNB8Dz7rGo4ynaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566650; c=relaxed/simple;
	bh=LFk1wAs4FKcW9griZHevwjzZHHkLSKzVhryrwFOnxvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YgBDAUG6Vx8uX7YslXj/0yfnkCBM7HwYHCIgmCREhWd46f3xYiX6u6F/szuUShOX3qbFbqICREPZN+sGkJN/LKnCuWk7+jfCB70FqYwAz7Tt3HQJIFYNLufpZRHMpuvuH+hWEc7xMztO5sWIsn2lF0p8tfKK/ekmFXGT1NA8SQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwcYaqRP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02993C116C6;
	Thu, 26 Mar 2026 23:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774566649;
	bh=LFk1wAs4FKcW9griZHevwjzZHHkLSKzVhryrwFOnxvU=;
	h=From:Date:Subject:To:Cc:From;
	b=MwcYaqRPw/8nhCry3tpgyZEvpGcZxGi35s+iy53G/8j1K2s9Vygwi7S6YnDtMefAg
	 AZE//bIixrb/WykCIrXE9K1bknanZmtEIRmo5b3OA48nq9OsjXauHTrtfF/3CFv2Ry
	 JfTsVhH5aPtIe5job4m3yC/NiiWS9eOQuE5w4zq7r/hJDVqduVbFCvneCBNBpzNSQx
	 c3PVhFsTO0HntlmqIY1zoC91/MyO/DzFu8M011oGSz4bULM4ITzVsjD0dhAwD3pLNW
	 Bxip6cpjr2wDc5DgyrByYtbHu9RsN225yIaA1cbPbbAdnrWpCmoKvTLmFyXjXmmlEf
	 YCKw5AUQXPxSw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 00:10:46 +0100
Subject: [PATCH] ASoC: wsa881x: Move custom workaround to gpiolib-of
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-asoc-wsa881x-v1-1-53dc05867e6b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3cTi/GTd8uJECwvDCl0zY+PkZPM0cwNDYyMloJaCotS0zAqwcdG
 xtbUAaZevp14AAAA=
X-Change-ID: 20260326-asoc-wsa881x-633cc7f70132
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34227-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 045F933CF8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/gpio/gpiolib-of.c  |  8 ++++++++
 sound/soc/codecs/wsa881x.c | 35 ++++-------------------------------
 2 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b7..d498b2918179 100644
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
+		{ "sdw10217201000",	"powerdown",	false },
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
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260326-asoc-wsa881x-633cc7f70132

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


