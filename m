Return-Path: <linux-gpio+bounces-36720-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNShIuszBGqDFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36720-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:18:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC652F7A0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50F2C305B263
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB064399345;
	Wed, 13 May 2026 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MCWaenBw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2102C38E126
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660256; cv=none; b=qPD2T3ykzmojTl0XmiHyuXZ3IKwkcKhuzq0BoutrsuZ8aHuhVPf36s51PIBeGlJLIkJI5Y9cp0EoChUD3j66rlcr/FZScGss+GNDTuVaN8vdtgeqts7TWWAQVGOE3gC5ILvtLodpVFDpCX8hLAK0V3FqwnigjjPpnwxS2y4X0E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660256; c=relaxed/simple;
	bh=YKp7OBRR05YAOgw0NaKqcd+xnlnxMjqbyZDXgrXpp/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXAsnw+vAE0y7u6QhEnmQDQJ3sWp6gpNXIY9M7hVssKUURfdfGRBsU/dSGa1qjjJKiwXyrXbLie0m9p1cF+nHp7SLBhj/d2c90Ee7r4shavWlQmvRjj1PkqWcqI9E48/Z1VB7fFQYY21jHaXBt0X6QtX4iuD96uGh/+QM606iwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MCWaenBw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E4C9A1A3598
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6E08606CE;
	Wed, 13 May 2026 08:17:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BACB11AF8D2A;
	Wed, 13 May 2026 10:17:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660252; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xLMaxXxsn8Xohc8EB+ep57JXHfwWkV62o7p206lPqDI=;
	b=MCWaenBwzoMKYn9k8O7CK2wQirk6CPq4/qvGI/MvxfN+qY9IALqgGEEb4VP2EoGxd8I9a7
	BVP1OJuUbaTtK+9c/nBJd54xSByeWzq3KI8hjdbuYo7Td3qBXiBPyZeIhlqCoW7nwHwNfQ
	0t1bLiHfKYi68dvckBNFN5iLslhOqhfWOWvO80zFLFSqmKniT97QE8PM9QKKO6fBHXmDU5
	Yqxv1TQ8lvb2qEigBvT+GYrEQuu3gSpqNWmj2QNNEMONaOHWBcQLVt/haPzEHgt0v9ezfO
	yMIsqNSPGB1ot4dG57hP0K0FI5pk5MhztpVIMrs1/t2/QzMgKc6rrQXYzWSrUQ==
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
Subject: [PATCH v3 07/17] ASoC: simple-amplifier: Use 'simple_amp' variable name instead of 'priv'
Date: Wed, 13 May 2026 10:16:51 +0200
Message-ID: <20260513081702.317117-8-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 4BFC652F7A0
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
	TAGGED_FROM(0.00)[bounces-36720-lists,linux-gpio=lfdr.de];
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

The simple-amplifier driver use 'priv' as variable name for its private
data (struct simple_amp).

With the support for gpio-audio-amp, more functions and data
structures will be added.

Those future additions will add more complexity in data manipulation and
will make the 'priv' term error prone.

In order to clearly identify the struct simple_amp private data, use
'simple_amp' as variable name when this structure is involved.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 8f2daec55134..231e84ab4c0e 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -19,7 +19,7 @@ static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *control, int event)
 {
 	struct snd_soc_component *c = snd_soc_dapm_to_component(w->dapm);
-	struct simple_amp *priv = snd_soc_component_get_drvdata(c);
+	struct simple_amp *simple_amp = snd_soc_component_get_drvdata(c);
 	int val;
 
 	switch (event) {
@@ -34,7 +34,7 @@ static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	gpiod_set_value_cansleep(priv->gpiod_enable, val);
+	gpiod_set_value_cansleep(simple_amp->gpiod_enable, val);
 
 	return 0;
 }
@@ -68,17 +68,17 @@ static const struct snd_soc_component_driver simple_amp_component_driver = {
 static int simple_amp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct simple_amp *priv;
+	struct simple_amp *simple_amp;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (priv == NULL)
+	simple_amp = devm_kzalloc(dev, sizeof(*simple_amp), GFP_KERNEL);
+	if (!simple_amp)
 		return -ENOMEM;
-	platform_set_drvdata(pdev, priv);
+	platform_set_drvdata(pdev, simple_amp);
 
-	priv->gpiod_enable = devm_gpiod_get_optional(dev, "enable",
-						     GPIOD_OUT_LOW);
-	if (IS_ERR(priv->gpiod_enable))
-		return dev_err_probe(dev, PTR_ERR(priv->gpiod_enable),
+	simple_amp->gpiod_enable = devm_gpiod_get_optional(dev, "enable",
+							   GPIOD_OUT_LOW);
+	if (IS_ERR(simple_amp->gpiod_enable))
+		return dev_err_probe(dev, PTR_ERR(simple_amp->gpiod_enable),
 				     "Failed to get 'enable' gpio");
 
 	return devm_snd_soc_register_component(dev,
-- 
2.54.0


