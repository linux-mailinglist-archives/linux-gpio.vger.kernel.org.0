Return-Path: <linux-gpio+bounces-11393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9976F99FD9C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 03:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5501B2813A6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 01:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9874146013;
	Wed, 16 Oct 2024 01:00:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2819D158522;
	Wed, 16 Oct 2024 01:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729040417; cv=none; b=jlW/+A3GzBsWXDgLhwSOLVmT7K9HgzSHy4pikBSiQ+GLIMOo8hd83ZlHgGT+8PwbYTB/TGG2BpIbve65eLLMfeZvLGWgy0RwrEzl7rJ0FDkyWEBLZ0aYtTCVUYWZLoa8Drj6Vdrs7bE/MJhb0hIjFPKHIvkKJW+9FFFHEHrHMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729040417; c=relaxed/simple;
	bh=qyH8+zwtfupiOe/jy/SZs2UIFz14M9UjXCHZWD/dI4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VknFbXyjJjH1bDZucQaV73bTOpgx9KeVPHE3Qf0iSgY9kJ/ouiBUDWk9cQtSizwylpBQg3YC0LEIoj+JsGWUo1IKXWtQrbUAjOtOdiGWFpze04mg+v8cHf/WraBy9B33t6ulva7Ar6kRHENYEOvbGLf0/V+8CsN6VpVh8QN7wm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 16 Oct 2024 08:59:41 +0800
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: spacemit: add support for K1
 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-02-k1-pinctrl-v5-1-03d395222e4f@gentoo.org>
References: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
In-Reply-To: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jesse Taube <mr.bossman075@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4424; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=qyH8+zwtfupiOe/jy/SZs2UIFz14M9UjXCHZWD/dI4A=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnDxAN9BemnpUR2VOjyi4ScO4yFh4f2+ztYGoO1
 0PCiVwEEOqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZw8QDV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TQBD/0TPxQCPkEfWkEhUR
 88GOihluvrChv0PpKX581f0RvpsLATDDwYgx107RGpfJ347spOL8TD9MebQ9K0F3ye0kU2+xNZ9
 Y+S5f/B0zKiqvh73x1KuBeOPIdZiaTYpceLsJ1ulYTXLcclUWma/+cqX4MZ31YffU0MiB/Qk9WU
 R3BN9uhBdArweZC/bZPc9uq8sXoMkkwCcR7NYcTPC95WSHgFhVKtZuoovz4aoK89PZFN89r+MGt
 bFCkKqyV2GbShf0bSdHY6mMlx2VzpjBu9xKHbLW5HF8aLL7dzvaleCNKVrkVMbAJeyiMiWAqUB5
 319440KCkiscKgq7+XgnwCgiv1EOtuu91upVPEtGFeW1x4Ddxh8vv1b54f0mPQLPVfK5iRv/GoU
 R+Iy6XR9ncyDoWIyHm1AUakDYE56TG3UlSGlA14J7jlGddjzDiH5bzVAMg2G8qQdRRoPW1wTlC6
 +ry78GGDvKYw8xUlDuojkdRTZn7nK4hPWa9Ov/21VWbCFGxStdKDWbwwbyJ0bq9y7EchtYrlVLq
 ZFzGB5fHMkmUsRsWEdvjHZzQhekv82fNa0WPsGgW9BeH0NJ5pZ+Cg0n9yyWMwUUokQk97JB0eGf
 mwnNyCBkbTYQqXVKX1V/LjK9pxf5TyVbgNg2HLcndKBxITfSe8gM863hiwunX9+o49ww==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v5:
- no change

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
index 0000000000000000000000000000000000000000..b01ecd83b71b5e9f47256adde23bc8b183bef05e
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
2.47.0


