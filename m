Return-Path: <linux-gpio+bounces-24669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA8FB2E374
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79C5A24BF4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E79433A022;
	Wed, 20 Aug 2025 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="NnIXmD3O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2578183CA6;
	Wed, 20 Aug 2025 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710246; cv=pass; b=Vlcd9JqEiHuMxWmLXCnQvEdAac5+n0Cjw4IKQ0saoaafwRtOZo/lOn8jyQlNzO/25iwy3vIJ5EtwrulCbhRNINpZnkvrV/FpLr7f1AdDVOKq1bS8xKBFZWcpoNW7j9dbCcYmkR7A5/HJiSYmDbm4swIbmggFK0ii+yEPZkagaok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710246; c=relaxed/simple;
	bh=28FoQf8cQse+YmM8bBwL6sx2pfXpz5oZ4iXd2vRXwQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kf53RhCkPIrJU8v7TNNqDBehFbKg5DAaeNDpWH3WeotF3ggCyeERxVIwUvhSZYcl47bgqsU4K30o+yXVIOZr3eURCgmXxm9P4MRAnKYnEgsgQVLkchIb4b5NsAL7HWSKH96lmnEB4m4nx1XQAmBqbyVrAFyEKR8Z1Kvby9/wD7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=NnIXmD3O; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kDLvwleaj883Cc+IOf/PW45nKxmOpw7FuppG8i0Prj5cvfL4kHuRh+UDW/wunz3j70rCneb6y2ysMUooD89JVY9IBQibD/YubrRqa48NSA+8kTw9n2lvDd0qMDcZMKD2AZedsiQz4BxzLfOGFm1EXU+fRZEbofBgKo6umQCFKik=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710187; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1zuf/x0egV55fv1vWyBb+AzWEsuddlFQ6GFnZVxpJ9g=; 
	b=TPL8yXuDIY/k0bSxRVY3lNUqbhD9/y7Id/K+OUU0WiArnIjigrgoNRZ6DB/CIZKrN0N1nIyvSqsDmhGUFgCn8NHMzCHBuzD6r/k2aCqUazRcaICqrokLsS9kkqUZyZ3/gqou9IPhaQvCimqJJl4YjnNX7TWvSaHgefXmIQYaBCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710187;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1zuf/x0egV55fv1vWyBb+AzWEsuddlFQ6GFnZVxpJ9g=;
	b=NnIXmD3OV7f8YZKLt1Uapf8Af9w/UdwvnnjPrjllr+Mv+BqmlmpxtkNjs63jppfL
	znM6/Aw9GjPSNdhmDzzQ2uop/9r6iipiqDQpF3hhw0QwXhfiMWe6X8sEl3dkLl003SM
	f2LFmD4tSbU7uwU6zWOwmorwqaB7uxpSH+fDG6O0=
Received: by mx.zohomail.com with SMTPS id 1755710186878582.0450674165439;
	Wed, 20 Aug 2025 10:16:26 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	jmassot@collabora.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v1 10/14] regulator: dt-bindings: Convert Dialog Semiconductor DA9211 Regulators to YAML
Date: Wed, 20 Aug 2025 14:12:58 -0300
Message-ID: <20250820171302.324142-11-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
Voltage Regulators family to a YAML schema. Examples are simplified, as
these are all equal.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
 .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
 2 files changed, 104 insertions(+), 205 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml

diff --git a/Documentation/devicetree/bindings/regulator/da9211.txt b/Documentation/devicetree/bindings/regulator/da9211.txt
deleted file mode 100644
index eb871447d5082..0000000000000
--- a/Documentation/devicetree/bindings/regulator/da9211.txt
+++ /dev/null
@@ -1,205 +0,0 @@
-* Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
- Voltage Regulator
-
-Required properties:
-- compatible: "dlg,da9211" or "dlg,da9212" or "dlg,da9213" or "dlg,da9223"
-  or "dlg,da9214" or "dlg,da9224" or "dlg,da9215" or "dlg,da9225"
-- reg: I2C slave address, usually 0x68.
-- interrupts: the interrupt outputs of the controller
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name, with valid
-  values listed below. The content of each sub-node is defined by the
-  standard binding for regulators; see regulator.txt.
-  BUCKA and BUCKB.
-
-Optional properties:
-- enable-gpios: platform gpio for control of BUCKA/BUCKB.
-- Any optional property defined in regulator.txt
-  - regulator-initial-mode and regulator-allowed-modes may be specified using
-    mode values from dt-bindings/regulator/dlg,da9211-regulator.h
-
-Example 1) DA9211
-	pmic: da9211@68 {
-		compatible = "dlg,da9211";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <2000000>;
-				regulator-max-microamp 	= <5000000>;
-				enable-gpios = <&gpio 27 0>;
-				regulator-allowed-modes = <DA9211_BUCK_MODE_SYNC
-							   DA9211_BUCK_MODE_AUTO>;
-			};
-		};
-	};
-
-Example 2) DA9212
-	pmic: da9212@68 {
-		compatible = "dlg,da9212";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <2000000>;
-				regulator-max-microamp 	= <5000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <2000000>;
-				regulator-max-microamp 	= <5000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
-
-Example 3) DA9213
-	pmic: da9213@68 {
-		compatible = "dlg,da9213";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-		};
-	};
-
-Example 4) DA9223
-	pmic: da9223@68 {
-		compatible = "dlg,da9223";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-		};
-	};
-
-Example 5) DA9214
-	pmic: da9214@68 {
-		compatible = "dlg,da9214";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
-
-Example 6) DA9224
-	pmic: da9224@68 {
-		compatible = "dlg,da9224";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <3000000>;
-				regulator-max-microamp 	= <6000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
-
-Example 7) DA9215
-	pmic: da9215@68 {
-		compatible = "dlg,da9215";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <4000000>;
-				regulator-max-microamp 	= <7000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <4000000>;
-				regulator-max-microamp 	= <7000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
-
-Example 8) DA9225
-	pmic: da9225@68 {
-		compatible = "dlg,da9225";
-		reg = <0x68>;
-		interrupts = <3 27>;
-
-		regulators {
-			BUCKA {
-				regulator-name = "VBUCKA";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <4000000>;
-				regulator-max-microamp 	= <7000000>;
-				enable-gpios = <&gpio 27 0>;
-			};
-			BUCKB {
-				regulator-name = "VBUCKB";
-				regulator-min-microvolt = < 300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp 	= <4000000>;
-				regulator-max-microamp 	= <7000000>;
-				enable-gpios = <&gpio 17 0>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml b/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
new file mode 100644
index 0000000000000..d4c5b354497f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: |
+  Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
+  Voltage Regulator
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - "dlg,da9211"
+      - "dlg,da9212"
+      - "dlg,da9213"
+      - "dlg,da9223"
+      - "dlg,da9214"
+      - "dlg,da9224"
+      - "dlg,da9215"
+      - "dlg,da9225"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description: |
+      List of regulators provided by the device
+
+    patternProperties:
+      "^BUCK([A-B])$":
+        type: object
+        $ref: regulator.yaml#
+        description: |
+          Properties for a single BUCK regulator
+
+        properties:
+          regulator-initial-mode:
+            items:
+              enum: [ 1, 2, 3 ]
+            description: Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
+
+          regulator-allowed-modes:
+            items:
+              enum: [ 1, 2, 3 ]
+            description: Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
+
+          enable-gpios:
+            maxItems: 1
+            description: Specify a valid GPIO for platform control of the regulator
+
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/regulator/dlg,da9211-regulator.h>
+
+    i2c1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        da9212: da9212@68 {
+            compatible = "dlg,da9212";
+            reg = <0x68>;
+            interrupts = <3 27>;
+
+            regulators {
+                BUCKA {
+                    regulator-name = "VBUCKA";
+                    regulator-min-microvolt = < 300000>;
+                    regulator-max-microvolt = <1570000>;
+                    regulator-min-microamp = <2000000>;
+                    regulator-max-microamp = <5000000>;
+                    enable-gpios = <&gpio 27 0>;
+                };
+                BUCKB {
+                    regulator-name = "VBUCKB";
+                    regulator-min-microvolt = < 300000>;
+                    regulator-max-microvolt = <1570000>;
+                    regulator-min-microamp = <2000000>;
+                    regulator-max-microamp = <5000000>;
+                    enable-gpios = <&gpio 17 0>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.50.1


