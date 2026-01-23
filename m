Return-Path: <linux-gpio+bounces-30983-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNWgI5JGc2mHuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30983-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:59:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA773D03
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C992A306AEF5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2FE385517;
	Fri, 23 Jan 2026 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rdMgpe8D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A670367F20;
	Fri, 23 Jan 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162101; cv=none; b=H6LVM8neaYwXbCAR3F7MP8IFFLoNthpPJVmds0AigSXFrVmVsSU2OzY+X4uMe/Kbw4LsfaVbybWfQc1G/8UeSpnlYCPpugvSV4DAHcKY400gcUnBZpPXF4ZvH56aTvdy51GCDNBTyBpeux+yRzvHpHkdK3VEwmgGHfRGEtbpX/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162101; c=relaxed/simple;
	bh=csO7fJLjqTP5V/c20DV8fnDFkCku7x86gfcOjMPl5Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYHbyJBVprK3g2tVhmtgtDv5fdwrg5t7/vXmBRdZ3TFEy4RL9tSihJDTOMNFhvGqgMYB/553bly2mXXYyqCmwD4DrbD/V/fl4dzczE7wtJztsP3qmH7FK300bL8DAcNIxZSkZ4LLF9pe8stQiLZ4/qAOzlYzWsHxoH69Q6j+lcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rdMgpe8D; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BFDEB4E42214;
	Fri, 23 Jan 2026 09:54:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94B816070A;
	Fri, 23 Jan 2026 09:54:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 540DA119A87A3;
	Fri, 23 Jan 2026 10:54:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769162090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EyC/GAu9DTSmLmeOK++rR8PfBg5itQ+kpE8oyjTPF8I=;
	b=rdMgpe8DHm7olxNrC6vmAgBTwuliGEyrizi7QRt/FZ1SAuOsm0isnkAsP7UQhI6LULu7Un
	U7dDZt0Td4nKM6ZKLLvkO/F7AvtXwNcOqLLamYMFpYvT54gT5z4I3+DD/AFCIYyQ3g1Lmk
	jKDP03mUqomKe2eysLra4rr3Jepcp9RdZ4JUXWLpNn7ZyLPuqM1kV7sve8hBGN0aESJi7g
	hJJPOW9j7IMOu8FYg09/FwJXnOAolWjMLXdh09q4v0uZWXyNkEdqPk8kqjYupi+rCli6ZM
	YpMdc8O4XwGg0JSg9bC+yJ13jHegdPrG/PL/70fDSJGiy44K90zOKBfSkrqHyA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 23 Jan 2026 10:54:30 +0100
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-dev-b4-aaeon-mcu-driver-v2-1-9f4c00bfb5cb@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=csO7fJLjqTP5V/c20DV8fnDFkCku7x86gfcOjMPl5Yw=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpc0VjQ4rcAr8t5AlHqZfWDczWyk7dJWQSMM+h1
 mQKN84z2leJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaXNFYwAKCRCfwAsFcf4K
 7fYTC/9OF4L7uuwIvqZr8yw9EfckD2MgCHRhIDg+26Fe5w9DgIfLD+sk7tVXPEMeCrWYY0daq8l
 3+8+ujdjsCghOkVPGJlqjUFcGtZQSC1kEka8k6B9ehu4uixBrzW2uYUxO+oXVXynEguq06U/90p
 iQkWCZ7Ilv0Xzt7/BDteL1MM5zSB17HvSNka4CJ8irMQUylGBnrJdervlxdw1KM8UWyuGxhHYa6
 2FLtJl5wpoRd8kjGwb/2rMz0jt1+vJdhASygtXhGzbYBPTx9bveeB4xPUG5Qp/XKCAPYObvhcYp
 Ifj9nlxL5p065MxpxY+2ru6TFZFornWLEmhHVM876BzBC/OgHdZKqD+Xarqs2YQYQoZqyTeTibO
 Jgf10ZdCk7BFKpdfsYdpuRHxJ/JAAqf6xbCoHm8WDt9dUxXRhK3/hRtihw9adG0mATyQ9f6Fnm8
 yUwdYMbTpVaopSV4nxNh/TTsZVprsdeg1p3aIhMqz1wkdo4LfpO4bGZfbyjbpl8hRwF2E=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30983-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2AAA773D03
X-Rspamd-Action: no action

Add the AAEON vendor prefix to support the AAEON SRG-IMX8PL MCU driver
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


