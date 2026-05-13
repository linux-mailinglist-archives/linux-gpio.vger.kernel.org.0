Return-Path: <linux-gpio+bounces-36722-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNk5KSI0BGoqFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36722-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:19:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371452F7CD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62F0530768CF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CC538D3E5;
	Wed, 13 May 2026 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pwGcduH2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D6639A7EF
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660261; cv=none; b=AN4kJtM4IB3qznLEWvYm10A0ngdK6AlQm5oYkCJ/v/7c9OGsPT3wh0ymIvd8QlDVmualIi2VZowZDlCvNzuM99f+uhZpo4i0/D2srEPnOHD/4Gy5ZRdfy6kgXBiz/sD+MaNVozFVSWn8hvbe1xP2BQ1kh61aTQW7HL76srkram0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660261; c=relaxed/simple;
	bh=i5JorZ/lhqcxy2K+Vji8D73jYUGJBcGuhuNT0DAMVeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mxor/DYKLR1MlGPM0s5QgMJBvcsws/6dfJKhYrmWUIrInBcIYd2Ek0EfWM8unBX5L4p/mr4Oafp/Xs6TPFrRJA4lcUPfU/Qpb+dlSBXhIDRDVgtDwgdhig7MBd5IpYmOpVNZ+nIjE16VVS2/AJ9DGlhuJZqqq1wMInaF0Hm1Z+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pwGcduH2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E61874E42C90;
	Wed, 13 May 2026 08:17:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFFD2606CE;
	Wed, 13 May 2026 08:17:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79E4B11AF8D89;
	Wed, 13 May 2026 10:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660257; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=CSGSnJ0G/eUMJQf9bcxpqWU0L91cpF0UV0XwaJOSqw8=;
	b=pwGcduH2bAXhWT3TXmfSrSsWXwhVHPnA/dFeO1Y4TKLpdSbRtt9aRNnd9n0236HHMeVByw
	QMri6ufMHX9m6l8IhICB90+wG+UQjm70A+goCui2DoU0yDSCD3lqeJX8Rbiq0XzAqHiyl3
	pIUEzgDi34MyPXHTqqva7AF20mRVszhX9LDgn3aObi2JJkuQFHiU9vPKGqgcY3Xjorb7iD
	b6l94LzeLDeezZ6e7S920lvraJx1q2bC0B6xwTtWpxQM/Y0XXAEtAqRn2behiGmic8yjuJ
	4eeL9CQvjJcCTwqwqO94R1RXiYQ+thcVSoleypqEWEkuQ/9PrpPuMCbrI3MGTA==
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
Subject: [PATCH v3 09/17] ASoC: simple-amplifier: Introduce support for gpio-audio-amp
Date: Wed, 13 May 2026 10:16:53 +0200
Message-ID: <20260513081702.317117-10-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 5371452F7CD
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
	TAGGED_FROM(0.00)[bounces-36722-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Action: no action

Improve the simple-amplifier introducing preliminary support for
gpio-audio-amp.

Those amplifiers are amplifiers driven by gpios.

This support introduction doesn't handle any GPIO yet but introduces
the compatible strings and the related DAPM table.

Two gpio-audio-amp are available: A mono and a stereo version.

The mono version has only one audio channel and gpio settings impact
features such as the gain or mute of this sole channel.

The stereo version has two channels (left and right). Gpio settings
impact both channels in the same manner and at the same time. For
instance, the gain setting set the gain of both channels as well as
the mute setting mutes both channels.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 3e644c1c2696..1704cdbb7de5 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -4,6 +4,7 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
+#include <linux/bits.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -12,6 +13,9 @@
 #include <sound/soc.h>
 
 struct simple_amp_data {
+	unsigned int supports;
+#define SIMPLE_AUDIO_SUPPORT_PGA		BIT(0)
+
 	const struct snd_soc_dapm_widget *dapm_widgets;
 	unsigned int num_dapm_widgets;
 	const struct snd_soc_dapm_route *dapm_routes;
@@ -66,6 +70,38 @@ static const struct snd_soc_dapm_route simple_amp_dapm_routes[] = {
 	{ "OUTR", NULL, "DRV" },
 };
 
+static const struct snd_soc_dapm_widget simple_amp_mono_pga_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("IN"),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+	SND_SOC_DAPM_PGA_E("PGA", SND_SOC_NOPM, 0, 0, NULL, 0, simple_amp_power_event,
+			   (SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD)),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("vdd", 0, 0),
+};
+
+static const struct snd_soc_dapm_route simple_amp_mono_pga_dapm_routes[] = {
+	{ "PGA", NULL, "IN" },
+	{ "PGA", NULL, "vdd" },
+	{ "OUT", NULL, "PGA" },
+};
+
+static const struct snd_soc_dapm_widget simple_amp_stereo_pga_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("INL"),
+	SND_SOC_DAPM_INPUT("INR"),
+	SND_SOC_DAPM_OUTPUT("OUTL"),
+	SND_SOC_DAPM_OUTPUT("OUTR"),
+	SND_SOC_DAPM_PGA_E("PGA", SND_SOC_NOPM, 0, 0, NULL, 0, simple_amp_power_event,
+			   (SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD)),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("vdd", 0, 0),
+};
+
+static const struct snd_soc_dapm_route simple_amp_stereo_pga_dapm_routes[] = {
+	{ "PGA", NULL, "INL" },
+	{ "PGA", NULL, "INR" },
+	{ "PGA", NULL, "vdd" },
+	{ "OUTL", NULL, "PGA" },
+	{ "OUTR", NULL, "PGA" },
+};
+
 static int simple_amp_add_basic_dapm(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
@@ -133,9 +169,27 @@ static const struct simple_amp_data simple_audio_amplifier_data = {
 	.num_dapm_routes	= ARRAY_SIZE(simple_amp_dapm_routes),
 };
 
+static const struct simple_amp_data simple_audio_mono_pga_data = {
+	.supports		= SIMPLE_AUDIO_SUPPORT_PGA,
+	.dapm_widgets		= simple_amp_mono_pga_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_mono_pga_dapm_widgets),
+	.dapm_routes		= simple_amp_mono_pga_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(simple_amp_mono_pga_dapm_routes),
+};
+
+static const struct simple_amp_data simple_audio_stereo_pga_data = {
+	.supports		= SIMPLE_AUDIO_SUPPORT_PGA,
+	.dapm_widgets		= simple_amp_stereo_pga_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_stereo_pga_dapm_widgets),
+	.dapm_routes		= simple_amp_stereo_pga_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(simple_amp_stereo_pga_dapm_routes),
+};
+
 static const struct of_device_id simple_amp_ids[] = {
 	{ .compatible = "dioo,dio2125",		  .data = &simple_audio_amplifier_data},
 	{ .compatible = "simple-audio-amplifier", .data = &simple_audio_amplifier_data},
+	{ .compatible = "gpio-audio-amp-mono",	  .data = &simple_audio_mono_pga_data},
+	{ .compatible = "gpio-audio-amp-stereo",  .data = &simple_audio_stereo_pga_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, simple_amp_ids);
-- 
2.54.0


