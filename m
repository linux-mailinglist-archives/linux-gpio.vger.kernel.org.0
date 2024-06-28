Return-Path: <linux-gpio+bounces-7804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FAA91C36D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 864E31F22A78
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F1C1CCCA8;
	Fri, 28 Jun 2024 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SwIgXW17"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E031C9EA4;
	Fri, 28 Jun 2024 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719591099; cv=none; b=B6wmwUj4ZR9E6Nyh1PAq2izoS4O8XbqV4gOQRSRYuGRYvJN4fpdPG+X6hAXQ/jpPaGNHihsWrc3lFDjf8Fbt6yaBVeanVROIelQMMrIZ4RlC0SZmP6UZFDO3KepCBxFrIAXw1K7nj1rLzx+hPgGl/yBkEj3vtwgiRrfDReshC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719591099; c=relaxed/simple;
	bh=R+chOmv8FkPYy3shRU6omdcCqkvl4xYk7/bp9zGrGnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqXz8mdGMTKmERfw58JE1Z0u+01vY8AIdHCqh9FRtPgOlK00P9FPj9IOuLD4TbDHpUsYfYzUpvGITYYvTvH3W4yD0yxXoHmQkuLgLKOx0x2DxFqfE/ekMYBIhYHCgVwn5OX6hVfOyx1xxGCTO1OxbS9kvxAEK3AxQLJ4RMOUQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SwIgXW17; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54A5060009;
	Fri, 28 Jun 2024 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719591094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlid2uc8/4wJ6Oij4D/kQLYpDdhcGo3VI/JMqY1sFgc=;
	b=SwIgXW17rk3JFCHxsozxdyVkEJHo8R0Jm5PT48TLuxqY+Cm72/gK6mL5SCoYLL0jgix4La
	6gxNc405q5B/e0SH75TV/4uh+5xU4Wd2OVA+AcFWdJfj7el+sSteZ4goHZcQUGO5ehdc5u
	+Wv6XcX7esMDQl3d34pteDaV8AHIX7+r7u8/HwMsO2sFqZi0TOfgNdb2FdMMqQMLsnfbDx
	oJ2g9axXNah5HFtZXZ5ubqn5bDAkg9wIpWU4tYOS9U4IUW7SpYuBkGQ5C68CiXDX2bs76+
	Bw+k86/TD70qnLDi2gktmg6O0wyuB4z4bblzwOpPyucwgBPEe5GZHa2MHiydtQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 28 Jun 2024 18:11:31 +0200
Subject: [PATCH 1/2] Revert "dt-bindings: pinctrl: mobileye,eyeq5-pinctrl:
 add bindings"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240628-mbly-pinctrl-v1-1-c878192d6b0a@bootlin.com>
References: <20240628-mbly-pinctrl-v1-0-c878192d6b0a@bootlin.com>
In-Reply-To: <20240628-mbly-pinctrl-v1-0-c878192d6b0a@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev-13183
X-GND-Sasl: theo.lebrun@bootlin.com

Switch from one sub-node per functionality in the system-controller to a
single node representing the entire OLB instance. This is the
recommended approach for controllers handling many different
functionalities; it is a single controller and should be represented by
a single devicetree node.

The pinctrl bindings is removed and all properties will be described by:
soc/mobileye/mobileye,eyeq5-olb.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml   | 242 ---------------------
 1 file changed, 242 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml
deleted file mode 100644
index 5f00604bf48c..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml
+++ /dev/null
@@ -1,242 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/mobileye,eyeq5-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mobileye EyeQ5 pin controller
-
-description: >
-  The EyeQ5 pin controller handles the two pin banks of the system. It belongs
-  to a system-controller block called OLB.
-
-  Pin control is about bias (pull-down, pull-up), drive strength and muxing. Pin
-  muxing supports two functions for each pin: first is GPIO, second is
-  pin-dependent.
-
-  Pins and groups are bijective.
-
-maintainers:
-  - Grégory Clement <gregory.clement@bootlin.com>
-  - Théo Lebrun <theo.lebrun@bootlin.com>
-  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
-
-$ref: pinctrl.yaml#
-
-properties:
-  compatible:
-    enum:
-      - mobileye,eyeq5-pinctrl
-
-  reg:
-    maxItems: 1
-
-patternProperties:
-  "-pins?$":
-    type: object
-    description: Pin muxing configuration.
-    $ref: pinmux-node.yaml#
-    additionalProperties: false
-    properties:
-      pins: true
-      function:
-        enum: [gpio,
-               # Bank A
-               timer0, timer1, timer2, timer5, uart0, uart1, can0, can1, spi0,
-               spi1, refclk0,
-               # Bank B
-               timer3, timer4, timer6, uart2, can2, spi2, spi3, mclk0]
-      bias-disable: true
-      bias-pull-down: true
-      bias-pull-up: true
-      drive-strength: true
-    required:
-      - pins
-      - function
-    allOf:
-      - if:
-          properties:
-            function:
-              const: gpio
-        then:
-          properties:
-            pins:
-              items: # PA0 - PA28, PB0 - PB22
-                pattern: '^(P(A|B)1?[0-9]|PA2[0-8]|PB2[0-2])$'
-      - if:
-          properties:
-            function:
-              const: timer0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA0, PA1]
-      - if:
-          properties:
-            function:
-              const: timer1
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA2, PA3]
-      - if:
-          properties:
-            function:
-              const: timer2
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA4, PA5]
-      - if:
-          properties:
-            function:
-              const: timer5
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA6, PA7, PA8, PA9]
-      - if:
-          properties:
-            function:
-              const: uart0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA10, PA11]
-      - if:
-          properties:
-            function:
-              const: uart1
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA12, PA13]
-      - if:
-          properties:
-            function:
-              const: can0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA14, PA15]
-      - if:
-          properties:
-            function:
-              const: can1
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA16, PA17]
-      - if:
-          properties:
-            function:
-              const: spi0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA18, PA19, PA20, PA21, PA22]
-      - if:
-          properties:
-            function:
-              const: spi1
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA23, PA24, PA25, PA26, PA27]
-      - if:
-          properties:
-            function:
-              const: refclk0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA28]
-      - if:
-          properties:
-            function:
-              const: timer3
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB0, PB1]
-      - if:
-          properties:
-            function:
-              const: timer4
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB2, PB3]
-      - if:
-          properties:
-            function:
-              const: timer6
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB4, PB5, PB6, PB7]
-      - if:
-          properties:
-            function:
-              const: uart2
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB8, PB9]
-      - if:
-          properties:
-            function:
-              const: can2
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB10, PB11]
-      - if:
-          properties:
-            function:
-              const: spi2
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB12, PB13, PB14, PB15, PB16]
-      - if:
-          properties:
-            function:
-              const: spi3
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB17, PB18, PB19, PB20, PB21]
-      - if:
-          properties:
-            function:
-              const: mclk0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB22]
-
-required:
-  - compatible
-  - reg
-
-additionalProperties: false

-- 
2.45.2


