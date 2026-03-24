Return-Path: <linux-gpio+bounces-34101-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELuSKTHnwmnnnAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34101-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:34:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0678B31B923
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FDC53162662
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 19:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A6E2E541E;
	Tue, 24 Mar 2026 19:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AIJf2nsu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525D2DF3FD
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 19:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380291; cv=none; b=CqgZFtkIRPuZfgK54amkkOB1jbXjgNi2CiPG2ISZJcaP8Cr55Xlbiv99nzcNXMhRGsZJMSa5bUVT6wB0pXy8P56NoGCGTB/T1aGlu9+LWCOG4JZyhE+UT1TzkwBqsiFQ1oPbuqJ83P1yrMWlf4nUeZOBAmV+LyrzEz4D8AMqyZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380291; c=relaxed/simple;
	bh=8TrHU4hzG9jr3+WmGmkzip34kt3Cu/9DQjiFtGVa7UI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQQff6+mwsdOcTTx0o48cwUchAHAz9Sp+J3qTgeRHeb1zh3sYZvvyfmzt4lQ9ThCHOHY0Mlgfb+Ijpa0R+3DNjASL5eKfBxGaGC8XysLXy4SayLhqxNI+EHA1RHL8iMTka5sPWu4ddimGVRWvucqRQwWSj4TCf1fQHu54zap39U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AIJf2nsu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 575961A2FD3;
	Tue, 24 Mar 2026 19:24:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23AB1601A0;
	Tue, 24 Mar 2026 19:24:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75039104510FD;
	Tue, 24 Mar 2026 20:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774380287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TM2DP092hskmM2RxaM2LB3v7gKNIlq0ovjIXOQs9+P0=;
	b=AIJf2nsu1Xny3excqeLKgyKBelSfOeBWWGVVzbv0/2z1TcR/BRSB1paYXZu9Fj7eQbbQj0
	CQXZpAK4ez0CCgL5810RrbyqiMiYlnq5V1Ms9pzcqwH2M5c9HDtHahcR5RTIz8BilmMw5P
	ixN3oxVeCDqOoPswcbsZEE0roQ7TNUVrt/SPlemPn4Hjf7DdZ1BVqLN68zRnYARQrr5nGg
	MLW7qocJDA+7B6ISgoSke/t6U5JFwfrzrBQc9lpR+pYq3/T1bgN0NW+6NqVLZuqwLytgQJ
	OvkptfSJ34I/xbVkY0brhmGvac5vKMUW1wFm04Rl1uxrkg1FxdD15YdjV05AIw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 24 Mar 2026 20:24:27 +0100
Subject: [PATCH v4 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-dev-b4-aaeon-mcu-driver-v4-1-afb011df4794@bootlin.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=8TrHU4hzG9jr3+WmGmkzip34kt3Cu/9DQjiFtGVa7UI=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpwuT2Kd58wahK84WAtZw6eMJgCXIkdog5o2R4g
 lP7K588teiJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCacLk9gAKCRCfwAsFcf4K
 7ZqPDACLSA2ImO2DZkyG5z1qL4EBemwiUD0EM1TzOUA6x1rVmhAJa4i9KK4EzOi59Bs/wfP1xxa
 BS1N9RgJKtIcBKZiytjoekht5parai1YFZEkcanXIxz3jxytLtpyOP5HaGVNdPAyWqjExaKiN1Z
 hxxDxL+BcajXALRtmqSDp+si3sA+RQ3NwWCtuG39DoZL4exu3c7ABXxRMtojxb5oBsyrBGsmZvu
 g+fbCrCAyk4VxCZJPURSSNYDisnRPhSLj60th4Fk8h64EB1W4O5b4AzigrTY52VVL1POR5rUwRJ
 /xwykzYQjF8SIkzWDtbIoFE5hpkqZoBcGnNr/UkGjqbhO/9PERl8jxLSXh5FYGlHLq/SQSfblIZ
 EkrKXeZ3gpkjbLmgVCmiyDTHNti3CVVzL3GGZ4XZzKggNtFtIXIrmnhPwDiWS2W99thZecWhHgM
 iWWsiu7kXZ6MXAAg85/R3Da0CDE2me6bPvjusrmEJJqLcwyUiYqyKi15/2d0UqkfNhAOM=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34101-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 0678B31B923
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
2.53.0


