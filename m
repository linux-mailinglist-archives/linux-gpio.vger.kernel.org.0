Return-Path: <linux-gpio+bounces-9126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD895E37E
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 15:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D25C11C20AC7
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 13:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7034B155749;
	Sun, 25 Aug 2024 13:10:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B775C29CEF;
	Sun, 25 Aug 2024 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591448; cv=none; b=esXvnZu3A/NANVEpPlZsq2lQPZoO+wa6FDFlaztu+mqhf6U3GtGxrsskttsw+7h8lQqKr124TeNJZXnbJ8pMdJIK4Prn30JdOlyGVTYiPTkki4PHNS8CAEjWry1pgrU7J/xMLlS8i4yyX4oyi7X0G4/cNzTkwrn3wqDInxudVGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591448; c=relaxed/simple;
	bh=tMlxbxzrZ33L0J3m+f7FpNcnNTZV3ALL4Cj5L+NgLME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRSu1fIsjiTPCH7Jvp7z3p5kGB2Bj7HmKNlppx3N9fTBDc9Z1F93pZSi7p9d9+2iAAwvSzP0ymPD+WFz9JQBSBopG/xk+0Pibc46gIMw+8/A9qMcG39D+JGNHM0zHmptFe/lyAkMDwe1sKvlYnr4G8MQfYQnlWGDiyAlmpJiNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 25 Aug 2024 13:10:02 +0000
Subject: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for K1
 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
In-Reply-To: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9863; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=tMlxbxzrZ33L0J3m+f7FpNcnNTZV3ALL4Cj5L+NgLME=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmyy1B6vWApnfTvGMYYkxTVxldkL13AJfRFwOI2
 LKm63to8/+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZsstQV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277S/YD/9Q+Z1r2wxaaIhiGE
 w3rBQUoQU4yPhEJa/iCqz5ct2WtBaL/OHd90jxhZ8rJIS9YBfLF4CwtQo9WJAgzrqN5HHg3FNfR
 0dOzziBzwiRFbF3ZDTxtXhp5G1l3MmU1xT5zy7D5cylCgyR7DhS2uUzuFeSaVNlx7wk0hjYdTZ7
 vYUHrbw3uRrKgbLvrjxB70Bm6mx5bV13HB9AhQVKPR8aWq4D753n2cX7v1/B85MUg3R1/jZ6w2v
 jnBy3GLeSWr8VP5CVuUsqDsx8r7CZcv/VMdrD8IPlOGvJKBv/TnzSzrr7nPthasIB6hFo+wB2Z8
 rcG3ODUyQM/i++MUs1m8ZLwP+NLQiUnXPZuWZsqbX+Awyyp0wfqOBHnwcsjM+HFgJGQhhQSjcbn
 bZGnDRkSCwzQoAhOcTRrLqh2yDaxsakb5ETVf8cydH/J8H4BczEcLzyOlxXhVUbMvboHVbPTZvM
 jGMTkWj+rzQHqx4xlKN+eDlLDAmoGFA6mzSy4VJE51Y/nXLUQuuRj2L9RQmOh4Xu8k0Y92hoL+E
 YKWAVJiE5acE9ulMBQlqXaWvdOqFw8TBAAWei8a16eN4oGKNdIh7kZUYIjU4MuA3mWnuyW92qR3
 4SV4IqFtDpIdKv+3j+gULoth27/qySpVhbg0N0I9qwStQp3NXGP+Me/MaybQfgBwRzVA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.

Two vendor specific properties are introduced here, As the pinctrl
has dedicated slew rate enable control - bit[7], so we have
spacemit,slew-rate-{enable,disable} for this. For the same reason,
creating spacemit,strong-pull-up for the strong pull up control.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 134 +++++++++++++++++
 include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  | 161 +++++++++++++++++++++
 2 files changed, 295 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
new file mode 100644
index 0000000000000..8adfc5ebbce37
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -0,0 +1,134 @@
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
+    description: |
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias, input
+          enable/disable, input schmitt trigger, slew-rate enable/disable,
+          slew-rate, drive strength, power source.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the K1_PADCONF macro to
+              construct the value.
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength-microamp:
+            description: |
+              typical current when output high level, but in mA.
+              1.8V output: 11, 21, 32, 42 (mA)
+              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          input-schmitt:
+            description: |
+              typical threshold for schmitt trigger.
+              0: buffer mode
+              1: trigger mode
+              2, 3: trigger mode
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          power-source:
+            description: external power supplies at 1.8v or 3.3v.
+            enum: [ 1800, 3300 ]
+
+          slew-rate:
+            description: |
+              slew rate for output buffer
+              0, 1: Slow speed
+              2: Medium speed
+              3: Fast speed
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          spacemit,slew-rate-enable:
+            description: enable slew rate.
+            type: boolean
+
+          spacemit,slew-rate-disable:
+            description: disable slew rate.
+            type: boolean
+
+          spacemit,strong-pull-up:
+            description: enable strong pull up.
+            type: boolean
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl@d401e000 {
+            compatible = "spacemit,k1-pinctrl";
+            reg = <0x0 0xd401e000 0x0 0x400>;
+            #pinctrl-cells = <2>;
+            #gpio-range-cells = <3>;
+
+            uart0_2_cfg: uart0-2-cfg {
+                uart0-2-pins {
+                    pinmux = <K1_PADCONF(GPIO_68, 2)>,
+                             <K1_PADCONF(GPIO_69, 2)>;
+                    bias-pull-up;
+                    drive-strength-microamp = <32>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
new file mode 100644
index 0000000000000..13ef4aa6c53a3
--- /dev/null
+++ b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2022-2024 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ *
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_K1_H
+#define _DT_BINDINGS_PINCTRL_K1_H
+
+#define PINMUX(pin, mux) \
+	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
+
+/* pin offset */
+#define PINID(x)	((x) + 1)
+
+#define GPIO_INVAL  0
+#define GPIO_00     PINID(0)
+#define GPIO_01     PINID(1)
+#define GPIO_02     PINID(2)
+#define GPIO_03     PINID(3)
+#define GPIO_04     PINID(4)
+#define GPIO_05     PINID(5)
+#define GPIO_06     PINID(6)
+#define GPIO_07     PINID(7)
+#define GPIO_08     PINID(8)
+#define GPIO_09     PINID(9)
+#define GPIO_10     PINID(10)
+#define GPIO_11     PINID(11)
+#define GPIO_12     PINID(12)
+#define GPIO_13     PINID(13)
+#define GPIO_14     PINID(14)
+#define GPIO_15     PINID(15)
+#define GPIO_16     PINID(16)
+#define GPIO_17     PINID(17)
+#define GPIO_18     PINID(18)
+#define GPIO_19     PINID(19)
+#define GPIO_20     PINID(20)
+#define GPIO_21     PINID(21)
+#define GPIO_22     PINID(22)
+#define GPIO_23     PINID(23)
+#define GPIO_24     PINID(24)
+#define GPIO_25     PINID(25)
+#define GPIO_26     PINID(26)
+#define GPIO_27     PINID(27)
+#define GPIO_28     PINID(28)
+#define GPIO_29     PINID(29)
+#define GPIO_30     PINID(30)
+#define GPIO_31     PINID(31)
+
+#define GPIO_32     PINID(32)
+#define GPIO_33     PINID(33)
+#define GPIO_34     PINID(34)
+#define GPIO_35     PINID(35)
+#define GPIO_36     PINID(36)
+#define GPIO_37     PINID(37)
+#define GPIO_38     PINID(38)
+#define GPIO_39     PINID(39)
+#define GPIO_40     PINID(40)
+#define GPIO_41     PINID(41)
+#define GPIO_42     PINID(42)
+#define GPIO_43     PINID(43)
+#define GPIO_44     PINID(44)
+#define GPIO_45     PINID(45)
+#define GPIO_46     PINID(46)
+#define GPIO_47     PINID(47)
+#define GPIO_48     PINID(48)
+#define GPIO_49     PINID(49)
+#define GPIO_50     PINID(50)
+#define GPIO_51     PINID(51)
+#define GPIO_52     PINID(52)
+#define GPIO_53     PINID(53)
+#define GPIO_54     PINID(54)
+#define GPIO_55     PINID(55)
+#define GPIO_56     PINID(56)
+#define GPIO_57     PINID(57)
+#define GPIO_58     PINID(58)
+#define GPIO_59     PINID(59)
+#define GPIO_60     PINID(60)
+#define GPIO_61     PINID(61)
+#define GPIO_62     PINID(62)
+#define GPIO_63     PINID(63)
+
+#define GPIO_64     PINID(64)
+#define GPIO_65     PINID(65)
+#define GPIO_66     PINID(66)
+#define GPIO_67     PINID(67)
+#define GPIO_68     PINID(68)
+#define GPIO_69     PINID(69)
+#define GPIO_70     PINID(70)
+#define GPIO_71     PINID(71)
+#define GPIO_72     PINID(72)
+#define GPIO_73     PINID(73)
+#define GPIO_74     PINID(74)
+#define GPIO_75     PINID(75)
+#define GPIO_76     PINID(76)
+#define GPIO_77     PINID(77)
+#define GPIO_78     PINID(78)
+#define GPIO_79     PINID(79)
+#define GPIO_80     PINID(80)
+#define GPIO_81     PINID(81)
+#define GPIO_82     PINID(82)
+#define GPIO_83     PINID(83)
+#define GPIO_84     PINID(84)
+#define GPIO_85     PINID(85)
+
+#define GPIO_101    PINID(89)
+#define GPIO_100    PINID(90)
+#define GPIO_99     PINID(91)
+#define GPIO_98     PINID(92)
+#define GPIO_103    PINID(93)
+#define GPIO_102    PINID(94)
+
+#define GPIO_104    PINID(109)
+#define GPIO_105    PINID(110)
+#define GPIO_106    PINID(111)
+#define GPIO_107    PINID(112)
+#define GPIO_108    PINID(113)
+#define GPIO_109    PINID(114)
+#define GPIO_110    PINID(115)
+
+#define GPIO_93     PINID(116)
+#define GPIO_94     PINID(117)
+#define GPIO_95     PINID(118)
+#define GPIO_96     PINID(119)
+#define GPIO_97     PINID(120)
+
+#define GPIO_86     PINID(122)
+#define GPIO_87     PINID(123)
+#define GPIO_88     PINID(124)
+#define GPIO_89     PINID(125)
+#define GPIO_90     PINID(126)
+#define GPIO_91     PINID(127)
+#define GPIO_92     PINID(128)
+
+#define GPIO_111    PINID(130)
+#define GPIO_112    PINID(131)
+#define GPIO_113    PINID(132)
+#define GPIO_114    PINID(133)
+#define GPIO_115    PINID(134)
+#define GPIO_116    PINID(135)
+#define GPIO_117    PINID(136)
+#define GPIO_118    PINID(137)
+#define GPIO_119    PINID(138)
+#define GPIO_120    PINID(139)
+#define GPIO_121    PINID(140)
+#define GPIO_122    PINID(141)
+#define GPIO_123    PINID(142)
+#define GPIO_124    PINID(143)
+#define GPIO_125    PINID(144)
+#define GPIO_126    PINID(145)
+#define GPIO_127    PINID(146)
+
+#define SLEW_RATE_SLOW0		0
+#define SLEW_RATE_SLOW1		1
+#define SLEW_RATE_MEDIUM	2
+#define SLEW_RATE_FAST		3
+
+#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
+
+#endif /* _DT_BINDINGS_PINCTRL_K1_H */

-- 
2.45.2


