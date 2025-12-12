Return-Path: <linux-gpio+bounces-29473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A32CB823C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 08:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DB9E3065608
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 07:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5021630F800;
	Fri, 12 Dec 2025 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s9BvrZnm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D7230F7EB;
	Fri, 12 Dec 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765525295; cv=none; b=rLO0DS65ZNKWEc6DnW0sHWI8aDLyp3ui8UrO2kfowOANBUffrrVPgoLtoxi3cDH5jQgQzeiT7vmqeYc/n2x+2DG8m2jSiLm7BgSLlW9z66NnVjsHSKksKFvXEVo/bdokMU40QNRTqLoVaMbKJPRbO43FjSJOaV+i8RIE2IZA8eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765525295; c=relaxed/simple;
	bh=BSmAnzV4B6s6gqsxe7AXAr9CaPdItinYcag7ge3M574=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lffwmsgPhhdtwnSgYaQcIRjd9TUD3CPhRFeW29P/v3RIVE/8eykPg8droCnSed2X/cCoO5Dub23zMUAKe5BroDxKUWB1U2XZDahMjNZQRSM56nVwfepN2JRAlXvTHsIgKHi4G/sBc4n833BMVmqPt+REJtggr+8OHV0+cWrR4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s9BvrZnm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31FB5C1935D;
	Fri, 12 Dec 2025 07:41:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32DF3606DF;
	Fri, 12 Dec 2025 07:41:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 459DE103C8DF7;
	Fri, 12 Dec 2025 08:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3KTFJp4GBF6e0UyvSTrCDMZ0n3vB42aRXVc/F+Pp15I=;
	b=s9BvrZnmkucinAOhUQlG3YtEU1bPxzm06ijVoRb8g/UHd5hkEttd7aK8ZtN7CzGm/EflFs
	zDVXsGoL0EhKNJfRqoXaxgsmilZMKgM7k94ohDxneVy/XGPxZZrcAm17e0XUNv8SDK9rUF
	PbmBn79blgND/mf8eLtfNnbB6QJDMDe5VI9lxEJRqDkq+UgiVkLtoIj3llj1cv3HhajH0B
	7u26nTxrrfxtdNYVzWYnWey+88h1tHpqBMIzeK5aGHH1GGijrpWiegQNJMv2pSIWgrNOkz
	sN9QlklFkjMnxFV4SD3w00vLG8DcnWqfdimINjsAC7IIbCD3aK7jpEfwHNCltA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:06 +0100
Subject: [PATCH 3/8] dt-bindings: watchdog: Add AAEON embedded controller
 watchdog binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-3-6bd65bc8ef12@bootlin.com>
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

Add device tree binding documentation for the watchdog timer functionality
provided by the AAEON embedded controller. The watchdog has a maximum
hardware heartbeat of 25 seconds and supports a timeout of up to 240
seconds through automatic pinging.

The watchdog is defined as a child node of the AAEON MCU device.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml    | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d19a2f4fd38826ff4d1ce6b0b7f12e8b6879445f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/aaeon,srg-imx8pl-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAEON Embedded Controller Watchdog Timer
+
+maintainers:
+  - Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+  - Thomas Perrot <thomas.perrot@bootlin.com>
+
+description: |
+  Watchdog timer functionality provided by the AAEON embedded controller.
+  The watchdog has a fixed maximum hardware heartbeat of 25 seconds and supports
+  a timeout of 240 seconds through automatic pinging. The timeout is not
+  programmable and cannot be changed via device tree properties.
+
+  The watchdog is a sub-device of the AAEON MCU and must be defined as a
+  child node of the MCU device.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8pl-wdt
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    watchdog {
+      compatible = "aaeon,srg-imx8pl-wdt";
+    };

-- 
2.52.0


