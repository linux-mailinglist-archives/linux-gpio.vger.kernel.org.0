Return-Path: <linux-gpio+bounces-36723-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CDuMzU0BGqDFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36723-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:20:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9478152F7E2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 947F43062D5D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3169539A4BA;
	Wed, 13 May 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="csEIykZ7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DF33A3E70;
	Wed, 13 May 2026 08:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660264; cv=none; b=ZuWQrrcnF9gZ0tpyNZBO3vPXoboRKtB16WENITbaHBFilzOPJ6ua8fHtYTHLAwPIb+EmHijH61WPmIWuM14PR0SPPZ/LLmRj960aTilbjsiBZ+E354058aj4fQTRyH2qgYNIuXEukl8rsbNboRIyOmBJaJPLycXZWYNdEWBBwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660264; c=relaxed/simple;
	bh=i2mY3MVN5dt/ry+r1WOFBuy2erA+7+Hf6qqrifEXYvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fELYmwV2WKvdIOWG51xe+B6DWj6LPgchzEAF6cHW2YluVLfa0RpuDTPXHdE9V/0usOyzBAT1pme9TaMJD/+PjowDhbtJRJ4C3/QrgUGztLdbC9bNF5Ll2KdRdtX2dMVHfyqE+HDElddO1g/fvVib8lAn6zQPbbZQOQcQN/9Ib1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=csEIykZ7; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2AE541A3596;
	Wed, 13 May 2026 08:17:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F06FB606CE;
	Wed, 13 May 2026 08:17:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1076B11AF8D8C;
	Wed, 13 May 2026 10:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660259; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mm7BvWADy+ZPIcjANv5OqdK0/9vQmIIVPvkzVzXD3us=;
	b=csEIykZ7leuo8SndF+3k/zs0OSnI8K/cMIu7rSS9bCGbxvM8ELKDZrEv0MpI7esQuWiDKI
	ez/wjpu3MX4A51+w0Q/MdILKTGHqGB6OwVTLLvMTGtj/3WU/1QwoNbcNztLTuOhvUZ2rMg
	PyfA16r7uP4lNkKuBtPrGm8zPfzh0iX8foFJ6gVoCbaM8MpKrPcw0g+RJ+FdbVyM9Dn0cZ
	my8NXVThjJo14YMG96yd4a8tHXR6QcrPqKzWYtvgF125ddmiDDIQ4DOEuDzn3i2F3FafbD
	eViaDQosRgMrQLtiqFS2UnsGNIsqcLEMGdTIOG2YoTj02leSoHtl4Wqu/sKw1g==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 10/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for extra power supplies
Date: Wed, 13 May 2026 10:16:54 +0200
Message-ID: <20260513081702.317117-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 9478152F7E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36723-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Action: no action

The gpio-audio-amp devices can use additional power supplies:
  - vddio,
  - vdda1,
  - vdda2

Add support for those additional power supplies.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 85 ++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 1704cdbb7de5..89e7e9e53b03 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -15,6 +15,7 @@
 struct simple_amp_data {
 	unsigned int supports;
 #define SIMPLE_AUDIO_SUPPORT_PGA		BIT(0)
+#define SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES	BIT(1)
 
 	const struct snd_soc_dapm_widget *dapm_widgets;
 	unsigned int num_dapm_widgets;
@@ -127,10 +128,86 @@ static int simple_amp_add_basic_dapm(struct snd_soc_component *component)
 	return 0;
 }
 
+struct simple_amp_supply {
+	const char *prop_name;
+	const struct snd_soc_dapm_widget dapm_widget;
+	const struct snd_soc_dapm_route dapm_route;
+};
+
+static const struct simple_amp_supply simple_amp_supplies[] = {
+	{
+		.prop_name = "vddio-supply",
+		.dapm_widget = SND_SOC_DAPM_REGULATOR_SUPPLY("vddio", 0, 0),
+		.dapm_route = { "PGA", NULL, "vddio" },
+	}, {
+		.prop_name = "vdda1-supply",
+		.dapm_widget = SND_SOC_DAPM_REGULATOR_SUPPLY("vdda1", 0, 0),
+		.dapm_route = { "PGA", NULL, "vdda1" },
+	}, {
+		.prop_name = "vdda2-supply",
+		.dapm_widget = SND_SOC_DAPM_REGULATOR_SUPPLY("vdda2", 0, 0),
+		.dapm_route = { "PGA", NULL, "vdda2" },
+	},
+	{ /* End of list */}
+};
+
+static int simple_amp_add_power_supplies(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	struct simple_amp *simple_amp = snd_soc_component_get_drvdata(component);
+	const struct simple_amp_supply *supply;
+	struct device *dev = component->dev;
+	int ret;
+
+	/*
+	 * Those additional power supplies are attached to the PGA.
+	 * If PGA is not supported, simply skipped them.
+	 */
+	if (!(simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_PGA)) {
+		dev_err(dev, "Extra power supplied need PGA\n");
+		return -EINVAL;
+	}
+
+	supply = simple_amp_supplies;
+	do {
+		if (!of_property_present(dev->of_node, supply->prop_name))
+			continue;
+
+		ret = snd_soc_dapm_new_controls(dapm, &supply->dapm_widget, 1);
+		if (ret) {
+			dev_err(dev, "Failed to add control for '%s' (%d)\n",
+				supply->prop_name, ret);
+			return ret;
+		}
+		ret = snd_soc_dapm_add_routes(dapm, &supply->dapm_route, 1);
+		if (ret) {
+			dev_err(dev, "Failed to add route for '%s' (%d)\n",
+				supply->prop_name, ret);
+			return ret;
+		}
+	} while ((++supply)->prop_name);
+
+	return 0;
+}
+
 static int simple_amp_component_probe(struct snd_soc_component *component)
 {
+	struct simple_amp *simple_amp = snd_soc_component_get_drvdata(component);
+	int ret;
+
 	/* Add basic dapm widgets and routes */
-	return simple_amp_add_basic_dapm(component);
+	ret = simple_amp_add_basic_dapm(component);
+	if (ret)
+		return ret;
+
+	/* Add additional power supplies */
+	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES) {
+		ret = simple_amp_add_power_supplies(component);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static const struct snd_soc_component_driver simple_amp_component_driver = {
@@ -170,7 +247,8 @@ static const struct simple_amp_data simple_audio_amplifier_data = {
 };
 
 static const struct simple_amp_data simple_audio_mono_pga_data = {
-	.supports		= SIMPLE_AUDIO_SUPPORT_PGA,
+	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
+				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES,
 	.dapm_widgets		= simple_amp_mono_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_mono_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_mono_pga_dapm_routes,
@@ -178,7 +256,8 @@ static const struct simple_amp_data simple_audio_mono_pga_data = {
 };
 
 static const struct simple_amp_data simple_audio_stereo_pga_data = {
-	.supports		= SIMPLE_AUDIO_SUPPORT_PGA,
+	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
+				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES,
 	.dapm_widgets		= simple_amp_stereo_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_stereo_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_stereo_pga_dapm_routes,
-- 
2.54.0


