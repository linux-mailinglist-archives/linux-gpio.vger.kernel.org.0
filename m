Return-Path: <linux-gpio+bounces-16128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84CA38391
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 112E57A1DAB
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 12:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2101621C163;
	Mon, 17 Feb 2025 12:58:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C7821B8F7;
	Mon, 17 Feb 2025 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797119; cv=none; b=W+3aVhYjtdGvCGw86Qxz3XRQMxNOEoAizgasIaAaMiWpN1ZgjuzzB1/AYoaTdPoEIkhcEuvtYb8+RM/SlfZxGtJv1ADWOZqnI1XvBCEFIY71Sx58YCRjBOk10PdzXeDtH/awAxxzaFA+xSAyHdVGCyLrkjEmlVD7TYtnH+sQ1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797119; c=relaxed/simple;
	bh=J4LzejSQ5iFcYvYi6JNYyYrOhmebJg2E7is5cCBuyAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nUMLSs0rH7aHdUx6BG+2LG6Myo9j6M4iVFNR5W/oqVED814LBftCZGwFkYT1rQu+80wKMC2BQX+/OPGgVnFOIgC5bGJK8LDd4e8GOiy7NMMJcwvHXbeEabEFBVVrZffPLsgJdxNFk2CPs4zOQpVWLRu3R/Rc1bgXPUgBNuNS9SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 77BC83430E1;
	Mon, 17 Feb 2025 12:58:31 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 17 Feb 2025 20:57:45 +0800
Subject: [PATCH v5 2/5] dt-bindings: gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-03-k1-gpio-v5-2-2863ec3e7b67@gentoo.org>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2910; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=J4LzejSQ5iFcYvYi6JNYyYrOhmebJg2E7is5cCBuyAo=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJd8XdZlWM84TE7E4yfh3s3Y2ffGC9HCA9Rr
 W1ZkVUj3MqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyXV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XkJD/9g1AnlmJcqBqTJUS
 FxmoX5jHQBALyWdYSfLNNcT1+UYG6v9ZOMGr93Kc2LHeaB7NDY6U1xxElCeUOE6gE3f1GfHJfHL
 XObxPeC4BUcIIgsBNi01juk5S4zZJYhureO96EV7Gn9C9ZJ6/UyXM3nCaEsZUY8zOdPqFCXqwlC
 Agz1Jqz+VvA0ICceCJh/DXdCZfupwsqP/VPB8a4Br6oQp0RO1ggbiVKVqHePviAoU+RFzYZ2/HG
 Qk+L//zr9cL7Uyp3lOuL/J8o10330fGpbUnDpYlYHZYMLnJ+IC5XizhJCmQ+eJUT0001n2PjKT0
 9FiDgEqFMGslaHBz2L+1vs3Ajd+tP0w8NdwQc0m8aHhYGOx7eu/ITDjp3iOTKwSQBrlzvJo6f/S
 OA7FR/BvPqLeAUdRwUIWtyWppUb9CmZ6B/jhd8/5O35IdT/6GrImCQHnAqjkzw9Ip/mKezgR3A0
 0UdlIk9/fmIuhoxXKeih8JSb4sARKhWK/PX3s8crwfI5N8DH3e0ligncwhQ7Ji4RWUyCEG+VnoA
 7oLK3s7zBt3FZRgt1YxjzXqfd02jju4UO+lVZ499yshRuFW6xDxJfF3MOUQmvnSwvIcCVRMLikd
 kz3p4tiNuZVlp9xY+qsQIqyCScaDTGVKEjaSm/PfWZkwu+qgizJqVAyXRHafHPktpS7w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, failing edge, or both.
There are four GPIO banks, each consisting of 32 pins.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..72a3ed2882782e5d22cf7d7a499c9084aefd961a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 GPIO controller
+
+maintainers:
+  - Yixun Lan <dlan@gentoo.org>
+
+description:
+  The controller's registers are organized as sets of eight 32-bit
+  registers with each set of port controlling 32 pins.  A single
+  interrupt line is shared for all of the pins by the controller.
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: spacemit,k1-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 3
+    description:
+      The first two cells are the GPIO bank index and offset inside the bank,
+      the third cell should specify GPIO flag.
+
+  gpio-ranges: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+    description:
+      The first two cells are the GPIO bank index and offset inside the bank,
+      the third cell should specify interrupt flag. The controller does not
+      support level interrupts, so flags of IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW
+      should not be used. Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - gpio-ranges
+
+additionalProperties: false
+
+dependencies:
+  interrupt-controller: [ interrupts ]
+
+examples:
+  - |
+    gpio: gpio@d4019000 {
+      compatible = "spacemit,k1-gpio";
+      reg = <0xd4019000 0x800>;
+      gpio-controller;
+      #gpio-cells = <3>;
+      interrupts = <58>;
+      interrupt-controller;
+      interrupt-parent = <&plic>;
+      #interrupt-cells = <3>;
+      gpio-ranges = <&pinctrl 0 0 32>,
+                    <&pinctrl 0 32 32>,
+                    <&pinctrl 0 64 32>,
+                    <&pinctrl 0 96 32>;
+    };
+...

-- 
2.48.1


