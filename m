Return-Path: <linux-gpio+bounces-25974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76DB5376D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 17:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 266FE188C9D6
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFBF3568EE;
	Thu, 11 Sep 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="QWNIuSZ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1888F34AAE3;
	Thu, 11 Sep 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603727; cv=pass; b=DW+5dALheNxSPaKecmv9pQrnaHB+LuK5yr85A6O6O/5XDbfcUhD/D8HJ29OmTpxKCN0ZhXxyPG1sQiJaUZPXiaiad4pO185P2JaFLfi+5l5BR4Ckx9eL0GU2euo/FMtp+Cj+junIJiBoB9wmhFTdzyOxQcpsQPKZYC1op4IHvXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603727; c=relaxed/simple;
	bh=3+SFg0S/NlY86M2aM3nLCt8edb3Q+z+EhIf4KSr9U3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyiAk6IG3qNrEPZK508jZ6OizXKrzPNn4Z2Gh4PC+yJrbTexPZcuh+YDerC3xkPdbb1EW4yyH2qOhXb11iYszVs6jHByqHVLgl1qwnA77MO7fSJ0rBRLoXztIVU5HHTEB1LSclv+YpMdgl0FZy1MVpc0etLiYXmHvmXjOj81+Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=QWNIuSZ/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757603671; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e+IvQJveE0D/NryFztk115aoVC0awDaoQqJr8rkbRsRQJIOhFM4IyOEBcKUaiRaGAwd+NIF3O/chVnIukEXiVAHEV+G6GRESmKozYdWD/VNUs6sTaIx8+XIZrlHZXBR4YhWec+A8uxq/YjI6ywKINBXh/s40yiffmuNEOciTdkc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603671; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UiGFEztwajuMfRUT3GriPKEySRok+K21Z8cbZsV3sZU=; 
	b=Du3ha77bu6sVlh+w5ESM91XMO8r+ri8HQn+Eu9de/+8y1BULt5RM49Ec7iL5P++SHFP/qY7tO9qkNb2UrlUIn7XBPX9EHSbPI1gwJsPUGzeu/Ttwz0zxQDOId3tf6aY1sX8gitXhvIwoUE7QbYAwSO5iJlg9KKKdTI0wG+eSjAo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603671;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UiGFEztwajuMfRUT3GriPKEySRok+K21Z8cbZsV3sZU=;
	b=QWNIuSZ/k4lgmBajDEds6zQGZh6bZ9ozj2kZz8nUUqJebkcmW056IYBhq7Hl4rqj
	iKt8TpsM8JmzPJW6LX83aCpc9z8AnO+tc0NHkZNk/2gAIpP505OfWOC+uFN2AKVLKHd
	CSmWvjQqmuF8TgAE1DMblyxNsrjbCvnJo8yCKOkQ=
Received: by mx.zohomail.com with SMTPS id 1757603670323995.4591080877603;
	Thu, 11 Sep 2025 08:14:30 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
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
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 09/12] dt-bindings: regulator: Convert Dialog DA9211 Regulators to DT schema
Date: Thu, 11 Sep 2025 12:09:58 -0300
Message-ID: <20250911151001.108744-10-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
Voltage Regulators family to a DT schema. Examples are simplified, as these
are all equal.

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
index 0000000000000..9d5e25bc3872c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:
+  Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
+  Voltage Regulator
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - dlg,da9211
+      - dlg,da9212
+      - dlg,da9213
+      - dlg,da9214
+      - dlg,da9215
+      - dlg,da9223
+      - dlg,da9224
+      - dlg,da9225
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
+    description:
+      List of regulators provided by the device
+
+    patternProperties:
+      "^BUCK([AB])$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+        description: |
+          Properties for a single BUCK regulator
+
+        properties:
+          regulator-initial-mode:
+            items:
+              enum: [ 1, 2, 3 ]
+            description: |
+              Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
+
+          regulator-allowed-modes:
+            items:
+              enum: [ 1, 2, 3 ]
+            description: |
+              Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
+
+          enable-gpios:
+            maxItems: 1
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@68 {
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


