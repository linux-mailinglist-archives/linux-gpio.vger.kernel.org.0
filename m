Return-Path: <linux-gpio+bounces-26159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA1B57AF0
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52B611AA0EDB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4DA30DD17;
	Mon, 15 Sep 2025 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mfH3Mywg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C1F30CD9E;
	Mon, 15 Sep 2025 12:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939100; cv=fail; b=blq97uIQVKtj9pUS0GXeC/73f344TUrbVqUbc7AC4UWV3+1nUMYIYCdYVJjvPttp75KhH2kzjiPRAMkkO4qkbQaXdKpNXJi28GSjCNcMQ7u/wOmJKNYKfjFN2YmR0opoEa8XTqBuAbE4sWvUFKjbyTbCwbeu4TbPqTta0kNTt28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939100; c=relaxed/simple;
	bh=m5kFzZ61MLwEQprJ3/ZbKVdYru3SF1jxhFM3GKkgPE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q8P/YQ1Li7pnDuiVc86cFpGF86hCieUlh+ttm4CmSErUpHQF2vQ/9yKcpShjHpaXerv/EOrcO8wx8N+RoHUZzjsbMACAdU+5j7fomFfp1IoyqrFu3Wz/BLQU9Kbf4ZsXAdPfDGv9yBKLn5f+sTPCoq2g70Ug/wbC6mwrBH5RPDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mfH3Mywg; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oN/H1VOt6CT89m9zBDL9IZr7VUD6bYU1uBCRwlHvrjSx2Rzz9UTu/PPPSsdokBe6SA18Nr1LaNnKUkpj6p3ING0HqEc1CMGwTqqZQc9DK0CZq4U3nkRDm8fjd9miHdogdd4t4cxCoDIx4n6aa2jVry/93uh9DxjqaitItuoXvoak5abk/Xiwx9ziPFue849HXuw+qSesRtzgtS6BK8ozZsGh8Yh677i+6PmuXMnp/HmctCNDpABtQ8P9Q/jn95/nJ5sdahtIlAy5pOzosTuCIZNWMA7RrJ8kddfXYo2nYhwuJltC2GIMTwag8ztVkMx8xvpV70rNaR4+SQdFcGau+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4hAL3bOpHSu+eDsL/K1wR0a9Pdi5RM9uzzns9vh6pQ=;
 b=v5NfU5E6aUEWowotmZdYn8+jO52PmTcIwZWJpFVnyJQb4gBjta1pbL8b644mbTOi0focxZhCr/p88aMseSivu0t5TPeldY+31VgZrmXyHgNLPo4VOU8flFFrPdsrBk9Ljnyu60YiNHUgTgQoTOh0RPgJQ4lWAG4+8moUeT1JIX3hsYfUDRwjja9uBPCl9eoW8nJ4PrL5r6355frP/0SgbYzvBIPZpjtVoQ0Vv9bQV8yCPDZCVcrk3peWuuA2dUJBv+5AY53eSV0U6Xb35FEzPk4rNXAAfwcMcvCZcoy3JLHh4mHDN6YK7814erWh3kZo08HSbFnUJ1kKIFXiGNrqOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4hAL3bOpHSu+eDsL/K1wR0a9Pdi5RM9uzzns9vh6pQ=;
 b=mfH3MywguEWIs4tEjMqdPUtKopGoOs4/aHJS0bzGI7RI05J5TL/+ScQPrpmuT85qRRgz7zGU1KqHnUjS4dtDQIZBdAazfcgDPc9JLAQy9NxDBE2NxzxT7zjwuhSXijVMfuOCnmgoo+wDYjuLxKzLB8CCY/CJcYYZ0n7dcYVLs7KiLKqJS+7XtpCtpSI4Z/rOW7MqNYTE/HdTTgpBtTgvkVb/5e+7ZxFx8N5dDeA0TW4KLEe3T7AFgbG9cWWgBygskL+BFdES9Noc/SDP6CxZm7u0zQXUEhXLjyxurtfy+9Zjupv+y3D0TMf+zZnb7Y9J/XSf8sEPs0fDc+ow5UK+WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS4PR04MB9291.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Mon, 15 Sep
 2025 12:24:53 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:24:53 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support to also cover the LX2160ARDB FPGA
Date: Mon, 15 Sep 2025 15:23:47 +0300
Message-Id: <20250915122354.217720-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::15) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS4PR04MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: b0439277-759d-4673-4a1d-08ddf452df50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PxrgP/O/y7jo11fkNONB0pKAaJqPg6g0n3VQGAoraIwXo5lts/TrFk8lchgk?=
 =?us-ascii?Q?cMOkvtR03RtI0OfK1Wyd9BcuVmESXSTbfE+/7o9A6RKODLQBYuvcEmm6kUcS?=
 =?us-ascii?Q?bZx3kgeOZJWWGZm0AN6ke/Bw6nutfVEhYCLUHGvYHH2pyFjIO9x7GxBOjov6?=
 =?us-ascii?Q?+yGmSBcdFIvB6SlHJXmuox8alywqQAN6R6qgDN1nzQfW8sm1qlDiJHLHt8tD?=
 =?us-ascii?Q?A5taBSJHYFLLbO7gAfe4zYNjxLt7QL9dVakjdbEDndni8gyKtpKogOiOnoeF?=
 =?us-ascii?Q?tV7zqqS9zxjVzbvgt3GxjJzhkM2/SLLBh6S8VtT1BRDe5fw9O2b92oEmTq9E?=
 =?us-ascii?Q?IC2eSP4pps+b0LYvJKWAanxH9Vlk7LoCHZ3GgwHh/5SuPGZky1bhZB5o13C0?=
 =?us-ascii?Q?J0EleyQdbPi/qABN6rLZMTgBqtZMml09XtZ8lOWIXXhzKZp6PCt4IXdHnLe5?=
 =?us-ascii?Q?MLju8SAHxH/u13w3cpBaAMsqboqBX1Z6Rb6FpexGS8Ui+VeSvRu1SZBGPw8p?=
 =?us-ascii?Q?ZYjG7oMnlr5AbJFt6w/D87LaN5RJ1kvccodkVwOmBipcBP2pUZOhhkbI+vc5?=
 =?us-ascii?Q?5Rsg0FC3L+aQ71li6iwyzdH6Umy0T4O4GOlgbfXPJ35ca7xdfqGJUfHgBxfx?=
 =?us-ascii?Q?yZQLFnbdCLwX+GA0Ml1gazl7pMJxwtTGb08ml5+hfFU71mfbKlqNqfk2ze0H?=
 =?us-ascii?Q?vlMsWy/nJY6VEURxi6rCsTKt6l77pjcv1x+q0Wl9NfkPLRmZrEUZBToC1f+O?=
 =?us-ascii?Q?81UbntmNi2R/aVNcMkdXkJy0vqYSe7nIMUrHpYscqMAY/KBkpDx2VRNl0WTG?=
 =?us-ascii?Q?4/TV2cspQhGVieq9VDY0RjFsb1XALxxcMUvRP9Z9OqiPlk8hRE3e2ojaqxkr?=
 =?us-ascii?Q?8BTOrxBKef0EieRM99m7fsbs6vzcUEoszlVeiR7U/CM5Exch8t71CawGXw+r?=
 =?us-ascii?Q?mD5/Gc1G6mjBDnDDHgbDLyCdEBFDj236/2sm+KCbC74bLu06sRwBVqGpzG7K?=
 =?us-ascii?Q?QSlZzy3d01leQ+I+hNvVejHeAwfM23xiSHt9vVharTig/zxBzFviPTYptrHZ?=
 =?us-ascii?Q?l1IWOc/4X+nRZPXI/BSmFhwY64zfHSNoXJd1sGteKtGRWfeXcr0qLtIImXvc?=
 =?us-ascii?Q?fNiYgSLHGK06SReuBaOdDkD+G5d6n70NBgFISKB2b7igbA5zAo1rKHQ8Aao8?=
 =?us-ascii?Q?yR4cgEgenVlIhj7ZHxDV3sN4uO4wNEx1js83lSCw1M+4bdrqIpMhr7M3LXxZ?=
 =?us-ascii?Q?CijAn9gT3L9cQ/l5i4tvD5ucTjmXpr7UXoSa2/ee5qPHoWsD3mnjIUTgJ9nQ?=
 =?us-ascii?Q?JBg/ISF1w/cIahDsHBPiu8/PmzB2toGQnnKNHmA6q9oQTsxaaCMb3BYJ5BE1?=
 =?us-ascii?Q?cqg6m5FVyz++aAffZrcHrj5bNR44r/uKkLWZAX9W4D1vPh+SHOCrvYti1u6/?=
 =?us-ascii?Q?JmPcxygHJnfOs8Bgp7NBryKGavy57vreO3rAITh+vJJnlZJdd4ScwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fuY1PNvpRJ/jpqbEBJOW4+4Ozb4HvHEnzSKWxSoZNCokmxMo8GS0/4EBhMTr?=
 =?us-ascii?Q?vrtT29FeYvQ/hwyo/Dpay9aGB4Oi0oA0raP7UetXfc14O/VesT4A0rYSk+k+?=
 =?us-ascii?Q?aUFMK0y7v3elXopndtwvl6iq69o4dWqyaN+Jl9Gl68UH2fYO072CxlweliML?=
 =?us-ascii?Q?vLK2clSZcZGnwOUbJE0HRTXrF2nFMpauNB9VBvSXjxMPZqOc+Q8+w6RKOEh0?=
 =?us-ascii?Q?b8rC9D5WyXpmmvmmXOSYPZRTLGgt1fBlv7rEps0/av/eCz12uB4KZqlR44I1?=
 =?us-ascii?Q?f2UKrMtsFguvYQzI0AXh03NFN9op4ldlSuSVQmlpoMPt3oVhnFA17DMVnXOf?=
 =?us-ascii?Q?2e0yr8mSobRBpMhDYeAyOQaeaPx+8+TPFPLFRjtYhDsOWcXr+Ex8TRJUfWMP?=
 =?us-ascii?Q?MwJ6iLFw1kUll7qiBebfBIYyES2o0i36CB7enF09OWge9uK35kYub6Jn9Jfl?=
 =?us-ascii?Q?uTb+/6q7m82sxXuLKuE7hv9du991Eesd+2CBmjTqIAv9VNrtzAw0igTKLEqm?=
 =?us-ascii?Q?NRA/ih5YIC4jd3mZlL7N6iGoj8jysvwDGYsle/TLnXyNYGVM5qJycHN+/Dyv?=
 =?us-ascii?Q?wcCRO6oq9oLF5q4UdhyMm/qiS/Oxstu94YdX3siDYzvQJ2RS1JWVG2+haDk9?=
 =?us-ascii?Q?9aXxgWK2BjqsDb+0iy1DaxhC8w10HfnyKRHQm/9fL5+xp983AG8YrOBBIOMG?=
 =?us-ascii?Q?CFGIuR7NFqGR2sIddUYgUsob2qy1ymb3uwbPYOHWJO9MUi65DDaGh47+diM/?=
 =?us-ascii?Q?WQDWPxHAhMrlDGY8YqESfK/9g7fE0O6fWhvJF+pTBTQh30aimyD5TccOiM+q?=
 =?us-ascii?Q?ZE/fWH5PpBsMTnN2zG/w01aDbuaNdsIJmFEy/LAZ7gMZ956eXUyRo//Cvbqk?=
 =?us-ascii?Q?xusAOAmMk5WRstgxPr4GRsxvirSDO7foO67OITD5ZJjEaMbOvBWdOmZ4QbQI?=
 =?us-ascii?Q?AimH5zi9usQHLoGKnSAQhGJ6F1hhTFTQ01pbZzDPfKur2lPUagZkvEGw42i8?=
 =?us-ascii?Q?VbVYGvwDbaUiJR5oN6d2ZOPPMCh2AAmr8Il06337KPZ8lhUCdZVMTVXH4Thy?=
 =?us-ascii?Q?MXkkxwxLQy37SDA+R2LiOBLwmTcF5zje5QB7zE+wPtrezTUckpokK67YkJCF?=
 =?us-ascii?Q?GjLG3A4G6livAkNeapbTEdFcNTHVVRloJHIbhNn1L2MzKLS6OGGxmxgM5DdN?=
 =?us-ascii?Q?XcmJ+dKqk/B1qZxKCbm0RFYzjfMDMdQv4NqBwpfIDwu9ZqKtzm3UL6lLU8wF?=
 =?us-ascii?Q?SA/mQfixt4K/7s9O7RxIOAcWC4nKe6tcHRV1MEhTBmwnm8q0EVzklgl1hGJe?=
 =?us-ascii?Q?6wItkNNI4rxJUvvxlqZR1FKZx6p/Jh6MnIAxxnIej3WM20QUW20EgB0ezXqH?=
 =?us-ascii?Q?EF1VlvlfUQxk4hTCPaSnaQ1A8YtrEkZ7eQSDwtcMfUnrt4FDfx0nMYLwYnVz?=
 =?us-ascii?Q?suj+2fP95rMA1DtzXFyNhxOq5G4OuPf1I+lvTXILry9/IZ9u8r8qdME04z9Y?=
 =?us-ascii?Q?1f9UBy7UTxvwhUDBrV1i0HawaE0ic6v6Cgr2/KS24buzh387bOPVCw1w/eCh?=
 =?us-ascii?Q?xxlkGjISQ5LkxkTGEX9ywVpSF+ZGA6UatKnS82vP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0439277-759d-4673-4a1d-08ddf452df50
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:24:52.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1uh8yrcT1tVPY/XacJMSkO6grraZgnS0Lb8AxiD4s8WGHPsn7et+nYvWPeAbtENoqK2rCFGAXXnlt0EkqljnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9291

Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.

Since the register map exposed by the LX2160ARDB's FPGA also contains
two GPIO controllers, accept the necessary GPIO pattern property.
At the same time, add the #address-cells and #size-cells properties as
valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
addressable.

This is needed because when defining child devices such as the GPIO
controller described in the added example, the child device needs a the
reg property to properly identify its register location.
Impose this restriction for the new compatible through an if-statement.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Enforce a unit address on the child gpios nodes (remove the ?)
- Enforce the use of unit addresses by having #address-size and
  #size-cells only for the newly added fsl,lx2160ardb-fpga compatible

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
index 28b37772fb65..da21d0defa04 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
@@ -22,6 +22,13 @@ properties:
               - fsl,lx2160aqds-fpga
           - const: fsl,fpga-qixis-i2c
           - const: simple-mfd
+      - const: fsl,lx2160ardb-fpga
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
 
   interrupts:
     maxItems: 1
@@ -32,10 +39,26 @@ properties:
   mux-controller:
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    $ref: /schemas/gpio/trivial-gpio.yaml
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,lx2160ardb-fpga
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+
 additionalProperties: false
 
 examples:
@@ -68,3 +91,27 @@ examples:
         };
     };
 
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        board-control@66 {
+            compatible = "fsl,lx2160ardb-fpga";
+            reg = <0x66>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio@19 {
+                compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+                reg = <0x19>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-line-names =
+                    "SFP2_TX_EN", "",
+                    "", "",
+                    "SFP2_RX_LOS", "SFP2_TX_FAULT",
+                    "", "SFP2_MOD_ABS";
+            };
+        };
+    };
-- 
2.25.1


