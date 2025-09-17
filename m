Return-Path: <linux-gpio+bounces-26289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C5B7E5E9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0490B3AE77A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00EB32E2D0;
	Wed, 17 Sep 2025 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lqegtn5k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082E32D5A0;
	Wed, 17 Sep 2025 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099900; cv=fail; b=JBy/rw9omarVRLswYahThchjvTm9I/NKZWpkg/gcQUP5ezNQThMsMMvXTHj9FkTCs9EV4m2UfE/8trOKN1BCzmqQZ/77HdAW5zFFzg9IfrYFvRXZy7QZ1DUHwC5cKiymoef9fcXVrTJ8l1lzgUz2eqYA7uBerDhkbzpKCL++Zzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099900; c=relaxed/simple;
	bh=1odd+s60q1ta0FwuUIYJH1bc4ea8Ds+Wenj+OC1frvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oEkKVHPbSljj06XyZw82SVqyPE3qtCFcK2OlFJ34ZZQjlu0kpD2rcNGbHWs3SY58kOgB3p4WuIgZViXrdC23//d4Gci1PQHPTbWT+VA4jtX6w9BxJKZykdKB1edNuzka+jSzkSs7bwSwMiWSpuzNWdFxeQrtbEVqQ3KZRYVmL3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lqegtn5k; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIrOTlKK6Ny04ubBOBlz8FjRSWPhLxNupBQkJ3VX7UXVq46L2LQpqDr5welXI//lNndNMgPVr4G0iMC2igxCrRV+aeNKJYcBMUETH0Pu+/R+gQJpoZdwO5bcu2csmQs7cAXl2DzzapzmaYUzVKVsyJnIXLRNFrbkWwOwy5xukeBpwIJpNOlF3IWiEDmyN1rzH22k6DZduWTjVULnRmaKiJpsz/NJ7RREkGU0TR+OYj81Rc+sodbmHcwUS8q4FeWpRdGGA9pqlbi/oG1YaYmA9DObXJs7/z/GLw1PrvOUEgmeD0KjFqFsddN98220i4qgrJ7hUApuZifGn7kF8q4TYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YtTOxM71dDhUxbBOOnesurE6c/xIfRcPapj0IZYvJ8=;
 b=rc03ZC9QcfVRPj5xgDftm/+FNITkXbL3/LfHoe9lRSn8aBCF0TNdmaCfHIN5HyIgFLcZzFhmEW63TFfCYv8pWyTp/q6OJJ2ddNj/UuAHC2zN6L8J013RwZcz3kXMh35nFNe9ztWh72KhWVCX9B3+9jAelxqM2/VsIau5ccRH+8Iayphp2J0XqADPk42Ti9TFxdK7ii1O+HbBvHNypDXNm0Lm6Wt1/8dMENb38Imv+XUbn/R0CXM+2ZpagMno4hbyMBPc+hEjmR7CMdc+XAv3n4lz4Ky85ZhxJO6OUiA+8G27CGLRSu6xv+zhctgkBucKf8CnxdQ+pjnUlH+nPgKdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YtTOxM71dDhUxbBOOnesurE6c/xIfRcPapj0IZYvJ8=;
 b=lqegtn5kgsSoJnwycK9UBInaxSRWvr/Lr0bXuHu7nL2K537mKanYM4183KRKEWyaxzooGWUpeQ4k31B+2EkGufIJ815hfnrDQYfqDtsz612iSCM5i5tzrcxgr5RD7/aBM90Jqjq4+PiJG+DPOU7yIypL4ulAjp7tAPip6He3XkSp1F5dw1aDVFq0gt6bi8eKrwv3gjuJAsj1mC+mZqyOR/0SUruTSSBKnOZykE1JMoW5xHlhJjB59hlUaTbZTx2+hSyYpVoXQheCAsH9x8oEhcAQ1F/oj6cvJNvIDBguJcrnllM+pgfgxmozLHQyEBxPkgiVkZNv+Ph874KMkq9jZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:04:54 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:04:54 +0000
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
Subject: [PATCH v3 02/10] dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
Date: Wed, 17 Sep 2025 12:04:14 +0300
Message-Id: <20250917090422.870033-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0107.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::48) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: c52c6f10-33d3-49c2-a7b0-08ddf5c94406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/iWIQ71HQNvagMNxixL/PPTNPY1DZK2IUQRosXVtRe9fpEnR4E9DhyPFfKJ4?=
 =?us-ascii?Q?GxbcwXoOWwVnbJELL4mJX7y4PLiiyPwAax/XQQdECY8VgySXj+BSr8axf2jb?=
 =?us-ascii?Q?Ut+6dKQIbL8+3Tle8KmO6joUJWbMK92DWaZkHosgeUA1YJS0UgrEpkeAqYY0?=
 =?us-ascii?Q?usG9g81cX0BHeD9Larkv+sxjsxD/PQ8W6dlSNHqVIRpA8qfYUferysE6g8mj?=
 =?us-ascii?Q?9OvXlmz/9TEwRFVUNtxzmGQ3x5AkGEtZAGEVWuajzxIkSJfn+QzIbBSyaoQh?=
 =?us-ascii?Q?QV3XWYhZDVfuRw0cRzKKtgbhMQErKZuyBK3/8o9Xs7RirA6eqpdf279TQOzg?=
 =?us-ascii?Q?uVRFtFM2Q6wsjuMsw0g236sjj5Y2lzYLUZPnlpKWCSmDiVNpo7+U8Wmv30jW?=
 =?us-ascii?Q?VRikhrVng5q9DXugOQe06U4BkiAApwyMW20nFdFCA9ZKyLw3t4ekwEjcBt5i?=
 =?us-ascii?Q?v+RXSlPwQ8pYFop0zfOlGdw5kOEfnQwFEoTkLCuhiUy9vp+MI/pLyu9b2Gyj?=
 =?us-ascii?Q?3KaqihgV4OVKLglBr01vxh7p8FptVaHm8x4qzgrnMjUg6SVJidN4rPt7eOYo?=
 =?us-ascii?Q?iPF3xlszaRGedMQSp3E8PGjPMklzZvBnt5T3YATKR4MlqHkqSwpzbP8Nz1/d?=
 =?us-ascii?Q?O7o0nof5E+P54djSo0Y0mpxs89hDSrJ8mSfAmQ5sdm8Z5ExBKmRv/TIJz5SR?=
 =?us-ascii?Q?LCBl0AUcpjIgsGVWKcfU/kMJoJ6Nqgft/ZLjD9c0vqgK1+7p7Xk6uHKpMnHw?=
 =?us-ascii?Q?i3BRXBAfNsGkpHkRFRW3O6/908FQdAI3+HLwdy4kx/aPwyx7varMO2DlVG8c?=
 =?us-ascii?Q?iAFcf1PQaUS69bQ6Shd0PkmWHqlpTlrh1Diw6SpdUfKfVKbjeNcGqPzi0N1E?=
 =?us-ascii?Q?FOMwxgutQV4AiP9Ek4nBLE86yzR+juU5xo7MWxVGW1t9H0QfMIybQRpIgY0G?=
 =?us-ascii?Q?iYOkGDcNEfcoch2VTXLmBGSi8WLJrrFtKSgegNR5P8ijrwIBuaqAtT4uWC7n?=
 =?us-ascii?Q?tQmctjw73iIJ4nCtC6enNkGcSf6dOWyfK51l64eBiSaogMir4lgUgAUSdm8r?=
 =?us-ascii?Q?yeblaLbwjwXwoTqS9acQvJqp3hUPAwZaiIFl4/ilkfMT+3reM0EkgMTC4WD6?=
 =?us-ascii?Q?qf7drtlAuafbsXBYlAedGSxiZLCReASIfVZQoYqv9zKDS7CwtGOu9TTX9vlk?=
 =?us-ascii?Q?TBX8HnRB9xFMYOmvKccqOzaTKtD3aLdAnc9QSSVk7JXm2/m5cCYbTuutj34m?=
 =?us-ascii?Q?qL0NZNXGKpBUitl8jvTrZLbOJNJeEtO4Zp/ELQf41nZ95G0NyuDPByEdrstO?=
 =?us-ascii?Q?Z9DFw2ZcjhsH2pl/g8Rsyu60ttRwrDHXZ7yOYm6OlZFxwkw0jMHu/yPrX1Qa?=
 =?us-ascii?Q?F3Oo0EdOasib3lRZuQsaP0xy27GLA5nStZRBKFRPuBrDLdAU6MpK+FzUvlQy?=
 =?us-ascii?Q?/vm3Cz3mR8KvLv0UIvfTYwjdzqulniSy0unFaL+8kx6iu5GoHdqHCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zwrxARPd23zw9OxblZA9SSfZeGM4JevMaP6LyYTNqJhvjYBvzgC8UVCXV7bt?=
 =?us-ascii?Q?sQuKT1uUcL47TZbEymPL2h5RKasDeP3kI4+2maQOxKksSuBaCBoVcxKAg9ze?=
 =?us-ascii?Q?tx9G9BOzPsUqoblODqrpupBTfDYv+GoUWrVdW7dsyp8mSRY9B+GdR8dV125Z?=
 =?us-ascii?Q?YMGYg0BC7v9C4jrbRHHhP5xD/mpmx6OAF9jroESM05E5TxSXR/9p5dv3Sv4c?=
 =?us-ascii?Q?gtvDQxe820iCSR9/TiyI0ufpRTtRMXjlzvDysbTKBDK30eGbB3aqpuG3X1Lk?=
 =?us-ascii?Q?9MoMDhttxxeaUtdi/yGmn8UeWhVrYuSV4kcG1dgPApck1PqemAzI6her3kIt?=
 =?us-ascii?Q?qLSjVQJzFNMY8UN3SwkuJWQeaGNSVsDBk6cKO0l8CmdHy0/Se5bVGko5AZ9R?=
 =?us-ascii?Q?2o1+gM277N4sdiS9iLa9zRC/6nG+ER9Ycsm4six747n9nnH2bRW0S7bhYdKP?=
 =?us-ascii?Q?P4gcq8ZXFzQ0wCyri040YTr67OQpyq0EAawA36GuWWKbj4vDJYUmOlp5NWxt?=
 =?us-ascii?Q?v1N9gNpq54jzffmuiuvMyVKt5bLu9hfPiERKmRu/ACj+iXnhPxPRwro416X6?=
 =?us-ascii?Q?A9wvP4KMu+egmkSM1X6m5cCPwptyhcdf7asjFAUODaqkw19CLMDFD9t5IaVw?=
 =?us-ascii?Q?atYfGpEFAxshnJ/tY/niL/pYvZqUko851EJACZoDFVyabCi2kGkZ5ZZl7+Vj?=
 =?us-ascii?Q?poQDlmG5Slpy/egJetd+tZLGTYjRVl6jc8QdN9wm42PJ/yGbYebmY4q6zNMo?=
 =?us-ascii?Q?ds+gTeB+Aw6XG0mBwTDn5uu/PIZasfMU5tbyqMJLyqiDI4K2WcPNYv2HZfsL?=
 =?us-ascii?Q?qQV4UbwyJH8n3GGWqKrRy49VYNPdQzYnZj/Ou0L9+c/peq2lBdMg78xKb+Zg?=
 =?us-ascii?Q?D/ClnyhLaR1wd8mosvER0e5OA6vC5w5JMf7eBMGfXUM7FZxEF73M/7/OpVOK?=
 =?us-ascii?Q?8uOfk72aTNEEf6lXoQnkCgF6NpR2nlkA0VuY0WICTL4+gE7zBDalk/LnEFKE?=
 =?us-ascii?Q?TNtuUYXtO8q5oldGzeVyiP41CErhL2tgyhAfajO3cHBFAd75icadhxtZrGIc?=
 =?us-ascii?Q?NOCKudWrSTYqY8uMcsic1cQVjwNRfxWqoDFN0BLnIMCOc9wbRLxOrayD4OZ1?=
 =?us-ascii?Q?Ee1CUlrqsF9YKk/VErVaRxPLrjAK2UFR8h3iCe7u0U130Z+NFIBR/zFezLbA?=
 =?us-ascii?Q?3Me96EP4kTyfigsRt8SMPzFO3jhEXIkXqeTJRkB7DGOEr81Il+6HgKqfGjF4?=
 =?us-ascii?Q?rWdNSFQewV5F4oSQIUNvyL3KzcjlQpixOSmbYe5zljwytXTCs9DC0bdFlPQr?=
 =?us-ascii?Q?GgvbDUEPJ8fSAHruCCZHwaVc6hQHO3soOe4oMxjP/81eSLBRZR0/gM6qdtHY?=
 =?us-ascii?Q?Cyl13lUsgjiLmb+ZDm37Yn8RMCPJtvfZ7u/7gBlwCkCpdn+J5dBesdGh7TFF?=
 =?us-ascii?Q?vK0xby1SvLJ+IMCyzevsFZJwDWw1qbkN2chi/K66KMgJXL6dhMh63keca2sI?=
 =?us-ascii?Q?iebaP/FMD2wRDAx0gubjfapoBQY8jlcto+X+6Jt1Mx0leJJnN3dlgmcjwAN0?=
 =?us-ascii?Q?9txKgwPYPtGE0YS624Skp2T/b/EvHIkK/Wd+AGbs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52c6f10-33d3-49c2-a7b0-08ddf5c94406
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:04:53.8745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHF8rBg/K5u18YOnVIBOwf7JNnqq3vUCVuuA6vuY0lF455RJaN9GsFAe2Hu+vPGG42zQvvkh+9V5KNy+5WppIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.

Since the register map exposed by the LX2160ARDB's FPGA also contains
two GPIO controllers, accept the necessary GPIO pattern property.
At the same time, add the #address-cells and #size-cells properties as
valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
addressable.

This is necessary because when defining child devices such as the GPIO
controller described in the added example, the child device needs a the
reg property to properly identify its register location in the parent
I2C device address space.

Impose this restriction for the new compatible through an if-statement.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Enforce a unit address on the child gpios nodes (remove the ?)
- Enforce the use of unit addresses by having #address-size and
  #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
Changes in v3:
- Replace the trivial-gpio reference with an explicit mention of the
  accepted child gpio compatible.
- Reword the commit message.
- Add the 'else' case to the if statement.

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
index 28b37772fb65..e889dac052e7 100644
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
@@ -32,10 +39,37 @@ properties:
   mux-controller:
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          enum:
+            - fsl,lx2160ardb-fpga-gpio-sfp
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
+    else:
+      properties:
+        "#address-cells": false
+        "#size-cells": false
+
 additionalProperties: false
 
 examples:
@@ -68,3 +102,27 @@ examples:
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


