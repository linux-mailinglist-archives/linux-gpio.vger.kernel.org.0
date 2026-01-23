Return-Path: <linux-gpio+bounces-30986-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CFmEXxGc2mfuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30986-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:59:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6E73CE7
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4877D30101D6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4A13806DD;
	Fri, 23 Jan 2026 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yEuuZRr3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51AE3815D9
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162112; cv=none; b=c4PTATMVsa3exoWHTwcBC8Z2a/tpNpPxAGTTlL9nX/GCvt+d7luTzBJIt2bSNLejYv5L5WuQ/1V4wymArGBNaj98PcPXkerG1wr+JxNtydgy6UOGx9KTRhHVEkRbpzKbXlZbcHEa9ahcTSGOopTYK1jeSwuI5BtF86WD0w1oMmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162112; c=relaxed/simple;
	bh=bu/rGz3MhaajWznLgOEciCHSKUCgeTXMKmrL1OPdgkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWV72zETN5AGNcqzdNfCI7dqWLeW2q6RXFVfNg0QVVkFxEEPsSDkXmlpe4mv/FF7CNkmo1vJOk2Jou0jNppgniOh0p5Hupbl9CV337fn3S/iSTO5bnz2Id6AoMGuWhGkR1Fpmg4kFoZCLmEzvu9lhyrl3nQwDHgjfmlMGRA6aXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yEuuZRr3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 31FF84E42216;
	Fri, 23 Jan 2026 09:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 083466070A;
	Fri, 23 Jan 2026 09:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4BFE119A87A4;
	Fri, 23 Jan 2026 10:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769162092; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iQsPBKPunW2HAhagUIukzpmsZpN0tQ18iuvsF7KTtx8=;
	b=yEuuZRr39/8EWTov4sVs8lOn0NUO/Reqlv/1PGRpEc47bOWY4VYLEEh8i1yvuuQBIa2HFV
	tVLZp++x/PJMXgnfw7zLq7qch3Z5dQUL56S4tzCFNUJQRXrU3gn/mTSZjFk0zRSjjxCpTF
	UKdjvNm/AfSCu0HxPR2qXJjLEW0o8Og21gowc1H6DVy1zFWMl6tUM+DREW7k6EsML7hhRd
	7rgjnfoPW5c2qHWRNq9B1SfymAA08l6I1MWQDtWyfCQjArcIIWhvaFrzqqtDbElAtv5MSQ
	qWgvATi01qFI+vrRrRybPmxp405YxLgy7zxpUKg8Y0Qn+rbZi/mjJgNWDhJtZw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 23 Jan 2026 10:54:31 +0100
Subject: [PATCH v2 2/5] dt-bindings: mfd: Add AAEON embedded controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260123-dev-b4-aaeon-mcu-driver-v2-2-9f4c00bfb5cb@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3095;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=bu/rGz3MhaajWznLgOEciCHSKUCgeTXMKmrL1OPdgkM=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpc0Vjlnpb1Zj8yHgaB44y8Q4HE8ao3GhllBMVd
 88O+M5Lbl+JAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaXNFYwAKCRCfwAsFcf4K
 7azDC/9O03mPqnCCNglsW3Cm342CIzwwud7A2DLA2beGLvhCH4Mr4oT70Lb5OxRHBEHtoV8o5oU
 ToHutcb5gkXjcX4eRHnhcVaO5+CmqGfr1ZR6k4ZgYDANmOwzde4pA0PgeJBNoncZaz1O/pG6n+J
 0FLmbfF6u0TAxE5CUgs6F0ugYRS6Cc1g/VIKcdszyKx9KQgYp0jc3UpgllLjfODxq/C1vCUq3UO
 63I7wXO9L3scytojLvx+H6kNsiJjM3qMnWDNZ8YxRcgEYpbyIORAgCPkAEliwvSFcQzqt514g+h
 ypSxh3FCZ2T0EyOfIer0zFzsVQNq9YJYHBSUW4zTxObwzOLPuueKNZ5TQ9zSMsPfyPEBaD5QGUt
 D6mD7JMmbZ1PfZAjCZLaC5pnQc3kCz8UEgBjEloi1VqZkJwMhb8wTGCcX6vgnReGLLaa6cs1vJc
 U/14k//mM/pJAaxxh9nCyX++YUKHlinQmx8SZEE3okssc31UoqWIAd40DaoGyaLMqLGUc=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30986-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,0.0.0.62:email]
X-Rspamd-Queue-Id: DCA6E73CE7
X-Rspamd-Action: no action

Add device tree binding documentation for the AAEON embedded controller
(MCU). This microcontroller is found on AAEON embedded boards, it is
connected via I2C and  and provides a GPIO control and watchdog timer.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         | 56 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b8eb5bf88853b6eb3d31841e1f6d6acd4b776bd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/aaeon,srg-imx8pl-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAEON Embedded Controller
+
+maintainers:
+  - Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+  - Thomas Perrot <thomas.perrot@bootlin.com>
+
+description:
+  AAEON embeds a microcontroller on Standard RISC Gateway with ARM i.MX8M Plus
+  Quad-Core boards providing GPIO control and watchdog timer.
+
+  This MCU is connected via I2C bus.
+
+  Its GPIO controller provides 7 GPOs and 12 GPIOs.
+
+  Its watchdog has a fixed maximum hardware heartbeat of 25 seconds and supports
+  a timeout of 240 seconds through automatic pinging.
+  The timeout is not programmable and cannot be changed via device tree properties.
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8pl-mcu
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      aaeon_mcu: embedded-controller@62 {
+        compatible = "aaeon,srg-imx8pl-mcu";
+        reg = <0x62>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-line-names = "gpo-1", "gpo-2", "gpo-3", "gpo-4",
+                  "gpo-5", "gpo-6", "gpo-7",
+                  "gpio-1", "gpio-2", "gpio-3", "gpio-4",
+                  "gpio-5", "gpio-6", "gpio-7", "gpio-8",
+                  "gpio-9", "gpio-10", "gpio-11", "gpio-12";
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c9e416ba74c64e90629c0b7d7941f879c9ac589e..10f7d5b183795376b3fcdedc9c3835eecb9d0a3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -186,6 +186,12 @@ W:	http://www.adaptec.com/
 F:	Documentation/scsi/aacraid.rst
 F:	drivers/scsi/aacraid/
 
+AAEON SRG-IMX8PL CONTROLLER MFD DRIVER
+M:	Thomas Perrot <thomas.perrot@bootlin.com>
+R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
+
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
 S:	Maintained

-- 
2.52.0


