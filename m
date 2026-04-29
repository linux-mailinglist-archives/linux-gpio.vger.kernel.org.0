Return-Path: <linux-gpio+bounces-35768-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCm9OGm38WngjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35768-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:46:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3298490B15
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C74BF300E159
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9B73B635A;
	Wed, 29 Apr 2026 07:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CUoqdaC1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62093B4EB0
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448682; cv=none; b=Zl+6FirRJhKUh2SVX8cjggbGMDPEH6047XfCd+ThZ7/HsY/jgeowbEwgYCR1ALGe+kMaBR7lfuYujda+4ANS7wB9dIszTQH5mlKsCQuthMTf26jrf+afizk64+XLQkYSiWbWHnAnkqUkDMtmb2Q/UF+nJdkjBRKTac0IktRRgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448682; c=relaxed/simple;
	bh=96M87psX4P0J4QLuFDJoFjKutTQlszkl0O3PgUCYtyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0N/HLYvJ0ACWTCMu3/LK+jEve5eWh/ZdQdlp8oMsLvax7FoTq9kp2/Jbo0y80/ffxNtsoxZowhD0RfE9+QXNwACgISO6UoNVTIwWXcK86m532++zZLTiwZ77KXrxJ5gVVZQboOErU6M5de0aCYzAeF34LnNdQB59n6O68xy51o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CUoqdaC1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7994D1A3478;
	Wed, 29 Apr 2026 07:44:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E56E601DF;
	Wed, 29 Apr 2026 07:44:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D5E010728FEB;
	Wed, 29 Apr 2026 09:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448678; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jz4TmAue/ulWA5im5r6RM8s61tPN0+iCOmjz7hw7KII=;
	b=CUoqdaC1C93P3tXLbPL81TS0GBQi9Y1Cv+o6vkza+W8oVDgX09+WgOG2elPRf/3rnSM94Z
	q/x3N/7IHeDMq/b7/y7Ls04/kB2JRN9kvUcyHD0/q1WmR5SJc6C417ZnVWuWnk7jM6NwCn
	B2HLkYpFRMeDjUJb8LowW9C7Wmo/JYwHwr9621AJB3uHvEMVkgfx5+6XgLgyWwHo481rBo
	X+ELBYUUG8cOlEhCEOMg+VJLPSs//F8Bt/BVWMctrCTQVBhwsegyhYmvXuTMJfAiCdGv8R
	1+oAOQFkuiF9QKRG440TU09pqxsG813fctAfTxnnXHQiXTzh9pDeQK/dttlpcw==
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
Subject: [PATCH v2 11/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for mute gpio
Date: Wed, 29 Apr 2026 09:43:47 +0200
Message-ID: <20260429074356.118420-12-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: C3298490B15
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35768-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

A gpio can be used to control the amplifier mute feature.

Add support for this mute gpio.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 127 +++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 537731996544..61d1cbb0661d 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -12,10 +12,18 @@
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
+struct simple_amp_single {
+	struct gpio_desc *gpio;
+	bool is_inverted;
+	int kctrl_val;
+	const char *control_name;
+};
+
 struct simple_amp_data {
 	unsigned int supports;
 #define SIMPLE_AUDIO_SUPPORT_PGA		BIT(0)
 #define SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES	BIT(1)
+#define SIMPLE_AUDIO_SUPPORT_MUTE		BIT(2)
 
 	const struct snd_soc_dapm_widget *dapm_widgets;
 	unsigned int num_dapm_widgets;
@@ -26,6 +34,7 @@ struct simple_amp_data {
 struct simple_amp {
 	const struct simple_amp_data *data;
 	struct gpio_desc *gpiod_enable;
+	struct simple_amp_single mute;
 };
 
 static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
@@ -103,6 +112,78 @@ static const struct snd_soc_dapm_route simple_amp_stereo_pga_dapm_routes[] = {
 	{ "OUTR", NULL, "PGA" },
 };
 
+static int simple_amp_single_kctrl_write_gpio(struct simple_amp_single *single,
+					      int kctrl_val)
+{
+	int gpio_val;
+
+	gpio_val = single->is_inverted ? !kctrl_val : kctrl_val;
+
+	return gpiod_set_value_cansleep(single->gpio, gpio_val);
+}
+
+static int simple_amp_single_kctrl_info(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	return 0;
+}
+
+static int simple_amp_single_kctrl_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct simple_amp_single *single = (struct simple_amp_single *)kcontrol->private_value;
+
+	ucontrol->value.integer.value[0] = single->kctrl_val;
+
+	return 0;
+}
+
+static int simple_amp_single_kctrl_put(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct simple_amp_single *single = (struct simple_amp_single *)kcontrol->private_value;
+	int kctrl_val;
+	int err;
+
+	kctrl_val = ucontrol->value.integer.value[0];
+
+	if (kctrl_val == single->kctrl_val)
+		return 0;
+
+	err = simple_amp_single_kctrl_write_gpio(single, kctrl_val);
+	if (err)
+		return err;
+
+	single->kctrl_val = kctrl_val;
+
+	return 1; /* The value changed */
+}
+
+static int simple_amp_single_add_kcontrol(struct snd_soc_component *component,
+					  struct simple_amp_single *single)
+{
+	struct snd_kcontrol_new control = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = single->control_name,
+		.info = simple_amp_single_kctrl_info,
+		.get = simple_amp_single_kctrl_get,
+		.put = simple_amp_single_kctrl_put,
+		.private_value = (unsigned long)single,
+	};
+	int ret;
+
+	/* Be consistent between single->kctrl_val value and the GPIO value */
+	ret = simple_amp_single_kctrl_write_gpio(single, single->kctrl_val);
+	if (ret)
+		return ret;
+
+	return snd_soc_add_component_controls(component, &control, 1);
+}
+
 static int simple_amp_add_basic_dapm(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
@@ -207,6 +288,21 @@ static int simple_amp_component_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	if (simple_amp->mute.gpio) {
+		/*
+		 * The name of the GPIO used is mute. According to this name, 1
+		 * means muted and 0 means un-muted.
+		 *
+		 * An inversion is expected by ALSA. Indeed from ALSA point of
+		 * view, 1 means 'on' (un-muted) and 0 means 'off' (muted).
+		 */
+		simple_amp->mute.is_inverted = true;
+		simple_amp->mute.kctrl_val = 1; /* Un-muted */
+		ret = simple_amp_single_add_kcontrol(component, &simple_amp->mute);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -214,10 +310,26 @@ static const struct snd_soc_component_driver simple_amp_component_driver = {
 	.probe = simple_amp_component_probe,
 };
 
+static int simple_amp_parse_single_gpio(struct device *dev,
+					struct simple_amp_single *single,
+					const char *gpio_property)
+{
+	/* Start with the inactive value */
+	single->is_inverted = false;
+	single->kctrl_val = 0;
+	single->gpio = devm_gpiod_get_optional(dev, gpio_property, GPIOD_OUT_LOW);
+	if (IS_ERR(single->gpio))
+		return dev_err_probe(dev, PTR_ERR(single->gpio),
+				     "Failed to get '%s' gpio\n",
+				     gpio_property);
+	return 0;
+}
+
 static int simple_amp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct simple_amp *simple_amp;
+	int ret;
 
 	simple_amp = devm_kzalloc(dev, sizeof(*simple_amp), GFP_KERNEL);
 	if (!simple_amp)
@@ -234,6 +346,15 @@ static int simple_amp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(simple_amp->gpiod_enable),
 				     "Failed to get 'enable' gpio");
 
+	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_MUTE) {
+		ret = simple_amp_parse_single_gpio(dev, &simple_amp->mute, "mute");
+		if (ret)
+			return ret;
+	}
+
+	/* Set controls name */
+	simple_amp->mute.control_name = "Switch";
+
 	return devm_snd_soc_register_component(dev,
 					       &simple_amp_component_driver,
 					       NULL, 0);
@@ -248,7 +369,8 @@ static const struct simple_amp_data simple_audio_amplifier_data = {
 
 static const struct simple_amp_data simple_audio_mono_pga_data = {
 	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
-				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES,
+				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES |
+				  SIMPLE_AUDIO_SUPPORT_MUTE,
 	.dapm_widgets		= simple_amp_mono_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_mono_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_mono_pga_dapm_routes,
@@ -257,7 +379,8 @@ static const struct simple_amp_data simple_audio_mono_pga_data = {
 
 static const struct simple_amp_data simple_audio_stereo_pga_data = {
 	.supports		= SIMPLE_AUDIO_SUPPORT_PGA |
-				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES,
+				  SIMPLE_AUDIO_SUPPORT_POWER_SUPPLIES |
+				  SIMPLE_AUDIO_SUPPORT_MUTE,
 	.dapm_widgets		= simple_amp_stereo_pga_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(simple_amp_stereo_pga_dapm_widgets),
 	.dapm_routes		= simple_amp_stereo_pga_dapm_routes,
-- 
2.53.0


