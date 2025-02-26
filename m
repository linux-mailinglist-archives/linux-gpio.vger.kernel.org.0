Return-Path: <linux-gpio+bounces-16596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB02A451AB
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 01:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 184D03AD935
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 00:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D09D1494B2;
	Wed, 26 Feb 2025 00:42:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7A383A5;
	Wed, 26 Feb 2025 00:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740530541; cv=none; b=i5TelvDRUib6z0npQ3fuTRVNKP1gilh5h6+uqpMzIOahADjEh3U8LPb8oC3Mgm6VNpcYk2w/pUqmjGZYN09ReYMixADHjTiLy618BOOfMEbDJaAq1MTo/cwgES4beVlxqSKW+j7LQJSysMuhc7Rm0Ltnzd4tZZ1hZfcAZICSTyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740530541; c=relaxed/simple;
	bh=WH0/VTh61l0QsJuNF/iOodgWqrXFSar6PL7qgSyL8ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckdFIeMERkXW6J2PIJvqbYrPNawFD4NpVIZ3EiVk20PIIYbRxXUbsLPxidGdjwjxqvF4WTScZevs2jq9/WfQrN6gEEDcrtOBMMKQt/9z+0sNPeo80VlJ3L8E67EGlh2eRa//g4egi2gBt9ymcz3vC0zUPwlhxJug70iquNCanSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F2706343294;
	Wed, 26 Feb 2025 00:42:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Feb 2025 08:41:17 +0800
Subject: [PATCH v7 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-03-k1-gpio-v7-1-be489c4a609b@gentoo.org>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
In-Reply-To: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2915; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=WH0/VTh61l0QsJuNF/iOodgWqrXFSar6PL7qgSyL8ko=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnvmNPdiA4mYGMfmM105DDB61to2aFpYc6rNj8O
 vq4OAncV+mJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ75jT18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QTrD/9uUg+iXLPceiw9Bx
 PER7uARndL4Pl8uSJagG9FH0xw6hmmNo/mev6u+JqbiNw3+imPKA9u2ctvIwNR0MA54KC8+lBFy
 77AJ3jEFosyR5DbQtFuqFLl5GFllMFyoBJ4yhHP5U1j/IihB5IjqMvC4VChFLk0ox0GZ3hx5C26
 B088HnYGiywI0ZmswNW8q1tmqcILFiY7TEdizNkvKJ3Z78ICJqBjax7ltly/IWG5Ssevy35/EC8
 EbzME60ot+J2xAvtFYR7l1iUz0qk95mYOU0FPJcBkB4yeijqOtplRYJmT0OORQSligeAK4x6IXh
 qw9jMK5yUdjvqI/54hVN1Doq66yqpIYOithvrNWQs6p77E1Y7sGtgAcXgzjilc2kio9criqnxzL
 XBeWX1cBVy2PEmfsSGvLruywdlqYKu5XApJTpGc69Hph1bstwwYpvew6RBRqibU8vImM1tbdnNK
 eUuru9pxk8frLFPsiXGsSaWp1WECmBm5BFzFxB9DCTA+Yua3FoSJ0Ekte8plW/pjkE6Tie45p+1
 sxcI6qBagkbNuAhkKKvSdxEfg0jU6gja1uj9jPChO5nW+OkvbCvZ10U4MIKe+6rgCnGvrAX8HcF
 p3k7wNC4Np5tVEDXyhPdteHvAopsNH4GyGKklEXoeHWCG+AbAph/rvLUdMmKWKNsgAsg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, falling edge, or both.
There are four GPIO banks, each consisting of 32 pins.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..dc28135e008a2acaadf0366b9d50d1c2e4954b21
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -0,0 +1,79 @@
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
+      support level interrupts, so flags of IRQ_TYPE_LEVEL_HIGH,
+      IRQ_TYPE_LEVEL_LOW should not be used.
+      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
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
+examples:
+  - |
+    gpio@d4019000 {
+      compatible = "spacemit,k1-gpio";
+      reg = <0xd4019000 0x800>;
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
2.48.1


