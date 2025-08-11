Return-Path: <linux-gpio+bounces-24206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C79B2126D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 18:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DBFD189435B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FF7296BCD;
	Mon, 11 Aug 2025 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HCrhoKSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D09D1DFDAB;
	Mon, 11 Aug 2025 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930346; cv=none; b=RvI8tsu5knWsBJEfuL7yNQsI1JhRtdjUiyi0zps7FSqa7NZXQS2Gq/Uuq7jOT1mW2siX9XVwnCDOCdfjMXJusn2MmtUpiNXBU403VglRo9jMoOJ96bnES/fvgqjLJEMAKoOgRtSlAz414/5DaXCBrbkaxxcXjjib6NP/4vzfnHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930346; c=relaxed/simple;
	bh=dYPpJEmQpvSq4iDW/S25rTfoUpN/PhSh2PhokpZ7IQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8uHavga/VBDUu0NWBFnJmFblKd7Bkb07a5/nVIXKysbOwwLsBzRVw/2wBHKwedKvKG39Yij83HN5Ye6ZzNqS3jMjoWnhCU/b/mCNqCV60YdDtEZpeYbIpm25zxgZPk1v3OEq3pv1lqEw6Od1evgvpUzPERDpsp2S5R63kISTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HCrhoKSK; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 02D0820E4B;
	Mon, 11 Aug 2025 18:39:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWaBrpNGEVI4; Mon, 11 Aug 2025 18:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754930303; bh=dYPpJEmQpvSq4iDW/S25rTfoUpN/PhSh2PhokpZ7IQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HCrhoKSKyXySqLc8qHCAxMFdNZpwcFHdFujM3fhEHIOBUXVVxmhSevfdEj6j8wmmx
	 JYgftrVUMAATuDrflwrlegC9UgZoMRbssI8z7PEUZNsxQQFaP71RxLGVUB0dAezN8p
	 r4gmF/xN8QQG5KRnQfua39PnpS3DkqaewIraayGPl4f8ZPoA6HKorG4j8ZH/zEbG+n
	 ys5SwvgYYiU8WZCRNIs0Y1HhHxq7LfNEYTU+4P3UKWrKVsyP62iXvuSrMzHVtvAjN1
	 TgCQSf6axCFiruSxUMarNEDAYbeNxybosrUTFebosOPPL1RWTXLNgNKZE1Dlf9D6FU
	 IbmzlPmzNkj5A==
From: Yao Zi <ziyao@disroot.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 1/3] dt-binding: pinctrl: Document Loongson 2K0300 pin controller
Date: Mon, 11 Aug 2025 16:37:48 +0000
Message-ID: <20250811163749.47028-3-ziyao@disroot.org>
In-Reply-To: <20250811163749.47028-2-ziyao@disroot.org>
References: <20250811163749.47028-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pincontroller integarted in Loongson 2K0300 is able to configure
function multiplexing for all the pins. It could also configure drive
strength on basis of functions, which means all pins set to the same
function share drive-strength setting. Drive-strength configuration
isn't available for all functions, either.

This binding utilizes two levels of subnodes, where the outer represents
function and the inner represents groups. Drive-strength is allowed in
the outer since it's shared among all groups configured to the function.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../pinctrl/loongson,ls2k0300-pinctrl.yaml    | 92 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
new file mode 100644
index 000000000000..cbd74cb45342
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/loongson,ls2k0300-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-2K0300 SoC Pinctrl Controller
+
+maintainers:
+  - Yao Zi <ziyao@disroot.org>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: loongson,ls2k0300-pinctrl
+
+  reg:
+    items:
+      - description: Pin function-multiplexing configuration registers
+      - description: Pin drive-strength configuration registers
+
+  reg-names:
+    items:
+      - const: mux
+      - const: drive
+
+patternProperties:
+  '^func-':
+    type: object
+
+    $ref: pincfg-node.yaml#
+
+    properties:
+      drive-strength:
+        description:
+          Maximum sink or source current as defined in pincfg-node.yaml. Note
+          that drive strength could only be configured on function basis, i.e.,
+          all pins multiplexed to the same function share the same
+          configuration.
+
+          This could only be configured for several functions, including jtag,
+          dvo, uart, gmac, sdio, spi, i2s, timer, usb and emmc.
+        enum: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
+
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents GPIO pin number and multiplexing
+              setting. Configuration for each pin takes one cell. The pin
+              number locates at the high 24 bits, and the setting locates at
+              the low 8 bits.
+
+        additionalProperties: false
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@1fe00420 {
+        compatible = "loongson,ls2k0300-pinctrl";
+        reg = <0x16000490 0x20>, <0x16000110 0x4>;
+        reg-names = "mux", "drive";
+
+        func-uart {
+            drive-strength = <2>;
+
+            uart0-pins {
+                pinmux = <((40 << 8) | 0x3)>, <((41 << 8) | 0x3)>;
+            };
+
+            uart1_pins: uart1-pins {
+                pinmux = <((42 << 8) | 0x3)>, <((43 << 8) | 0x3)>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 7960e65d7dfc..dd50571b4072 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14414,6 +14414,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
 F:	drivers/thermal/loongson2_thermal.c
 
+LOONGSON-2K0300 SOC PINCTRL DRIVER
+M:	Yao Zi <ziyao@disroot.org>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
+
 LOONGSON EDAC DRIVER
 M:	Zhao Qunqin <zhaoqunqin@loongson.cn>
 L:	linux-edac@vger.kernel.org
-- 
2.50.1


