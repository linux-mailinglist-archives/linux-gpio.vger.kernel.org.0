Return-Path: <linux-gpio+bounces-8030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E4926F05
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 07:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAB041C219AB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 05:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858E91A00FA;
	Thu,  4 Jul 2024 05:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Lvr2Uzl+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2043.outbound.protection.outlook.com [40.92.41.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6154748F;
	Thu,  4 Jul 2024 05:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720072048; cv=fail; b=V7M0hv/aSXkvX/omqI8fjiltbdm2Xo0YycmfNCgsfrJaEbpeJ2bGcYpYOS7R6tjlnQE4+5KvZbXKS35xGFdwf73l1dVB5yz8zMfg2oauLn+F7CwdIqrRmXWBNpqmeeLvOQ6he7Fas+k9ITbdSEU77g8mylP4C5BwxBFKW2s65Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720072048; c=relaxed/simple;
	bh=airqL60FN6+xHFkV0S2XWHuAzVMimnu8VeMBbDrV0UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uuGS+c/0yIND4hhSzEQGGUqxtPcS/Y4KuKdBHZqK7gFjcoV3BeOyI3x/1Ma9uDYSGh03OC5apNSZ1VTYCENhipHdXvnHv2s3spcnpbWByLltwszzdthdIHnSzgnEyO/CKYU9XHFiMuMFcQZvFc1os6ezYRKo8SeqeGLB/VgTBac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Lvr2Uzl+; arc=fail smtp.client-ip=40.92.41.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxnJzBc02oJM4KE8aEZrfuKXz61j8VmTNoG3XjIFc/ORN3ds+r0TbDic8Gopq9i+3OMA/L8RYwVtTe7+pyvGtFdYio+66aU+JK0exWzqrS4dObkwDnp5C6tl1srWxyI5sexqMpEIwHtuhPKRtxx/ackPqoJqxLwb6XlhG6PiUrkiVVDFOdLxpr1tC2YxBl68YUZPWNvY1lFDhQb7l3293Q/rjhnhFxSHP0XcMdTdztmLd/cEF4ifSSdEHtpNPGJvJwlo6UL31u2A9TiFjbSXlxy/Gpzz8nl2byGCicMEq7l2hW5x8lUdYUf7AvKbpRIRzWPixUjyquPcFtUBx3596g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EQaV7LdNqaoeKfGetYjm+aztjSyPYmu/cGGZo/gs44=;
 b=LZVEVMaPuMvQOy7hStG/ja8hZqxeoMtpKAlBy86BBF7m+/Tmjcj283eR//TtuVHw1bfWEsrNneNqyqnbGtXW2OT7pfX+yC88EXf8kZVaE80k7e8ZR28N597UZw8ymd/uieR8mKOk5idYkC0tDJjyn6Sc16rP2PpY7BxFMg1oBIw3hmbXUm/PgfGcxmTwDdxl+2d2MMUI/IMX07AAdDSr2/CYvJH591qkmNY6xpJGhd8Dx49vMryCUjBACzjJnHUYgAWtZJAwbRtbK5JF4IIrzq15yBR+fPLbOUqdVLpXDcfiuk5Gh+oy1o8rkeVdBQEmeNz+9mk8Jd8yFhSwj05/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EQaV7LdNqaoeKfGetYjm+aztjSyPYmu/cGGZo/gs44=;
 b=Lvr2Uzl+Xkjn3v+3vj5buxS6N9WonERs4I28/Ybhrm0Wa/yMKaeqp0ciZ2BPZS6qsaH3OMRW9BdHvjQFGEHXLKkv8BsG6wPHLUzrbGFLwgl2uM9oojILUGiVSbtrPIBr1QBpgqNx74t/uD9/zJIoS78bhfFlkMnUBHR0QR1zkR9MUkx/LlpJ03JIOjpuCePxThdNd7gpcsBVRkHo9SOEsRWR7fIKB/u37e04ed/xOoXvtu0SBmjgpB8xs77UbHNYystHN6zumcqPJnRDf7/8fqziSdAPfHnaSUavYo7qOfpRdB0OQ/uRYqY9OpgwqXKVNU9MtR6op94lSLIa9nTScA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB4293.namprd20.prod.outlook.com (2603:10b6:303:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 05:47:22 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 05:47:22 +0000
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
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.
Date: Thu,  4 Jul 2024 13:46:37 +0800
Message-ID:
 <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [i8kgN8U909w0+iM85t0oYzZdqFlnNM9vNZSj/SxNYCw=]
X-ClientProxiedBy: TYWP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240704054647.1747392-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acf4d76-b595-4512-3f94-08dc9becc652
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|4302099013|440099028|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	JTJogxsgue3RxyaM3b0GGOBKNMkrRE3jnFZTEGOx7TBh2unalIzn1FYMUDum/KF6FWqYShpU3R+riCTP1lNFckTvuEOpKkdJD/8hoBqQOgGk+ao2JPVDdVs/SgNfX8JTC6ynn9vCnGMXZU6bJBc6GcRP5UPpwx9C+mgHa4zMQLxnREHfyBMEm7UVDv0/JgtQNK8pb34uW/FSO9Qx6UZ13qLSkLZKDWaWMOJWp4l0iT9kmh4hr2JLvs/dO3k5pitQrTGgwgnrhmO9Aa2UL2nX1X6VDoLt6Zerl+ETk2/uO1HzrDrH4EWAfemwjRmtWaxUtxJXNaV2zex8YhWVO80Mb2CkwYvQqGrFJJcyLyVpSkAHZAarUsjHrlN3XqyrIrbOPQLN2WKIc52AT+yTPSbOz25Gq3TbYesNwUHQw1xxOlpDuBxbQGWXPXc8PdmFVpi9W0Abg5wOb1nnYt/YCJ9dGtoVKkR1eyer+ifln0X33SSbSja42HJvmm6d6CM5V0raj0UYxGsryYbhsMAaY1tCXJ16B/70g8n2eDCen0DxQqXgRZcROx0jP2MIiUFgZHvfxc35OdRized87xkdVOCPTHwbjUB6c/UDRF0GN6YLhlxxkViXzj7Lv+aKy2ts1XDjd6MjGDwKwK7wCviasx4n5nYOhqQmUD73pwb9eU5+T+BaUXT+OLQlRl9WYTXrIDcY5ulxAfaMmIcoSuhWcTVYWmvganuOhVb2DfkqHcFyJ1px7GQ/BCBfMwFLKBqZIyvRoSPYSuRU/X40r+7jX95ODQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r9nyZqueH1+MVp5yP7GIMZHgf5/LRBN+3iP4HaHsRFKWGV0tnxT2p6BYeq1I?=
 =?us-ascii?Q?cS0/gE8Fop+HZxPjrt6km7irZ40FVEXt6vha5y+lPZHn24rvIBDsCFfxwx/3?=
 =?us-ascii?Q?dcZyuAh7ylvg/13PvgsSTzvUfL45BQnLa+U/n7O46SyAI/3qvWI6JEVSWs19?=
 =?us-ascii?Q?TazEGF2m3u5uSOGAuvA4oOS9w9B3q+fP/yyhoVJEgJjQF+5qCVE9pqTAwkXY?=
 =?us-ascii?Q?q93mtvti3C7hbR30DmjjoDbPC2g/Ml5mbvf5NC6OvUIL8CG0RTaCCniFhL/5?=
 =?us-ascii?Q?1rTXgtz1SQZy2PCAouBaT6xdh5w4chrI8gv0MAuxZS1d+GDVliXOMVlOZxtM?=
 =?us-ascii?Q?+u1EReVr6ozipG/42j3RbwsTgxNOFDNleg2o9qQ3vaDQ97C5QD1d/U7ngqBX?=
 =?us-ascii?Q?ZQsD874dfHvxcxAmHztE5Ha6Fhs7rJ2/gsE7jV01+75A73AyY1dCfoQcY9vn?=
 =?us-ascii?Q?cZ41zoQZHSBmwTmjViUPUbJzZ3ZHrQctDfnNEuSQWv0B3yaXdtRVK5wenVJN?=
 =?us-ascii?Q?cBFCxYh5vvtAm3p1Mnm0UFAir2Mz9VEqq+nKDUqEZRRUuSKiyIXTMM6vFy9R?=
 =?us-ascii?Q?srrZaFUFUYz0snNhbHvyoDOUQM4DAAXENBLfig0cwEK2nC39OTDfgGJhLyzI?=
 =?us-ascii?Q?Fp8kriUhmF7r8pkPIMiBX68Pds2y/4pC70pGhEKfqMQADvopJ4rsLWYutwyI?=
 =?us-ascii?Q?DSQA4u/Po8Ti+vwX9n/oak/npc9Uk9c7mtvxSKHbcajuUjp9fwa7sJHt/qfy?=
 =?us-ascii?Q?laCLanjmGyqBZofU6nnW+9HO9+usoM2a6pSQPTnsDBQXgzCe+X8lrRtYcaAU?=
 =?us-ascii?Q?53IRey8nbrXHy885sIz5OH4JWYwBKdtPhEmbPQYgF7is41ZSBFmyUBbIKRPE?=
 =?us-ascii?Q?GpfZiYY0y5Bt8N4+Jd05ix210sioFRR3cTGNMVGwICP76fbiA+Vnsfkohy+A?=
 =?us-ascii?Q?WDtL/zCHw3J1kZjsC2UQSCTIXdw+bkIfluPoO+a38W41dIHhSBAZka5y4HYK?=
 =?us-ascii?Q?dR5M+0HsUrAAmKdNlqotHeHVSXQYRkVMrLd4KY6FUY49g59v11ZnMBaMj+cc?=
 =?us-ascii?Q?rH/W7Vi6OkzRrUBovkQA6abNWUBFDVD/PuCVkTnbf2otbvKSjBMxxN3eiWC0?=
 =?us-ascii?Q?rrt8Vx79y0Y3s1SHaMXWV195A0XvOagVO+ws1GiMkiH9eugMI/HlH1tuP5Nm?=
 =?us-ascii?Q?nMwt/GFTKyuf3cniX/Y0VDTjng1kUngvgknTpszHSrMwcVmCTjqNqiVvZKkN?=
 =?us-ascii?Q?2Tr6+9ZjOzoH6SpOfc8D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acf4d76-b595-4512-3f94-08dc9becc652
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 05:47:22.4756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB4293

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
index 000000000000..b7e4084b78d6
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
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate and drive strength.
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
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 7
+
+          input-schmitt:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 7
+
+          slew-rate:
+            enum: [ 0, 1 ]
+
+          sophgo,bus-holder:
+            description: enable bus holder
+            type: boolean
+
+        additionalProperties: false
+
+    additionalProperties: false
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
+                    slew-rate = <0>;
+                };
+            };
+        };
+
+        uart0 {
+            pinctrl-0 = <&uart0_cfg>;
+            pinctrl-names = "default";
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


