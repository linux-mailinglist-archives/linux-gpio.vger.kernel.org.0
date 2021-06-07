Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741F739D496
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 08:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhFGGCZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 02:02:25 -0400
Received: from mail-eopbgr20080.outbound.protection.outlook.com ([40.107.2.80]:48134
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229436AbhFGGCZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Jun 2021 02:02:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njG+EKtBrj7X7Upa9FrOZTsOxMdTcB7DXYok4qSzXQptqzrjTcWCjsPuNhvAWP0IDGsxO80ve7HBa6BUkq98jVvF/gZZNkfwT7fIF2c4S5IBw5x8cidNOVk4TzF0pYoWAGLGalIYSHbLq5LUzy67jfUzNu+r8AWmOWXL46GGBo/82Ke79QkyHqNNVHRNE0HBeaMG8A6k6UZ5OD2aP3Re9SsCdgvzs/fUfDUxkonHHw/1VlW22wpFdOxT8O9lQU4oR1FCMN0dIpsxpDDr28epO5FZJSe2s8E2Wv1zQ+AWDbitSNpf0BQU4juXN8qGaKGgE42eYG60HdH9CuNlk5qWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dUM7wfgpoGISViflqsHkeVfnmprHwnOuVXKSIQaqEs=;
 b=ELAR6J+HcwASiF6ayCndP7rO34EkVnASUJdZ+7rrWtWO0B98VaoEPAWizLxV/d1td3lJAruMzIBocUrU0jeCHR77hhp++ASV46hJe1YKpLA11wZXwxoJoqwwvnPBN3sPVHsXUQGeJCr4EELyckOQZIFQXv/7KiIMPFkNJ2ecz4hYCRAl+nKBoNW/fMWdl/50JYoNJyFxHpEpOuJfDaNKSskAcyV7qdll6baHoYsnziI8VBMPF4TdlIWMzdBradZFYfbppXrVOMROL/BT/+OO8FpV7AtOS4/xLS+sL8fSv3H6+zbpyc8wMkC9ZnhLZCZOHEqQQdEzlMhDoMRk3HWDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dUM7wfgpoGISViflqsHkeVfnmprHwnOuVXKSIQaqEs=;
 b=Si+4YXEGrO4pwlsSno0ICxXAGy35IuauEj4TgWcUOBO/QUod9Tfo6ttlkrFpNLS2IwWptFmi2Flj14t7ori3+LSlOtuph/7h5vdfIm21bR2XqoBC0iyc/HseIONSKlpaOTgq9KvQYYGsF2tmM84WvU/CgK2+Wrxrz3OxDV3fN/8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB4940.eurprd04.prod.outlook.com (2603:10a6:10:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 06:00:32 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209%4]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 06:00:31 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     linus.walleij@linaro.org, shawnguo@kernel.org,
        aisheng.dong@nxp.com, stefan@agner.ch, robh+dt@kernel.org
Cc:     linux-imx@nxp.com, festevam@gmail.com, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl binding
Date:   Mon,  7 Jun 2021 14:10:40 +0800
Message-Id: <20210607061041.2654568-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:3:1::20) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:3:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 06:00:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec0da9a9-a55b-4567-9815-08d929798ef4
X-MS-TrafficTypeDiagnostic: DB7PR04MB4940:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4940F34C0D9D987B127D640787389@DB7PR04MB4940.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VPnBYBMduWWUpX2kW+th+d2/6hIX7XQ5YubdGGUhwf0e6H45dQnir21cPMQF+18pJYjPLMHDt0gx4G+F3CfBM2uu0w89eMZi2FiLRp4M1LeTJXF+z2q2aL1VtECV3heMEOd12PlXQuvWAX49vMzyf5xCwYsN3G3JxTsnhQ2fj3e6dqs23gbxAd32BI7AqQuGkMfsBpjR3qqAQQ4r9uu1uC10Lmq/8LVuUZTu4RwGSOd4LxL2P8wD9kP7GFGhkPzM8p73s50omuyUnNhga7O1gDsI78YYFaIN0rpM89VpDYkzqUFKDPLxlnkEAkj94Yqr6tQjJpsEBapepWxh045cqgYXzhGh9iq4KkhG6jNb5LrLXRC74otAvg70uKcjz9y3lMEO/GJwOHKhs4K6UZ2pf4I5sH4cSSy1QYw5zYFp6h5PMi6iMG9dwxWex1POe8ahyXwYa+vVEPPzQmYo57aPY4NtizgUzEJLEAPiTb8mk4bwou81f8naGVanAwbWKhkifwik7N/3p7b1Aiwy1dnkS08SMqWLdnWgsHEmQY9W/ohsVXjxj51RRT2Kz9hUxbqMdITPBCOzmHC3yjfXd70OEmvlWvF0mccT1wcJG0UYWXsLcygs9ww43yz6pXW7XhjKeTfZyNUXkvKOqTsgImo6ATBmej8U2sR7jL39bUfPMxQeigtKb4cpB+40UQl9mCHrVx4e4n0UqDzrBc4pHe5Jd9pfu59H6yJKlBFOnaMnectDrZGP63WjVrPPzPNT9iVRElft91k4EY1MERDPJtLaq2R20BiWwL5RXnkrr6GVYblUVmVlQuNaGvdWho/VM+rGC11sDj2OUqE++Pm1uGTNNcxcUUxrCOFEUn7EABI3fOHjzttp4d9PJpib51TUyBFp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(83380400001)(966005)(52116002)(66556008)(66946007)(1076003)(66476007)(6506007)(16526019)(26005)(186003)(956004)(2616005)(5660300002)(8676002)(6512007)(38350700002)(6486002)(38100700002)(36756003)(8936002)(2906002)(316002)(4326008)(86362001)(478600001)(6666004)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mhpFvBai7TFVcnGnlfKrQWwBtG4aqJDCbdBQl+/7dQuPYo9JcKjaeaezZmMb?=
 =?us-ascii?Q?PDxCtmeqfduHyBhAvsq/Tt4K4pVDy4+BZLg0ZYaULgH2gWI2nTnirnilT+DJ?=
 =?us-ascii?Q?rni7VYAOdhj78dNhF2fim8KB1bK2YfuG+YYRDV2wwNn//j2zMdclPlAjG3QT?=
 =?us-ascii?Q?hFaOnc1dWb99GeYkhGmvd+0OJpR2RS9m4Fuv4An7tOsEc+CsDjSt0seaDUgA?=
 =?us-ascii?Q?XyMZ+foHaclPQK8NQ1TyaSXxNHrdQlHYH4sN1UDfMVzi+BpiGvMAHTA2MC6b?=
 =?us-ascii?Q?rSAgpni34HUVkd2elUCUsNVDZ27ex1mah+oPsqaV/E8hE71xIMsiay0L2xKX?=
 =?us-ascii?Q?CXVWJw8qYmffIdxRRt0YlhYXClgRZrkygwHebZrOANssncfWKtV/QcLGChZw?=
 =?us-ascii?Q?hmzBrJbmGLprw6W9jXSy2cHSqv1ZKIhoxX+11N5/tyDohBDHPKsPI5bf1hEj?=
 =?us-ascii?Q?7yM5KPoYtBSBX5o5K3pYVnyJD9vPITWaknsp7qakD3lTNqsnHvMY0d0vVxe4?=
 =?us-ascii?Q?MWYy0RoY27cnprjJX9wdZmXnivKkfxZmno4xyHMGf/ma2GP+Pa3Yg0479rSM?=
 =?us-ascii?Q?5/QsMMGfCmPhBTb0tZYg1bsFvo/IKjA6OJsrRLNT6lCMWfBoz5Q+wj6rERiF?=
 =?us-ascii?Q?ZfKz6F8JLZApyGYt9Mc7f/qZm5VWk31MgahrMIMR7sj7jr+sGyqavxL8bu7O?=
 =?us-ascii?Q?umRrDBsLeUywO2tXIBi+aXJBZeDwsQxtoYYWTR8QlJMW9843cZP3ZCnKCO3E?=
 =?us-ascii?Q?CYIgZuhK5OQY1+mqrys+myNOJHBu1qfROLlHK9oMDcgQY5YoYV3tt4Ego4TB?=
 =?us-ascii?Q?EU/ZbfUBnYQXcJ9UA9Ztm8l8LveL5UY8CfhyCLemCc9XYs3RkdLNE+kJrux6?=
 =?us-ascii?Q?W/jjxE9ZjjSjjuknnYwD5pwep0YLnrlKD1dypOUik26BVY/nj2MWn8OgeQ3E?=
 =?us-ascii?Q?HekkYl97DHUaGbtPH/a2oowSsvaT5LfF3ZAZjrPoYIvE3iR8TSnjR8+ilcqI?=
 =?us-ascii?Q?qKsj2UD8PypVC55oDfjYlytdB5U0uGNm34dbO3jsYlyZ/uJgv0+gQ9b4t9UW?=
 =?us-ascii?Q?hGXZLqL5ri5EysqlGlCKAteS54iP2XObfeSB9iYpldu0+AuFdDaXnMz4bR6I?=
 =?us-ascii?Q?zbL7vkU6z2nPA2XZ1KD9Sz1Kz8yZv/mwVffMcLEeDcku7z7UrbeUpPB7eTbf?=
 =?us-ascii?Q?7S48KonPixlkdc3UUOyeaC6qSVCqmxnoUjl0z4ReY98VBEh/wV5PNUmpxA1M?=
 =?us-ascii?Q?13CUbDQWWBQISy99Zgji2sWP2BUq3lJQ0UAEvUX7gldcCuoh9TwvXZp689gc?=
 =?us-ascii?Q?GARqgvqnQbGOrqP59VAM/Kh5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0da9a9-a55b-4567-9815-08d929798ef4
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 06:00:31.8370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43esLWoOmT2rTuUonyVxnCyrUpEgcGdg48Nrl/8FYSvxhL62iM2LYnwq+e7JgLXv2yhk9mwGMY+iDm8FFb5bOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4940
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl binding doc for i.MX8ULP

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 - v2 changes:
   update the compatible string to align with driver side.
   fix a typo in title
---
 .../bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
new file mode 100644
index 000000000000..86622c4f374b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx8ulp-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale IMX8ULP IOMUX Controller
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
+    const: fsl,imx8ulp-iomuxc1
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
+        compatible = "fsl,imx8ulp-iomuxc1";
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

