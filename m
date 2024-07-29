Return-Path: <linux-gpio+bounces-8404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C710E93EA63
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 03:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A04F3B209CE
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 01:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D871A1FB5;
	Mon, 29 Jul 2024 01:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="o09FFcnr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2035.outbound.protection.outlook.com [40.92.43.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60D8F44;
	Mon, 29 Jul 2024 01:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.43.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722214985; cv=fail; b=stIpLRG9YcZ75Qy70BeftBID88vvPQIMnKwqd5+O5ewBLivxX+gDUGubH76P0QuIXg4nlMaRg4Gy7vUYyigUltYDCLucFn8S/q4gugORvz8/bc55QVL7l/0HvYVaL8o1bQC5J2kXEjhLR0vQYLz1xYqC8bZ+FXt7P5+SFCDT2FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722214985; c=relaxed/simple;
	bh=FYEkDxiUXI3aq5vilCUBgBVfIXogWuFh4bjh1TkXCtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GqfzabZrF+y2l5fm1OP5ZUX/tB06opoBdhGAw6rNahJQr4TwQUp3+KecTbXldO3S9ubSEmcLizHkAtexpIoo9ZlOb+8jNB1sfZs38jIM7sXjU7me5xZlq+uf4OBC2M2QDN3A5FcqHMXUPjiKyvx2Iee6KIreBImwNeW2gsj6wsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=o09FFcnr; arc=fail smtp.client-ip=40.92.43.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykoAUaL6Y6kCfo/Z4Qdsk64b1M22Q8an9J3EX6bivrKdYjxo5DYERxvSUQ5VtX1sht6vLxeHh8ty0UK2Q8BebZ8esazKaSYEYEY/MYnvwXj2uecPvkXFn2NxEYO/Tj6mnoHCYkf3egHMlemyVdV4WkdwQytOJ5akHH8iF5mFmWgDZ0n6Wa0iryboE2/uFVdGb9meDSQLM2kKlt3tSFrXqXNHi1kKVQvvt17uykkOvYY6QbouT1Xo22y2XuJ+6cWk511BcATM0ovWI/+bChs0LkJV40Tj0AWaSs5yeQAtdvn4CPoALvkzKFJEWmwybDXa4R7GmPDAVp8JKLTT+VHr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POU9b9zxm2+NqWcO0W4SQT4CF1h6udYnOnRZ917OCW0=;
 b=e0Bii16QdOXG7LaaoyGj0kKvWpqYof6Yhlv0DMMOeo3UEhPJrc2DcDUlFNCJHmJMF+Rydrsj8NLMcVg/70wzvAiN5M4Z84BMdUwCk82rDyWUafmZXRvlZ/rwHJLprZnG+5vMNqo1yfVyFG9SF/VtsjXzuGV7WbzWXYqDUpecRu9KAfO3kRJR+/8DWtlYan2m51wnjj8urBgg7uzbXJXcby7ghZPMxrwohD4zMVww/s/eo6LhSyzClQBYnS9yvMh9bRvKIYJ4/YYCgfy4s7cpKGNDj7DpkTG4+jGoG3XXTS4hUhKVrCl0lJVUoHOC8q2WBzPpaum3xbs+pRUHVOzfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POU9b9zxm2+NqWcO0W4SQT4CF1h6udYnOnRZ917OCW0=;
 b=o09FFcnrL36NZ2YOZ78KSgI8E8nGxVuCyKzL+/zk0rM3a3ewnjZlzOoo1uBvPw/lCC50h2nB+33xNkb3UjKYDhpOFU0WN8AZkqovhL//UZPlRTDsE/scCtgiSl31zKpGaIxNIC52GBPCVMiIkCleF8whkmdjBMkb9g34FxNd4aW0LahxLzHkgv8V7TJahk5nuuoCdzg5ax5S1o6HzThRse2wSQCg480+yZ5LtwDOU8Co0XZY/w8rQxe+msEjSaCfQM8GO4IaoirWbXN3yz3OBt23gTaFx1618nNMJ3UckK+FsK+78F440umI5iZHL5WTuADl+z4Ivkw3RAl506y4Rg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7300.namprd20.prod.outlook.com (2603:10b6:408:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 29 Jul
 2024 01:03:00 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 01:03:00 +0000
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
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.
Date: Mon, 29 Jul 2024 09:02:27 +0800
Message-ID:
 <IA1PR20MB4953C9FF856D6076FB1F8641BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [LGMtB2lTKNBFa4n4Vmx5M3DQsTMiGasRcBy1Uz2ihBc=]
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240729010237.650411-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 875e69cf-cd47-4850-e5c5-08dcaf6a30c8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599006|8060799006|461199028|19110799003|3412199025|4302099013|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	6ahahqmqD0S/j9BYduZyqvliGlHVfkP2BtofsweEs5TEwHFxCprZ7Q9/AJ+r2kz/O4YIBOo+yy81OqiX+IgRxANexlI2iuRdVYxLtAY/zgI2qk0b+hRpf9MLCvnt01dgi9HWCLodttl5xNdLnEsk5OT+GTYTYiLKlE17FZkTOiVNetDwRrSeScy04zx5yB9sqUKf0CEpWPv7u03gn9qW6c7FYSXH0k1hBJWH5+mskr44//gVpSeCFwCe3xgeHW3FCEd72ih5YHWjbqprOu71Gq4RC+sb9QEoF1ZcGOYtJzHC8GpGTJdG1iWgR8iJRFh7AU9PkvrtTRsFmZr/cz6+5oIddc2LfNVKP4a2v+6JPxFlLQLAIRdyTvWO/oGXDid4Wny9c+h3Tg9co3UPLVKsKwnMQBKtc0coYKl0FeQI7oED64lICZgBMpXDNtV6b3A27YHNlGgqe+gAb1ii/AkHA8J3JSv15yAW2iLQJ78Lw6L0T2ebUzfqOtDbaHWp2hCWmpZZ5aJuR7W5zDolh4oO/ouvacdZ8J+Dn40Tj1CkfFsCO8roELzsDxTimQ4/gVjrQpnMwdME27IoDv/+gSnPZOl4cn+x4BYw5KMJNSekZ6NUeVbSxLq/VAv/9olKcmVde6urnLl3X4OTzS9IL1DczAPhJMJhfKOdXgg9l6PUexeFOY9HolSpxY59Dl5r7nHhE7zZFgC7m9E3idStvp2OB8ppUA2UJb0fvzrsUHXL2VDM6iiC9DQ6qvFcSfo53FjULOK8aug8rCbCQfR8Kcp85aseJrnSORcl1ZwObDmfiWfpbc5FciZOy8SGrPB2PR65SGtvI/NYJppcGDWf4AtPOA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RQ8esYOAymzfZrBdyjAf+jREjxvkA3olG+COFjz/Pb5qnHJy0QzwOyT73kTC?=
 =?us-ascii?Q?nc3l8JRMiPUKXg49gEAmt2WYcJPXPru2kgojjoO4ZObsFFkHsQHM/o8EXa8E?=
 =?us-ascii?Q?rM6D+kENikNyXBHJjj7jpvXvMw9YiN0e2uthSlkKd6MTH+19jJzd68LFWDsq?=
 =?us-ascii?Q?WEKKf5ayx3uIlUZaewxkwT5TTBNBcMKflNTDN87bNukyepzdPB7BKuXa58nd?=
 =?us-ascii?Q?Zrp56NV4K7vhTO2J7kEaPJ2u3GdS0bTGV3WccOLINWfNEFlx6rJrmW/E8ebi?=
 =?us-ascii?Q?pDaSYu2glnrKF9kUpIpFLL+50UGL0ciCqNbd3HGXLXrj1OEZgRW+4C/ls9HZ?=
 =?us-ascii?Q?sL4krn3vK6ljGrhODL3g5qB/NDkWMVH0uvDWDA89jl+CwwOtfhBtmmSryIHP?=
 =?us-ascii?Q?x/lZc24f8t8agap4nWMwL4SiHhD9JLviCJqMBdrRTqrs+Eeew0JMlZp47C82?=
 =?us-ascii?Q?Lk8vviC+dPP8Js3Qzs8Wtnr2Ftt+uiuXK6hV54E8qb9Ua12fqgTAW/+twCzZ?=
 =?us-ascii?Q?B5kXyHZXK/lPKO+pZZg0w6ffUXRolwmWCqsrstZ+c6JmT5uKMFDnbFVqOHZr?=
 =?us-ascii?Q?yEfF33PDw4f+iLvVfvOcruxpRxWGtATRSpA6/1JIbcCXIyRkCVNtnfN5e3L6?=
 =?us-ascii?Q?PomqvmZnVmypistyAfUNU/Y0kZg4gShLYtj0E0023XcxInGuw0VuWgjly402?=
 =?us-ascii?Q?fPUJ/R8TMT7CVXfRos4rdf9gwHER+rZPr/vKWpDEdaF6dPDNcpGKUZYgxizU?=
 =?us-ascii?Q?rJkKbND2RqsV5xdMlCDp/NwvY4u2BHpoWiuUqBXN7aGq5GSwP8bOXLXJdPxU?=
 =?us-ascii?Q?4Qt4ULLewAGZ8E2LDvvd9PpFBSsFD8xhWjlG/8X4fZgkYWQp+LzBi6hcLxK2?=
 =?us-ascii?Q?KqlxKy8YVKqouhdkIs7easytxJLKSJzZpzJhb4u30HwM0f0c4shFtZoVvcqW?=
 =?us-ascii?Q?3oIbDjWYSh4u1OWGI+/nHN4SK9A6Yd97QIn3GhdyHaABZvpACkXZuzBjSEf2?=
 =?us-ascii?Q?isCsO0xCcp+Ctt4QaZh8dVVV4I5KTekBlexiqyn+pQGPAm34dwTLr3TBCPIg?=
 =?us-ascii?Q?t66vZsgo/tOuDwJoDD4EHC/QiJd7NJ+AWHVCQBZbl5TW3kJetwCDixpILUsR?=
 =?us-ascii?Q?DQWGpEd6jNlZi5BI+2j2dDw3mHGXkrGVUuCzcK/Yse98mZMZ/Pstrojjd3Nx?=
 =?us-ascii?Q?hM8Zh/sBY9wfEXvX9ScuJFK/1i0xtv3QpC4yFkCJM2af+uh6W02g9LWNKR1E?=
 =?us-ascii?Q?lnpG8YuBd1ebx3E//Fqm?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875e69cf-cd47-4850-e5c5-08dcaf6a30c8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 01:03:00.3398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7300

Add pinctrl support for Sophgo CV1800 series SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 120 +++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
 include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
 6 files changed, 535 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h

diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
new file mode 100644
index 000000000000..a94ff6fb785e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
@@ -0,0 +1,120 @@
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
+    description:
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
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
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
+    pinctrl@3001000 {
+        compatible = "sophgo,cv1800b-pinctrl";
+        reg = <0x03001000 0x1000>,
+              <0x05027000 0x1000>;
+        reg-names = "sys", "rtc";
+
+        uart0_cfg: uart0-cfg {
+            uart0-pins {
+                pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+                         <PINMUX(PIN_UART0_RX, 0)>;
+                bias-pull-up;
+          			drive-strength-microamp = <10800>;
+                input-schmitt-microvolt = <0>;
+                power-source = <3300>;
+                slew-rate = <0>;
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


