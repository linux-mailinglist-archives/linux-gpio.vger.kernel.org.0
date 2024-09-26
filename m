Return-Path: <linux-gpio+bounces-10465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 741AC987717
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 17:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DB331C2111A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 15:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E12156C40;
	Thu, 26 Sep 2024 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PoymsWGC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0282A14AD25;
	Thu, 26 Sep 2024 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366315; cv=none; b=GprCvKDQiVn+no/ZUNIPaZWOhPoDwytyvnI9Iv/Exm37IYG27j7C8flXlAX3BwidmvI4J2hm+6p9/YhCV/B4vew/+kbdTL9woe97v8f/NMDgHs2DVMnhw8wnqOyBEuee7tk61eS/1Emk15Wpt57PR6+7d8ShcCG4JLO5UXGHQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366315; c=relaxed/simple;
	bh=Nl29eGU+LqeBp/q6oMd/IBwgBjzcLkHRNHOWh5mHn+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZHatXVOuIRRZc3yHLTrk8GFCH9Wku+B13eQixxSCQl0jEaLIxtO43/8OLTa/N8FFTGMWYqHZt+xeUdlGmsh2t+vRKqvnvHe5RrfwoZAuFHhha4zPtRsPXAzfJOTIJKjLAv1aktSJIFxSjN9DzNAlg21Ra0uN2M32n/Pn7RNTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PoymsWGC; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id; bh=mty+cdJRqv0WA4yEuN8JbkJ3vgLRawx+ZI6WiLYKKXg=; b=P
	oymsWGC6QzTJn2BpALlcxIyJgWCCKLefjZHffOTQSKUKhZxj0tjLznSqq4jjoC38
	YA2nH7/rDodr0spi5rrAmEI1D2jwmAcUGSNfLThiNiGf5mZ7svzt8Rf5WgqSYoUK
	6iTQMc9f+JYpUJZf3JJgfbGbakTBbBwXRwWzQcA92w=
Received: from [127.0.0.1] (unknown [27.18.107.33])
	by gzsmtp3 (Coremail) with SMTP id sigvCgBHA3OFhPVmTIX3AA--.42449S3;
	Thu, 26 Sep 2024 23:57:58 +0800 (CST)
From: Ze Huang <18771902331@163.com>
Date: Thu, 26 Sep 2024 23:57:43 +0800
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: Add support for canaan,k230
 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-k230-pinctrl-v2-1-a9a36fba4b34@163.com>
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
In-Reply-To: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ze Huang <18771902331@163.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366277; l=4390;
 i=18771902331@163.com; s=20240926; h=from:subject:message-id;
 bh=Nl29eGU+LqeBp/q6oMd/IBwgBjzcLkHRNHOWh5mHn+c=;
 b=6btBS1Z9E2dC+EVFS5yNRzeMnx7sLUnEln7pk27eRXqfExuUY0NE0ZCPIBfn9sWkvk75HTIyY
 K0JrtKV/84oBVWfptRAJ75F5mE+i1g3+W7K6b6UI40DfiiHONLfP2oX
X-Developer-Key: i=18771902331@163.com; a=ed25519;
 pk=M4cXLTlQ3syp0aIw4PNbFtajcroq/y7WBxK2F/jsUWI=
X-CM-TRANSID:sigvCgBHA3OFhPVmTIX3AA--.42449S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF17Cr1rCw4rGw1UGr13XFb_yoW5KrWUpF
	Z3KFW5Krs5WF47K3yfta18uF13Xa1kAF4Sqw1UKr9rJw45KF18Kr1akr4aqF4DuF1kJw1a
	qFWIgry7Kr47Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEk9NDUUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJw1momb1fqM32QABsP

Add device tree binding details for Canaan K230 pinctrl device.

Signed-off-by: Ze Huang <18771902331@163.com>
---
 .../bindings/pinctrl/canaan,k230-pinctrl.yaml      | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0b462eb6dfe169a292bf716503c03d029f1ac7ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
@@ -0,0 +1,127 @@
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
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        additionalProperties: false
+        description:
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias, input
+          enable/disable, input schmitt trigger, slew-rate enable/disable,
+          slew-rate, drive strength.
+
+        properties:
+          pinmux:
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
+            description: |
+              slew rate control enable
+              0: disable
+              1: enable
+
+            enum: [0, 1]
+
+          power-source:
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
+    pinctrl@91105000 {
+        compatible = "canaan,k230-pinctrl";
+        reg = <0x91105000 0x100>;
+
+        uart2-pins {
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
2.46.2


