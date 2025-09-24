Return-Path: <linux-gpio+bounces-26562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5777B9C5CF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 00:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00CE7324032
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 22:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318C525F784;
	Wed, 24 Sep 2025 22:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIWdwdJP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09B27B4E8;
	Wed, 24 Sep 2025 22:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758753132; cv=none; b=C4rjnSRRGZtqY28HWjgYnKL93HiiqKu9lGaJIoKcOGC12B2Pvnhk9Iolk6FmDsmiH90VVb23LeaitAGsyfVMWBgMfIhL8eGGfaOFMzWgwv1VznNLG16flm+XRsC7H8YO0CvFpgJ5Jrzx53++FOyJwNeoyfJXWqKSYEJce/f7I8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758753132; c=relaxed/simple;
	bh=vcpmBitnTv4R56a3+OiUjc9+LnarzpY2vQKN626n8Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nwx8GoXHpmltnNhU9HxS0+Q8TpdcrhgPZAbY8WA7YKAoPdDH2iDFIh2ltaQ17YRM7a7mJXiucW7dDVv7rRKM2bg1h6MDENzrVw0cVv3Ad+3y/i5gZjeu3s/Wugckxao7kKr6piP4r7u+D3ZcUkPOZgdf6zYOaPN/ywXZ2hrHJaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIWdwdJP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F08C4CEE7;
	Wed, 24 Sep 2025 22:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758753131;
	bh=vcpmBitnTv4R56a3+OiUjc9+LnarzpY2vQKN626n8Q4=;
	h=From:To:Cc:Subject:Date:From;
	b=KIWdwdJPwVGAKFCfudJKON7MSkfhTu5Aiz7A/Qc0URzC6h09VTd/FujOGd7hIoF6A
	 pOsbNhX50YBKh6K4p8jPx0veUPiTlFuDlZPA24IUMlsTEwQ+wjsCRDB8KE2atOhvwE
	 jSAf6p8xV09QrNnYB21+lTHQZRMN7U+KJFkwmJrKHWniDRPTIyR0nU0xl4JEY+lf2U
	 3pDR+BtohhltrXohDVaRluJkWjOVZkDb/BwYbk0mC1q5mzHw6SOJi+pp6gFEAkIVa6
	 VflDDV8AUCuBLJDF928wkJNA6xkyNIy4hnNcK5id1dvm4ue4KXHkQD0TRvC7pZ+BzU
	 GMZx9swc91hBw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert Marvell Berlin pinctrl to DT schema
Date: Wed, 24 Sep 2025 17:31:59 -0500
Message-ID: <20250924223201.2952988-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell/Synaptics Berlin pinctrl binding to DT schema
format. The "reg" property was not documented for the newer SoCs.
Otherwise, it's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
With this Berlin is warning free on arm64.
---
 .../bindings/pinctrl/berlin,pinctrl.txt       | 47 ----------
 .../pinctrl/marvell,berlin2-soc-pinctrl.yaml  | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
deleted file mode 100644
index 0a2d5516e1f3..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Pin-controller driver for the Marvell Berlin SoCs
-
-Pin control registers are part of both chip controller and system
-controller register sets. Pin controller nodes should be a sub-node of
-either the chip controller or system controller node. The pins
-controlled are organized in groups, so no actual pin information is
-needed.
-
-A pin-controller node should contain subnodes representing the pin group
-configurations, one per function. Each subnode has the group name and
-the muxing function used.
-
-Be aware the Marvell Berlin datasheets use the keyword 'mode' for what
-is called a 'function' in the pin-controller subsystem.
-
-Required properties:
-- compatible: should be one of:
-	"marvell,berlin2-soc-pinctrl",
-	"marvell,berlin2-system-pinctrl",
-	"marvell,berlin2cd-soc-pinctrl",
-	"marvell,berlin2cd-system-pinctrl",
-	"marvell,berlin2q-soc-pinctrl",
-	"marvell,berlin2q-system-pinctrl",
-	"marvell,berlin4ct-avio-pinctrl",
-	"marvell,berlin4ct-soc-pinctrl",
-	"marvell,berlin4ct-system-pinctrl",
-	"syna,as370-soc-pinctrl"
-
-Required subnode-properties:
-- groups: a list of strings describing the group names.
-- function: a string describing the function used to mux the groups.
-
-Example:
-
-sys_pinctrl: pin-controller {
-	compatible = "marvell,berlin2q-system-pinctrl";
-
-	uart0_pmux: uart0-pmux {
-		groups = "GSM12";
-		function = "uart0";
-	};
-};
-
-&uart0 {
-	pinctrl-0 = <&uart0_pmux>;
-	pinctrl-names = "default";
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
new file mode 100644
index 000000000000..6ace3bf5433b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/marvell,berlin2-soc-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Berlin pin-controller driver
+
+maintainers:
+  - Antoine Tenart <atenart@kernel.org>
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description: >
+  Pin control registers are part of both chip controller and system controller
+  register sets. Pin controller nodes should be a sub-node of either the chip
+  controller or system controller node. The pins controlled are organized in
+  groups, so no actual pin information is needed.
+
+  A pin-controller node should contain subnodes representing the pin group
+  configurations, one per function. Each subnode has the group name and the
+  muxing function used.
+
+  Be aware the Marvell Berlin datasheets use the keyword 'mode' for what is
+  called a 'function' in the pin-controller subsystem.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - marvell,berlin2-soc-pinctrl
+          - marvell,berlin2-system-pinctrl
+          - marvell,berlin2cd-soc-pinctrl
+          - marvell,berlin2cd-system-pinctrl
+          - marvell,berlin2q-soc-pinctrl
+          - marvell,berlin2q-system-pinctrl
+          - marvell,berlin4ct-avio-pinctrl
+          - marvell,berlin4ct-soc-pinctrl
+          - marvell,berlin4ct-system-pinctrl
+          - syna,as370-soc-pinctrl
+
+  reg:
+    maxItems: 1
+
+additionalProperties:
+  description: Pin group configuration subnodes.
+  type: object
+  $ref: /schemas/pinctrl/pinmux-node.yaml#
+  additionalProperties: false
+
+  properties:
+    groups:
+      description: List of pin group names.
+      $ref: /schemas/types.yaml#/definitions/string-array
+
+    function:
+      description: Function used to mux the group.
+      $ref: /schemas/types.yaml#/definitions/string
+
+  required:
+    - groups
+    - function
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,berlin4ct-avio-pinctrl
+              - marvell,berlin4ct-soc-pinctrl
+              - marvell,berlin4ct-system-pinctrl
+              - syna,as370-soc-pinctrl
+    then:
+      required:
+        - reg
+
+examples:
+  - |
+    pinctrl {
+        compatible = "marvell,berlin2q-system-pinctrl";
+
+        uart0-pmux {
+            groups = "GSM12";
+            function = "uart0";
+        };
+    };
-- 
2.51.0


