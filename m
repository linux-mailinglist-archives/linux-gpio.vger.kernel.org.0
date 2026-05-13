Return-Path: <linux-gpio+bounces-36726-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIUdJlE1BGoYFwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36726-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:24:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAEB52F938
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09B94313B332
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3163E3ACA7B;
	Wed, 13 May 2026 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="q52HTojc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66A388880;
	Wed, 13 May 2026 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660270; cv=none; b=FlMojFMQTmm+U3Suqwgk99Lm1IKpe+9XEzRCAzEsr94AkoUW0a3hj4Oi44vcDuLYoYozl7oxMXu0IkUzBWV+gCqgEfykcyAffg9VT+XTnBUywMblTLSj9dCNVagwpbI02/4QKUUe80TpsXL97ETDoUCwmO8gncDDbC3QMtU8am0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660270; c=relaxed/simple;
	bh=coNR5/Jbbqx4IcynozWQzsdlswDqEUvwsKZ26kLK5ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXBErwHQywZwF8Jrht4+sfaLH/UHZCtj0/Pug9R7pwZsSYgRK4ljREMLiK53Afje8cRTg9sRZH8itRw/BSZy4bdoR5/MGazwbfNC5qNzScZst4H+0AMvAG+9a5Kwn/C5U5+5amDV2fUP/NbjsqUGTYSMIGWz3hxui7jG/zRHb9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=q52HTojc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D82C1A3598;
	Wed, 13 May 2026 08:17:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3600606CE;
	Wed, 13 May 2026 08:17:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F42911AF8D92;
	Wed, 13 May 2026 10:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660266; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rLl6sxdapIDMoZ3QKJ3tkcg6Um6vqswgpyatkMA06D4=;
	b=q52HTojclKQYpXRKVuBMdKffaTPGA8NtYoy2FIvCUI3fwozAGYS8v7gx7S3Ch/JkREi+0N
	aNYZKSRGqRTnAhOhDSPM29LiOV0JtkRqX+3An+nbcmgi15PMLO9e+CILXj8HBtaVLO8SFT
	R+ZOt7phb/FoaV7/ZWn1oP3hykBxN9NOX4cctqm+V3fQ7Oe1qorl23Fr4llxX56wQgaS0p
	50rDfbNpnSVL+4v9vlkfR++yIAq2CxGJjuYMTmsM4cO6E9zbw5ldvGgnnqznOIe1o1y7ZN
	Vf6pc+y+DsoN24jVOWSWBKdZfeCBrKKZigtGRi4pWX05maRdrtoG/L1iUilmAg==
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
Subject: [PATCH v3 13/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for basic gain
Date: Wed, 13 May 2026 10:16:57 +0200
Message-ID: <20260513081702.317117-14-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 0EAEB52F938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36726-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Action: no action

Several gpios can be used to control the amplifier gain.

Add basic support for those gpios.

This basic support doesn't include any mapping between the GPIOs value
and the physical gain value (dB).

The support for this kind of mapping will be added later on.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 125 ++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index b9c09a04832a..5b172e520dcd 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -4,6 +4,7 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
@@ -19,6 +20,13 @@ struct simple_amp_single {
 	const char *control_name;
 };
 
+struct simple_amp_multi {
+	struct gpio_descs *gpios;
+	u32 kctrl_val;
+	u32 kctrl_max;
+	const char *control_name;
+};
+
 struct simple_amp_data {
 	unsigned int supports;
 #define SIMPLE_AUDIO_SUPPORT_PGA		BIT(0)
@@ -37,6 +45,7 @@ struct simple_amp {
 	struct gpio_desc *gpiod_enable;
 	struct simple_amp_single mute;
 	struct simple_amp_single bypass;
+	struct simple_amp_multi gain;
 };
 
 static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
@@ -186,6 +195,84 @@ static int simple_amp_single_add_kcontrol(struct snd_soc_component *component,
 	return snd_soc_add_component_controls(component, &control, 1);
 }
 
+static int simple_amp_multi_kctrl_write_gpios(struct simple_amp_multi *multi,
+					      u32 kctrl_val)
+{
+	DECLARE_BITMAP(bm, 32);
+	u32 gpio_val;
+
+	if (kctrl_val > multi->kctrl_max)
+		return -EINVAL;
+
+	gpio_val = kctrl_val;
+	bitmap_from_arr32(bm, &gpio_val, multi->gpios->ndescs);
+
+	return gpiod_multi_set_value_cansleep(multi->gpios, bm);
+}
+
+static int simple_amp_multi_kctrl_int_info(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_info *uinfo)
+{
+	struct simple_amp_multi *multi = (struct simple_amp_multi *)kcontrol->private_value;
+
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = multi->kctrl_max;
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	return 0;
+}
+
+static int simple_amp_multi_kctrl_int_get(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct simple_amp_multi *multi = (struct simple_amp_multi *)kcontrol->private_value;
+
+	ucontrol->value.integer.value[0] = multi->kctrl_val;
+	return 0;
+}
+
+static int simple_amp_multi_kctrl_int_put(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct simple_amp_multi *multi = (struct simple_amp_multi *)kcontrol->private_value;
+	u32 kctrl_val;
+	int ret;
+
+	kctrl_val = ucontrol->value.integer.value[0];
+
+	if (kctrl_val == multi->kctrl_val)
+		return 0;
+
+	ret = simple_amp_multi_kctrl_write_gpios(multi, kctrl_val);
+	if (ret)
+		return ret;
+
+	multi->kctrl_val = kctrl_val;
+
+	return 1; /* The value changed */
+}
+
+static int simple_amp_multi_add_kcontrol(struct snd_soc_component *component,
+					 struct simple_amp_multi *multi)
+{
+	struct snd_kcontrol_new control = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = multi->control_name,
+		.info = simple_amp_multi_kctrl_int_info,
+		.get = simple_amp_multi_kctrl_int_get,
+		.put = simple_amp_multi_kctrl_int_put,
+		.private_value = (unsigned long)multi,
+	};
+	int ret;
+
+	/* Be consistent between multi->kctrl_val value and the GPIOs value */
+	ret = simple_amp_multi_kctrl_write_gpios(multi, multi->kctrl_val);
+	if (ret)
+		return ret;
+
+	return snd_soc_add_component_controls(component, &control, 1);
+}
+
 static int simple_amp_add_basic_dapm(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
@@ -311,6 +398,12 @@ static int simple_amp_component_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	if (simple_amp->gain.gpios) {
+		ret = simple_amp_multi_add_kcontrol(component, &simple_amp->gain);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -333,6 +426,31 @@ static int simple_amp_parse_single_gpio(struct device *dev,
 	return 0;
 }
 
+static int simple_amp_parse_multi_gpio(struct device *dev,
+				       struct simple_amp_multi *multi,
+				       const char *gpios_property)
+{
+	/* Start with the value 0 (GPIO inactive). Can be changed later */
+	multi->kctrl_val = 0;
+	multi->gpios = devm_gpiod_get_array_optional(dev, gpios_property, GPIOD_OUT_LOW);
+	if (IS_ERR(multi->gpios))
+		return dev_err_probe(dev, PTR_ERR(multi->gpios),
+				     "Failed to get '%s' gpios\n",
+				     gpios_property);
+	if (!multi->gpios)
+		return 0;
+
+	if (multi->gpios->ndescs > 16)
+		return dev_err_probe(dev, -EINVAL,
+				     "Number of '%s' gpios limited to 16\n",
+				     gpios_property);
+
+	/* Set default value for the kctrl_max. Can be changed later */
+	multi->kctrl_max = (1 << multi->gpios->ndescs) - 1;
+
+	return 0;
+}
+
 static int simple_amp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -366,7 +484,14 @@ static int simple_amp_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_PGA) {
+		ret = simple_amp_parse_multi_gpio(dev, &simple_amp->gain, "gain");
+		if (ret)
+			return ret;
+	}
+
 	/* Set controls name */
+	simple_amp->gain.control_name = "Volume";
 	simple_amp->mute.control_name = "Switch";
 	simple_amp->bypass.control_name = "Bypass Switch";
 
-- 
2.54.0


