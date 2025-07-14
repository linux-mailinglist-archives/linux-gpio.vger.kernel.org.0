Return-Path: <linux-gpio+bounces-23234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98248B04863
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA4161A663A4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3A02367DE;
	Mon, 14 Jul 2025 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIVmCnKC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CBA1F418B;
	Mon, 14 Jul 2025 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524878; cv=none; b=pji2CFqwawg6avaiIgyMPP0w6lUUuyCxzVJ2ndcn/Ll67j9rfzelBT7xiChVqnzu7n3xLD8qfdeOVIkf7Vo4Vq77owup+JFsEURLQNCEJqz8d4ca2d3I2MLB1QRkSPHNGIc02O2n2tSo4wvRnIcO1ECR6HJHySumorQJYfAFrRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524878; c=relaxed/simple;
	bh=KqTIXe7cJXAI//GfX/ufzx2y0/k8296xkvEHRld4EcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HkY4L5kkz8O9i/zfYsoKX9MPSZErpajVGtKamPM9lI80LRBs538Our2SmGXv/TPSyPZ2zaH1/nYtE+8sefZK4I/rsufElGW9Go1a8Iapf4ACTOWASvdwyvYvNLWTTKd288x1Sri5Li//GZPAx9aH3LleWDPLMgp1d/Po+zIiqpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIVmCnKC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D931C4CEED;
	Mon, 14 Jul 2025 20:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524877;
	bh=KqTIXe7cJXAI//GfX/ufzx2y0/k8296xkvEHRld4EcI=;
	h=From:To:Cc:Subject:Date:From;
	b=HIVmCnKCdOaJsEfDFxI6J6SJTCP5nezyuRTsuo7zwz+ADS1fPZyzuuFW8SPlaNZl2
	 Sa8xyOOy9JUjunN27sYVhaqOvtJhL5N0oBlS+EoU8rDfoK91QFaeiWISUetCFZ9ZQt
	 +k2jFLYOprlio8fvKR9S6uGzxpsY8YR4Jw0Dek6aCuF3Zp7Bvmft4Z5MvLYlCUX3HE
	 F21ThqB+ODOiQNVngYuMuCGsCIaDAKKfzv41TaTHLNVJWfMP/AYXu+nwHoXlgr5FKP
	 iP3Gzm7VefjlgWMGAdLcA9kqYT7pStnWoFdGPop0NUwv6mgiFdeQPiDo2du4a9CkhF
	 lzhYYaSpcsUcA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert st,spear-spics-gpio to DT schema
Date: Mon, 14 Jul 2025 15:27:52 -0500
Message-ID: <20250714202753.3010240-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ST SPEAr SPI CS GPIO binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/gpio/spear_spics.txt  | 49 -----------
 .../bindings/gpio/st,spear-spics-gpio.yaml    | 82 +++++++++++++++++++
 2 files changed, 82 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/spear_spics.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/st,spear-spics-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/spear_spics.txt b/Documentation/devicetree/bindings/gpio/spear_spics.txt
deleted file mode 100644
index dd04d96e6ff1..000000000000
--- a/Documentation/devicetree/bindings/gpio/spear_spics.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-=== ST Microelectronics SPEAr SPI CS Driver ===
-
-SPEAr platform provides a provision to control chipselects of ARM PL022 Prime
-Cell spi controller through its system registers, which otherwise remains under
-PL022 control. If chipselect remain under PL022 control then they would be
-released as soon as transfer is over and TxFIFO becomes empty. This is not
-desired by some of the device protocols above spi which expect (multiple)
-transfers without releasing their chipselects.
-
-Chipselects can be controlled by software by turning them as GPIOs. SPEAr
-provides another interface through system registers through which software can
-directly control each PL022 chipselect. Hence, it is natural for SPEAr to export
-the control of this interface as gpio.
-
-Required properties:
-
-  * compatible: should be defined as "st,spear-spics-gpio"
-  * reg: mentioning address range of spics controller
-  * st-spics,peripcfg-reg: peripheral configuration register offset
-  * st-spics,sw-enable-bit: bit offset to enable sw control
-  * st-spics,cs-value-bit: bit offset to drive chipselect low or high
-  * st-spics,cs-enable-mask: chip select number bit mask
-  * st-spics,cs-enable-shift: chip select number program offset
-  * gpio-controller: Marks the device node as gpio controller
-  * #gpio-cells: should be 1 and will mention chip select number
-
-All the above bit offsets are within peripcfg register.
-
-Example:
--------
-spics: spics@e0700000{
-        compatible = "st,spear-spics-gpio";
-        reg = <0xe0700000 0x1000>;
-        st-spics,peripcfg-reg = <0x3b0>;
-        st-spics,sw-enable-bit = <12>;
-        st-spics,cs-value-bit = <11>;
-        st-spics,cs-enable-mask = <3>;
-        st-spics,cs-enable-shift = <8>;
-        gpio-controller;
-        #gpio-cells = <2>;
-};
-
-
-spi0: spi@e0100000 {
-        num-cs = <3>;
-        cs-gpios = <&gpio1 7 0>, <&spics 0>,
-                   <&spics 1>;
-	...
-}
diff --git a/Documentation/devicetree/bindings/gpio/st,spear-spics-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,spear-spics-gpio.yaml
new file mode 100644
index 000000000000..3b0d2112da79
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/st,spear-spics-gpio.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/st,spear-spics-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Microelectronics SPEAr SPI CS GPIO Controller
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+
+description: >
+  SPEAr platform provides a provision to control chipselects of ARM PL022 Prime
+  Cell spi controller through its system registers, which otherwise remains
+  under PL022 control. If chipselect remain under PL022 control then they would
+  be released as soon as transfer is over and TxFIFO becomes empty. This is not
+  desired by some of the device protocols above spi which expect (multiple)
+  transfers without releasing their chipselects.
+
+  Chipselects can be controlled by software by turning them as GPIOs. SPEAr
+  provides another interface through system registers through which software can
+  directly control each PL022 chipselect. Hence, it is natural for SPEAr to
+  export the control of this interface as gpio.
+
+properties:
+  compatible:
+    const: st,spear-spics-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  st-spics,peripcfg-reg:
+    description: Offset of the peripcfg register.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st-spics,sw-enable-bit:
+    description: Bit offset to enable software chipselect control.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st-spics,cs-value-bit:
+    description: Bit offset to drive chipselect low or high.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st-spics,cs-enable-mask:
+    description: Bitmask selecting which chipselects to enable.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st-spics,cs-enable-shift:
+    description: Bit shift for programming chipselect number.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - st-spics,peripcfg-reg
+  - st-spics,sw-enable-bit
+  - st-spics,cs-value-bit
+  - st-spics,cs-enable-mask
+  - st-spics,cs-enable-shift
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@e0700000 {
+        compatible = "st,spear-spics-gpio";
+        reg = <0xe0700000 0x1000>;
+        st-spics,peripcfg-reg = <0x3b0>;
+        st-spics,sw-enable-bit = <12>;
+        st-spics,cs-value-bit = <11>;
+        st-spics,cs-enable-mask = <3>;
+        st-spics,cs-enable-shift = <8>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.47.2


