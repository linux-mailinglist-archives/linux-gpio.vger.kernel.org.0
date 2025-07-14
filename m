Return-Path: <linux-gpio+bounces-23245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780EB04898
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83E2D3BF58B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504C0288C2B;
	Mon, 14 Jul 2025 20:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fImV1jmU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C8239E64;
	Mon, 14 Jul 2025 20:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524964; cv=none; b=ZVnF5Hup+g7Oe/1RiZwzEJTWuoEI4XAWw/CzoRb4OfX8ZYIi/SKwzKN3KyGCqyJOFWfrLFPSSXwDhoUz+TmPFlLwWZCeutMv/Su5xK9urDZliyv2j62i4jqAshi+t8CPrxU3oAwiw1DbJ9mj7q5aCYrUti53dEVcofRYDgSxFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524964; c=relaxed/simple;
	bh=JoEuCqYsOaoXzsJadCoQHfUyFtYoher338cP+XTWi4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pe6VLOE5VrSam5AWkAUxMZJYWmbtYy9NR6B7Hnu2UH+kNwzTmwSoioJX7bpuo/xuK/Fn8rI1pMscGzBhaBjpp+ctTLWYsMsWO5d0465tZIL3n9Qlgm1VcHSAvvAzNwdr9O1fPE+edJenj9f9LFnFzRZlvaZa87jAHAaciBUa/14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fImV1jmU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA6AC4CEED;
	Mon, 14 Jul 2025 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524963;
	bh=JoEuCqYsOaoXzsJadCoQHfUyFtYoher338cP+XTWi4k=;
	h=From:To:Cc:Subject:Date:From;
	b=fImV1jmUW4HTjb8VzTxKeJK4ITww3dYRXfLGQjodvr3ysp8pPGNAReV4tUGxpeAdE
	 0w9XL9o8qHTSgSNhlH1/3qv/isEG9hRL7jIkWPWDpqCANKfklRfAAjy6CvOnw2JCYQ
	 Jy7ureo2Fhb41boT3tv2SLPzoUo/pmz+v9AdZTnhHHFpYSEJGp8RgbZwFuCG9eGUoI
	 /jlYyBZi+rdWeJ0xBgnStw0thdAl7oyawhyOhrx3oseLmKLVVUn6O5/9TfSvAgYlpI
	 IJ4zoFPdtZwJ+rZq2/bjLfdwzJYRkhJz56F7mdYOUAqdE3aAytrQo2Jw2FmvMxTq5U
	 rB67qtcteskQA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert cirrus,clps711x-mctrl-gpio to DT schema
Date: Mon, 14 Jul 2025 15:29:17 -0500
Message-ID: <20250714202919.3012764-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the cirrus,clps711x-mctrl-gpio binding to DT schema format.
Add the missing "gpio,syscon-dev" phandle property.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../gpio/cirrus,clps711x-mctrl-gpio.txt       | 17 -------
 .../gpio/cirrus,clps711x-mctrl-gpio.yaml      | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.txt b/Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.txt
deleted file mode 100644
index fd42e7280f72..000000000000
--- a/Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* ARM Cirrus Logic CLPS711X SYSFLG1 MCTRL GPIOs
-
-Required properties:
-- compatible: Should contain "cirrus,ep7209-mctrl-gpio".
-- gpio-controller: Marks the device node as a gpio controller.
-- #gpio-cells: Should be two. The first cell is the pin number and
-  the second cell is used to specify the gpio polarity:
-    0 = Active high,
-    1 = Active low.
-
-Example:
-	sysgpio: sysgpio {
-		compatible = "cirrus,ep7312-mctrl-gpio",
-			     "cirrus,ep7209-mctrl-gpio";
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.yaml b/Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.yaml
new file mode 100644
index 000000000000..bdffca817f1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cirrus,clps711x-mctrl-gpio.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cirrus,clps711x-mctrl-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Cirrus Logic CLPS711X SYSFLG1 MCTRL GPIOs
+
+maintainers:
+  - Alexander Shiyan <shc_work@mail.ru>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: cirrus,ep7312-mctrl-gpio
+          - const: cirrus,ep7209-mctrl-gpio
+      - const: cirrus,ep7209-mctrl-gpio
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
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    sysgpio: sysgpio {
+        compatible = "cirrus,ep7312-mctrl-gpio",
+                     "cirrus,ep7209-mctrl-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.47.2


