Return-Path: <linux-gpio+bounces-35772-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN6hEU648WngjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35772-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:50:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2CE490C3E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA17F3099909
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C72D3BBA15;
	Wed, 29 Apr 2026 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WjCwr/0L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5371F3AC0F9;
	Wed, 29 Apr 2026 07:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448694; cv=none; b=txzrCSTMHERzf7Cte/TWdWEJHVv2rZM9niUOi+7M6z9INDTXn4SWHotT/LthkydfMQ5qc1z7aWRXzVNARv8ckGluAZ2m0uodf/fzBtoO2NFlFUXwS2iXxn1DmH7qnxDClte36X4mY8dGhx8/kBBpbGvUY7oq9QeMbT3WxXAjwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448694; c=relaxed/simple;
	bh=iKc3QYrFOcmY1MCPB4FxrTH+D7zAdtAOJ4RcBhuIqH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mR6rSNgo+9G79u2NCRTrpPKdEkf9TkYahBZ3p2aSlrdsfgSGaGgYmsXc3RKVeBZk9ido00gtKHXkh0hJYkJej3MnPmk1WNGUTS2NQWCsgyQVJS7W4wZeuivMRqrJ50HVir1yiI/O7c+14bu5PjD1JzVcJuSHlRFE8oV6Y8CjpfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WjCwr/0L; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0B26E4E42ADE;
	Wed, 29 Apr 2026 07:44:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF5BA601DF;
	Wed, 29 Apr 2026 07:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C59911072989E;
	Wed, 29 Apr 2026 09:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448689; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pcpQ7WpaW4lGxE92Wx2KSCv7DhOVSwNrRADnBFLqbNw=;
	b=WjCwr/0LnWUZZTL5k5bAYml9YJxUC4039wCuyoN1ASIaSwv0XBuFVqnN05FCvzLcbyYMmZ
	StjiDSBnj5y//dSMMOhkWebV+/7Uvt0pGloG/kFHzCv8j1ZEwM3in6oI47se9FBGTGRfa0
	fENuXSYV3AIWTs4wLShDvTsDBUYISYOv7NJtChk1vwHGlAt1HyLaNi1RftoZHcVvmT17ee
	qWoynWSF/4T9G6mGVe+6PKTy/Xm8hTPJddKw06vO2skfhKPp9LXAEcHAdpraMti2cqSgK6
	nCaSU9ikhDt7Eh0RdLk4RN5rg6pVNRB0F02TFtKbpAKXhmTKptqCOmQy9CEgaQ==
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
Subject: [PATCH v2 15/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-labels
Date: Wed, 29 Apr 2026 09:43:51 +0200
Message-ID: <20260429074356.118420-16-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: BC2CE490C3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35772-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The possible gain values can be described using labels instead of gain
values in dB.

Those different labels are attached to a gpio values using the
gain-labels property.

Using the gain-labels description is mutually exclusive with gain-ranges
description used to describe the relationship between gpios values and
gain values.

Handle the gain-labels description and the related kcontrol.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 112 +++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index b25332a76549..a7fbfcc4ec0d 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -41,9 +41,15 @@ struct simple_amp_ranges {
 	struct simple_amp_range *tab_ranges;
 };
 
+struct simple_amp_labels {
+	unsigned int nb_labels;
+	const char **tab_labels;
+};
+
 enum simple_amp_mode {
 	SIMPLE_AMP_MODE_NONE,
 	SIMPLE_AMP_MODE_RANGES,
+	SIMPLE_AMP_MODE_LABELS,
 };
 
 struct simple_amp_multi {
@@ -53,7 +59,10 @@ struct simple_amp_multi {
 	const char *control_name;
 	unsigned int *tlv_array;
 	enum simple_amp_mode mode;
-	struct simple_amp_ranges ranges;
+	union {
+		struct simple_amp_ranges ranges;
+		struct simple_amp_labels labels;
+	};
 };
 
 struct simple_amp_data {
@@ -312,6 +321,45 @@ static int simple_amp_multi_kctrl_int_put(struct snd_kcontrol *kcontrol,
 	return 1; /* The value changed */
 }
 
+static int simple_amp_multi_kctrl_enum_info(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_info *uinfo)
+{
+	struct simple_amp_multi *multi = (struct simple_amp_multi *)kcontrol->private_value;
+
+	return snd_ctl_enum_info(uinfo, 1, multi->labels.nb_labels,
+				 multi->labels.tab_labels);
+}
+
+static int simple_amp_multi_kctrl_enum_get(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct simple_amp_multi *multi = (struct simple_amp_multi *)kcontrol->private_value;
+
+	ucontrol->value.enumerated.item[0] = multi->kctrl_val;
+	return 0;
+}
+
+static int simple_amp_multi_kctrl_enum_put(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct simple_amp_multi *multi = (struct simple_amp_multi *)kcontrol->private_value;
+	u32 kctrl_val;
+	int ret;
+
+	kctrl_val = ucontrol->value.enumerated.item[0];
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
 static int *simple_amp_alloc_tlv_ranges(const struct simple_amp_ranges *ranges)
 {
 	unsigned int index;
@@ -368,6 +416,13 @@ static int simple_amp_multi_add_kcontrol(struct snd_soc_component *component,
 		control.tlv.p = multi->tlv_array;
 		break;
 
+	case SIMPLE_AMP_MODE_LABELS:
+		/* Use enumerated values */
+		control.info = simple_amp_multi_kctrl_enum_info;
+		control.get = simple_amp_multi_kctrl_enum_get;
+		control.put = simple_amp_multi_kctrl_enum_put;
+		break;
+
 	case SIMPLE_AMP_MODE_NONE:
 		/* Already set control configuration is enough */
 		break;
@@ -712,10 +767,40 @@ static int simple_amp_parse_ranges(struct device *dev,
 	return 0;
 }
 
+static int simple_amp_parse_labels(struct device *dev,
+				   struct simple_amp_multi *multi,
+				   const char *labels_property)
+{
+	struct simple_amp_labels *labels = &multi->labels;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	ret = of_property_count_strings(np, labels_property);
+	if (ret <= 0)
+		return ret;
+
+	labels->nb_labels = ret;
+	if (labels->nb_labels > (1 << multi->gpios->ndescs))
+		return -EINVAL;
+
+	labels->tab_labels = devm_kcalloc(dev, labels->nb_labels,
+					  sizeof(*labels->tab_labels),
+					  GFP_KERNEL);
+	if (!labels->tab_labels)
+		return -ENOMEM;
+
+	multi->kctrl_max = labels->nb_labels - 1;
+	multi->kctrl_val = 0;
+
+	return of_property_read_string_array(np, labels_property, labels->tab_labels,
+					     labels->nb_labels);
+}
+
 static int simple_amp_parse_multi_gpio(struct device *dev,
 				       struct simple_amp_multi *multi,
 				       const char *gpios_property,
-				       const char *ranges_property)
+				       const char *ranges_property,
+				       const char *labels_property)
 {
 	struct device_node *np = dev->of_node;
 	int ret;
@@ -745,6 +830,13 @@ static int simple_amp_parse_multi_gpio(struct device *dev,
 			return dev_err_probe(dev, ret, "Failed to parse '%s'\n",
 					     ranges_property);
 		multi->mode = SIMPLE_AMP_MODE_RANGES;
+	} else if (of_property_present(np, labels_property)) {
+		ret = simple_amp_parse_labels(dev, multi, labels_property);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to parse '%s'\n",
+					     labels_property);
+
+		multi->mode = SIMPLE_AMP_MODE_LABELS;
 	}
 
 	return 0;
@@ -785,7 +877,7 @@ static int simple_amp_probe(struct platform_device *pdev)
 
 	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_PGA) {
 		ret = simple_amp_parse_multi_gpio(dev, &simple_amp->gain, "gain",
-						  "gain-ranges");
+						  "gain-ranges", "gain-labels");
 		if (ret)
 			return ret;
 	}
@@ -795,6 +887,20 @@ static int simple_amp_probe(struct platform_device *pdev)
 	simple_amp->mute.control_name = "Switch";
 	simple_amp->bypass.control_name = "Bypass Switch";
 
+	if (simple_amp->gain.mode == SIMPLE_AMP_MODE_LABELS) {
+		/*
+		 * The gain widget control will use enumerated values.
+		 *
+		 * Having just "Voltage" and "Switch" widget names with
+		 * enumerated values and boolean value can confuse ALSA in terms
+		 * of possible values (strings).
+		 *
+		 * Make things clear and avoid the just "Switch" name in that
+		 * case.
+		 */
+		simple_amp->mute.control_name = "Out Switch";
+	}
+
 	return devm_snd_soc_register_component(dev,
 					       &simple_amp_component_driver,
 					       NULL, 0);
-- 
2.53.0


