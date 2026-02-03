Return-Path: <linux-gpio+bounces-31396-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDHGJqwhgmmQPgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31396-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:26:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B406DBEB9
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC1B03040385
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 16:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19A83D1CCC;
	Tue,  3 Feb 2026 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IhJaT0Ou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842C93C199C;
	Tue,  3 Feb 2026 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135700; cv=none; b=une+pAgbmKHz86k7QvcSSTYe28mHV6y0I6hmZxe2zGIscwgrCQNPbpvag7rw/TaPziy6G5OhdvFwWk3X3/Jr1ChdCIilA10Oo0Jj4B3lxL6VXbXfNmcRZk6g7wrr/q1syFJAofJMramW9ZeuzPbUjlOLxeGszw4eEFAuV47yOOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135700; c=relaxed/simple;
	bh=FXR1urZyHxRMQhEV+YAE1Dupsb+CKUg3wI8EMI1En5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TExD0YPARNZRg+J9cUhzFYS7tC9v/4GHDK93Nm0IFmGVLAyylT0L/1ezvlRNZ0AblPBpnIdhfzqgbP8HpByaT+v2HQv6EOIbPR2nJoH4l2hgwrLuxKjIa6o2GadBJaweA1RYuUt+/jP7jOnaqIXAiZXbX+dBXm/5kIibdV2aLAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IhJaT0Ou; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0AC36C24383;
	Tue,  3 Feb 2026 16:21:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE8CC60728;
	Tue,  3 Feb 2026 16:21:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDB15119A8888;
	Tue,  3 Feb 2026 17:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770135695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Iv2/16VnKv0xj7dzCIsq/6ykvwxz9Vm1Oxs1q8ZKaVA=;
	b=IhJaT0Ou/kPgEgJQh5skMhWgrBzndqcfICme9vUHZfia6yIm3tp6/EDpLEYNlMh4eoJaB1
	+5drPdkwQT+eUDHXCS6R05Nz4zvUu+GZAPQpEGG3ivAKv/eSmbMSspsScE+MYjrqdtadAB
	8RpcIglgtj9Ls+5+Slm46o7CoxwpaGbjwa3BtiT3FMeJgsa7Muty/Xa3M21tXiSeYB+xaX
	ETmMNTkDig4Mx1Yq7Va9LABP76/OeVuYhthcHpBQvwqUr63b1JeiBxcUwLFX6LPgAoWScE
	tVlti3rn0Q8Ihcxwhj901ddDkWJFPgTC/v2JHo9zxW/MD4NVN5dOUHcWERYC5g==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 03 Feb 2026 17:21:10 +0100
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-dev-b4-aaeon-mcu-driver-v3-1-0a19432076ac@bootlin.com>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=FXR1urZyHxRMQhEV+YAE1Dupsb+CKUg3wI8EMI1En5g=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpgiCHHJdMGQyfnwVKTPYFRXLxHw0FYtCoHkC2W
 uj9FJzILRCJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaYIghwAKCRCfwAsFcf4K
 7WvJC/9SpUNhoDdX7+9IAoTUB/v+MkNNL5RbRfufer1AeRcJ5JWN159wm3yunjcDD1XzO2ogmDE
 8vwMKJ3nJOEuXYo70lspF9dT6azJ/a+P3cySfcc37Q2LTAIf3Vi471TXXt8x80UtFDr6GhSqDZG
 p4gfDXuv7+Ab/RMpBC8bw4ENMl6UPLy7st0WiSAJmIeUjCuDOpfGFTSPQ4aSADIH6I9VlQVqNom
 QSCkggI9xPez4xclj6m08AyYvDobRP6fpKia9qScRGuSpnGlhQP6+z9qt2OQb4SuHYdLhYcp0mx
 Iz3WR/WVriZS0Abmlq7FgxPJlt8eJSvZ/P+aKFzxvUSwTtTNeru0aDMeEoKW9drMKwAsOYTVIfg
 fSEMkz7qa0BIlxM1KPrURwtlq/MJEZdmMIUclF9Q5e/0tTS5HH5sLTxS5ECBmTGV8bfWIEUs5Eu
 0ofRm9KHlhsAvTLvbDuzKPCy89NatJI11YlgT0zg6vE+VlbPN18BjnX3nEFgmHnA05gK4=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31396-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7B406DBEB9
X-Rspamd-Action: no action

Add the AAEON vendor prefix to support the AAEON SRG-IMX8P MCU driver
devicetree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a74560a4f687fe7a2070ca21b0752..0f84ee93b3a8473719ee92f8c046e350c4a20825 100644
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
2.52.0


