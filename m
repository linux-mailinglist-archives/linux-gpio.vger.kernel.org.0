Return-Path: <linux-gpio+bounces-35770-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEwTBjG48WngjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35770-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:50:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97317490C12
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16AAF30938F8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B903BA25B;
	Wed, 29 Apr 2026 07:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C2knB5ao"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237143A75A1;
	Wed, 29 Apr 2026 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448688; cv=none; b=kKx4ee+qnOCCK/eclPyrXr/m4tUV+/P5EsiZg5IXIjIJy71KT08KZ7+JCnnDF8ZJ6StKB97W8X8vDI6BtSKu0FfkJ/yeiQFJ/kToHyPtic0N9Fz8l6E3ftLSDkPV814r2xgNqWeWDCTPxvCd+X5MPlqa+4nC1fPRf10lGusOmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448688; c=relaxed/simple;
	bh=9ZeNAqe2K1RpT29ZlmLoNX7+/TuYhbpdbTQk6+W5xGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoXvWMkQZzku9SV0BPqPmFEZWXkxTdUdb0FxPaVH41YBfGKuXhh0hNsVj0nu8wbV9/y2BwmQSG0LryFTho9KHF1atuyhySV+lmMDFZGvNIj4gfu99jJMD5RJGZY4LyUmdJiRIuIJYNg51XDDKztVnWVEmAi/WgwVw4fI1W5Wh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C2knB5ao; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C21D04E42ADE;
	Wed, 29 Apr 2026 07:44:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FDFF601DF;
	Wed, 29 Apr 2026 07:44:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F34481072989B;
	Wed, 29 Apr 2026 09:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448684; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=oYgKZIs1o6j/WKLi22VenrpXpjZYinvex25VuhaxODI=;
	b=C2knB5aoU2HGI6GQi0DSqDKLIbs5sWvP0mGPd7Y/3l6GHLWzehXq+zLLBBnRjkFcPvWxSp
	s0BkRPKYaRmsi81QKmwWITuPmwJ9YtYX7PY91P4C22LZx0h394PfPuY09gfa+PFBwpDrlz
	YVtQahmvvDjHZJljPpGZeoC/CADGHWnkn/orkn7/kqo3sHh60Pk0rmgTJFVxVXtVwaR6wl
	rJ9kxbtHCmJR7RnMbkqpM8jRsRgemrDnM2pJPfZhchCxNvJvlj1Ve+IdOaG1zNSH8GYcT7
	mDPkZtgXeDetD0r0RausFTzhGSs2cLUzALWDbekYhfRJItad9LSvdal3xogSIw==
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
Subject: [PATCH v2 13/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for basic gain
Date: Wed, 29 Apr 2026 09:43:49 +0200
Message-ID: <20260429074356.118420-14-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 97317490C12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-35770-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]

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
index 1c845272509c..4f4a3c10f883 100644
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
2.53.0


