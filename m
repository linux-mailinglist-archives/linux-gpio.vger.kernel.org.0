Return-Path: <linux-gpio+bounces-9635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B5969D83
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BCB01C20E90
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0B11D61B5;
	Tue,  3 Sep 2024 12:27:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADF51B12DE;
	Tue,  3 Sep 2024 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725366441; cv=none; b=jDE2r3rZVybvM5lcQg0yvcI4rFj9KOOAucdiaNQYUazdxRNB2u3ALKcAJEYeafYQHChgzh7ghKfncx8Wzt7lzGWUq5nwbq0WiIs5ah2m8w1KLPPdVdg62x+aNcS/ANpS6WFvB/q/5ZmSgVvWQKonY3jmNAbyis9dtYkRax8Jj4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725366441; c=relaxed/simple;
	bh=YBpT/3PqGgtZFSNBAnPeMlslzAclFshMpPrK579COGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jji3gMEYSUXHW8bxsfItMrVtEi9uPZbMQc1GHMq9yL5FYMzrSqOUe7s0ky83neJM/wNmwWIwiTwypa7faUwcl/ikGlZ7ocAz5cBJVRyb/JXN3T2R0Q4iW51tmsJ2j3i7fO1qyYKyGbUNxcVHFyXDf5k8C1a+Pu8bnR558AB/zEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 03 Sep 2024 12:26:44 +0000
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: spacemit: add support for K1
 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-02-k1-pinctrl-v4-1-d76c00a33b2b@gentoo.org>
References: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
In-Reply-To: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4339; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=YBpT/3PqGgtZFSNBAnPeMlslzAclFshMpPrK579COGU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm1wCUEbvr8+/5FNss5zfyKq9w+eMy/Cy5pBUXG
 k0glKkbII6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtcAlF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277avMD/9kig+JxRIVo9rUKW
 iusSVCLOzi4WUuog1YkjMPM9FbMVBNd5Yof3kbOYvbMM7GABrbQm28/4aZdnjvCQU6svRGIJ0YG
 uiL1qa43A+/EYZOWB+97KBDHathok9w3RziCBJPYtnL8T/+5iJSf695Pq33zK4S6TJd9vvcZF8g
 GfPwc052gF/FHUbG58SlzFr1FMzC9uzR2R841lV4ioEtRYHxSwEnpQSe3xchO6SoeAvbKazNpxS
 Y11hG46e/iCq/n3/o2o91Bh/RiTAhufhcuJ1EMfJxmVcTeb0+D0GE9ss9HfjmmRZgwrZt9AT25u
 cQZ7vcHdyTC6gkDnig10cMkH6Uk0ELe6LscuKxHtZlqkO6Xwx97oVGLzVv65XsFxKpXOaWFJqEj
 v92mOfW9AHflAiux/+dTdRM9H2V8UlJb4dXGp9SUfPRObqBkJn8s22cUWOioWNTV3ZL/5WjuaSY
 YzWtX9EvW4X4Z+kwhH4mBaR8PZUsOdbt2CYI4npL17bsv1CPeIMMaEXPDfskx1fTClWTWM2gctQ
 XBlub0bNF0Edp7Np2q5KpjzE+CwXC08g+8QAKIol0Jj7aQQCHyQi9ktE1TSKNuYWu16K+/YpaFO
 hYaXxWxezocWmnJdTHzXxxgLsm7ziXOiUrxlP/UZf1CSC0U2rruGV7pf0DSpaTJn78jg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v4:
- collect tags

Changes in v3:
- drop spacemit,slew-rate-{enable,disable} property
- use drive-strength instead of drive-strength-microamp
- fold strong-pull-up into bias-pull-up
- format fixed
- title fixed
---
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
new file mode 100644
index 0000000000000..b01ecd83b71b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC Pin Controller
+
+maintainers:
+  - Yixun Lan <dlan@gentoo.org>
+
+properties:
+  compatible:
+    const: spacemit,k1-pinctrl
+
+  reg:
+    items:
+      - description: pinctrl io memory base
+
+patternProperties:
+  '-cfg$':
+    type: object
+    additionalProperties: false
+
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    patternProperties:
+      '-pins$':
+        type: object
+        additionalProperties: false
+
+        description:
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias pull,
+          drive strength, input schmitt trigger, slew rate, power source.
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description:
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the K1_PADCONF macro to
+              construct the value.
+
+          bias-disable: true
+
+          bias-pull-down: true
+
+          bias-pull-up:
+            description: |
+              typical value for selecting bias pull up or strong pull up.
+              0: normal bias pull up
+              1: strong bias pull up
+            enum: [ 0, 1 ]
+
+          drive-strength:
+            description: |
+              typical current when output high level.
+              1.8V output: 11, 21, 32, 42 (mA)
+              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+
+          input-schmitt:
+            description: |
+              typical threshold for schmitt trigger.
+              0: buffer mode
+              1: trigger mode
+              2, 3: trigger mode
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          power-source:
+            description: external power supplies at 1.8v or 3.3v.
+            enum: [ 1800, 3300 ]
+
+          slew-rate:
+            description: |
+              slew rate for output buffer.
+              0: disable it
+              1: enable it (via bundled value from drive strength)
+              2: slow speed 0
+              3: slow speed 1
+              4: medium speed
+              5: fast speed
+            enum: [ 0, 1, 2, 3, 4, 5 ]
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
+    #define K1_PADCONF(pin, func) (((pin) << 16) | (func))
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl@d401e000 {
+            compatible = "spacemit,k1-pinctrl";
+            reg = <0x0 0xd401e000 0x0 0x400>;
+
+            uart0_2_cfg: uart0-2-cfg {
+                uart0-2-pins {
+                    pinmux = <K1_PADCONF(68, 2)>,
+                             <K1_PADCONF(69, 2)>;
+
+                    bias-pull-up = <0>;
+                    drive-strength = <32>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.45.2


