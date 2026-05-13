Return-Path: <linux-gpio+bounces-36729-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAgkDOs0BGoqFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36729-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:23:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6508B52F8BF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CEBBC304FCF4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7778D3DCDB9;
	Wed, 13 May 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KuM3Cftb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D63AEB2C
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660277; cv=none; b=sP+ilm3AcPKtZlVLEjrilUYpXAIwEDvwce04Bb0V8wxYov+Lh/vv5rRt3WjL976iLRs76ipQCyYeETRBH/5wDrvrL8BsHax5tSxauy/32baVSSJtrzu6m6hioBQVrFkbJDgsM6rBgAwiR8B+MFTYCHZmrC2H5K6kaUDKQXZ560w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660277; c=relaxed/simple;
	bh=ckDu0VjPC19YRESbBrFMF6uiYeAqa2EVWTd7bagjIX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSg3hdhKcJIKRgMV4637n3pRvwB8geu3hOW53BbAeRZdQcWYujcqh5ZD3MjRdIiqXKqZqeyN2kYz4jZOhaae/Xg2xpW5iqtlGc3yW/ILGsKkRA084IVPxG4cs06j+CGt4Qs2XuHjLdUbqtz8ZmGWj6HycGccbF3KWd3ERoGHiSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KuM3Cftb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F9DFC5E175;
	Wed, 13 May 2026 08:18:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC58E606CE;
	Wed, 13 May 2026 08:17:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1996611AF8CAA;
	Wed, 13 May 2026 10:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660272; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=w6LvO0+ZHRHkRwAR/Nbky+/YGsSj01EgGbCdFr5Zd7g=;
	b=KuM3CftbB+9QllsT+Qb+M+yR/OQ/6reaVZOR/7ojmsRkaAkKChRoAVuJWCENbN++V4MYY6
	rCw/DOJozJHABerqQPSo8R3iu/bLV6ryJG+GBzsfDYCFmQAYvlEGTYElXl5Aro1F21yn2u
	Bz4ez02PPFCrC9DxlA2K8TiLWA09okA3CMcEj4T/RPwKxRae97xnA24L8CffLU9ng5Uv4E
	0SgRW9ZXoRCMuE9nYNlVeVM4Kh653m00BQRdo+KiIXJyQH1q4QdeJMnVauGk/u3/xM9w7F
	k+ErLz5qzVzAPGzXPSyiXhJEsumZ32sZxTWedcNPeT6/HEk5X6h23zD28ToAfw==
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
Subject: [PATCH v3 16/17] ASoC: simple-amplifier: Update author and copyright
Date: Wed, 13 May 2026 10:17:00 +0200
Message-ID: <20260513081702.317117-17-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 6508B52F8BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36729-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

After reworking the simple-amplifier driver and adding support for
gpio-audio-amp in the driver, add myself as the author of the
gpio-audio-amp part of the driver and add a related copyright.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 3785044235bb..ca0e6ce8cc37 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -1,7 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2017 BayLibre, SAS.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
+ * Support for gpio amplifier
+ *   Copyright 2026 CS GROUP France
+ *   Author: Herve Codina <herve.codina@bootlin.com>
+ *
+ * Basic simple amplifier driver
+ *   Copyright (c) 2017 BayLibre, SAS.
+ *   Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
 #include <linux/bitmap.h>
@@ -967,4 +972,5 @@ module_platform_driver(simple_amp_driver);
 
 MODULE_DESCRIPTION("ASoC Simple Audio Amplifier driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
 MODULE_LICENSE("GPL");
-- 
2.54.0


