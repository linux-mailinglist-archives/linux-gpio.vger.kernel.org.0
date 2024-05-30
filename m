Return-Path: <linux-gpio+bounces-6963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FC8D503A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 18:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7616EB21CC2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 16:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577A53FBA5;
	Thu, 30 May 2024 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LV3s6NAO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC24776F;
	Thu, 30 May 2024 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088085; cv=fail; b=JcIDPVJSiBPGSPBFVw+l/5POZkgGT6sHcr7eZKMl2IQRm+cTA+VTzzf/G4kligDnxxqYxns3L6JIyXkT6wG238RLel3rLv96KTJqyv8tDTYiXHwS6ueUy9RW6tENz+JRJ4fd5yJO5sBFzWaKkm0WPgEFP6k4PBve09OLgzhbXcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088085; c=relaxed/simple;
	bh=BlAMvXoPbWfAXZpcX917YxtYn7HH1nWDwnOe5GPK9I0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Q6ZDZMViGdhKhD60h4dYN5/ngBiz5rBHdzrTX958SU9GnGBhHMZQvPbVQ46fqrdIpkPKtfSMkQ8SQPeeBMzy1YqaHGzkgyFxduWivtdTqXtCH3YEZBIbO4E7rg0C64DrSSzyUoayBWVWbrvRA6BZaLrt8k++HwQzMIZHXzDkJF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=LV3s6NAO; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL9IiJ4eM49XjTvvZdj66z9QcN4HZDom3HVVxEexy+3kkc+HCDEbHfzyGZcWCRUNaMTuT85cUD7tNCPORMQz4WEgVvAaF+eX+csw6i84aPV8CGkP2s4iIwpr2mafP3lXC4GVZbnvpHRjBHobK0buGqPsVZElv2HUfEwK94tqU3Jgep+olpdHI/c44ISn5RCNo/JD82f5ae7htAiQ+bvTMx7sA8zVAc5nkkXXl00Vy00ftGlKKn2pTZijqgmo3QJtK7BbF7OGUZFdwYJcbjUyeSEROOXrBV7tfVjYv8/eZsafgpkdbumGSCOUyBIjnOpkb002phWo/iGdci5tKyTXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iEEgiDfLuU24gK0/aTuNkWwHhNv7Cyr53ift2m412o=;
 b=EAZu8O+JBP5VBjkfMghFRhUOxt4D6feLlDg2XlIV2+mNhSh75lgUhRFypBi+ocOk+WCHCA7a+WZwFLW41Rda+MEdMOPfi/fbxB6aH9iutQMCBAXKvy7DW1KwrccKsxxfTmTv5ReRTfN5mKvdFYS6WbRkcyMSwaZsokQWr/D89vWg5pD8uiFYew5k/eNVJtdwqIAE2OYTyiooTyXbU2f1dbIVYOl3v0Hhb9jPRXHQS/ce9n5Rf6oLEQwMNNqMdWaRSWH5DipNG2vd0PCQUiFrFWUSiR33EYW90ciKzyZJKnow5zX/hCqr0W0EIGQlxJoSqPMUzgy7nEmWr35kARAyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iEEgiDfLuU24gK0/aTuNkWwHhNv7Cyr53ift2m412o=;
 b=LV3s6NAOXAgemq2ZUeP/bdBdm9BMld7m+KWLfSIhrhBHQwIdUOMobWpPqGB5KfHZVIwYEhJBmIVbtAvQryg5lGOsnj91BapscWOHmyRgklvOpyZchGB1zTQUzIsb1fxqBILEb1J30nzCeNm8H/ZRqwfVUDVLKS+qZDS2rJdicvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 16:54:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 16:54:39 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org
Cc: Frank.Li@nxp.com,
	brgl@bgdev.pl,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	krzk+dt@kernel.org,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
Date: Thu, 30 May 2024 12:54:24 -0400
Message-Id: <20240530165424.3173673-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:d3::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0d5cf3-c125-4529-6d31-08dc80c93201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YR1dihWCJh5WhgUElmEagi0F6gc0x9kL9iZ3dwxbLHAI16Xqa0mFi2lhU6QY?=
 =?us-ascii?Q?TtXBqAfhCLNUc7PI8qpgaHHrOxkhIuOptonQHqHGBLT9k7ApjorpJeTP92vz?=
 =?us-ascii?Q?+J+o0Srl78dHm3GUDEl5i8qZCFMVPZ+8w5qSn2kAQV4xaz/yj7JhibuvlDNC?=
 =?us-ascii?Q?GJh2yOY8ldl3c80RqkE8e0TmzWjJ15M201y4R+gFHzn7ZQGFGHeg1QI3orLb?=
 =?us-ascii?Q?7FpjJ0CZQtwT2JHw37E3p75DHq9x/81Z/WkZLJIPesgzu1jlG13z0RACrRrL?=
 =?us-ascii?Q?42o0uezds+CDmcoQRNqQUNsKZ/ajALkQJFdnhHI0lOYgckP8eU6z16FiXv5i?=
 =?us-ascii?Q?5JHSOttuVi3xLTyCcxlCj2je/K0fwNcX7cGEyxLSOVmOmJRIII1EpwcDEwWG?=
 =?us-ascii?Q?bkXETx55ktu2TRryRM4Eh2y8+EDFkSnh5Anx3N0G5bkLPp+Xl3gHQpZG2Djw?=
 =?us-ascii?Q?qlYx7iT9h0WCmaqmMg5Bhp/KVfkH7N+J9GVPPAjV+Thi6Iz6qrmKPsw27jFZ?=
 =?us-ascii?Q?9qVIbiTRPiGigDl5W1lUr1R1AZ0E2CTbsRfx3ruNuC/bHg2ra+nE2tBCQDvB?=
 =?us-ascii?Q?EUjoXDkU2MgosCHOqvNJzu3Asm8NpnU8DuK9KhK0Rz/O+kmvW2F+eijqNELj?=
 =?us-ascii?Q?zWD3Qwk5c/oVoYg2S6STiJQih9WWV19rPj5JvDKrjF9PjORjwcEyuwRdyRTi?=
 =?us-ascii?Q?5tgihXMgB5UkEkLyUCX4O4NzJbdKBIiM/5MFFz7IpRCYmw8jQ/E72s4DI0TU?=
 =?us-ascii?Q?N1aBWgglJOY8aefWK6GMpSp1d0gf0lDH5tWi4y3GqDZ5U9aSsLUR7XlHcZ5r?=
 =?us-ascii?Q?DLseUo3QvroMiosoU8XXeyYeLjhatHC98eBol7ohDlFiMS3gbAuwWNenVnux?=
 =?us-ascii?Q?9qgdz1VIzjHXAQ9/ofNSZvCPPo0IDXKycuxPSUjqpQdR9HMEU3WSuZ9unbT7?=
 =?us-ascii?Q?93zT4sPOK/dlbLQhlA+Vzt/AFPnj7Kmo2OFDmzC1b+DBOCdSMWA8QTg/sAU5?=
 =?us-ascii?Q?Q/vcyUr/bm71rH909sFqusnFT+qO9iwpI8umVfB9BHA7Aku6ZGJ8olyR5scH?=
 =?us-ascii?Q?IeWTrdp0iVaFZ9sKv9mT/kLhuETOBIWqd9OkzZHGHbxoJqdIyMuDkV/lcBid?=
 =?us-ascii?Q?NhQCrR/WM4wOU1yg0/69+tpe3Y2sNGL2LhIz94BwfOqAZWRDqoIWxjvr0jcD?=
 =?us-ascii?Q?ZqP+5doKvamHZzFT4pJ3woefOYJUogRhIQldnJW/D02Z6iEDbB42YnyS2QXX?=
 =?us-ascii?Q?WwHl5EBrxMy9MfN/rczV2m+ZLvGtpj+YU9xGUGkYKXZdQBhPfSY5ninlKigH?=
 =?us-ascii?Q?KxM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xs1DGavOiE5HH5e7vUlsHm7kTWWICXDrQgzpKTbOXt4UXJMBtRrGWTQL/hEA?=
 =?us-ascii?Q?M/muUi9aKrNEKQDZzs1rW+1XgSdXsgpQBYzblcUV5U5/dvAwQbOMnLw77yNQ?=
 =?us-ascii?Q?HiIDBSK3/X45fVuPvcKmdaiq2deFkuwnyVPWlky6WmLAaRzzKvMtmQzME0pq?=
 =?us-ascii?Q?0e5kQrd/tTE0F/RpvHweaKMj8xhDeRb07oxqqFDfXKh1WH077RFmMIm02agR?=
 =?us-ascii?Q?XAPtizNTugoRmGOuHnFVP5ZC8HvdaEVNtEqsECcF0iBpavpcyXRQIFFszYPS?=
 =?us-ascii?Q?L9UZTte8foAg9bEuOZz78unk+Pd01y9NRDDK6HYzhfnpoXRy/v99T7eZEkp3?=
 =?us-ascii?Q?QkbSNYCOKrt2zD/f1NYXO0HTaeYCNPc6a/xBevAe5MnjrB0n6CUKrV4Oymdt?=
 =?us-ascii?Q?VqKeCL9nUselTOpHBraH0NM4hsBKtZ7OeW91HPJvbYOGMKhjVvkP7MO46IOh?=
 =?us-ascii?Q?SNzH9jJgUwC01wD9WQ8tT22aF93taBI4N8KZ8yfiSwKWKdqU9rKCacy52hSh?=
 =?us-ascii?Q?uEifxfN7dwiS0ERHThmCfX+wZz+EudFF818ssqlDfPe8R51Y5+64GiYwS1hD?=
 =?us-ascii?Q?HBzTlFvQ00Nnb6yRB43ky8Bn06GRxEr7xocy5RmvS8+EtTyDzQvVLS50ZsAH?=
 =?us-ascii?Q?jy3P3VYH32bftCt6oeA+bSNugzCfVgySAXJ/XMsEUQxScUmPQEPJFZ1H2Zs8?=
 =?us-ascii?Q?swzNCXoLGdTvBUmnjpeZAcnbNBHVo0t4VZP4UlORgw4I84eOgur7l3hiM+6q?=
 =?us-ascii?Q?l/H1lM0HFoJBad9LpUylaAOdx1qKBzqJ272YNpzvljY9YgnvgSNcfEzt3NdI?=
 =?us-ascii?Q?Rr1kLjsJy17KyP9gwFnCPEuF5pGtc/dz6XHUnPjliRLcmOSFYhZvBDTS9g4L?=
 =?us-ascii?Q?xVuaF5aOE/90AyfTgl9xUNesNFQJZDm17ESz6jLBnlPsDjVNgillWDugqYwf?=
 =?us-ascii?Q?NzFstZbUcWhRkQ9aKVBVIdO0ABumXgC1Jnf7n05ogSQvWEoGIMq5iAv/1L40?=
 =?us-ascii?Q?T6gSP+cgp+AROgiP++ogOEQz7aYe0+Vupa8m/NIyYUzQqEH+hxkWDHQME8i3?=
 =?us-ascii?Q?YPscRwi1BjcY0djJ2U4EnlOp2i5hcqP5okKbSFinPdcoAY0yMbjxEP3O98u4?=
 =?us-ascii?Q?HcH/E0sTtMuxv853SOR5Zeer07rgWCimEpIP1QPVu9XjOOfp4DJ+Ym/4B1c5?=
 =?us-ascii?Q?PAim/wPb9Yv8CffBSodUsY2ym7YZ+GMcs7UOJvgj9I/GI4pxdHDqwfPRwKZs?=
 =?us-ascii?Q?fS8fjeEWK5fvFGcWiW79U6lfxnhEvp1dlAnQNnEHbYxRMs6jO6S+j+qXpu8p?=
 =?us-ascii?Q?pXxF2AinMpXeuXxVyGgHGwBFIz/RgHqa274fWGPfrTQcbu1nLfueiDVy3KdA?=
 =?us-ascii?Q?yRlYGAN4SSCRvzoIL99rozNhGCya0Rj/9IYLNxCyszi2lJrCF4+hTex0A1OE?=
 =?us-ascii?Q?mRFH39yzetwYAH16Wg31QKPhdQk1Bkd8w1/Nef9hxr6i6WEbxXDW2/MIHb8V?=
 =?us-ascii?Q?++CUpCTCv4nu4U8K54MkHHWkpKho3OUnSGSzXk7XTBR7ecsQy6cUIhQWe6k2?=
 =?us-ascii?Q?MeqNkYzih2mKUhPDFdOlskfTQSg1xo/1pR+48xY+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0d5cf3-c125-4529-6d31-08dc80c93201
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 16:54:39.6511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LryE0VQ2zqmC+rFUAvTwvpqrSDEaKtRnxyxp1bVhdaOpcxkvhQhHaYgEBgsdguxSs5dKLbCpLOKoHEVeJ5mKyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653

Convert binding doc from txt to yaml.

Remove redundated "gpio1: gpio@2300000" example.
Add gpio-controller at example "gpio@1100".

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
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
index 0000000000000..adc955679d066
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


