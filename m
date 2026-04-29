Return-Path: <linux-gpio+bounces-35762-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SItfJ/K28WngjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35762-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:44:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51173490A52
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 589373012234
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C4C3A7589;
	Wed, 29 Apr 2026 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1X0M2PKq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B703A7F7A
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448667; cv=none; b=Ro2TjCxgEE6OUlthrJDhYAT5/+NRyivJmYHSijeNF1r8BJJeqoDSvO3CSrIba8kwMr1qqa6cIJJIC41moiFc3F3gBCKYZlTLkjTywKwYrYBieEMUJWElkdikmAOSO83hwDqp5BxUEY9tRWYkCH5t1qWH0MB0AZ4kxXHuxb3uBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448667; c=relaxed/simple;
	bh=XB4PAC9+Xt1SlGkK8fa2uT700JX99DgEJP/N4cZVx6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ai1Up+hlRA2/1X8P0mMeAXApaSpyk1/XUBMO6r8vGo7K8+Fm3tPzAWDdY47Jx6hnLxmVqO1XvLhdSzGw527pIrRuC0p1TWcngRM0HbKx9HFeaDd1vaXdOmVQzeti4XTMWlWrsi16CPqasN1bpuLlBQWp26ig6Hk9mgPishZ+dp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1X0M2PKq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB1341A347F;
	Wed, 29 Apr 2026 07:44:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFF7E601DF;
	Wed, 29 Apr 2026 07:44:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8490B1072988A;
	Wed, 29 Apr 2026 09:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448662; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ao/Ge/7pzeYgeQwu1DzSFkfa9mVgrNeq6YT9C0YLJQ0=;
	b=1X0M2PKqVM0WS0MleB02urqi7GBYeGMCv8SJ5CPt7amRZfcFD4QlAP5AAXCfjV0lqjvig4
	1A+ju3PTz7wr52GBXbUnkg4h8/rqBdUgUWgp9DKvbU464x6iXf7NMy/ETWsFaMJBMcVNOy
	IA8Y3RVL76ZNeGp3aItjB0mJ5Gw87jMYgngLbHBzaq7kbr768lnm39unfmEWbja9lQdTdQ
	89PTgGUwhzmZH/S1/lH3pf5E7M6AFj7cH73aXUM41yGxxempLqTGC5+Ogsnr363aujRXG8
	gOQaNrf5CpUgka9fFEZtD0EwGZVd/lWjJ3BX/Wg3Dhvwr3IK8Z2uocA1YhF6pw==
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
Subject: [PATCH v2 05/17] ASoC: simple-amplifier: Remove CONFIG_OF flag and of_match_ptr()
Date: Wed, 29 Apr 2026 09:43:41 +0200
Message-ID: <20260429074356.118420-6-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 51173490A52
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35762-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]

The simple-amplifier Use CONFIG_OF flag for its of_device_id table
and of_match_ptr() when it assigns the table in the driver declaration.

This is no more needed. Drop them.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 5b44bcfef49e..215318ff62fc 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -86,19 +86,17 @@ static int simple_amp_probe(struct platform_device *pdev)
 					       NULL, 0);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id simple_amp_ids[] = {
 	{ .compatible = "dioo,dio2125", },
 	{ .compatible = "simple-audio-amplifier", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, simple_amp_ids);
-#endif
 
 static struct platform_driver simple_amp_driver = {
 	.driver = {
 		.name = "simple-amplifier",
-		.of_match_table = of_match_ptr(simple_amp_ids),
+		.of_match_table = simple_amp_ids,
 	},
 	.probe = simple_amp_probe,
 };
-- 
2.53.0


