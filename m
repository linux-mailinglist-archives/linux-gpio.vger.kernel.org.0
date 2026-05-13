Return-Path: <linux-gpio+bounces-36725-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNOKG1g0BGoqFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36725-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:20:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA3652F809
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 616513080EEE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7123A8739;
	Wed, 13 May 2026 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vWgZWCbE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24D384CE2
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660268; cv=none; b=TRjCvUqJVs7K+mdMRNjzD6YZIRf5ahLbVUq+LoATngV0xAVuWJLV37UlMWXNrIb35xoXIS8QMElVF2j3hGBeoQ10n4SgyVneOsS1BioG0YsFMNNbO3fOzruobwt3j2exUCmFayJEgDYCc+EXAVFAE6vOirwPMlzTI6ey1jmuhVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660268; c=relaxed/simple;
	bh=gUxrwcBNZzbsrKxXV7sZfku4ej4L/dvnA/UNMB1jT2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7oE7USfWCaLqvaC4TJdAtoAQBT6WZ8H+crBIqnjilP5n7mfa1SlPeUGxECvtK/UelraYgkb0dFOXADH/YYaDKOe9iesJBVMTX+h7ibaVDMBEGcXVnRtkqkazozw1Nn7lT7NH2qIkqGiVaB4gpWmwnfvUs5HAZUJg1CkB4tITsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vWgZWCbE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5BA594E42C8F;
	Wed, 13 May 2026 08:17:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D3AD606CE;
	Wed, 13 May 2026 08:17:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 788CE11AF8D8D;
	Wed, 13 May 2026 10:17:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660264; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gphw8W9dqzPoUZJg+3tlhGLKbJUVUowdC9hHr7obwMA=;
	b=vWgZWCbEUgyy9fnd3ngUralRKNQe19iVijkRrK8eM4fRDpMLUvGFsZjgSa+hfFd1xE6nYb
	EiPBzjZYXBXynAhNt7xAuxooh3+zDW+BJ203VC/9zmKafI8CuomdcbOW+fiBQL27vHuicj
	Hve14lXA+XKZyE3AEFZDOJ5H7Snize2fg0FSdVkARxF6X0oKunGJuYjzp3WTwtXYZOMHSD
	Vx/M80n1QB7WIoPSW4A8MdJMr2YD+kLLIkJkScDK+fNel2oBplDB2sYg7fLX2OO4bhhyQR
	ZYXogSq6y0xZMENq9WBKyz5BJvFpjnYtZYymsS8TeCK3j49nm4VXuyimHdBuFw==
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
Subject: [PATCH v3 12/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for bypass gpio
Date: Wed, 13 May 2026 10:16:56 +0200
Message-ID: <20260513081702.317117-13-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 2BA3652F809
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36725-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Action: no action

A gpio can be used to control the amplifier bypass feature.

Add support for this bypass gpio in the same way as it has been done for
the mute gpio.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index c8991e340def..b9c09a04832a 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -24,6 +24,7 @@ struct simple_amp_data {
 #define SIMPLE_AUDIO_SUPPORT_PGA		BIT(0)
 #define SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES	BIT(1)
 #define SIMPLE_AUDIO_SUPPORT_MUTE		BIT(2)
+#define SIMPLE_AUDIO_SUPPORT_BYPASS		BIT(3)
 
 	const struct snd_soc_dapm_widget *dapm_widgets;
 	unsigned int num_dapm_widgets;
@@ -35,6 +36,7 @@ struct simple_amp {
 	const struct simple_amp_data *data;
 	struct gpio_desc *gpiod_enable;
 	struct simple_amp_single mute;
+	struct simple_amp_single bypass;
 };
 
 static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
@@ -303,6 +305,12 @@ static int simple_amp_component_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	if (simple_amp->bypass.gpio) {
+		ret = simple_amp_single_add_kcontrol(component, &simple_amp->bypass);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -352,8 +360,15 @@ static int simple_amp_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_BYPASS) {
+		ret = simple_amp_parse_single_gpio(dev, &simple_amp->bypass, "bypass");
+		if (ret)
+			return ret;
+	}
+
 	/* Set controls name */
 	simple_amp->mute.control_name = "Switch";
+	simple_amp->bypass.control_name = "Bypass Switch";
 
 	return devm_snd_soc_register_component(dev,
 					       &simple_amp_component_driver,
@@ -370,7 +385,8 @@ static const struct simple_amp_data simple_audio_amplifier_data = {
 static const struct simple_amp_data simple_audio_mono_pga_data = {
 	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
 				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES |
-				  SIMPLE_AUDIO_SUPPORT_MUTE,
+				  SIMPLE_AUDIO_SUPPORT_MUTE |
+				  SIMPLE_AUDIO_SUPPORT_BYPASS,
 	.dapm_widgets		= simple_amp_mono_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_mono_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_mono_pga_dapm_routes,
@@ -380,7 +396,8 @@ static const struct simple_amp_data simple_audio_mono_pga_data = {
 static const struct simple_amp_data simple_audio_stereo_pga_data = {
 	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
 				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES |
-				  SIMPLE_AUDIO_SUPPORT_MUTE,
+				  SIMPLE_AUDIO_SUPPORT_MUTE |
+				  SIMPLE_AUDIO_SUPPORT_BYPASS,
 	.dapm_widgets		= simple_amp_stereo_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_stereo_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_stereo_pga_dapm_routes,
-- 
2.54.0


