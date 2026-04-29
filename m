Return-Path: <linux-gpio+bounces-35773-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGWHCOO48Wk1kAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35773-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:53:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7041A490CB9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 004F5310BCA7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E1D3BE165;
	Wed, 29 Apr 2026 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0HmwpJwW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E7A3AD506;
	Wed, 29 Apr 2026 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448696; cv=none; b=HETWKZhMiaKAgqH/YVt2PL16kCFWyALVK/OLqAGHScOQwwIkYucWreyEcHKkLreZXrGd/wuLHXIohrAJdhmKfPf8IRF6wDb3SIqiV1BBuoTpjYGBxRBsXq0TF/WzxzpVn632LDGpaTTwnxCAlTK+vQqZKJ+zVzrMW5GPN1vKZv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448696; c=relaxed/simple;
	bh=juStJNcfV7KjmE/LU0kVIQ+8d1FBUV24oHAKybg13/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rk/behE9LGkazdJiCQ/jDPt8N/xyvHI2FGxt1HFms12frwEI+LZqoKY+2j3AKz6GeUKmyQEH96cXO5PpoOPy8jzSbwPcFbvwiZsLY/bdyLsIZusHfZOxN02W91evqGF/9kA1Yx3bAm+36J08WYXHoUXXTeSa2RGIAMlMCV7zp7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0HmwpJwW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A6624E42B68;
	Wed, 29 Apr 2026 07:44:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C116601DF;
	Wed, 29 Apr 2026 07:44:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43CCB10729898;
	Wed, 29 Apr 2026 09:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448692; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9QLwGF5jb+oga4BqW3y5KpwsRAOpzcDnt9w/lqu+R0Q=;
	b=0HmwpJwWfbl0+K20zJpSighylQ/sm5p0ZyWqTVfBOp7q0DIoDWXbXPyvor+LcmE7JKCevK
	vAiEKQZ40Nz4wNqouOdGTVvIW9rkmglHnEw6vs4p0yaut2hh4d7WeZF6K7ETeQm8tGyBVe
	im7gk62n2063rjJjKxvJInkIPlidzUnhJaOtUWjHjtSp2dSN3NbckYZ0zn2mSNzoaqXcDt
	iJYxjj2P0hMf8f5p4U2LGb3MWzSgWdu1gyg6Wd04LAL6YViah9f5P1rNEmLrp/JDZNqesK
	6BPaADAL1dNTKl9lWzq6y9xwc3qwO1fI+gWf1CVKVo34YEkI1C/yBzb6+sDYCQ==
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
Subject: [PATCH v2 16/17] ASoC: simple-amplifier: Update author and copyright
Date: Wed, 29 Apr 2026 09:43:52 +0200
Message-ID: <20260429074356.118420-17-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: 7041A490CB9
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35773-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]

After reworking the simple-amplifier driver and adding support for
gpio-audio-amp in the driver, add myself as the author of the
gpio-audio-amp part of the driver and add a related copyright.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index a7fbfcc4ec0d..e65ac29b4998 100644
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
@@ -956,4 +961,5 @@ module_platform_driver(simple_amp_driver);
 
 MODULE_DESCRIPTION("ASoC Simple Audio Amplifier driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
 MODULE_LICENSE("GPL");
-- 
2.53.0


