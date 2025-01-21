Return-Path: <linux-gpio+bounces-14954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E91CFA1764F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 04:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 661DD3AAC90
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 03:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01923185955;
	Tue, 21 Jan 2025 03:39:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2478F58;
	Tue, 21 Jan 2025 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737430751; cv=none; b=GXu59ZtRAi+NjhogrQfY3XEFYMr8/eQ62tNF6KuntNVW0hI++EfkLc2O7LrsWD6ZvtE7Vg1oFcJVtLuKGcurhmbysz4uBebhceYHlpmTWw6SboW3zaXc7NrcDTG79nWw1DObtA37/UWyMUZ1BPTaHNwLy4k9FMlx9QB6mGybWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737430751; c=relaxed/simple;
	bh=DscMYv3enzAGZGUA7P5eEREoN3GC1937aMOucAj7ncY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPqVAVhdqjR8n28K242DyWpCUZZVUjiXH9/YRDJlVhMYMsczGoMaB/R4JtXujZglwA03hOTz7J8eFu/7SiG1IDsiSrUtVkt4xTjHJt5AuxXdbJyAW4J7kGb4z+xA7nvcZKGH6pz4jYggSqTRKY4TU9TvEVKzTWJ5ZxDqCALL5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 33A45342F94;
	Tue, 21 Jan 2025 03:39:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 21 Jan 2025 11:38:11 +0800
Subject: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
In-Reply-To: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
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
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=DscMYv3enzAGZGUA7P5eEREoN3GC1937aMOucAj7ncY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnjxbDAodos70mhPrcP1Vp9XEVKplA4pnbbJSoH
 dI2fCaMeKiJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ48Ww18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277bwwD/4lcyKHl+9mOfUuIW
 jZKw+CqCZN4yJzCiC4RFJT368Vz66M+JAx4AeCWTO3NDLjUYc1OV4mNFTuIilyqatz+rgNJm1Xx
 6uLVGgkdVYrfcY0kxW8lGaTUyeBjCFFsTOFDzeYk5vvvXxHHLUc/1NUrdQytYUmhy6TG/dpZPhA
 ljUC+xWAQ3Igeb7R7PxmaB1iBkfUl0x0gnuydWkRxWVyht+heHatYr5Qysbig+GdLPSl7BxEkvf
 aqQLZkg3gSWx8uw70PHrnbWECj1hctShLDFbBb+0oX7odbd6zk0h5JYn5Cb39xm61qWb/3txFgt
 G65+hVz07/pcrgp5g0RFkZ1EejTzZPy5yNAsiuoHo33dk4v+KzhXd4mhNYGG34J9hzHdtZzm+vL
 OKDpLPQLPq3pa21w/+fhjItCQaFv3NhCVHGPVfCONuOETOhyNnN/yiFx1Rth5GdIN/rW5DOT+Ni
 58lw4ajBKiemFcKUiapVX/tLpU1K+E9BHnXp2wq6/RzuPDctqa1FCgzXfLdOJx+SMB7KNWCTbTI
 DzUAobBb9skFXes1EOzPCrws250jkpaSPyrQxUoncvn6oGb4XQK+OS7VJ/n+XRX7UvOZu2abB3g
 IXqqG306Z+/k51XNUXGGeKWs7WwoHPPtJXoVxhOkF/CyBgK3SeonMr0Fb8kqNtMtUzkQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, failing edge, or both.
There are four GPIO ports, each consisting of 32 pins.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..dd9459061aecfcba84e6a3c5052fbcddf6c61150
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,116 @@
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
+  Each port will be represented as child nodes with the generic
+  GPIO-controller properties in this bindings file.
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^gpio-port@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: spacemit,k1-gpio-port
+
+      reg:
+        maxItems: 1
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges: true
+
+      interrupts:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+        description:
+          The first cell is the GPIO number, the second should specify interrupt
+          flag. The controller does not support level interrupts, so flags of
+          IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
+          Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
+
+    required:
+      - compatible
+      - reg
+      - gpio-controller
+      - "#gpio-cells"
+
+    dependencies:
+      interrupt-controller: [ interrupts ]
+
+    additionalProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    gpio: gpio@d4019000 {
+      compatible = "spacemit,k1-gpio";
+      reg = <0xd4019000 0x800>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      port0: gpio-port@0 {
+        compatible = "spacemit,k1-gpio-port";
+        reg = <0>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-parent = <&plic>;
+        interrupts = <58>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 32>;
+      };
+
+      port1: gpio-port@4 {
+        compatible = "spacemit,k1-gpio-port";
+        reg = <4>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-parent = <&plic>;
+        interrupts = <58>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&pinctrl 0 32 32>;
+      };
+    };
+...

-- 
2.48.0


