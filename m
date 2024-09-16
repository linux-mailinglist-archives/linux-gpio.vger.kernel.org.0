Return-Path: <linux-gpio+bounces-10168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B783E979B57
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9F571C22517
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 06:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9B05025E;
	Mon, 16 Sep 2024 06:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ELcD2D9i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32CB4120B;
	Mon, 16 Sep 2024 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469145; cv=none; b=gOztd+T559jPv6UkNacN1mdLsvl3dd4bUNSaJIX6gytSj7gMwJn4zUhUyXOFQpOmP5OnOLlmt25+zMmg7pfLgsqhSP/YZbQhRtWMfuXVzCPE79cYj8dJYM1arSu0FIBnF0f+1zQMMnTbIhuOzSAy7ZrJ73r8fS5jsrvYEg1pvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469145; c=relaxed/simple;
	bh=jAwSw4LEIfXT39XmNvQkkX3/1clNMqBMeMdEHqSLLuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XwLrVYJQO9ckb7UN33sI/4EAf9kCDL2BvWHsQmSYAMhqoo3C5e+OHO+1QMkhzkSaZD+av2OprpNsCOMtRu51rRiRYN9gkdg41XDvGUvFWRd0XvPin02pALDwGxXDH/Wj4hQdzLruQstSriXr0vff798gafxwGGqPJ5ZJWl27lis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ELcD2D9i; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=H5SO/
	a1hfbyVpeTzy2AAy5aKvwSqfgsGs2lOMb5bsec=; b=ELcD2D9iTL4cSN5SxjBh6
	BXgHtcjXd3q1Snt6RNk4YaZOuu2naSd+v2aGVrwlnyZTvk4kirg61qdU9m2/J6bd
	WHwF+zo+k9Z/u6AEiRrnVJRe/mY9XlCJVCu5W9h85pwJhnwxN7fme/EkWBGbZUcX
	4hclGhEXcFJ5oq7C1CoeVY=
Received: from jean.localdomain (unknown [27.18.168.209])
	by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wDXX36b0+dmVfTnDg--.31141S2;
	Mon, 16 Sep 2024 14:43:39 +0800 (CST)
From: Ze Huang <18771902331@163.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ze Huang <18771902331@163.com>,
	Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RESEND PATCH 1/3] dt-bindings: pinctrl: Add support for canaan,k230 SoC
Date: Mon, 16 Sep 2024 14:42:23 +0800
Message-ID: <20240916064225.316863-1-18771902331@163.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240916063021.311721-1-18771902331@163.com>
References: <20240916063021.311721-1-18771902331@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX36b0+dmVfTnDg--.31141S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF17Cr1xuw1rZr4rAryfXrb_yoWrJFyxpF
	ZxKa98KF1rWF47K3yfta18uF13Xa1kArsagw1Utry7tw45WF18Kr1akr4IvF4DWFn7J3Wa
	qFWIgry7KF47Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piL0ePUUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJwBcomXAn1YeJAAAsP

Add device tree binding details for Canaan K230 pinctrl device.

Signed-off-by: Ze Huang <18771902331@163.com>
---
 .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
new file mode 100644
index 000000000000..979c5bd71e3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/canaan,k230-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K230 Pin Controller
+
+maintainers:
+  - Ze Huang <18771902331@163.com>
+
+description:
+  The Canaan Kendryte K230 platform includes 64 IO pins, each capable of
+  multiplexing up to 5 different functions. Pin function configuration is
+  performed on a per-pin basis.
+
+properties:
+  compatible:
+    const: canaan,k230-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    patternProperties:
+      '-cfg$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
+        description:
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias, input
+          enable/disable, input schmitt trigger, slew-rate enable/disable,
+          slew-rate, drive strength.
+
+        properties:
+          pinmux:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description:
+              The list of GPIOs and their mux settings that properties in
+              the node apply to. This should be set with the macro
+              'K230_PINMUX(pin, mode)'
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            minimum: 0
+            maximum: 15
+
+          input-enable: true
+
+          output-enable: true
+
+          input-schmitt-enable: true
+
+          slew-rate:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              slew rate control enable
+              0: disable
+              1: enable
+
+            enum: [0, 1]
+
+          power-source:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              Specifies the power source voltage for the IO bank that the
+              pin belongs to. Each bank of IO pins operate at a specific,
+              fixed voltage levels. Incorrect voltage configuration can
+              damage the chip. The defined constants represent the
+              possible voltage configurations:
+
+              - K230_MSC_3V3 (value 0): 3.3V power supply
+              - K230_MSC_1V8 (value 1): 1.8V power supply
+
+              The following banks have the corresponding voltage
+              configurations:
+
+              - bank IO0 to IO1: Fixed at 1.8V
+              - bank IO2 to IO13: Fixed at 1.8V
+              - bank IO14 to IO25: Fixed at 1.8V
+              - bank IO26 to IO37: Fixed at 1.8V
+              - bank IO38 to IO49: Fixed at 1.8V
+              - bank IO50 to IO61: Fixed at 3.3V
+              - bank IO62 to IO63: Fixed at 1.8V
+
+            enum: [0, 1]
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl: pinctrl@91105000 {
+        compatible = "canaan,k230-pinctrl";
+        reg = <0x91105000 0x100>;
+
+        uart2_pins: uart2-pins {
+            uart2-pins-cfg {
+                pinmux = <0x503>, /* uart2 txd */
+                         <0x603>; /* uart2 rxd */
+                slew-rate = <0>;
+                drive-strength = <4>;
+                power-source = <1>;
+                input-enable;
+                output-enable;
+                bias-disable;
+            };
+        };
+    };
-- 
2.46.1


