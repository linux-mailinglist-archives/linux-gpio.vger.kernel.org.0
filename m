Return-Path: <linux-gpio+bounces-13996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B869F753E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC36B16CBAE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 07:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47D8217671;
	Thu, 19 Dec 2024 07:18:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682827082A;
	Thu, 19 Dec 2024 07:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734592714; cv=none; b=g1VCyedzVOW+S/YoZbmlf6f8jDL9xYd1cSxivnaPfdKYD1tr167eHWsdJdoVD61JYpJ/Pb2BNixS5uf+m0LC6bCwLeYAGune5TkY9EAwNfKLPzHee3OtWSN0VoaqGOtd4P5SXNxoJc/6PbOLEaTFmbc6LqRYPX9qKzw28Pp8u50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734592714; c=relaxed/simple;
	bh=PuvMbdDrX5Trb+pDXq7PJAmUp0RoHA9vJ85lsUKDFM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ra8WtT1/CLva4FXkiWE6T/nXEq8tXXKyXswcmaC9d3Hiqzsc32Es3/L53X1OPkJdrfNP6VCqdiV86F1HEKipGOjYeFceBaBTu340gzGtFMEer99hqaXquU1hxhSR4kOg/ZGNSJhNjpaNAVs/Lpy0dncOLj3g7vmn3Kse9tfWhUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 19 Dec 2024 15:17:43 +0800
Subject: [PATCH v2 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-03-k1-gpio-v2-1-28444fd221cd@gentoo.org>
References: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
In-Reply-To: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=PuvMbdDrX5Trb+pDXq7PJAmUp0RoHA9vJ85lsUKDFM4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnY8ixu0mGraLvHA7T/MWmc4IEZlzlnnzDPK2CQ
 wuMVJtmSVaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2PIsV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277X/3D/99Rw1E/QBAOgCvsh
 nASBxGHryoj95OL1ThOJCzsUvYoJ4BCpuN823Stpjx95NeFef0zxiSC4c/UkvjQweTWlKMgkm/W
 SK6Im4M8C3QeqNT3NRfxKcYPU3cqhR4aWcxKkm813C8YZTAQ7nTpRbQEB6y56DLUp3sJDYusGyR
 OcoJmzJhnyseUdMk+ZKAPzM2Ff2BP7kDJc26EEduPqckjKLJN8ole/0y0FzS26lvSjQr/UtS3i5
 7oxOr7J5/kpML33V5TsHuNrunl7pyACiFwJIvTtFEppHKWhHRd/stjwzby6m5RklvydQzoZU96p
 pxQc4U3H0xSckgH1YOxjefK5q37iaa41IMrpKdfIokYXUWOsQGyz9VJFBidGsjiJCPi+KVEult7
 XA1SNB5SZFoG1LdK/yWTLJc/qv1v77Ws03PvBwyoFjGzHBE2T5HKFI98JD9OwlvMCie59ZDqM7z
 TPHDrwhDhwLD+BAOClzjfXps7qMzLtB8QdkATk8pXT6LBkJxWFsl1FJ1hbfzWK1OheLO+6knYaT
 E3OL+2UwnffK9BYaFZFwMNc73qeyKxXaRAc0kSj6mqJMMIFbM8qbFLypNDAsswwzjqe7WYqoOO/
 h4x5V3dd/mBDCntZC0t7VIL45+dFe+Vd6PiIVISZe+lqcp5hFG3WcOTnYXXt7G7U3Tzw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, failing edge, or both.
There are four GPIO banks, each consisting of 32 pins.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3d3d0b3bf2c144ed57b717bee50064949e26f087
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,75 @@
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
+  registers with each set controlling a bank of up to 32 pins.  A single
+  interrupt is shared for all of the banks handled by the controller.
+
+properties:
+  compatible:
+    const: spacemit,k1-gpio
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  "#gpio-cells":
+    const: 2
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
+  interrupt-names: true
+
+  "#interrupt-cells":
+    const: 2
+    description:
+      The first cell is the GPIO number, the second should specify interrupt
+      flag. The controller does not support level interrupts, flags of
+      IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
+      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-names
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@d4019000 {
+        compatible = "spacemit,k1-gpio";
+        reg = <0xd4019000 0x800>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupts = <58>;
+        interrupt-names = "gpio_mux";
+        interrupt-parent = <&plic>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 128>;
+    };

-- 
2.47.0


