Return-Path: <linux-gpio+bounces-9734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55896AD49
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 02:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A31D1C23EC7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 00:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3600B1EBFF4;
	Wed,  4 Sep 2024 00:27:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2374A21;
	Wed,  4 Sep 2024 00:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725409678; cv=none; b=hd/Vcoxe2r9TlcGZ06zWCQ4UQPzwiQuqGW0IZahpIzW1xRnsaX4YRC50Wu6ETLWa7CSZ8FNFgSVxEt5EWo091jZwAfO6ST3UF0vF1zUITsG9zDVNxQs5EBvNskvAY7jbBymrVUcAZunuj0pyFWnML+msItCFfsSVxWBn1ExkVY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725409678; c=relaxed/simple;
	bh=h5V7a9pxwmZDjwKd2MNAtQG9j5qokpi/xWv8XCnn2Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k67129qMByYeazQkUkHqVBGU9D7Q1POCJIeqwfYfzQvEUq6GTniwQlIn4wH8s++YI+HI1vf0HFARc+5Wqz4dzmiLLcqvrGbKkRbeCYdqvnyY2Zb5DZZk8GhOhkoilCAvkznLncBmIkb6w429u34pjqYjCbgyyjmRq09GZbNvxJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 04 Sep 2024 00:27:23 +0000
Subject: [PATCH 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
In-Reply-To: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3255; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=h5V7a9pxwmZDjwKd2MNAtQG9j5qokpi/xWv8XCnn2Xs=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm16l55DAFqmnxhQWr0EaOvZhIceq5xWRq8etwf
 GqGV1GKIiSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtepeV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277df9D/4/yQmgqpndfYf7wk
 U/3O/xumfLX10GuHYDS2jG3xgJGOOEgr1DgibtUOt6A1UboAZSVHk2DmHNmt+HDofeBlY6RqnWt
 rMlHPjR/w4qQwkRFbfK6B+TcZQK6orKztDYi0BZAet+E3Hq/9Q+3WClDxQssw6KnI1f7F/eJR/j
 oKNvJS2jf01iyptgRaADK8tdrfHKCsDsdAJiHfbc3jQeb9VID4slpk3ja4ADkniDoewq7c1/PXe
 7UAUqxtjox8VJllGVETC7dDa1xV83xa69flLsqdwd/AsGgmB41UqgCykaZRTCELqZoCJu74Rhtw
 Hfgi/gvqeuwzY/1sprHt73VmEgKWUaS/u0hphLtzltwCbCvzftuHfowDBJPTSp49ZKsCXTOyii/
 W9npoOjJhcCxapkJz5drbpzsjBpYOL0PTDOo1XqZpB7qtjo812ZjFPDj7lp0Un54/Q3B2t7UUOL
 gMA5yVTxsabmh4aKF06osZfvjjkzVePrwNabUiv9/zXjc8TWgWdoiPJNBJWUchEhvlRx2lC79gG
 bKCNNAVvnvLfaog6j9N72pCJ+ZTf8HwdSMeZNHD3H2j/6MjqQrv8ORxc2SxsYjDBC2PacyQSCE/
 rulTI1K5T3+wXR6kPwCxVR2/notlf8jtZd6QAG42mJIf5UEqcrz98feAR179fGvAyYxw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, failing edge, or both.
There are four GPIO banks, each consisting of 32 pins.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000..db2e62fb452fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 GPIO controller
+
+description: >
+  The controller's registers are organized as sets of eight 32-bit
+  registers with each set controlling a bank of up to 32 pins.  A single
+  interrupt is shared for all of the banks handled by the controller.
+
+maintainers:
+  - Yixun Lan <dlan@gentoo.org>
+
+properties:
+  $nodename:
+    pattern: '^gpio@[0-9a-f]+$'
+
+  compatible:
+    items:
+      - const: spacemit,k1-gpio
+
+  reg:
+    maxItems: 1
+    description: >
+      Define the base and range of the I/O address space containing
+      the SpacemiT K1 GPIO controller registers
+
+  ranges: true
+
+  "#gpio-cells":
+    const: 2
+    description: >
+      The first cell is the pin number (within the controller's
+      pin space), and the second is used for the following:
+      bit[0]: polarity (0 for active-high, 1 for active-low)
+
+  gpio-controller: true
+
+  gpio-ranges: true
+
+  interrupts:
+    maxItems: 1
+    description:
+      The interrupt shared by all GPIO lines for this controller.
+
+  interrupt-names:
+    items:
+      - const: gpio_mux
+
+  "#interrupt-cells":
+    const: 2
+    description: |
+      The first cell is the GPIO number, the second should specify
+      flags.  The following subset of flags is supported:
+      - bits[3:0] trigger type flags (no level trigger type support)
+        1 = low-to-high edge triggered
+        2 = high-to-low edge triggered
+      Valid combinations are 1, 2, 3
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - interrupt-names
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gpio@d4019000 {
+            compatible = "spacemit,k1-gpio";
+            reg = <0x0 0xd4019000 0x0 0x800>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupts = <58>;
+            interrupt-names = "gpio_mux";
+            interrupt-parent = <&plic>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-ranges = <&pinctrl 0 0 128>;
+        };
+    };

-- 
2.45.2


