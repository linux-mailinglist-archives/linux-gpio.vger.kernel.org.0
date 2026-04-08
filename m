Return-Path: <linux-gpio+bounces-34895-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GcvNN6O1mliGQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34895-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 19:22:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 908623BF6CE
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 19:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D67A9302A1B1
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 17:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5DC3D6CC6;
	Wed,  8 Apr 2026 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G+weuG8b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C693D1CB4;
	Wed,  8 Apr 2026 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668945; cv=none; b=JeuhG0A8fXsf58LqwCU7irZyO+oWVbAlEeuXkRyk5uYnERrmloU4O+acOQXkdfW59f598PwG5Fmfm4sADMAXVzaTTMP+l8RilyMv49cBnuwSL1SNQnV2ilSr7BenBEZ8UvSu6uq9PC0oaAObmKJU5ucVJfXB7Uwxws7uVjxIqQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668945; c=relaxed/simple;
	bh=AGFAvWQk7zbxUAEt/PCMZqut0lt2/9FHvDQ2czbP9Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuvpWbT5z/mqF6a9l6aJ84YL9d/BeZ+lJY3UdHPQdu2II2WHlzGgbUO64tAMDur90c0YG6uJNrbArUcvSzy9+5ltmjzEN4G9rZSaIafiMfrRdwqCSCyh7nWLH/+fJVUwcr4rj5CpAeUFJPSoefwddK45m6Z6BVGgH4L+xm4P5qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G+weuG8b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3BCC64E4296A;
	Wed,  8 Apr 2026 17:22:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11FAD603CE;
	Wed,  8 Apr 2026 17:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 689D01045017E;
	Wed,  8 Apr 2026 19:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775668940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UBIjXtimEC8z6iE9BfKGji+xfAx6FZDoerR+pykd9LE=;
	b=G+weuG8bwIawZYAgD3gCT2/VfWHmq7yaCDI4SMM982Q+a/XttsJWCezVFRx/Ekc/UmxMX9
	XyhouRvZk+Zi85mQIgCf0ZAMYZQWRVyzS31nn382MCY4Geue0r8kCb8id8Q90F7DNycfys
	6w9nzlb1D3tDDCQscy2re1ug10YoqKF2fkTxaL+68yeH5qxeA0wYQBXhIC3H/fRqKcoFEa
	O70BWec315TfLIMcCKt8RloyXhzNAyuhr6o6owAtisLUHm3flI38oPYxHBKipy7hY3cgvM
	5DufpwUlpohkwx2chd/lWyM1Dk0ZX96Edk2tbaje2/5KW/si1Cveuywz0150Dw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Wed, 08 Apr 2026 19:21:54 +0200
Subject: [PATCH v5 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-dev-b4-aaeon-mcu-driver-v5-1-ad98bd481668@bootlin.com>
References: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
In-Reply-To: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=AGFAvWQk7zbxUAEt/PCMZqut0lt2/9FHvDQ2czbP9Tk=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBp1o7DI3w+rVUWZTe7H38X421b6sLX2EXxPl9Sm
 kxhfXFiGl+JAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCadaOwwAKCRCfwAsFcf4K
 7SvtC/oD6PgRkmSR74B35Eq7t21wwxQYtIB5T9r++AIM768VV9/eluT+EdWwdAo0+i4F4BgppHi
 ignu26bRlRzGee1SDTAxETaRm7O9EheK14gcaVe4kQChmaohFHawAsTaMCvKWaxpMjWMkQFyyha
 0UFqp2vjRXB+Re8ggnyVK1lK8ukvZT7qAIlv2+CG6iQ8cPS3WcINITzY/nd8yeR3UHGhxIqzamz
 QjmC1Gv/Du4zlgvTiGwAHGYzpLQZ/gAw5f7WWAESyr4AbEUGThpWtHr6ZVYhpNOj5lDWvRzyfPv
 RM0X23enTGhzAWDKcV74xSElLIvtO86B0J4VKqR6MY5ylmIibc7X6TRnyfcvwtp3M7NIF25K/Y9
 TvFxnXrDjQqUsSCVk+VOttkiQEL3AI7MWxiksQe6b+ypYpIJijNmqbBHk+zCDP5GR+hkTHzrrJT
 7jDaNCL5pn2HIIjeCQiyqaBpiZ5WkMxgHhL8W55eyY2ab64gI7P+2CA1FZlfyOiDodb1w=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34895-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 908623BF6CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the AAEON vendor prefix to support the AAEON SRG-IMX8P MCU driver
devicetree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..0f84ee93b3a8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -32,6 +32,8 @@ patternProperties:
     description: 8devices, UAB
   "^9tripod,.*":
     description: Shenzhen 9Tripod Innovation and Development CO., LTD.
+  "^aaeon,.*":
+    description: AAEON
   "^abb,.*":
     description: ABB
   "^abilis,.*":

-- 
2.53.0


