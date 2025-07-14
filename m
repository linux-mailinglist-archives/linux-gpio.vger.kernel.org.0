Return-Path: <linux-gpio+bounces-23240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22FB0487C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C962316C502
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F4C2797B7;
	Mon, 14 Jul 2025 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iU1Uy7NW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D279023ABA8;
	Mon, 14 Jul 2025 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524919; cv=none; b=qAXuN62fjKczZssiYsVNuJpc4jAimzb7BXwzWKHk3zVVVAa2gMnh2RCp4AhSOvaVWP8U2T0oB3n8pZ6FFvJOyoFHkHubwOEuaIzVqoGnJqVj22Qjv/8Xk/dJ/dBkKMo/w4V1oR2RSE8nwNnOdhYXfC4Vi9aqeqB8rl4pErGKGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524919; c=relaxed/simple;
	bh=Z+1vBGIGj0UhprWbljKkU0ULACoyzUTvSBRWeU+Ua1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=th14WgoZv/2YaVPlm76kuZ4CGo1H+obmqsojNbp/UZgwNtBn4TIlzIScpDgP/kHclqfXTXy9CPex5TSYtnNHL/68/pWJUIELSh/JyqEjqvC0zZjcfgFh8K8OvZNaLYZ1LHK2mcG/m1ANjuLLyaJ69oti5I/ICmXz0gNn6XwJlmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iU1Uy7NW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565A3C4CEED;
	Mon, 14 Jul 2025 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524919;
	bh=Z+1vBGIGj0UhprWbljKkU0ULACoyzUTvSBRWeU+Ua1k=;
	h=From:To:Cc:Subject:Date:From;
	b=iU1Uy7NWKaWoZKB+7b4YELCkHw6/Rme3lQG7Jfsa9X4eju7DqDso1FPX0X6p3QBmC
	 VJxmclyzSQ2CH4yOxnRaumvel8bjnlsrfNG9CKBu/QAJDUWuTvDsEib7/PtnwFSjsP
	 ZxaSzjsNhr702xmg93gJEugT6wOhhs3Q4iY4qqvXtxISSZ/dc9ki8iJ0ihqoc5eUph
	 Crk47BE0XoZz91cEvWAFL2nwxVC7BlwnDsgsxF7GHHkEhrncRZn1g0yQJofUAlIl3z
	 rrB2txZE+oP17RZGTr4Az4UFN+R2ndP6dp104g8e6QV8eGxqCKKdFkaDF5VbCwJ3Bl
	 +YFUZYGqp4DgA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Crispin <john@phrozen.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert lantiq,gpio-mm-lantiq to DT schema
Date: Mon, 14 Jul 2025 15:28:35 -0500
Message-ID: <20250714202837.3011521-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Lantiq SoC External Bus memory mapped GPIO binding to DT
schema format. It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/gpio-mm-lantiq.txt          | 38 -------------
 .../bindings/gpio/lantiq,gpio-mm-lantiq.yaml  | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mm-lantiq.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/lantiq,gpio-mm-lantiq.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mm-lantiq.txt b/Documentation/devicetree/bindings/gpio/gpio-mm-lantiq.txt
deleted file mode 100644
index f93d51478d5a..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-mm-lantiq.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Lantiq SoC External Bus memory mapped GPIO controller
-
-By attaching hardware latches to the EBU it is possible to create output
-only gpios. This driver configures a special memory address, which when
-written to outputs 16 bit to the latches.
-
-The node describing the memory mapped GPIOs needs to be a child of the node
-describing the "lantiq,localbus".
-
-Required properties:
-- compatible : Should be "lantiq,gpio-mm-lantiq"
-- reg : Address and length of the register set for the device
-- #gpio-cells : Should be two.  The first cell is the pin number and
-  the second cell is used to specify optional parameters (currently
-  unused).
-- gpio-controller : Marks the device node as a gpio controller.
-
-Optional properties:
-- lantiq,shadow : The default value that we shall assume as already set on the
-  shift register cascade.
-
-Example:
-
-localbus@0 {
-	#address-cells = <2>;
-	#size-cells = <1>;
-	ranges = <0 0 0x0 0x3ffffff /* addrsel0 */
-		1 0 0x4000000 0x4000010>; /* addsel1 */
-	compatible = "lantiq,localbus", "simple-bus";
-
-	gpio_mm0: gpio@4000000 {
-		compatible = "lantiq,gpio-mm";
-		reg = <1 0x0 0x10>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		lantiq,shadow = <0x77f>
-	};
-}
diff --git a/Documentation/devicetree/bindings/gpio/lantiq,gpio-mm-lantiq.yaml b/Documentation/devicetree/bindings/gpio/lantiq,gpio-mm-lantiq.yaml
new file mode 100644
index 000000000000..eaf53a89542a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/lantiq,gpio-mm-lantiq.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/lantiq,gpio-mm-lantiq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq SoC External Bus memory mapped GPIO controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+description: |
+  By attaching hardware latches to the EBU it is possible to create output
+  only gpios. This driver configures a special memory address, which when
+  written to outputs 16 bit to the latches.
+
+  The node describing the memory mapped GPIOs needs to be a child of the node
+  describing the "lantiq,localbus".
+
+properties:
+  compatible:
+    enum:
+      - lantiq,gpio-mm-lantiq
+      - lantiq,gpio-mm
+
+  reg:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  lantiq,shadow:
+    description: The default value that we shall assume as already set on the shift register cascade.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - '#gpio-cells'
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@4000000 {
+        compatible = "lantiq,gpio-mm-lantiq";
+        reg = <0x4000000 0x10>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        lantiq,shadow = <0x77f>;
+    };
-- 
2.47.2


