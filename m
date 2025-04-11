Return-Path: <linux-gpio+bounces-18722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E65A86933
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 01:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12F28C5593
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 23:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCB82BF3D2;
	Fri, 11 Apr 2025 23:32:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51481EFF9F;
	Fri, 11 Apr 2025 23:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414340; cv=none; b=mH304/kiSMdQz4u93Okkp/HokdPlRxbFuHHCnfs+GFnyzmDmqXQtUXKaUnHJ0rMfiqD/0ywyMIrURCjwpksOqlR6fD+WGBYaV//4CB9l99Wc5k6MaPLwKA0GOsS5Uv39E0CAcDzOdWNTZo7Ml4q2L8NULZL1VmztudmMiw5+I5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414340; c=relaxed/simple;
	bh=M9VXnk1CtK2r3QgagZZvS//FUcoVPscUp1KyuaHsl90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1dk14btpB3VKMewpZ3QuDGXnc7Lo2yRF7FPbeS4xOk1fJx8O9mZU8jRAW4P0Q0oPeL3R0mLoIYzQGj0r8cbSu/98rgDtMT9p6XVD7RBEwSOzegOFkQpViRR4BWb92ZkGC1IaEDnQZioYIPmP1KB0jZ/DuF7d5sgZcOODrIi62s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3ADAA3432D5;
	Fri, 11 Apr 2025 23:32:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 07:31:28 +0800
Subject: [PATCH v8 1/5] dt-bindings: gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-03-k1-gpio-v8-1-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3458; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=M9VXnk1CtK2r3QgagZZvS//FUcoVPscUp1KyuaHsl90=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZkuqS6HejCQ9s7lpPFM94hIZRBADOGbP1fd
 dTXSQnpvyaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mmZF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277U9LEACeSmRmAW1yFr/t/g
 /stpNYRHicl0EL6RKphFEz3m5a5aEXNsHdspxfUo/ZokcKcmHcxHM6xzrh2Az7GFLdlvy69cx0F
 hHshG4ZryTi+JtvdD6NYMFxXR2rJ8BLylWnFE50ylFtW4xJ2A81nhRBX71vu/3dMhrWWH2TQx/q
 3l+F6IYlBMn+Fa9kohAa1AmnRLWqStcmwC2T1MRmU4iGmCb11Ed85okOxg1Qx0GAOOEN9+1/Ni0
 dir5e3m/fmYmtSvgzpWFFsIY5ZOhvHhRQlbwfSt0RJQrPsPJNV9YCGSY6hHb5Jji0KbUxKuUJOF
 FkulPr88eAZx+sjdCU1Ul+9Px04NFcSoVQzrvmWpZDjIsNmupXdhMkBYk4kuXW460GShAP2xIAM
 Z3ZCI8oVZLY9io95eX1NNO6mRnY0LkjBN+Tf6Iy/x20WK6rmuhXPGZGWEnTw+G9UIVFjqaPyeP7
 kFCT9EQb74j9J1WZCgCRp+FdmsgppAejnM0/R9rMz1r9A8u0NP4QlPDo8oQ7+NH/TNaR70feFYj
 QLK5uaPFZ9aPNzqNfGH5SxAIGRU9yqkAEq8q3gW8egQGhurA7jkNo5c+5THvqkOZjTbFLW02qmE
 q48V1dxfqB61Pv/B2U5c2el7JpQJ6/t/x7d4f54iIvIP6ia2IAVFH0n7XeQbxQEzQEYQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, falling edge, or both.
There are four GPIO banks, each consisting of 32 pins.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
hi Rob, I've kept your Review tag in this version, but want to
mention some changes here:
 - new clock property is added
 - add reset preperty, but make it optional
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ec0232e72c71221444972f0d3e0f391be05e4ef6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,96 @@
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
+  clocks:
+    items:
+      - description: GPIO Core Clock
+      - description: GPIO Bus Clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  resets:
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
+      support level interrupts, so flags of IRQ_TYPE_LEVEL_HIGH,
+      IRQ_TYPE_LEVEL_LOW should not be used.
+      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@d4019000 {
+      compatible = "spacemit,k1-gpio";
+      reg = <0xd4019000 0x800>;
+      clocks =<&ccu 9>, <&ccu 61>;
+      clock-names = "core", "bus";
+      gpio-controller;
+      #gpio-cells = <3>;
+      interrupts = <58>;
+      interrupt-controller;
+      interrupt-parent = <&plic>;
+      #interrupt-cells = <3>;
+      gpio-ranges = <&pinctrl 0 0 0 32>,
+                    <&pinctrl 1 0 32 32>,
+                    <&pinctrl 2 0 64 32>,
+                    <&pinctrl 3 0 96 32>;
+    };
+...

-- 
2.49.0


