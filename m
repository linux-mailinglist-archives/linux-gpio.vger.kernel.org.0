Return-Path: <linux-gpio+bounces-8331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181493874B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 03:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54CD11C20C0D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 01:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673166FDC;
	Mon, 22 Jul 2024 01:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Q+AP7RvK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2042.outbound.protection.outlook.com [40.92.41.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF88F49;
	Mon, 22 Jul 2024 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721612403; cv=fail; b=qhAR8OQLtgFK3CVaWrGz06EWQl4mVdY36JgsdK4o3qxjiGaI+kJ3nRjC3Ts/EoGgA7WMXShiEGG9AoWGwvfSievpebCIz0kA5edZQhA2xi/QGmIx93AdEAaNfJzUyiiaXMM6/o9I5Jig4GuKA1DjzpYYN8s+DSNuV9tdyTdhdBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721612403; c=relaxed/simple;
	bh=mqziatCo+Kuc4WCrTKjdcQvR4d62eYygX21nIDY2zt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pI7qKjndb3FtvczkGDgLF77z1ZN01bccW+1wPL/CuZtZ+S+J3bH+5/I3M7O9GyrEMWk0UtmlKV8oOOuWJN2UVyqsvjxb3++473OOy0v8aabFz4ClFzQdmN2veUnFxKCuoAGHyAPbwPKwLWqpRxFcZRqvMqWGMGCAtKv+T5h+L8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Q+AP7RvK; arc=fail smtp.client-ip=40.92.41.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTr2xuIK/WIshiT1/8PcNGhiOFbFJ8mypgpdoVnWmET7s+bvR7IpEoQvpUUYbf5/ZYL9jBeVBWF9zJVN2C6qVTYuApd95gsJ+XROoSkHWVCNPCZGjUeoFP4T3m18I7GEBePL5tVaGy1D1yrxel+Hub4yejzannWaAdWUAdOt9SZZ8wrtEMBKzC/nqo9nL07MMal4yedskldKyryAhAs4AiFYDM2rzJkX9mkQa6wDiEemE5OXYwPGK4aM7Ls5/s3qHZBfv1sqy7uvJlMcvGBG2r/6Q7tLxkJALSe2NJkdLMCJ7q11uZXhFsxipRQiwXUsfn3/LFMYdw+v+3SssXmL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNQ4v23wAOOp3I1vDt4CaWrBVpf3f1sieBbd/sQzHYw=;
 b=U4Nr6JXtjNcPbWOnMqUV9hjQE4kk83BtcoxbaRRA9Ur5vnMvdi+uptp9GVGiFrcSFMnGqqE9QX7b1/gR/ttY8LEYV/yv0QdKjy+H5qvD6TISHFxHrDZkWOHlcSAAmgAIROYO2EEFheVizAPgtdHanx9dMKxWZy7ZEyp6tNC3IYnLiNvXw3DGoHiKymP/LIVrYoACZtNWUzqus603n6qBtUsSdxyvnmMy+05Y+W3aLrEXObLd5NnKxrH92mZI1aerj5WoyBqoSTf3GzVkpOuNIXB6Zcx+JXiOMN81uZy/qZMEcdVtEpld3Xd/XpPdZxD5WVC6zrPAfgDgEmzwjTN7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNQ4v23wAOOp3I1vDt4CaWrBVpf3f1sieBbd/sQzHYw=;
 b=Q+AP7RvKp2vkthP1OraW849vdjiCdqBmc010B5dsYAvgS2KnkKj3ssHDjobIflUwDPSKpTK1wUgDytupkaAY/MeTyImrZXO6359p3ok4p3UqQul2cSQzDx+ejGJX67wwIDoZZkguCxhoV2VZ5l5ZSKW9EzAqDhHzrXejqI7h9Sly2ohRjp0AyN8xYtP6vV23nW0/lqispKlMtsoAhTKiepKniQUVKHjq4XrOeAbcoxsssHMKRI+Zub3kRUKMHhp8tZP+oA9rgWPqCGuqDkzTpeFNaoR0eRAF/id6OIOPXmtDix8iA02ryTQoX34w1JVf7gRt1sYKN7cfrmt524PnUg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5403.namprd20.prod.outlook.com (2603:10b6:930:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 22 Jul
 2024 01:39:58 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 01:39:58 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.
Date: Mon, 22 Jul 2024 09:39:20 +0800
Message-ID:
 <IA1PR20MB4953E686117C52C2B4EF35C3BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [DFkWAdKpc0rBv0cb1JNPjhu8zf1uo90LzPmYPNdCw0c=]
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240722013937.623685-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: 195a135e-5f4b-4770-c4d8-08dca9ef31ee
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|440099028|3412199025|4302099013|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	+WulfcZABWPaQ4ucFYRmQ+Q3tVJxx0muGz5Go+vYaj/qf06JA0lvpDEM6KGQfZ0jBTQMLeIwoAD9jW7Io/kz1BDIIUeYqvYTu52h0AxoRN6nYJ9rEU/8MC70pPcSvMqnaiM7kVUoT7sW40jZN7Di/H7Z3jRd5UsQBAn4fyMl0fqGTcSyp3Ethg25kEaIaoDfVJh7lI2wPR6AWaokB7ve9OisTmAUlFjplhdDxFW+ldZ4lDPDEIX5LLoHBt7lKH01xLCr3CQzT16S+qxNy2oWmbZ5fa/pbuRl6e1e4DAZeU4UD1KpvVwtd2kTsv9G9GnRoznSNDLVlmFhy6Lw57dZ75l4V8A+61gKFF3UFM0BAYm6E9/5PcNl3SrNS1XES0XzOJHyFzjlPga7IshkhrvQKV9xAVii0Jx9kUXjSccxbEaAKoy3hkTHUoAaUnKMcb0Bz9Jf3hT/SMnfde7vJfc6vWiZBw+JbLEn6XZlOcg1pCpO9D354mUjSRcXdcDymOQp4l/v0yuhw9+FED/kGuIL5TWvyg2CXBpes7zwBdLUXgCCy8GgSFVnsqtgTkoQ0wWJkzq1uYAsVcoAGt3wYG1WYbW7nskJB6GvPr0s/HqHp2uFdZx51yhvvalu5mWQ8wN/FwPdwPjTT6cKe0pEdEFnC+pGPmv/gZVz7MjY16iq9NpJLyrha8Cce+ZAa7a5UiHTVa5N37OZ7yP/0QGsn4rgbPoL1hddpPiP4q7CbS9d4R3v9flYlMxQG2ovn/GNBmMhD3T3ZJXcsmchwhO33G/6KQ5jYz8FqYB5BvSwyFzAY5Y=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gdIJUYGyfc1YpvydX/9Q5FKzDdKpape/X0IH3avUs1aOrHWUEtSjG0tfn/Nu?=
 =?us-ascii?Q?k17IDi25KSW2yUfYqlt+8A4RuYDUPU0WWbRU/b+HEpAg5DNQYLIqiTl3E/fd?=
 =?us-ascii?Q?ytVXSz/TG6IVAaRaN5tbQJSuaZwzBGReJE2ONVHPNexz24Se0k3hQQ/sgnhK?=
 =?us-ascii?Q?hdPuMtZ8qI97J9mdZy5Qy49nRJOfTncbUoOwsCeGx6MO/HlIT+1l5wVQoCD6?=
 =?us-ascii?Q?QWPmCqlWpb4hivP07uXzZY+PPI959DSvtYDU2xRdyASV+WJsYPZwSJZIbxBB?=
 =?us-ascii?Q?rHOi/amp7+sR3ijb05IbR+WZAEIH2yxgeFixYET4hJYDJ8ejKEmcRRAJINkR?=
 =?us-ascii?Q?Qd9CBz6STx4w8zmN3yk7rmSDtINZFOhiKgHQPeccoTjtV6AwSR2lnXZmQAVn?=
 =?us-ascii?Q?C1UA5skNM81wjVOGVNMVOWibAGJEEIM4B/eJadVoqizYj/owkTjBRyE+tGau?=
 =?us-ascii?Q?su52qAAvhlQX3FF2DC9rW8ySzZN2bI9apHYG8J4RqqLofWGF8YjizWmIqQ7M?=
 =?us-ascii?Q?we9Xa3ApxIwTylt9xPxxSsg+DJNgC+4iKpjsImC3R0ken/bOd5e6J1x438FI?=
 =?us-ascii?Q?9zMNPlt/St6hy9qZR/X+z4Wpjoctvm0Ky0lS1ywaa5RU2R9XAWKN9sS2gWuW?=
 =?us-ascii?Q?jhjTeAWpPWMe+vdCDHMomQAP80odmHE/T9TGjQd8xR4goTuGibmjsjWNBAiS?=
 =?us-ascii?Q?o6Ahj2o3AvcDrDvN6kf2733ba8Vuo1a6QyC4XNehEyRUHtWEu5fRiTTvhuun?=
 =?us-ascii?Q?lLcopOqhuPZMptjJEgbf5VVgg7kgrvLWxBSBkR47pFb8aqLKOsJP+5bPbAEj?=
 =?us-ascii?Q?L9qUluIWHvilnzrKLW506A+tf0rhxjW8Q56BaP+/e3hsXn8l0YIcvCeHF7Rv?=
 =?us-ascii?Q?t5eFred//4MxNnvw0iUjX3C7X85k6HyFb9bsTo+DNtewXopDhfcRH1hVtkSl?=
 =?us-ascii?Q?7lRNC794cW5T/sJ8jQWB32BIsdZd8/goBhjd+dunRGoXJMPFpHFo3GEBoVoV?=
 =?us-ascii?Q?mjy1EDpuKEG0v9/T95CpnVCO5XwE3Cv84hNfPn6Yly15aKfCVFm5bytqw6ub?=
 =?us-ascii?Q?nKZPPzCqeVvmMIvnrXocwvp9Ep8t4IabIV0ewAuWIvezDz5ICdAYmj3DJsAY?=
 =?us-ascii?Q?sFF4Vuw7LjhukDRPOi2mKLBtPMhhjP6U2E9AMlyXTXaMgu/N8+t9lVJgO4fn?=
 =?us-ascii?Q?vQrwQMUXezKsn+xE29nasYkl0NC9cLLw4FWeTm89DUKXA1WEM+G4pSxmcay9?=
 =?us-ascii?Q?L3SEkM1fN9nOeejTTZdX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195a135e-5f4b-4770-c4d8-08dca9ef31ee
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 01:39:58.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5403

Add pinctrl support for Sophgo CV1800 series SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 129 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 +++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
 include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 +++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
 6 files changed, 544 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h

diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
new file mode 100644
index 000000000000..e6bd271ad22d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/sophgo,cv1800-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800 Pin Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800b-pinctrl
+      - sophgo,cv1812h-pinctrl
+      - sophgo,sg2000-pinctrl
+      - sophgo,sg2002-pinctrl
+
+  reg:
+    items:
+      - description: pinctrl for system domain
+      - description: pinctrl for rtc domain
+
+  reg-names:
+    items:
+      - const: sys
+      - const: rtc
+
+  resets:
+    maxItems: 1
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
+          enable/disable, input schmitt trigger, slew-rate, drive strength
+          and bus hold state. In addition, all pins in the same subnode
+          should have the same power domain. For configuration detail,
+          refer to https://github.com/sophgo/sophgo-doc/.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the GPIOMUX or GPIOMUX2
+              macro.
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength:
+            description: typical current when output high level, but in mA.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          drive-strength-microamp:
+            description: typical current when output high level.
+
+          input-schmitt-microvolt:
+            description: typical threshold for schmitt trigger.
+
+          power-source:
+            description: power supplies at X mV.
+            enum: [ 1800, 3300 ]
+
+          slew-rate:
+            description: slew rate for output buffer (0 is fast, 1 is slow)
+            enum: [ 0, 1 ]
+
+          bias-bus-hold:
+            type: boolean
+
+        required:
+          - pinmux
+          - power-source
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pinctrl@3001000 {
+            compatible = "sophgo,cv1800b-pinctrl";
+            reg = <0x03001000 0x1000>,
+                  <0x05027000 0x1000>;
+            reg-names = "sys", "rtc";
+
+            uart0_cfg: uart0-cfg {
+                uart0-pins {
+                    pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+                             <PINMUX(PIN_UART0_RX, 0)>;
+                    bias-pull-up;
+                    drive-strength = <2>;
+                    power-source = <3300>;
+                    slew-rate = <0>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/include/dt-bindings/pinctrl/pinctrl-cv1800b.h b/include/dt-bindings/pinctrl/pinctrl-cv1800b.h
new file mode 100644
index 000000000000..0593fc33d470
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-cv1800b.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_CV1800B_H
+#define _DT_BINDINGS_PINCTRL_CV1800B_H
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#define PIN_AUD_AOUTR			1
+#define PIN_SD0_CLK			3
+#define PIN_SD0_CMD			4
+#define PIN_SD0_D0			5
+#define PIN_SD0_D1			7
+#define PIN_SD0_D2			8
+#define PIN_SD0_D3			9
+#define PIN_SD0_CD			11
+#define PIN_SD0_PWR_EN			12
+#define PIN_SPK_EN			14
+#define PIN_UART0_TX			15
+#define PIN_UART0_RX			16
+#define PIN_SPINOR_HOLD_X		17
+#define PIN_SPINOR_SCK			18
+#define PIN_SPINOR_MOSI			19
+#define PIN_SPINOR_WP_X			20
+#define PIN_SPINOR_MISO			21
+#define PIN_SPINOR_CS_X			22
+#define PIN_IIC0_SCL			23
+#define PIN_IIC0_SDA			24
+#define PIN_AUX0			25
+#define PIN_PWR_VBAT_DET		30
+#define PIN_PWR_SEQ2			31
+#define PIN_XTAL_XIN			33
+#define PIN_SD1_GPIO0			35
+#define PIN_SD1_GPIO1			36
+#define PIN_SD1_D3			38
+#define PIN_SD1_D2			39
+#define PIN_SD1_D1			40
+#define PIN_SD1_D0			41
+#define PIN_SD1_CMD			42
+#define PIN_SD1_CLK			43
+#define PIN_ADC1			44
+#define PIN_USB_VBUS_DET		45
+#define PIN_ETH_TXP			47
+#define PIN_ETH_TXM			48
+#define PIN_ETH_RXP			49
+#define PIN_ETH_RXM			50
+#define PIN_MIPIRX4N			56
+#define PIN_MIPIRX4P			57
+#define PIN_MIPIRX3N			58
+#define PIN_MIPIRX3P			59
+#define PIN_MIPIRX2N			60
+#define PIN_MIPIRX2P			61
+#define PIN_MIPIRX1N			62
+#define PIN_MIPIRX1P			63
+#define PIN_MIPIRX0N			64
+#define PIN_MIPIRX0P			65
+#define PIN_AUD_AINL_MIC		67
+
+#endif /* _DT_BINDINGS_PINCTRL_CV1800B_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-cv1812h.h b/include/dt-bindings/pinctrl/pinctrl-cv1812h.h
new file mode 100644
index 000000000000..2908de347919
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-cv1812h.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_CV1812H_H
+#define _DT_BINDINGS_PINCTRL_CV1812H_H
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#define PINPOS(row, col)			\
+	((((row) - 'A' + 1) << 8) + ((col) - 1))
+
+#define PIN_MIPI_TXM4			PINPOS('A', 2)
+#define PIN_MIPIRX0N			PINPOS('A', 4)
+#define PIN_MIPIRX3P			PINPOS('A', 6)
+#define PIN_MIPIRX4P			PINPOS('A', 7)
+#define PIN_VIVO_D2			PINPOS('A', 9)
+#define PIN_VIVO_D3			PINPOS('A', 10)
+#define PIN_VIVO_D10			PINPOS('A', 12)
+#define PIN_USB_VBUS_DET		PINPOS('A', 13)
+#define PIN_MIPI_TXP3			PINPOS('B', 1)
+#define PIN_MIPI_TXM3			PINPOS('B', 2)
+#define PIN_MIPI_TXP4			PINPOS('B', 3)
+#define PIN_MIPIRX0P			PINPOS('B', 4)
+#define PIN_MIPIRX1N			PINPOS('B', 5)
+#define PIN_MIPIRX2N			PINPOS('B', 6)
+#define PIN_MIPIRX4N			PINPOS('B', 7)
+#define PIN_MIPIRX5N			PINPOS('B', 8)
+#define PIN_VIVO_D1			PINPOS('B', 9)
+#define PIN_VIVO_D5			PINPOS('B', 10)
+#define PIN_VIVO_D7			PINPOS('B', 11)
+#define PIN_VIVO_D9			PINPOS('B', 12)
+#define PIN_USB_ID			PINPOS('B', 13)
+#define PIN_ETH_RXM			PINPOS('B', 15)
+#define PIN_MIPI_TXP2			PINPOS('C', 1)
+#define PIN_MIPI_TXM2			PINPOS('C', 2)
+#define PIN_CAM_PD0			PINPOS('C', 3)
+#define PIN_CAM_MCLK0			PINPOS('C', 4)
+#define PIN_MIPIRX1P			PINPOS('C', 5)
+#define PIN_MIPIRX2P			PINPOS('C', 6)
+#define PIN_MIPIRX3N			PINPOS('C', 7)
+#define PIN_MIPIRX5P			PINPOS('C', 8)
+#define PIN_VIVO_CLK			PINPOS('C', 9)
+#define PIN_VIVO_D6			PINPOS('C', 10)
+#define PIN_VIVO_D8			PINPOS('C', 11)
+#define PIN_USB_VBUS_EN			PINPOS('C', 12)
+#define PIN_ETH_RXP			PINPOS('C', 14)
+#define PIN_GPIO_RTX			PINPOS('C', 15)
+#define PIN_MIPI_TXP1			PINPOS('D', 1)
+#define PIN_MIPI_TXM1			PINPOS('D', 2)
+#define PIN_CAM_MCLK1			PINPOS('D', 3)
+#define PIN_IIC3_SCL			PINPOS('D', 4)
+#define PIN_VIVO_D4			PINPOS('D', 10)
+#define PIN_ETH_TXM			PINPOS('D', 14)
+#define PIN_ETH_TXP			PINPOS('D', 15)
+#define PIN_MIPI_TXP0			PINPOS('E', 1)
+#define PIN_MIPI_TXM0			PINPOS('E', 2)
+#define PIN_CAM_PD1			PINPOS('E', 4)
+#define PIN_CAM_RST0			PINPOS('E', 5)
+#define PIN_VIVO_D0			PINPOS('E', 10)
+#define PIN_ADC1			PINPOS('E', 13)
+#define PIN_ADC2			PINPOS('E', 14)
+#define PIN_ADC3			PINPOS('E', 15)
+#define PIN_AUD_AOUTL			PINPOS('F', 2)
+#define PIN_IIC3_SDA			PINPOS('F', 4)
+#define PIN_SD1_D2			PINPOS('F', 14)
+#define PIN_AUD_AOUTR			PINPOS('G', 2)
+#define PIN_SD1_D3			PINPOS('G', 13)
+#define PIN_SD1_CLK			PINPOS('G', 14)
+#define PIN_SD1_CMD			PINPOS('G', 15)
+#define PIN_AUD_AINL_MIC		PINPOS('H', 1)
+#define PIN_RSTN			PINPOS('H', 12)
+#define PIN_PWM0_BUCK			PINPOS('H', 13)
+#define PIN_SD1_D1			PINPOS('H', 14)
+#define PIN_SD1_D0			PINPOS('H', 15)
+#define PIN_AUD_AINR_MIC		PINPOS('J', 1)
+#define PIN_IIC2_SCL			PINPOS('J', 13)
+#define PIN_IIC2_SDA			PINPOS('J', 14)
+#define PIN_SD0_CD			PINPOS('K', 2)
+#define PIN_SD0_D1			PINPOS('K', 3)
+#define PIN_UART2_RX			PINPOS('K', 13)
+#define PIN_UART2_CTS			PINPOS('K', 14)
+#define PIN_UART2_TX			PINPOS('K', 15)
+#define PIN_SD0_CLK			PINPOS('L', 1)
+#define PIN_SD0_D0			PINPOS('L', 2)
+#define PIN_SD0_CMD			PINPOS('L', 3)
+#define PIN_CLK32K			PINPOS('L', 14)
+#define PIN_UART2_RTS			PINPOS('L', 15)
+#define PIN_SD0_D3			PINPOS('M', 1)
+#define PIN_SD0_D2			PINPOS('M', 2)
+#define PIN_UART0_RX			PINPOS('M', 4)
+#define PIN_UART0_TX			PINPOS('M', 5)
+#define PIN_JTAG_CPU_TRST		PINPOS('M', 6)
+#define PIN_PWR_ON			PINPOS('M', 11)
+#define PIN_PWR_GPIO2			PINPOS('M', 12)
+#define PIN_PWR_GPIO0			PINPOS('M', 13)
+#define PIN_CLK25M			PINPOS('M', 14)
+#define PIN_SD0_PWR_EN			PINPOS('N', 1)
+#define PIN_SPK_EN			PINPOS('N', 3)
+#define PIN_JTAG_CPU_TCK		PINPOS('N', 4)
+#define PIN_JTAG_CPU_TMS		PINPOS('N', 6)
+#define PIN_PWR_WAKEUP1			PINPOS('N', 11)
+#define PIN_PWR_WAKEUP0			PINPOS('N', 12)
+#define PIN_PWR_GPIO1			PINPOS('N', 13)
+#define PIN_EMMC_DAT3			PINPOS('P', 1)
+#define PIN_EMMC_DAT0			PINPOS('P', 2)
+#define PIN_EMMC_DAT2			PINPOS('P', 3)
+#define PIN_EMMC_RSTN			PINPOS('P', 4)
+#define PIN_AUX0			PINPOS('P', 5)
+#define PIN_IIC0_SDA			PINPOS('P', 6)
+#define PIN_PWR_SEQ3			PINPOS('P', 10)
+#define PIN_PWR_VBAT_DET		PINPOS('P', 11)
+#define PIN_PWR_SEQ1			PINPOS('P', 12)
+#define PIN_PWR_BUTTON1			PINPOS('P', 13)
+#define PIN_EMMC_DAT1			PINPOS('R', 2)
+#define PIN_EMMC_CMD			PINPOS('R', 3)
+#define PIN_EMMC_CLK			PINPOS('R', 4)
+#define PIN_IIC0_SCL			PINPOS('R', 6)
+#define PIN_GPIO_ZQ			PINPOS('R', 10)
+#define PIN_PWR_RSTN			PINPOS('R', 11)
+#define PIN_PWR_SEQ2			PINPOS('R', 12)
+#define PIN_XTAL_XIN			PINPOS('R', 13)
+
+#endif /* _DT_BINDINGS_PINCTRL_CV1812H_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-cv18xx.h b/include/dt-bindings/pinctrl/pinctrl-cv18xx.h
new file mode 100644
index 000000000000..bc92ad1067ec
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-cv18xx.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2023 Sophgo Ltd.
+ *
+ * Author: Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_CV18XX_H
+#define _DT_BINDINGS_PINCTRL_CV18XX_H
+
+#define PIN_MUX_INVALD				0xff
+
+#define PINMUX2(pin, mux, mux2)	\
+	(((pin) & 0xffff) | (((mux) & 0xff) << 16) | (((mux2) & 0xff) << 24))
+
+#define PINMUX(pin, mux) \
+	PINMUX2(pin, mux, PIN_MUX_INVALD)
+
+#endif /* _DT_BINDINGS_PINCTRL_CV18XX_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2000.h b/include/dt-bindings/pinctrl/pinctrl-sg2000.h
new file mode 100644
index 000000000000..4871f9a7c6c1
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-sg2000.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SG2000_H
+#define _DT_BINDINGS_PINCTRL_SG2000_H
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#define PINPOS(row, col)			\
+	((((row) - 'A' + 1) << 8) + ((col) - 1))
+
+#define PIN_MIPI_TXM4			PINPOS('A', 2)
+#define PIN_MIPIRX0N			PINPOS('A', 4)
+#define PIN_MIPIRX3P			PINPOS('A', 6)
+#define PIN_MIPIRX4P			PINPOS('A', 7)
+#define PIN_VIVO_D2			PINPOS('A', 9)
+#define PIN_VIVO_D3			PINPOS('A', 10)
+#define PIN_VIVO_D10			PINPOS('A', 12)
+#define PIN_USB_VBUS_DET		PINPOS('A', 13)
+#define PIN_MIPI_TXP3			PINPOS('B', 1)
+#define PIN_MIPI_TXM3			PINPOS('B', 2)
+#define PIN_MIPI_TXP4			PINPOS('B', 3)
+#define PIN_MIPIRX0P			PINPOS('B', 4)
+#define PIN_MIPIRX1N			PINPOS('B', 5)
+#define PIN_MIPIRX2N			PINPOS('B', 6)
+#define PIN_MIPIRX4N			PINPOS('B', 7)
+#define PIN_MIPIRX5N			PINPOS('B', 8)
+#define PIN_VIVO_D1			PINPOS('B', 9)
+#define PIN_VIVO_D5			PINPOS('B', 10)
+#define PIN_VIVO_D7			PINPOS('B', 11)
+#define PIN_VIVO_D9			PINPOS('B', 12)
+#define PIN_USB_ID			PINPOS('B', 13)
+#define PIN_ETH_RXM			PINPOS('B', 15)
+#define PIN_MIPI_TXP2			PINPOS('C', 1)
+#define PIN_MIPI_TXM2			PINPOS('C', 2)
+#define PIN_CAM_PD0			PINPOS('C', 3)
+#define PIN_CAM_MCLK0			PINPOS('C', 4)
+#define PIN_MIPIRX1P			PINPOS('C', 5)
+#define PIN_MIPIRX2P			PINPOS('C', 6)
+#define PIN_MIPIRX3N			PINPOS('C', 7)
+#define PIN_MIPIRX5P			PINPOS('C', 8)
+#define PIN_VIVO_CLK			PINPOS('C', 9)
+#define PIN_VIVO_D6			PINPOS('C', 10)
+#define PIN_VIVO_D8			PINPOS('C', 11)
+#define PIN_USB_VBUS_EN			PINPOS('C', 12)
+#define PIN_ETH_RXP			PINPOS('C', 14)
+#define PIN_GPIO_RTX			PINPOS('C', 15)
+#define PIN_MIPI_TXP1			PINPOS('D', 1)
+#define PIN_MIPI_TXM1			PINPOS('D', 2)
+#define PIN_CAM_MCLK1			PINPOS('D', 3)
+#define PIN_IIC3_SCL			PINPOS('D', 4)
+#define PIN_VIVO_D4			PINPOS('D', 10)
+#define PIN_ETH_TXM			PINPOS('D', 14)
+#define PIN_ETH_TXP			PINPOS('D', 15)
+#define PIN_MIPI_TXP0			PINPOS('E', 1)
+#define PIN_MIPI_TXM0			PINPOS('E', 2)
+#define PIN_CAM_PD1			PINPOS('E', 4)
+#define PIN_CAM_RST0			PINPOS('E', 5)
+#define PIN_VIVO_D0			PINPOS('E', 10)
+#define PIN_ADC1			PINPOS('E', 13)
+#define PIN_ADC2			PINPOS('E', 14)
+#define PIN_ADC3			PINPOS('E', 15)
+#define PIN_AUD_AOUTL			PINPOS('F', 2)
+#define PIN_IIC3_SDA			PINPOS('F', 4)
+#define PIN_SD1_D2			PINPOS('F', 14)
+#define PIN_AUD_AOUTR			PINPOS('G', 2)
+#define PIN_SD1_D3			PINPOS('G', 13)
+#define PIN_SD1_CLK			PINPOS('G', 14)
+#define PIN_SD1_CMD			PINPOS('G', 15)
+#define PIN_AUD_AINL_MIC		PINPOS('H', 1)
+#define PIN_RSTN			PINPOS('H', 12)
+#define PIN_PWM0_BUCK			PINPOS('H', 13)
+#define PIN_SD1_D1			PINPOS('H', 14)
+#define PIN_SD1_D0			PINPOS('H', 15)
+#define PIN_AUD_AINR_MIC		PINPOS('J', 1)
+#define PIN_IIC2_SCL			PINPOS('J', 13)
+#define PIN_IIC2_SDA			PINPOS('J', 14)
+#define PIN_SD0_CD			PINPOS('K', 2)
+#define PIN_SD0_D1			PINPOS('K', 3)
+#define PIN_UART2_RX			PINPOS('K', 13)
+#define PIN_UART2_CTS			PINPOS('K', 14)
+#define PIN_UART2_TX			PINPOS('K', 15)
+#define PIN_SD0_CLK			PINPOS('L', 1)
+#define PIN_SD0_D0			PINPOS('L', 2)
+#define PIN_SD0_CMD			PINPOS('L', 3)
+#define PIN_CLK32K			PINPOS('L', 14)
+#define PIN_UART2_RTS			PINPOS('L', 15)
+#define PIN_SD0_D3			PINPOS('M', 1)
+#define PIN_SD0_D2			PINPOS('M', 2)
+#define PIN_UART0_RX			PINPOS('M', 4)
+#define PIN_UART0_TX			PINPOS('M', 5)
+#define PIN_JTAG_CPU_TRST		PINPOS('M', 6)
+#define PIN_PWR_ON			PINPOS('M', 11)
+#define PIN_PWR_GPIO2			PINPOS('M', 12)
+#define PIN_PWR_GPIO0			PINPOS('M', 13)
+#define PIN_CLK25M			PINPOS('M', 14)
+#define PIN_SD0_PWR_EN			PINPOS('N', 1)
+#define PIN_SPK_EN			PINPOS('N', 3)
+#define PIN_JTAG_CPU_TCK		PINPOS('N', 4)
+#define PIN_JTAG_CPU_TMS		PINPOS('N', 6)
+#define PIN_PWR_WAKEUP1			PINPOS('N', 11)
+#define PIN_PWR_WAKEUP0			PINPOS('N', 12)
+#define PIN_PWR_GPIO1			PINPOS('N', 13)
+#define PIN_EMMC_DAT3			PINPOS('P', 1)
+#define PIN_EMMC_DAT0			PINPOS('P', 2)
+#define PIN_EMMC_DAT2			PINPOS('P', 3)
+#define PIN_EMMC_RSTN			PINPOS('P', 4)
+#define PIN_AUX0			PINPOS('P', 5)
+#define PIN_IIC0_SDA			PINPOS('P', 6)
+#define PIN_PWR_SEQ3			PINPOS('P', 10)
+#define PIN_PWR_VBAT_DET		PINPOS('P', 11)
+#define PIN_PWR_SEQ1			PINPOS('P', 12)
+#define PIN_PWR_BUTTON1			PINPOS('P', 13)
+#define PIN_EMMC_DAT1			PINPOS('R', 2)
+#define PIN_EMMC_CMD			PINPOS('R', 3)
+#define PIN_EMMC_CLK			PINPOS('R', 4)
+#define PIN_IIC0_SCL			PINPOS('R', 6)
+#define PIN_GPIO_ZQ			PINPOS('R', 10)
+#define PIN_PWR_RSTN			PINPOS('R', 11)
+#define PIN_PWR_SEQ2			PINPOS('R', 12)
+#define PIN_XTAL_XIN			PINPOS('R', 13)
+
+#endif /* _DT_BINDINGS_PINCTRL_SG2000_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2002.h b/include/dt-bindings/pinctrl/pinctrl-sg2002.h
new file mode 100644
index 000000000000..3c36cfa0a550
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-sg2002.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SG2002_H
+#define _DT_BINDINGS_PINCTRL_SG2002_H
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#define PIN_AUD_AINL_MIC		2
+#define PIN_AUD_AOUTR			4
+#define PIN_SD0_CLK			6
+#define PIN_SD0_CMD			7
+#define PIN_SD0_D0			8
+#define PIN_SD0_D1			10
+#define PIN_SD0_D2			11
+#define PIN_SD0_D3			12
+#define PIN_SD0_CD			14
+#define PIN_SD0_PWR_EN			15
+#define PIN_SPK_EN			17
+#define PIN_UART0_TX			18
+#define PIN_UART0_RX			19
+#define PIN_EMMC_DAT2			20
+#define PIN_EMMC_CLK			21
+#define PIN_EMMC_DAT0			22
+#define PIN_EMMC_DAT3			23
+#define PIN_EMMC_CMD			24
+#define PIN_EMMC_DAT1			25
+#define PIN_JTAG_CPU_TMS		26
+#define PIN_JTAG_CPU_TCK		27
+#define PIN_IIC0_SCL			28
+#define PIN_IIC0_SDA			29
+#define PIN_AUX0			30
+#define PIN_GPIO_ZQ			35
+#define PIN_PWR_VBAT_DET		38
+#define PIN_PWR_RSTN			39
+#define PIN_PWR_SEQ1			40
+#define PIN_PWR_SEQ2			41
+#define PIN_PWR_WAKEUP0			43
+#define PIN_PWR_BUTTON1			44
+#define PIN_XTAL_XIN			45
+#define PIN_PWR_GPIO0			47
+#define PIN_PWR_GPIO1			48
+#define PIN_PWR_GPIO2			49
+#define PIN_SD1_D3			51
+#define PIN_SD1_D2			52
+#define PIN_SD1_D1			53
+#define PIN_SD1_D0			54
+#define PIN_SD1_CMD			55
+#define PIN_SD1_CLK			56
+#define PIN_PWM0_BUCK			58
+#define PIN_ADC1			59
+#define PIN_USB_VBUS_DET		60
+#define PIN_ETH_TXP			62
+#define PIN_ETH_TXM			63
+#define PIN_ETH_RXP			64
+#define PIN_ETH_RXM			65
+#define PIN_GPIO_RTX			67
+#define PIN_MIPIRX4N			72
+#define PIN_MIPIRX4P			73
+#define PIN_MIPIRX3N			74
+#define PIN_MIPIRX3P			75
+#define PIN_MIPIRX2N			76
+#define PIN_MIPIRX2P			77
+#define PIN_MIPIRX1N			78
+#define PIN_MIPIRX1P			79
+#define PIN_MIPIRX0N			80
+#define PIN_MIPIRX0P			81
+#define PIN_MIPI_TXM2			83
+#define PIN_MIPI_TXP2			84
+#define PIN_MIPI_TXM1			85
+#define PIN_MIPI_TXP1			86
+#define PIN_MIPI_TXM0			87
+#define PIN_MIPI_TXP0			88
+
+#endif /* _DT_BINDINGS_PINCTRL_SG2002_H */
--
2.45.2


