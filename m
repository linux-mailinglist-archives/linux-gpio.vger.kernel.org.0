Return-Path: <linux-gpio+bounces-35767-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFBqDNK38WngjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35767-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:48:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA3490BC2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED955302DFAD
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D21B33DEDD;
	Wed, 29 Apr 2026 07:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c2e5JnIE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C2A3B27CD
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448679; cv=none; b=V8JrZQg26LFIcRqJYB20mIs9Gae4+gpN9XCZGHKSrQZ539blHoDRFqVorrTMAiKKQN8AgYo4q8Zpj9pbe8J6+RztLsA4TJQyNgj4eyeJ/jNgmTW7gPVtuIlO3I/Aj4Xn1ET9yQmca5CfEai8+VkE11UwdQvUe5J85eqpNcIbCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448679; c=relaxed/simple;
	bh=Tq9Zm5cc8QAyn6CoesgnMmrTCJ/2c3DE+Za8nxun/8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5w0KFDGU8F+7Zj+g/gJdz7J0eNVVLaQJhGhUDB4YrR7xySpIfKnYWdXAxHWjpQKiqkTKaVGbaFeCJGlboZcdKMjZ4O5zQGJPLvSERQ5FlkV8NfXBg9Byj3ODSZKOYm5N0NVGIk+8sFN9zPptt5ZZM2Q8y4nKGzyQydPshugaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c2e5JnIE; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9464BC5CD5A;
	Wed, 29 Apr 2026 07:45:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92AB3601DF;
	Wed, 29 Apr 2026 07:44:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95089107298A3;
	Wed, 29 Apr 2026 09:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448675; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zPHbeqWn73H0ZvBSUfxN/4jGBDJpeb4A0vDFShhp6ms=;
	b=c2e5JnIE2JY6xEja9UFUxU6quTMyEyqNo9/zfoufj5HupML1SsqzN5qsmpRrxEhH4X0FPs
	T8hw5uuF52aikZWOzkrgWYFqbJPoMGl8/B1Ua5hmdllzS0U3+5DDutsI8tmIj7W1kj2r9D
	Lwsi6PHU18jOzUHPusAsVmcAvd2ztkG58RrPAh441Sd1OWjCO+L4N2m7s3F7SgNJLidA80
	rUkmp6RfXxUco8E/D2+qRGSwGZq4RYz0+1lUfGCJRwb+H+VJwF0jC72rka+DPNT0f5h1sQ
	swPdmNdrKXsBZPHSKQDUk80ox5OgH20WBAu77N4kUH8EQ3St4FCYIr9anZ9GUw==
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
Subject: [PATCH v2 10/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for extra power supplies
Date: Wed, 29 Apr 2026 09:43:46 +0200
Message-ID: <20260429074356.118420-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429074356.118420-1-herve.codina@bootlin.com>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: B9BA3490BC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35767-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]

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
index ab4fa074603e..537731996544 100644
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
2.53.0


