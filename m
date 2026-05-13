Return-Path: <linux-gpio+bounces-36728-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIbnG4Y0BGoqFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36728-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:21:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E452F836
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 978E5305E711
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24075392828;
	Wed, 13 May 2026 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s+FAjwqD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C73A7D6D
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660276; cv=none; b=JguxJrexmy+0UkJ3Urx/eQTU/j1zcRGeVc+i2uIJSbDjk0us7SqZYuuFwib9nJ4ZJHc4jR3cTpr2pTP82mPWq2jui6BlUEKZqbpY2y44bf+N5G0kaCd9P19qImJleEZXnqm75cregNHrgJ+Rj9g+pCRXEuS+8UdEPHZMhrC6qxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660276; c=relaxed/simple;
	bh=7RnBr5TLsLGnsDGF92yOn/AlHrJ9hozDSpHcJJP9i+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8I0Fm7PQiKFqHF36XeADEHfXQF/a8UAVZnrTpgV5J9URy4vg4AgsWmKr8GyIJKkKcRcQJJu6pFE3aicUWqM95N43hAcy71Fxkbs79MAbYrun2/e1GyWQivo5DhrbrQ6BiQTFLWs2AiycdrDGRsGES4epOjvc/vY4Dy/WXSWXW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s+FAjwqD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12D401A3597
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D925F606CE;
	Wed, 13 May 2026 08:17:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FA3F11AF86C3;
	Wed, 13 May 2026 10:17:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660270; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2s4uqu7uODiMgTxxo91RPScrysYHw7RONpKtbJ5dveQ=;
	b=s+FAjwqDahx7SByBckcKrCrU8RJr3S6+/w/qja0C0F9jkZksPbyBo3gQuaZdCnS7l1X9++
	hbuT0CIDhbO41+gTg/Vi2WqIfZfKG/ynKMfW7kKQKo8OVmVODjQ+pX27KqV2fA3Ia8Xu0V
	1pZeJBK9xyf/9iWmb1vrobUaBavqvZ98bGPXy/h+jlBjLR0PFZcUnKhhNuwvSxrM/70Bm5
	8wCvjSeocdJIiKtdx5SmaMDp8CQwGXfUWAJaBskwz6Fia+ToTe525wsSbR5FaiWXzOHkSR
	LkAMKo+k7VFrTf0PTgZ49OBpDtyTT1mo7J3fe/05eT3C7B3gPgw6LiJfUxoqkw==
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
Subject: [PATCH v3 15/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-labels
Date: Wed, 13 May 2026 10:16:59 +0200
Message-ID: <20260513081702.317117-16-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 0B7E452F836
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
	TAGGED_FROM(0.00)[bounces-36728-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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
 sound/soc/codecs/simple-amplifier.c | 116 +++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 5759f9bc2f4f..3785044235bb 100644
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
 static unsigned int *simple_amp_alloc_tlv_ranges(const struct simple_amp_ranges *ranges)
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
@@ -719,10 +774,44 @@ static int simple_amp_parse_ranges(struct device *dev,
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
+	if (ret < 0)
+		return ret;
+
+	/* The labels array cannot be empty */
+	if (ret == 0)
+		return -EINVAL;
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
@@ -752,6 +841,13 @@ static int simple_amp_parse_multi_gpio(struct device *dev,
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
@@ -792,7 +888,7 @@ static int simple_amp_probe(struct platform_device *pdev)
 
 	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_PGA) {
 		ret = simple_amp_parse_multi_gpio(dev, &simple_amp->gain, "gain",
-						  "gain-ranges");
+						  "gain-ranges", "gain-labels");
 		if (ret)
 			return ret;
 	}
@@ -802,6 +898,20 @@ static int simple_amp_probe(struct platform_device *pdev)
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
2.54.0


