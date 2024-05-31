Return-Path: <linux-gpio+bounces-7017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20EF8D6717
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 18:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AE25B2A8CC
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91552161B4D;
	Fri, 31 May 2024 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ErqaLlMp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2056.outbound.protection.outlook.com [40.107.6.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1E16D9AC;
	Fri, 31 May 2024 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173855; cv=fail; b=ay69ToVc+bJYZRwxXg049i0vnVbaDjp131Z5ubKrK29An77RfYxaQYZVhhfjumoLF7//COn9j08chXlACQ6aat3w3bjl01K8cm3Sx3eBniMKPqLrTqwck1Vj32MHn4dNpDt/7nUOc/e72f35IQwB5M6y3Dg5qxt8tVP6OJilCQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173855; c=relaxed/simple;
	bh=QfhQ0tSjtsAp3pwdL16aT4ioOSRp2kefG1/9b0svC2A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pHlgL7MLJeg48dWzoORYS1F4izxbuUCdBbz8Jo9bcdfGFLzUWPR8XN+eFcY3lAET39uYqVkO2IUqH6pOcOa+3Qy8vT4262/W1lHxW8wk0+Q17ziLrBYB4XLd6Alv9vxo7GfEaqLbiceqbCwagJ5sjjUDhAHRROlmQ9KC767g8oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=ErqaLlMp; arc=fail smtp.client-ip=40.107.6.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Csz5r/EmNWj5q5MHtaz7KasD7494EST2xV/tg8o2CA5oT322kusSXVAch3nfM4eRihmq7eJF7bhSnWl/Tvx3gfZ3ExcJv143Q+TbpvGr81oVbn9anbEh218gms9pX7VPGunCvc++0WfNZhN0Vgj+0RvvWLVHrD3F/GiZph+M0GJK4loNvbkwMiXu2MjgeV7Ar1dT8Fb8G5lx3eUCB4EwgZVUF65zFca7srR1oWSOMky1XGkLmeOTsFwSw/GVHSXJmvW/khe77wKy65LN90AfrNpMoafEEjUaWj/aMEwMOEx4BPjo+fSPWlobsEl8PtPKIxz9Mx/prCMZtQ0sR3QDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dJxGasPJaw589fVwlksqdg1/sl0BoImJj0StJOPsy0=;
 b=EfeKexrC4B+Q2YkVRFdgKPtyumMRmdkY+Dqqnl7pVdVesU4EjHs8wgI5FGL4UDcIgMS3ytn1T2RyIz8G+wOcBEMP//PJT9sZ+9fkbpA7oxq/oYeSdWQ0ByKTpRlrCNOoecgKOWWtTwd4CW1jOI7lvfoM5v2IMrpHezi96rpWOPwIBT2lX7O2MHz4+IeOSoQVUB8R861odDdKOjKCodz41bwJBQRCkZYr6Z4mwVgghAdgKhfH6EmaNUwmgUlEyzZszea4j4wQvdljNFAHULPowyJAPPw2ow+U9tPPm8HwF8B69VlPn19kyXp5O2Qg7CLW1R3GKN8LcivP5Js901c1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dJxGasPJaw589fVwlksqdg1/sl0BoImJj0StJOPsy0=;
 b=ErqaLlMpJZfa+tGQO5P00nA6paZolcVAMzjZ5WPCv7KdNzmV4LszeLYdFK4GQJk/z2CxJF99rfpF2+IRe/zzN2Mn7VSnyBeeK99FET+U3kYg+bS5NavHs4GWYQzttvSd5Yei3jERk9QINOWkKmg2lpr/FOtJ/OHH5bUc8yj9toY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Fri, 31 May
 2024 16:44:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:44:10 +0000
From: Frank Li <Frank.Li@nxp.com>
To: alexander.stein@ew.tq-group.com,
	krzk+dt@kernel.org
Cc: Frank.Li@nxp.com,
	brgl@bgdev.pl,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v3 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
Date: Fri, 31 May 2024 12:43:57 -0400
Message-Id: <20240531164357.1419858-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 229f2d9c-5609-45d4-0ec0-08dc8190e531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JtqwbdKManIGVECDzGYtiHsdPxPMORiKhrxpUVRnS5TA339Mk5ZzLeNJ+VVa?=
 =?us-ascii?Q?Z7CvyZXrgDAqbD0h3y0fzRhCL2D0NgeFfviDdl+C4QFX3nNL+xNT728r5YVk?=
 =?us-ascii?Q?nH2tO660c8fMw/tWNIJsXKk0At2G/01qQSOw7N+V9JGpHuDGjWB36Rx0dbYU?=
 =?us-ascii?Q?xG11oVmb1+BFr3fzcPW9GmnFWfW5BCek02M3Th7AUz6tKg7tE07blApFr84n?=
 =?us-ascii?Q?wVSjBFbvVUYw5HByl7WPBFTziMT7ixph5bxBPlroZUtzOxGrBmNmmN2RxJdY?=
 =?us-ascii?Q?4xLI4frOkQ4sSZYB1yE5sQghYInoLsKZ4JvozfJqnkiDD6fvCIQkNix24mDO?=
 =?us-ascii?Q?PLEKvqLIgpGJTGPlaQr9aOuOg6dydakbiZgLgMzA7qdp6zt2gnWN3Dkkjq9M?=
 =?us-ascii?Q?W07PiUcHqfB0lbwueXF2QZiXwj3PXt4Ky/YxwlqA++GMJ2GRb2/F+iRW6841?=
 =?us-ascii?Q?efeTXFkdZl44F+lQviKpLOl2P6viHfi7LiXd6DLw8mAS/81FL8johlA8WfFC?=
 =?us-ascii?Q?1nocAHucAMxGoI0ylq1E/9CLsRoHsN7Xuzg8dS/a4pFZf4VXRcy6NULwS0ii?=
 =?us-ascii?Q?fK/+Q3CDbjLKMLBHXH8SNZXrJAJm/oK4gkoELgshZIyWlkVSIgAknF0ts1jq?=
 =?us-ascii?Q?sOaG1SS/fq0xVXGMLv1z/71gefn53dvBUvjIrgSCZFNLblf350EBotYcA5f8?=
 =?us-ascii?Q?w7MjiMa1m7YXRaY7ktDEjPBaZGXA+GysFDl9Hu/e5NJg6kPe6Nfpw6x65Jzb?=
 =?us-ascii?Q?AQC2AfXZA2MoxymBKQtHwZw4Mv3X1ywBkc4e6hDG+BmmHO60h9qPV9u4uDVA?=
 =?us-ascii?Q?tj4dDt+Y+ArgqIR39CQPz7VEva/ZGQMTCd0ggE06XGIPBViH6FdDO0sJVBkb?=
 =?us-ascii?Q?U1/kkjPXSqrRWk36hvju6BlgooTXxSTlG1dJgllZPWGaewU+YcGEXZNTRGdn?=
 =?us-ascii?Q?XNUlw13zDzNg4Ioqsg4KIU+86B6rZWCdhfvxKKC9pjQRqRpFBBaIAVgvxl9X?=
 =?us-ascii?Q?mRx+6J3b1G6bkReD7SD9AW7JX3s/zFduvFK11tL3WJj6z/E911zrxgDQga1e?=
 =?us-ascii?Q?cZoQw41i8RIt2x8Fq5czQCsgTL58KkBRCzZLkvEY7ApBrsC4t2PNLuvWanKS?=
 =?us-ascii?Q?IX0mM0nYyRGeFfzcmFP8jFSQEVqaQPZ5BkMt0QYyktlwYM1TXatm98I89+f9?=
 =?us-ascii?Q?3YD3iO+vhqKKHHPANabWC/XTtcWuETPFTTovjilz111nNWHy9fEArzMvp984?=
 =?us-ascii?Q?F4wo4SoT9Lcb6djXZPWLiVbLoAQqRyQoUx1JihvcFDQtEBSZ+LJRR52NCt4d?=
 =?us-ascii?Q?SHc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KLLqIMMkvDwE9207pz7QnbLvqWVQ4TbKJNGVHo68dvsIPeC1mHnnFxuHX+Yd?=
 =?us-ascii?Q?0MXJeJ4LckcFibhoBM+LBRNrDpFQ+VtVbrcSVL4WyU8GCKWHyYfX6Xlb2Lxa?=
 =?us-ascii?Q?jU+sKJX1OqsZCcVQs/pOQSW33Ei2HF0iXsyx/qSkbrl0nHeTyLTidEu5tF/7?=
 =?us-ascii?Q?3AEDfJs7a60jMpnx+tCUoMKk7jm1QWmJIX2EGdsv1e1sMv5iTD59cEW3TBtd?=
 =?us-ascii?Q?zJPwg9CksujD/BR21jAELS8FLanBdb/trfHpVHEl0z870iq2fDCIQZa9U4ay?=
 =?us-ascii?Q?poWsdEE/d1Azraiv7iqyxntSaOLN59SijwHzp9KBHwScEXzHL4KjZrEG7Rx9?=
 =?us-ascii?Q?3Oiax04tuIGy5KeyXGEQyo1/VT07EuBI8WP+Kf4LjJ5Ia3IIA5xLPcxBtkJ9?=
 =?us-ascii?Q?my2wAxHH39sEKWOzqSuRF0YIYkkTJi3u4FL1is0X3/ANVD8u0CQL/37vB8g1?=
 =?us-ascii?Q?VPK17DqxE7f0MXbYHdnHiUPYzC/52AWvI948LBMphUCNncGdP7QN8SrHipct?=
 =?us-ascii?Q?uUoz+r1Ftpcsf6efcAt9QEjmhCHTL6PJs8an6bft6u27A0yb+KCrDMm03qC+?=
 =?us-ascii?Q?x53at9yn4vH0YaxpIADkht0qpq4bv21FKFTJBHGai5e1v1hBe7rHW8vPA6P+?=
 =?us-ascii?Q?9lQbVVXwJ74n21reuapZna2PvEa5SC6f+vrEI+qTj9q9T1816SszR8stRThO?=
 =?us-ascii?Q?AcQF8bXoacbH46OkMK9zaKYjxVmSKSgtmBXrtqgzG0BGFLKE3nlEBBIqr2It?=
 =?us-ascii?Q?EjHVf1Mkz3HxyCHU/rnuFPc+Qj3B5JXuV0N7VHqXIcNc/waPZUxe7q9DysBa?=
 =?us-ascii?Q?O6/onPz6RFr1/FGk1U2JHukxipTtRW3VmkAmmgCd8SsHqaUIhTzMod7YspZq?=
 =?us-ascii?Q?1UUyl8v5cg+hVbxYWsURMU6jg+ajN2qD2Ul3owwBCsodQOEFDhlnaS70IE0K?=
 =?us-ascii?Q?CX4VX2XBG3UmybuV5lZnFIuvWyDGTB6El361BQp3sfzndwHhiSoVDlaTwgj+?=
 =?us-ascii?Q?wPMU7IEOGp0N07zERbFZyM4JbAiYCsszQU6KvRAKpGuqOah+79zQ7bOgrqq3?=
 =?us-ascii?Q?eAF3jrbRE93nk+yjQODAp7djHY3ZryYmBPX6J36ZbiCuuoqKxolCENBcl44H?=
 =?us-ascii?Q?lJ+/j9DskGN2pIiEzKfD+Pexh61mgN+LA1wBjP88uLIabSOV4zm4HMkcGOSV?=
 =?us-ascii?Q?aX428DjtU9NePTtvoDDCE6aFzlsO68hiNX1qPo3bQ8c4yUb/yHLzda8yVxRL?=
 =?us-ascii?Q?RepGe3C9dIMDEUKfPkm1+3BWzjhl+7JljZ6xzFXSlCsNtjzn4NIfh2EfWrge?=
 =?us-ascii?Q?JNoUZ9Zgx/5njQ7QPztP0lQGLddZfPMC6zDoEfIMQRqY6e/pVNK6P0YAOfpf?=
 =?us-ascii?Q?YpyfznVhO1VJBmguwtFrPzLG8EP3YIPDjHppo1SW4qKWDACzk7JuoLQJhbaB?=
 =?us-ascii?Q?fPPl8xyh5vQesRUhaeNC1Oxx4xUz3HazsI07berBQH/NtOtD0RzEKEdBk+It?=
 =?us-ascii?Q?LMbmzeE2MsAbri9GFwryej34ABOmOpQD+rTUSdw45FoDwmcj7W6Ck3O/fqYN?=
 =?us-ascii?Q?J4p8QOAIYMxGNsIBmPU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229f2d9c-5609-45d4-0ec0-08dc8190e531
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 16:44:10.1394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwR3WlkZlXAbP6pX65tynVaarv211qI83H0Yqx+O+fzRHT8BOyy2UgVvNe5rwMSck635kKLm3CtXgeGKK8/onA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316

Convert binding doc from txt to yaml.

Remove redundated "gpio1: gpio@2300000" example.
Add gpio-controller at example "gpio@1100".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v2 to v3
     - Add Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
     - keep 'gpio-controller' and '#gpio-cells' together in example.
    
    Change from v1 to v2
     - Add gpio-controller at example "gpio@1100". to fix bot error.
    Strangely, I can't reproduce locally.
    
    Pass dt_binding_check
    make dt_binding_check DT_SCHEMA_FILES=fsl,qoriq-gpio.yaml
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      CHKDT   Documentation/devicetree/bindings
      LINT    Documentation/devicetree/bindings
      DTC_CHK Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.example.dtb

 .../bindings/gpio/fsl,qoriq-gpio.yaml         | 82 +++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt | 53 ------------
 2 files changed, 82 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt

diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
new file mode 100644
index 0000000000000..eb046a48a3f59
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MPC512x/MPC8xxx/QorIQ/Layerscape GPIO controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,mpc5121-gpio
+          - fsl,mpc5125-gpio
+          - fsl,mpc8349-gpio
+          - fsl,mpc8572-gpio
+          - fsl,mpc8610-gpio
+          - fsl,pq3-gpio
+      - items:
+          - enum:
+              - fsl,ls1021a-gpio
+              - fsl,ls1028a-gpio
+              - fsl,ls1043a-gpio
+              - fsl,ls1088a-gpio
+              - fsl,ls2080a-gpio
+          - const: fsl,qoriq-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  little-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      GPIO registers are used as little endian. If not
+      present registers are used as big endian by default.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@1100 {
+        compatible = "fsl,mpc5125-gpio";
+        reg = <0x1100 0x080>;
+        interrupts = <78 0x8>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    gpio@2300000 {
+        compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
+        reg = <0x2300000 0x10000>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+        little-endian;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
deleted file mode 100644
index cd28e932bf50e..0000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Freescale MPC512x/MPC8xxx/QorIQ/Layerscape GPIO controller
-
-Required properties:
-- compatible : Should be "fsl,<soc>-gpio"
-  The following <soc>s are known to be supported:
-	mpc5121, mpc5125, mpc8349, mpc8572, mpc8610, pq3, qoriq,
-	ls1021a, ls1043a, ls2080a, ls1028a, ls1088a.
-- reg : Address and length of the register set for the device
-- interrupts : Should be the port interrupt shared by all 32 pins.
-- #gpio-cells : Should be two.  The first cell is the pin number and
-  the second cell is used to specify the gpio polarity:
-      0 = active high
-      1 = active low
-
-Optional properties:
-- little-endian : GPIO registers are used as little endian. If not
-                  present registers are used as big endian by default.
-
-Example of gpio-controller node for a mpc5125 SoC:
-
-gpio0: gpio@1100 {
-	compatible = "fsl,mpc5125-gpio";
-	#gpio-cells = <2>;
-	reg = <0x1100 0x080>;
-	interrupts = <78 0x8>;
-};
-
-Example of gpio-controller node for a ls2080a SoC:
-
-gpio0: gpio@2300000 {
-	compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
-	reg = <0x0 0x2300000 0x0 0x10000>;
-	interrupts = <0 36 0x4>; /* Level high type */
-	gpio-controller;
-	little-endian;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-
-
-Example of gpio-controller node for a ls1028a/ls1088a SoC:
-
-gpio1: gpio@2300000 {
-	compatible = "fsl,ls1028a-gpio", "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
-	reg = <0x0 0x2300000 0x0 0x10000>;
-	interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	little-endian;
-};
-- 
2.34.1


