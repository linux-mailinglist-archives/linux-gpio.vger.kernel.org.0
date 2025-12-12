Return-Path: <linux-gpio+bounces-29472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2004CB8230
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 08:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AC37305F658
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 07:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AF230EF72;
	Fri, 12 Dec 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uAi5Xxef"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712630EF9B
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765525293; cv=none; b=pp7q/WZkCzb/VEwiHD7XOucNBblCMbnIeLnCVv+rBUaipWq+sw1p/k8CxOx725zfVMQRHDbFuiuF1nCU4BHt7RHNHDzv522PoWvcEu+80K0CJMGPAn5+XBllKAtHex0gtjVlhIE+8MmWMzy+Z4LHcY3t7mcVOKFy7rVCmoduHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765525293; c=relaxed/simple;
	bh=FIIMYAEVN5l4cUQpvtH4/p59boAQjkVDmxDdAVxEwDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNa8+7o3zfYwm38CLWXpyspRcQKxVzTBUIuSzPGPkDn8FqQ4ycM4jxXASgPhikeCU7QrQuBoJNtl2q4jx/RdVauMT7ZIf3YxRHmXGr8QbekHu10RHiAeJZ9odJ7RrWr435+KrEsbvIvROjP8tcCPG6QKnXNjhYWRhm/9xq8bAM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uAi5Xxef; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 090544E41BA8;
	Fri, 12 Dec 2025 07:41:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D305A606DF;
	Fri, 12 Dec 2025 07:41:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDBD6103C8DFF;
	Fri, 12 Dec 2025 08:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ezHaG49ifLrG8L8qfzPELOpOD4DZDpPJpVprvXJHmRw=;
	b=uAi5XxefYNgnNq+TWibxsdUF2UesQTOsVqW2gubwawMkbAuuPScMMEVLXiQmW7RXhFx9AX
	2MRPyqxSEFQUMJSwH+lSqCn3S7cnM0uy2VpCcwXZoK2ncLVK8QKbQcKYts+ktJjLfsYRO8
	//OXcZraR9+5QRKSLbhEAZmQzcTeejGykxI5e1ZCOEzNx7Xz7v9mJZ2rGvo6znQcAwLiFH
	Zr1q9x0xhigRth1yEqs1HRFujjFgdLOMU/HBTk2Utr+SqIJoRan8y/5UtD5Fh0DMCMrM5i
	FmzJUN9stiwRnt23jBuq47ySPfcaG8AVYV0HtPFkTOuSfdGMvykZiAPBnAUoIQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:05 +0100
Subject: [PATCH 2/8] dt-bindings: gpio: Add AAEON embedded controller GPIO
 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-2-6bd65bc8ef12@bootlin.com>
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

Add device tree binding documentation for the GPIO controller functionality
provided by the AAEON embedded controller. This controller provides 7 GPOs
and 12 GPIOs for a total of 19 GPIO lines.

The GPIO controller is defined as a child node of the AAEON MCU device.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/gpio/aaeon,srg-imx8pl-gpio.yaml       | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aaeon,srg-imx8pl-gpio.yaml b/Documentation/devicetree/bindings/gpio/aaeon,srg-imx8pl-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8040dc0a36ee5650488520c2218f09fd08cdf64a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/aaeon,srg-imx8pl-gpio.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/aaeon,srg-imx8pl-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAEON Embedded Controller GPIO
+
+maintainers:
+  - Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+  - Thomas Perrot <thomas.perrot@bootlin.com>
+
+description: |
+  GPIO controller functionality provided by the AAEON embedded controller.
+  This controller provides 7 GPOs and 12 GPIOs.
+
+  The GPIO controller is a sub-device of the AAEON MCU and must be defined
+  as a child node of the MCU device.
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8pl-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the GPIO number (0-6 for GPOs, 7-18 for
+      general-purpose GPIOs).
+      The second cell is the GPIO flags as defined in
+      <dt-bindings/gpio/gpio.h>.
+
+  ngpios:
+    description: |
+      Total number of GPIOs available (GPOs + GPIOs).
+      This should be 19 (7 GPOs + 12 GPIOs).
+    const: 19
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio {
+      compatible = "aaeon,srg-imx8pl-gpio";
+      gpio-controller;
+      #gpio-cells = <2>;
+      ngpios = <19>;
+    };

-- 
2.52.0


