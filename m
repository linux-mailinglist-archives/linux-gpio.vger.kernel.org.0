Return-Path: <linux-gpio+bounces-16432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D4A40E89
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 12:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 922163B3916
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 11:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADD8205E1C;
	Sun, 23 Feb 2025 11:50:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48314205AA4;
	Sun, 23 Feb 2025 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311425; cv=none; b=SFv6SFFvQ+dHUsOV8ays08gq60eynWs4Ev98d6Ijfjw0rhGZYHdk5SKX5FNSmXhiHylvZMySpVSIzu8xc1Q+426yhISMsYyCW9+GXI/46/FrCr/h253XSiSMLkBi0TQgFSv76CYgh0PsE9U+h46Z6AwuU8wDRdvcJBmnE/UtJYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311425; c=relaxed/simple;
	bh=Kk9p+piWnXTCMsCpvXWiYvyWsBN2vniQaFGG+k7h9zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcjwdE4L4pv+WXpfJz/prbyIuoC68auCEjGVy70dGSrJxnqVAVRtIoiNU6DQK64zoiEA3jHvX4R+PO6lTfihCOTqagvOmn4w5iKHI9v+uBMXjloAWWmP1VMjD7vYGdavDhPTEnWoshZgSoaTdYw0DBOLdz/WG5HJJNqETndWzoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B556B34317F;
	Sun, 23 Feb 2025 11:50:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 23 Feb 2025 19:49:32 +0800
Subject: [PATCH v6 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-03-k1-gpio-v6-1-db2e4adeef1c@gentoo.org>
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
In-Reply-To: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Kk9p+piWnXTCMsCpvXWiYvyWsBN2vniQaFGG+k7h9zM=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnuwtjYecUQo843P6AskonOScZM0vFHwMau0n9I
 bbPmh8Zg/uJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7sLY18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277S0GD/9ZoXb1J3VtYCjmPf
 +8sf3AwK4bEwBUstAw2Vs+EcQbaeE1j/FOSDHaNIukPSYyF6Hs9dfLN2U/IdOAAvFJ7DK51cUma
 3mx2D4TgG1xremHQpxUco3tRU7x5UVKS7XUx/c7k5ZdYwYDbzvPqRWypnKMA1owGxhveShu75+u
 vvFxo841qATsB13DEaC/bRiDTJl/S7v7guE5pveMBMePhE7R27uTmvs8KCYaq9nyMkXZ3oriyFM
 BHQ2aE3Qww+Ph49Olxt19ckUbYWhiuu5YWnFAl4N/hkzaFAk3ysGTuN7Cq8rxqtXMA46gJ/tdxf
 GVNOhFXcih8ME1axGumuJMZj4vt5WF8nSL3+be9yEw0tOvuC9hgiokL7vb33iJYu/gCC9YAftcy
 M4C50+7PM3BXLOqt8I2fVmKXI+B4uAxL/hDcjtFU0Mtjm6yQt5hdekVggc2Nns0ux4zJziOQ0Pl
 4k4AFMyEWYeuS9lYf9qjAMIwPemtvB/uE7taLj9lQ8kGgZI/XKkMDxHxuzmpkdwJHaeQSKT5Zw0
 9pYYYMD9zEu0aO+NrZ1fwmmNGpdY0V9WqQSOfZP/fBoz/fIBwfSxUd0enOTUlyw9yrPmKBrlMGF
 5vXROWhbBu5LuyZyDwrohU20q9QkhmddlyUQiWAAfjau5liSJYeaBP4gGryo0ksP6t8A==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The GPIO controller of K1 support basic functions as input/output,
all pins can be used as interrupt which route to one IRQ line,
trigger type can be select between rising edge, falling edge, or both.
There are four GPIO banks, each consisting of 32 pins.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..017165d325565a6868700a9ac8298b61dffcfef4
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
+      gpio-ranges = <&pinctrl 0 0 0 32>,
+                    <&pinctrl 1 0 32 32>,
+                    <&pinctrl 2 0 64 32>,
+                    <&pinctrl 3 0 96 32>;
+    };
+...

-- 
2.48.1


