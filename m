Return-Path: <linux-gpio+bounces-23242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7FB04886
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 628764A7AEC
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407F128136F;
	Mon, 14 Jul 2025 20:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMWk+uKl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBE323ABB5;
	Mon, 14 Jul 2025 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524936; cv=none; b=YUxk3+NoTkedOuK4XTL0iNPt83TmHAmhJBajSzlDXBA9otbup3iBDEBzsEjuyUIVBuZOK9rhasTngPH5MfS3Vk+Vm+33mCPYV1bXrLD0J36ifao1jOJSqJqeFtYAtgCGL8uKKcEiTZZ1fCWfCFx4RTyLDQx7EcBKgZZqBRM0A/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524936; c=relaxed/simple;
	bh=okck3br5hYlUvLvW+5zS8S+h0K8zkABaei8u39lUfJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YtSipk5hriivXdAkgf/YopQxvzfmJcPfCS7ku2OxWjuQ5pAxBjkY5824nSCOKNWLlLEQyqTdqS+MzQRSiHkPl8TftAVNC5Z1lDoMDCyxbA4qNFKDJV0Nn3lMSMJWarJ0n8fIKGIJKn3vgXjCOQpayqTc2IvFQ/QgvkEPzO5VNBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMWk+uKl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D22C4CEED;
	Mon, 14 Jul 2025 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524935;
	bh=okck3br5hYlUvLvW+5zS8S+h0K8zkABaei8u39lUfJc=;
	h=From:To:Cc:Subject:Date:From;
	b=AMWk+uKlk+90lCUNPK4Zgd/IzInIUOE379PyNidMY/XYSdR+dVdwekI7bHFcwzyNm
	 5lTmGoAbdaJ8Ayhjv69/x1+FFQXgDDSHRgtAGvSE+QFRcYTA9WSAKPzS858c3hDcug
	 pKH5QxusbyQCHJJv4aDR9eLJb12AR3dS5EHEl0TR1V7kiTBJ8ftyPL4CsHxciIXAgs
	 0unHwxjB6qirVirzrVYi8CzVktfGhIfP37DbsHV0OFAD21imDETzh3tuctykjh/zGY
	 OJqUfpgDHY9fgCQpul7w4999V17P+ijU0+aZ31tA7ZiNnb1kf2SlcDRaT7tor8olm+
	 zNSkC1Alx7xZw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema
Date: Mon, 14 Jul 2025 15:28:49 -0500
Message-ID: <20250714202850.3011952-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI Keystone DSP GPIO binding to DT schema format. The
"ti,syscon-dev" property was wrong and should be "gpio,syscon-dev"
instead.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/gpio-dsp-keystone.txt       | 39 -----------
 .../bindings/gpio/ti,keystone-dsp-gpio.yaml   | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt b/Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
deleted file mode 100644
index 0423699d74c7..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Keystone 2 DSP GPIO controller bindings
-
-HOST OS userland running on ARM can send interrupts to DSP cores using
-the DSP GPIO controller IP. It provides 28 IRQ signals per each DSP core.
-This is one of the component used by the IPC mechanism used on Keystone SOCs.
-
-For example TCI6638K2K SoC has 8 DSP GPIO controllers:
- - 8 for C66x CorePacx CPUs 0-7
-
-Keystone 2 DSP GPIO controller has specific features:
-- each GPIO can be configured only as output pin;
-- setting GPIO value to 1 causes IRQ generation on target DSP core;
-- reading pin value returns 0 - if IRQ was handled or 1 - IRQ is still
-  pending.
-
-Required Properties:
-- compatible: should be "ti,keystone-dsp-gpio"
-- ti,syscon-dev: phandle/offset pair. The phandle to syscon used to
-  access device state control registers and the offset of device's specific
-  registers within device state control registers range.
-- gpio-controller: Marks the device node as a gpio controller.
-- #gpio-cells: Should be 2.
-
-Please refer to gpio.txt in this directory for details of the common GPIO
-bindings used by client devices.
-
-Example:
-	dspgpio0: keystone_dsp_gpio@2620240 {
-		compatible = "ti,keystone-dsp-gpio";
-		ti,syscon-dev = <&devctrl 0x240>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	dsp0: dsp0 {
-		compatible = "linux,rproc-user";
-		...
-		kick-gpio = <&dspgpio0 27>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml b/Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
new file mode 100644
index 000000000000..59f81621408b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/ti,keystone-dsp-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Keystone 2 DSP GPIO controller
+
+maintainers:
+  - Grygorii Strashko <grygorii.strashko@ti.com>
+
+description: |
+  HOST OS userland running on ARM can send interrupts to DSP cores using
+  the DSP GPIO controller IP. It provides 28 IRQ signals per each DSP core.
+  This is one of the component used by the IPC mechanism used on Keystone SOCs.
+
+  For example TCI6638K2K SoC has 8 DSP GPIO controllers:
+   - 8 for C66x CorePacx CPUs 0-7
+
+  Keystone 2 DSP GPIO controller has specific features:
+  - each GPIO can be configured only as output pin;
+  - setting GPIO value to 1 causes IRQ generation on target DSP core;
+  - reading pin value returns 0 - if IRQ was handled or 1 - IRQ is still
+    pending.
+
+properties:
+  compatible:
+    const: ti,keystone-dsp-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio,syscon-dev:
+    description:
+      Phandle and offset of device's specific registers within the syscon state
+      control registers
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon
+          - description: register offset within state control registers
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio,syscon-dev
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@240 {
+        compatible = "ti,keystone-dsp-gpio";
+        reg = <0x240 0x4>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio,syscon-dev = <&devctrl 0x240>;
+    };
-- 
2.47.2


