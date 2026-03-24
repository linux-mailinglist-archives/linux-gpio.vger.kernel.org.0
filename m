Return-Path: <linux-gpio+bounces-34102-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CBRCp/nwmnnnAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34102-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:35:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84131B987
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AB7030B8E48
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 19:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4243093D3;
	Tue, 24 Mar 2026 19:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lpQw40np"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407CA303CA0;
	Tue, 24 Mar 2026 19:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380294; cv=none; b=epXm7dV6Q4Bu267iAT6BL/qCAsNpE0sRPR0EtQJ8bL+z7WCrbHfchmHo7+bJ+pnsSv7cdn9HThGHLCtNcKTcVx5Oz1SCr3frX7k8xNsUFH/i3ZYNPh1euZ3IrggAgo2nmBQYOFKS3R9YI7E41vkYuOt6e/sTgvIIXqOkWxDHGrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380294; c=relaxed/simple;
	bh=4XZ/GuRMSAxFpp6yNg37Xy4r5DlcogaXd4BVSSY4Jtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lFLPwwMaVq4Zwcxswp93I/UO8HOBVUyTbdNjaWVOJljHAnV2wW2bzg/A+AbbvqCmb/tTRwOkBxwMDzJuBNcVvcjAJf0t5mEMQpRPg3YfWqn5KNYgMerCRzIn6AzRCawT2J4F0N81AqcSnJq+0LBanpih+NH5M8jPHxzpGv8d8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lpQw40np; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CD8854E427DB;
	Tue, 24 Mar 2026 19:24:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 996D3601A0;
	Tue, 24 Mar 2026 19:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12C8710451148;
	Tue, 24 Mar 2026 20:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774380290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Itu45DKmsPB5+bFts834kAEPp0swPEbwWn1hCj9DneM=;
	b=lpQw40npMMscsn3vCvyrQlBbpb1hBjZSFwux9kT66/LsRWWHqpr0XcVNMkDFOvtmwYU0zH
	DG1Bj2HWATvDACsRW5C46v/rayxg+TxO3sSnm3W6rhz83ywVeip3P/Wi9C6vz0HlRve+7e
	OvPI21CEpsCha7Ww3NzGflH5j8rpRdSJ2REPI+LQ8lqUUJCsiZ2Az8e6jo6T7SJw7TEBa5
	P/uqg2Wotd0MtOBFdISQEQ3gQsmg2CiZG52QZjYWq2JYsx6bAHxaP+GWRA/gDCNoXHaWos
	QXu/V3+azb5tHqgnYN/Nmxj/9Q4NjpMGrmXb6cmKSQtxu5ggofQO6M1VCaaLHA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 24 Mar 2026 20:24:28 +0100
Subject: [PATCH v4 2/5] dt-bindings: mfd: Add AAEON embedded controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-dev-b4-aaeon-mcu-driver-v4-2-afb011df4794@bootlin.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3300;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=4XZ/GuRMSAxFpp6yNg37Xy4r5DlcogaXd4BVSSY4Jtk=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpwuT26ZHgMy+LO0/qS7k6hZDVs65qpqulluV4i
 uDTcAOxZauJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCacLk9gAKCRCfwAsFcf4K
 7WyzC/9XUeZ8SfJHrvqkj2PGtah72qGoDJH+pZ4GLNJxXxml9jr7LCOXdYu6rAUoCV0iVPA4EmA
 u0b9z/xLmuhP97B6DFnrS93XjoIXnQIfBni51l29ZlSRShOrlqywIGoEGfAH9alSIWXNe1kWytp
 IPvwjEXKwJcxdUngHEW9DYQ1fhqmCQ/s3XHvkTtBWEjd83Oh/6HeLSLn+Rlbbp/ATwGyvcyeATn
 kdCv01uADRwL8dIWhya/47ZWUsJH8EIQ+KXeFDOPUQyknJIjYZNpGvtp/ZJEag2RF8lE9iounxI
 8QKeh2rMAUfgRMMzDX+toO7zKeQO4182V67IOCDcu/39mrPqcXK7ki00RUmo8yOhsIuDh8yxpVf
 vtZdgS6fegAPhMpgLZsPKtKakZJyFXt3kW2806XLtm2T93PyuiNVGu+S7C80EvVE0EW3s+1Cv2V
 vl9jPdVLR4srKMb7Sup6uIJxJt/hO2dtiHzTSeAjyW2WDUBWYdwgxmSW+cBdCAxey45U4=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34102-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.62:email,devicetree.org:url,adaptec.com:url,microchip.com:email]
X-Rspamd-Queue-Id: 7C84131B987
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree binding documentation for the AAEON embedded controller
(MCU). This microcontroller is found on AAEON embedded boards, it is
connected via I2C and  and provides a GPIO control and watchdog timer.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/mfd/aaeon,srg-imx8p-mcu.yaml          | 67 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4895028e72eb3ac2376b61ed9c06549b42da66d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/aaeon,srg-imx8p-mcu.yaml#
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
+    const: aaeon,srg-imx8p-mcu
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 19
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@62 {
+        compatible = "aaeon,srg-imx8p-mcu";
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
index c9e416ba74c64e90629c0b7d7941f879c9ac589e..ea9d55f76f3509c7f6ba6d1bc86ca2e2e71aa954 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -186,6 +186,12 @@ W:	http://www.adaptec.com/
 F:	Documentation/scsi/aacraid.rst
 F:	drivers/scsi/aacraid/
 
+AAEON SRG-IMX8P CONTROLLER MFD DRIVER
+M:	Thomas Perrot <thomas.perrot@bootlin.com>
+R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
+
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
 S:	Maintained

-- 
2.53.0


