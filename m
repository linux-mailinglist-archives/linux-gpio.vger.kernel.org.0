Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B480E396D2B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 08:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhFAGPQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 02:15:16 -0400
Received: from mail-eopbgr60043.outbound.protection.outlook.com ([40.107.6.43]:62293
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229477AbhFAGPQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Jun 2021 02:15:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7hGaEoeWfHOvju2dwYghyeRfdVcw6YmbQ+JxNs4lUSPRp/GilcYaFqIJC/1V3kEATiLrwC2kTxD5xg5KpirGWRTuB3iIftmSQpY09IWlxW9ZTzqObsfv/gOG05Y0OBSKVM4L0i3aaiAESiqANZ4hpB4ZLzl6zMdE2c615VnaB1Al4ycSSZY5MoQIx0XuI34TzXfcc4BB+us5nl74ayBWJXG9kDVqada8/rtEz7Hz3j8XRnnsvyixHeAwMgSoMNGGd5ThBaERjXm1Z9ts6+utDvpu22NH3yVkOldMXotl16wEVVaIR3ql1gKHzEv08Mo6BhliW2BgCFcaYqBiQCcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41SpGwHLj5Rh2N1ocjQctCZ9RqIfnQctq91UHrSofV8=;
 b=IiG3kGPTc5OkqCRiAktKZNk0LDjJcTv+Kr+3/ekmY/M0DUCaUR+a7h9YFYA4HFpwcZof6DdzNmtW4DFqVx07Kd7ku3tvczqaS8+yeyPEAN9/7d7Ts5mZnwBxjBXmoDXzSKH6Pc2DrE/dZScOQLW9cSS1PkjtfetZZy+PPsTvq4BaLVkGmj0dJnckj+PRbmEp9+0rRgmO3qGltJlUbCxfjrm7TGBykdQndP/SW4QG/gVBCJeoAtnEc3m+yKDFJBK9XsKNsn6z8nWZr1iNbRYd5hkcDAcvxQxVhzwssFISRznsyzkdykKfA6MU/9ZlUW83XE2mTTVPDp0sZELGBqV4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41SpGwHLj5Rh2N1ocjQctCZ9RqIfnQctq91UHrSofV8=;
 b=nuqphcjPf9H7YvgPNtdrdhU5cas/SkCqyGUVh19vWFRJZsrIbSw9of9h2j44zzRvZwq8eEk2uRRB66SgpcbYE0PGaXNToMBxcc6FtUuOx2Crd/MZFVDPgfOVe3q9gBvkEy2SD+J8ZQ3G5oJU+uUtEJ1en4I+XiGR9aoV0YV1jUY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5241.eurprd04.prod.outlook.com (2603:10a6:10:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31; Tue, 1 Jun
 2021 06:13:32 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209%4]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 06:13:32 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     linus.walleij@linaro.org, shawnguo@kernel.org,
        aisheng.dong@nxp.com, stefan@agner.ch, robh+dt@kernel.org
Cc:     linux-imx@nxp.com, festevam@gmail.com, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl binding
Date:   Tue,  1 Jun 2021 14:23:37 +0800
Message-Id: <20210601062338.1969040-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:3:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 06:13:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f89975ad-8d7c-47d9-6739-08d924c461b7
X-MS-TrafficTypeDiagnostic: DB7PR04MB5241:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB524147495498FFD18F6A6E7F873E9@DB7PR04MB5241.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfIxhQmqGbz/7255X2iXo39IuwjW/dNlk2P2YwDAx0inLDw2j05qI7WU7gHl0BY+kM75Roa0qHzksQel/Uuep6reaxDa2aNWTI+rAW6ViH1TD1NPR5gcfT6GRZ4zPdPuwZ8xh+OWkvWdHGF8bNom4aqAcUdlIG/sopTx+L/+bOuwCvtVB94YxS7PyIJ9JJTG0fOaVbiCKj1d4Q1WuQup9h+79eulvU8k35BDyyjyc2B7VxGJ8RAS9R8pc7mSgEa3Tv8QrwTnhMjn8RS+OwEFUDhPwu8QNISLcMZoZ1yoPIWNHhUOF2HlHChRK3gbqgPG7Od7Jpg+2r6BuQjWNtKxahw73KpyoXqgi8Z+fS+Z3zrmRxWkUBRC4u7ip9PeSS+MFemeBzX7wkcPc2Br0k1gRE5Mn6buOC1uA/aPMlmoXGwZTHc+nzqQ+kQW48o2pBlzvJI2kqLXVg5zRzPiFlkR2qqXgxIc0DrevsZbZk2i2UjSGUvWaoYyFNiLiU620GXQzW5RilMUgbFRYTmYQQCxBMYZZYwi50zipFiwXnIWMXNPRQlyOHJosK+B7UlwCzz00WCGlG/L+qFtaGnsBpMUdi2ufky9HzwrQHPHmUpzP0Rcw/ZARuf7cd+HCLl+/Yd8oh8traRWfGFyjJah0beRXJvFvy/ZGedoFE0AISbxzKyNywmp0m9UqNguSn8UUPBXap1lwLRp5DhcnN7FyRMLQuI1TK8+5MpIrMvCIxl8E/bMeeOZnXXkOSJKfn7uEctnNqET1B3pp4HLuTpouEZ7WoW4C4fabtA084K62YTzu0xtddLWt4vMUSujDpiexmUhYvx3S93B6r5gvDSmt9++OSepRmSe58Wu654kakWHmlyaWYpk/MqqKh6ObQ+TuyA0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(38100700002)(478600001)(966005)(66476007)(52116002)(36756003)(4326008)(38350700002)(6512007)(86362001)(6666004)(186003)(1076003)(16526019)(8676002)(316002)(26005)(2616005)(6506007)(6486002)(8936002)(2906002)(66946007)(66556008)(956004)(5660300002)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?S4LSw9d7raa8M+2JO5lTemjqbH62/d9aF2bnrJDU+uHwMX1SNPubhA5TgPtF?=
 =?us-ascii?Q?KBBtFEY480rFL5HElvjQEmzs9tVXVJTwRuJ6AsFyOq60J1c48GPxBLpBa+bV?=
 =?us-ascii?Q?FBOsAfk1xKI648nPt89qGLb5FevZ4GGkXtBU+iF18y48UQmoI6+rupduG96z?=
 =?us-ascii?Q?M1/yrbXlcHnVxqS/rsn6XJqYQ/tK2ebbF7XtfgpQhpwEJtsUlrTAYjiXRqsg?=
 =?us-ascii?Q?6PvVBChKNJCeOOfbdHDWdrktW+NJLCmtletz+n0MijH2dzDbYYc+qq1XXBOT?=
 =?us-ascii?Q?kpgbZJufICDrpkA8dIcx8T3YHD41uf3qobxmYCx1jL4/SoU/rx8ea1YIxjO7?=
 =?us-ascii?Q?hLvk0iJnDppmtWiXi7dWVkICaQfqL9QOYIsvUB660rxm1VhyGwVewjfVUo2u?=
 =?us-ascii?Q?1ZJcgfoLbE53InbFqD/Aga2c2OPcDMQH+ui+1NMEJrZGDxHGKsqcgwJLIhiJ?=
 =?us-ascii?Q?oyoJHSZD5RPDTu7jKFg+BGWwWGcB8tuGYayQJnakVruDngbDheWvZRSk3XBI?=
 =?us-ascii?Q?z0HGb0H49ae1T52MsoIglvynVbkEw+oDht/6b0YbfxbJHFuVObXF62nlLoRB?=
 =?us-ascii?Q?yP/XQ1D/bHYCuaAlM2SJZB7mKhshAzgnfnclsgY4FDsc2XmoLWdSI5MAf/im?=
 =?us-ascii?Q?ebPeUL4NfR7Cq4upFmhfjy44BeKKCrWGzxvcp7X3l9xs2XIqZQOvVXxiMh8M?=
 =?us-ascii?Q?MUK2hVdnPoEA7Hh9XywHKFwBUu+m8dHXsHXiurJVmAZEN6+aO+MEh6O0w/Jt?=
 =?us-ascii?Q?CeKaIebJE8aF8uX+5uLeaKoEMaitFfcDpZnlX3r8FlKT3jm4FwOGqbLgPOkQ?=
 =?us-ascii?Q?QP9dMZbMlm2ItCRKa9gs5HSomZ8XZDdDWfyiHhRSzxytIluT+EpmHg3YLMlT?=
 =?us-ascii?Q?R/J8+tCY/9Ur9KueEFJ551ToYQLcSn7joFMy9FqqBjkQGD45W9n1DWZHnJb0?=
 =?us-ascii?Q?qvNunRmADnX6k3odsQUH2BH1Qo15CoX2R+U+iDXAi3lZZk3Wo1Mqlc9ou4tK?=
 =?us-ascii?Q?g+Hn4f8LD6CgkC3w8tXzN24uCn7++SXbnP9qDPVOEWUTJKSe4dxHfh8nmOBw?=
 =?us-ascii?Q?WQkZ43qvrUWmAR5QF+zlW7AAuREr7pBKW278bXoMY/BgzbidWcyT54iCFA1G?=
 =?us-ascii?Q?ddyUHKEGP4p924J/cyQvmIg57C18dSEO89/gIfvcFM52qsoEHZwYhl/tbMZ3?=
 =?us-ascii?Q?9K9ILE/bBO+meMYLojlXXR+941ak8BLbbwqq7PSktXIDdn3sLbRJ+SD/nYOM?=
 =?us-ascii?Q?rlwMkn9Fr7rPw87zAT5zkFtPeBSZWxs+j8urzOzZNzMqvJqLGlLY5K/MIIIu?=
 =?us-ascii?Q?oSfzK4KR+5Hsu3f6uSXZxw3i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89975ad-8d7c-47d9-6739-08d924c461b7
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 06:13:32.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHd8BBqNHO7e9sZoO/O2h7N3Wf0FA7GQB3D4CTFMU/MNwpNKXDdAwrORpyZ7gY+RYfPw6soSe0M11plSnzFd1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5241
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl binding doc for i.MX8ULP

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 .../bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
new file mode 100644
index 000000000000..594c61c34dad
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx8ulp-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale IMX8MP IOMUX Controller
+
+maintainers:
+  - Jacky Bai <ping.bai@nxp.com>
+
+description:
+  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+  for common binding part and usage.
+
+properties:
+  compatible:
+    const: fsl,imx8ulp-iomuxc
+
+  reg:
+    maxItems: 1
+
+# Client device subnode's properties
+patternProperties:
+  'grp$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      fsl,pins:
+        description:
+          each entry consists of 5 integers and represents the mux and config
+          setting for one pin. The first 4 integers <mux_config_reg input_reg
+          mux_mode input_val> are specified using a PIN_FUNC_ID macro, which can
+          be found in <arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h>. The last
+          integer CONFIG is the pad setting value like pull-up on this pin. Please
+          refer to i.MX8ULP Reference Manual for detailed CONFIG settings.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description: |
+                "mux_config_reg" indicates the offset of mux register.
+            - description: |
+                "input_reg" indicates the offset of select input register.
+            - description: |
+                "mux_mode" indicates the mux value to be applied.
+            - description: |
+                "input_val" indicates the select input value to be applied.
+            - description: |
+                "pad_setting" indicates the pad configuration value to be applied.
+
+    required:
+      - fsl,pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    iomuxc: pinctrl@298c0000 {
+        compatible = "fsl,imx8ulp-iomuxc";
+        reg = <0x298c0000 0x10000>;
+
+        pinctrl_lpuart5: lpuart5grp {
+            fsl,pins =
+                <0x0138 0x08F0 0x4 0x3	0x3>,
+                <0x013C 0x08EC 0x4 0x3	0x3>;
+        };
+    };
+
+...
-- 
2.26.2

