Return-Path: <linux-gpio+bounces-29474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5CCB824E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 08:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 707093078CA1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 07:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C117530F7F7;
	Fri, 12 Dec 2025 07:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N1SpqbfJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB7630F819;
	Fri, 12 Dec 2025 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765525299; cv=none; b=IzekBOIiFwRgCxkC6E8UQTMzAVPm+xYudr6Lbg8agASIXX3ugVK7neTT7Gjj+cxFRI8xQLhWd8fEFBxC7YJ8w+x6WFni0W1pqBoX0tD2xMlgCNU7Yw4eLdH8IG/G2boYmk6GPNxctZnRl/baSAdK6trkt/P2QaXQrN9P4yTyOjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765525299; c=relaxed/simple;
	bh=swJSdzTLYW1MSyK+Z4b5H7xLrxOgjAgmC67dBUDOSU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0+eZpFWDPlkQt2FgV29tom16CnYAKWn/f+k6hJ6ZKSBwi3nexDcz8A2zkEpp1ygPr7coy1oCdmwMy5FjCPs9yCheCEeA6mVzR+oazsZbys9Gfbxu02j5M8moiLiQSnKzEpt7GVmji93rQmvp/w1BXwhHhQVqU2dIqYiFhtgLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N1SpqbfJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E8BE1A211B;
	Fri, 12 Dec 2025 07:41:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34F83606DF;
	Fri, 12 Dec 2025 07:41:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96E3A103C8DFE;
	Fri, 12 Dec 2025 08:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=f9ATSBSJrLX8nV2+0kSB8PwCrrIZNBcN7n8C9TFO+74=;
	b=N1SpqbfJqH9rsWcVwaflVJSleFEYs6Xym6KfGgEHgHrQ5GxUR184FTUwe+3/cxlB6/VtsK
	wDBPZXEsXubevWDRWECkNOiuCKpDBv3lmpSwBYt11koSNec6RGZhnoZKEPSftpDt9q8Ktm
	OrkeSrvIJzQFD8UJgwK/sH3foLbVytFELFWOfH8q2WncWG0K3nW5LuYV7Nni1/o+HE3nJ7
	VzdBu5faN4O+hXYtfm1xiZppO2vdhzWheSVOmCyw4dz7xFnSdO7CMHusugmnQyrjqA5wuM
	um6T61ZXy/X72NC/h7t0QVHl5+VN7JNCRO7xIPDiCo+Pi2qX9y66+OXkafoh+A==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:07 +0100
Subject: [PATCH 4/8] dt-bindings: mfd: Add AAEON embedded controller
 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-4-6bd65bc8ef12@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Add device tree binding documentation for the AAEON embedded controller
(MCU). This microcontroller is found on AAEON embedded boards and provides
system features such as GPIO control, watchdog timer, and LED management.

The MCU is connected via I2C and acts as a multi-function device with
GPIO and watchdog as child nodes.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..680d06a7e7cb3754bdfc67a1b8c484811eba55d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
@@ -0,0 +1,58 @@
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
+description: |
+  AAEON embeds a microcontroller on their embedded boards providing system
+  features such as GPIO control, watchdog timer, and LED management.
+  The MCU is connected via I2C bus.
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8pl-mcu
+
+  reg:
+    maxItems: 1
+
+  gpio:
+    $ref: /schemas/gpio/aaeon,srg-imx8pl-gpio.yaml
+
+  watchdog:
+    $ref: /schemas/watchdog/aaeon,srg-imx8pl-wdt.yaml
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
+        gpio {
+          compatible = "aaeon,srg-imx8pl-gpio";
+          gpio-controller;
+          #gpio-cells = <2>;
+          ngpios = <19>;
+        };
+
+        watchdog {
+          compatible = "aaeon,srg-imx8pl-wdt";
+        };
+      };
+    };

-- 
2.52.0


