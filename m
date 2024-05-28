Return-Path: <linux-gpio+bounces-6741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B18D22D9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 202931C22B62
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 17:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27D745BE3;
	Tue, 28 May 2024 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="DVYNoduC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2070.outbound.protection.outlook.com [40.107.247.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A2A4501E;
	Tue, 28 May 2024 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716919029; cv=fail; b=BUvqhRkx1CiIYPgDz2xUs4fB32N4ITJ/9yeAnizCdq4g1kwELDt1t/KglNXxOAc7UGhtSzu0ptuHfnZ429S09WrBEyjMBm+aMIfYPW/Ehjsp5KeCDvptqS4IH1wXb8WVM4603wNrg+OKpdymdxRMngZOOEfq8dspVyi+w/KnMiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716919029; c=relaxed/simple;
	bh=Ll2Yeu5BnD/hizFP9o6YmEs9HDLeDFtfECIcuCDny8s=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=upyZhGUbHIIPLWUpOyXefsFSvcHO03d9bpGgCPYkdgdHjZHQsP5nH5sQnx/zvCqDil33l9dOnYo8CeVvaz/3POyxdYlL9qByEdzGUE6URhBS2Pe2GPSRFFfq7hR3uhVoVpM9Sysk/u78dMrmwFEdAWkI5D8OJ8ujoc8O6CEdCeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=DVYNoduC; arc=fail smtp.client-ip=40.107.247.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNvwbdjhSeMiXgMqdKgJu+bC+HyIWgmPO6AEIw07hXjB3OlB+zpicdgfOGCAwq0QQOjD4nMBEBb07xTMwoTBEIwGJftXZwZZlu9v8G+xyS8S40s7hPNK1/qaKv4D2V37L5aIuotn/KK+gQv4WtkPUNJucyGo89dBY3lWkmbWutMaS3BkaCxVtU2UiLTwRlsPYVmsIoBXccOZpViLyCNvwVQk56hFLlbqMgHvM38JeDiDvjcPoYJJaXPqf+LVKIag2VTNgD8klmr69R+wwzg3JgEQLHFRJwk9AG2qldmbhUWYVPCHCHYla/WfcMXolr4PrVEUfKXKddM2jRrp4FOjUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eh8Csu3RezZhPxqV+WVuW3nAaOagyjglgMz4xf4jfvk=;
 b=Gp/ZsRoI7619qA2CsENRHkX/9xh/2fXoUzxm9EKY+p4r/riQCpGHVt9S0BV+rJnYURiKWpBDpIJQ6XxrJFZvd+bEyTh8+Dnsn78Nk00APeDdODykMMVc4B6C9qh8dyNrlv8h7oRIjBh0lA5BofyHlLaBUHFKxAw/tfJfbGsR49SgRXJs9dXvMm1te+hPhamYVbf3spA93o3yeGolLNqCRvSWmy2VQY0UMYxr8g5KyQDlsTQtZBAFOwc8i6y1VQbhit69EOXb1aj+uMWxsfAOkYxj+bBSvoXFZ7CKpZGKKB4Vlwv41dON2Jw95UzTLbxh8meB92SvWP6vmvkpjenKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eh8Csu3RezZhPxqV+WVuW3nAaOagyjglgMz4xf4jfvk=;
 b=DVYNoduCmfFLeM3TgdFnEL/pwwva+Wt/YxM2Lrno/u/WLEGc7wlk2uv1djVe4vBL22WbQqKH3b/qWIEidf9yyetzLlFquZAuq1KrwW2J6VsnP9hJ9PinNZDIG3Al/3OEnXMSZEkuAl0wcvd7mm0eXdZzpqckmcLpZIuExrcnHj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7710.eurprd04.prod.outlook.com (2603:10a6:102:e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 17:57:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 17:57:03 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
Date: Tue, 28 May 2024 13:56:46 -0400
Message-Id: <20240528175647.2604295-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: efc84c4c-66e7-4318-82b6-08dc7f3f9474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QXe04qnxUbUERGzYyNy0iSmgZ52APyUDLbUg4YJdGgKywj684Maq9UJkTfDh?=
 =?us-ascii?Q?SciWV6nIVTgsiRkqQPn8+4HiH5+E7Ooankyd2Fwk9NP8GMEZCL8UHxoF3yLY?=
 =?us-ascii?Q?H2FzKOeqHjBgF8WyzWJw7kl8Oo5Lk66zC+aH+BpDe2EsDx3+YUy0L/q/X1ar?=
 =?us-ascii?Q?iY8c+MVwRSAt4BVh8CBUEBR/9sOBYL/SQVuTC6aYKlUl/RO9JQjzHEc/dLTz?=
 =?us-ascii?Q?6m8I6uwt646zZ6pC5gDkMrzegbrUNcX9T92+9g3lfmqvG25EiBBNxVf7FafH?=
 =?us-ascii?Q?L7C47Uc6uGaM9ebWOMVNXYIjr9KWsivALsrfb5QbQAVa9ov4AkgUxn+z90wJ?=
 =?us-ascii?Q?NtOnF207lZ30k1i+JL3+8RPALV7cd6w/UbRpv+eUhzmc/nd5cptsC6IpmGR8?=
 =?us-ascii?Q?fUZG9CYCQj7W1/VPtJrttEmxKluv1x0aGmMnlVva2a0iokMIdgoVqAvDljDr?=
 =?us-ascii?Q?ZKejfaxipHN3b7pLNIKblvY7R2RztslF4EWciorZHs/JcP7O7+1UQe4jjcBD?=
 =?us-ascii?Q?UGdx3j08laGyDXPI1yYL8yZkmxTJWz6TVJpMCZ6t/t+3T5jTPBDjdboDP3D8?=
 =?us-ascii?Q?SaGODZcsH+8xmGw5Vu9YQpsyq+IHf87lBmaAFeuJSITvRXsycWYQM2NtCmL5?=
 =?us-ascii?Q?HPtHmy48SeMfFYtsssaoy1+LqpxgIQb4vUoOv7D6cqd/utiBOz93zzwkkOWu?=
 =?us-ascii?Q?JXnkdWigFd4hssg4nQ6QVg+qEaj/51HOvBtvk0wJPCJXV6uJ8DtZlHl3/Imc?=
 =?us-ascii?Q?SqFza9nuPQ+4LjkTl6ZaF2Gm/KMB2TUOGV66IQKuhmqvdot7QihlXhI3junE?=
 =?us-ascii?Q?8Z9zbmjBidqf8Do/PxOVNGIZO1MpC5Au0Xk+jhisk09N0zHBEYSgcHhZW3Se?=
 =?us-ascii?Q?6D3QHSUZ3vBudxc0raEsUDwJV+2e1mCkV46rEQr6h0eAUqilij+Igs0kuZ51?=
 =?us-ascii?Q?sGG1LBDrwP3V2DKqEdNM5g3x6i3aEym5DweUhSwD9HhdKJWsiPzAxwf2UgyH?=
 =?us-ascii?Q?GHju3h9SG6rEn1yld636i0I+5ojpeldQckqOO1lLu+2zxGLTQSdFTWwpcz6e?=
 =?us-ascii?Q?s1qeJzCW8HlX/dKMCae91h0OhOsBxNVm9SKWNmi+kYdV9hwdlTd+AiJup2Qa?=
 =?us-ascii?Q?GY5hBX/IqkBfY0+dEGKkE5S0INDpVuvfBZp+n0CktrANpLqh/aulHlNQH47b?=
 =?us-ascii?Q?F1yQmwOLcByMxXegW6vUpCiImNBM3vc5kO0M4mtOps3gF1oK3reawRuo8DYu?=
 =?us-ascii?Q?6xCbfhwVzt8pdSToRldZ/70C8q7NWwpjTgH/o9SXbPhIyWfMtxKo3UudZ6T0?=
 =?us-ascii?Q?aHE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tloEe58VkcPe562OpL50hndMizif3tGmr0lM5+i1IB+lB149jOAdrcT+ZPpv?=
 =?us-ascii?Q?18mhR1L6MXV/X3If0nL7vDfgIu+I0EW4h9wx8h2CRd0rzDJV/cRlV8MAOxEO?=
 =?us-ascii?Q?d20Awm7MKjEuK//s4ddERtiu5Vmdl+Sm7uEYUsqCanYEji5tb2ccSJnkUl60?=
 =?us-ascii?Q?UpE/Pw0pDjPugLXb86Y5Z/Jj2RIAt045VeNXNqd3fzWP2mtYuAvRDzD8WyBR?=
 =?us-ascii?Q?olzUINEee4wY+7kVYFXzDSoGwlALqSdQZ2LpWsrtA5Xful+H8K1pbImv6e3l?=
 =?us-ascii?Q?3NVC+KZcU+iaS9R9SZXtTIRqtJlX42rFoEUw9u6CEe1ecvXBkUk0m1XvANSz?=
 =?us-ascii?Q?6KzEVgejuXu+9EsyLIfXW6D3+XuWX4reyL9DOo7gCdu2WgXfSTvyrxQUOTzP?=
 =?us-ascii?Q?dj6DMOpDVcK2AIZmQaJPiKvJrDcawnZW2o1m/J/DOXUs+gbVLxgHXTurPhnp?=
 =?us-ascii?Q?YtGTE+OoHv8w86iR0F2u3x+U3Ob+RkKqSXuM++7hoNoDUouK2E5EhmjdEnHc?=
 =?us-ascii?Q?5Rlhu1PaSGq14Q3bNMzybeUvZkUZFMnr5A2dSclafnnEsRG8o7QJQ0wbq9Xm?=
 =?us-ascii?Q?Uj/B06qgI53tql+gCP2hztIi6Mca3+V12KKfpQ45PvckDZMD37XUjVmylqJS?=
 =?us-ascii?Q?JKSoIDiuB5BN3FJQ2+MS53IYrOohPUfJHhrAB9a25oWpGIgdKv+dxUr986ba?=
 =?us-ascii?Q?FQE2skdX2mXLaZ00w6Hh6uqj78HaM3mnnWbPh3BiJxx+VN16+7fWql3IHK4G?=
 =?us-ascii?Q?1VZ/FxTQKp9zm2LRFfXoCH15iTo6u/DqkxpXuhWJ3Tzcr9UNKPz46YpODs7p?=
 =?us-ascii?Q?PoB3jHRwmvDZCqNhYNt2ok0N5piPGNpep+9/G7o7cjft/l353OypjdAvSeHn?=
 =?us-ascii?Q?vloX95Z2g+pnsc2HQLCeo/CE0kNlt29WMSTkWgh5toA/iBPMMh9ByjPFpSMN?=
 =?us-ascii?Q?/GQ1Ov9eSLLHr3n2srzIXPvA/yCqMi/7lq8jkGkNIWD0rbYAFOEb94MF24I2?=
 =?us-ascii?Q?4QhkYhG8soRxgwvYaJda1PqmfPEVmFttvw7McSoaFTmsiGNKq4VosqP1tdkR?=
 =?us-ascii?Q?8oX+m8Yi7CTs0wCotLtxnD+EaL/1xU+L7f32eNjQD+2ph/fG0FSoY5twdjmF?=
 =?us-ascii?Q?JS+7XJ72RmM1AiwcalEsY8NRp7OtuNpDkugROPN/aNH4USgOIRB9nXZJFrxn?=
 =?us-ascii?Q?9ctzCaZCMUXi0b2OhGtRtIwVVinD0UxabCSUYqBugpCqxttZWH8sqX0QJzlG?=
 =?us-ascii?Q?HkZrODDCoVPJFov3n5dfSqgqww0hmwmzka35FaoF0bNIsEPeKMZUIWIwBwki?=
 =?us-ascii?Q?+qaxc3KIvv1RdtsQiZxiCm2LyeNlECFbJ/WbvhFx6tWatrubGDYw8fruRzTr?=
 =?us-ascii?Q?f1ty1FjYrxX9LlL82702r0X91GapwxReVEij7hCIDh2hTb0Ewc70NzwSfAhY?=
 =?us-ascii?Q?xfZA/v5AP2cG8fUbTLK7qQteW46fEa3b9I/JeLvS3exAagWiIb7hIeFgbWGH?=
 =?us-ascii?Q?Bby6hz7Wxt32phwRUC6TeCoUe3CswRVZ2nLXTQoUBJbeUYzEi1O+LYtb8ZDU?=
 =?us-ascii?Q?ZTpMEFdk2BvWxa1JIzYqgugvRLEvIjtRq+kpxmbL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc84c4c-66e7-4318-82b6-08dc7f3f9474
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 17:57:03.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pID+pVzdzMKVTIVfXzN/FF/tfaDSMf9ZyLxkG4MeqRAHz9MNYwOPFqemk23rP3LIiDMdk7YpRtBFJGc6A7PNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7710

Convert binding doc from txt to yaml.

Remove redundated "gpio1: gpio@2300000" example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Pass dt_binding_check
    make dt_binding_check DT_SCHEMA_FILES=fsl,qoriq-gpio.yaml
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      CHKDT   Documentation/devicetree/bindings
      LINT    Documentation/devicetree/bindings
      DTC_CHK Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.example.dtb

 .../bindings/gpio/fsl,qoriq-gpio.yaml         | 80 +++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt | 53 ------------
 2 files changed, 80 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt

diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
new file mode 100644
index 0000000000000..532fbb631a89a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -0,0 +1,80 @@
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
+        #gpio-cells = <2>;
+        reg = <0x1100 0x080>;
+        interrupts = <78 0x8>;
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    gpio@2300000 {
+        compatible = "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
+        reg = <0x2300000 0x10000>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        little-endian;
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


