Return-Path: <linux-gpio+bounces-17169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 099E9A55277
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 18:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AD74175DDD
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 17:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB0D25C713;
	Thu,  6 Mar 2025 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YhMrkm2N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012010.outbound.protection.outlook.com [52.101.71.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBAC25C716;
	Thu,  6 Mar 2025 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280979; cv=fail; b=kmO1P322bnNyYISUj/erkGW84BwzUHPA1l9nV7IXNmo78y+lOyxeviQ80V5Khg4m/dUXucA6vlQlbuzlhquHFxwiPnGXzsDtykgMNOzLwHP5pG0qntXARIY6TrKPjvtEw+mw09scsIu42ubsVWmeoq9U7urnrdvzOygMpsIeZhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280979; c=relaxed/simple;
	bh=aWGttqxSGRsjPuCRviw0X6JKjthMStYB80LhfxTo/9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RPRsViWiPgRYtuKvoSG2lkAKYub5VqBIgO6QbUM+ThHaJEHQxchfc3kcgHSS/mnPZQ1EJy8CIrA3qr9u3JSyI1BesajpC4hPmu1LM194n12uK4ycXud/fl3AO1SbSfy7hF8C3uQK9cJ9oPciNNY3+V/MQj48YIx/+p2LGlTb8wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YhMrkm2N; arc=fail smtp.client-ip=52.101.71.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQkeJdKzvMaSmcjsjkl1XIlXVCAvkbkuUqZx/EzD1m1aQtYVi9LhDDq5eOTzrhwaYzJdserInyEx59iC6iR+gbfCmMYJgmekysMC6eMlryHU7D/n4Ou8BqnSTNVOQ1tmQ8XcPVUzCgulIUK+J4rHaKa8ofbpsXE2dBdIBER4nOzRa7+3HQQBoYBPVbugp8ok0+k0Q0yPhNchA0tM5j4cnXUtSSsNSHOD5bZa5ng55Dt5k1HCvkjUtfMACqBhsv2hjeTH6lPhEvN/ivyn4COcL7Rb54ST4FHLeOgyZc6jgWvdooZDmQX5lgbNMvSlDz1PFVakTbRNU1s4rYYvJIihiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW+ax6WcrSHPuTk6UT5XANBhpVGQ8bldBShkecuSs9k=;
 b=wwzPwsThBeyvAsxoiVpqVjBMH+xZKrBFPunj7FHjIjM3znt+n3Z8i1/SypMeEA6rp/GQV0pwr0N/FK1xrmdzGZUheTlvCnsjU7El7CLI4mNdCSlfNsLQbSjxmatK/R1nT7Zg1cZHkGmCku3kzDF0ZEfqXf+uXCi9p2zrD/97JaKgOWM+5ptB3kJHY4dXq9zUMdGYADpuim8l7aOB9ZLL0UntzzJLj03A1X9OBb4UeOuvAmH1zSKlt3Mo1nYo5jM4GRluzT92vB4rbOwevlbEKWdo7kk4cyevmTfAp+HdBIvMufDdDVJyFBgYZ83qDsS9FVCAoE4shLdUB7kUKGCtmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW+ax6WcrSHPuTk6UT5XANBhpVGQ8bldBShkecuSs9k=;
 b=YhMrkm2NqXiMP2CDhmT4i+HGAHQ/CWzJSJdIKK1pYZCO0nWEXKWtI5MdWoa3LF8a3cvAnp/CmsJktU+7m6iGnTiDuVyoeEUt0JabKcWHEIZj2crXaYAxKxTcmXSg4l2ChB4vM4hUJD/nj6s1IAeUbsttvKB2SWtS2WRBGJbZibb3AzN21yV3gDSyPRmNP80Ff4xtt9v9Yy5uZRRKvzft0xGnz3RytU0rIMpDEhagXCRLHC5CHTOTkzWPXMa66Y6vVjGQSKZzEt/PUSpsIhVXmDPzizAb8w5QwBwn5CBUGDWgo9K0Ynpj7CI4ifhT8S2LPNXgKtUuoHAgWJhYNarU4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9179.eurprd04.prod.outlook.com (2603:10a6:10:2f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 17:09:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 17:09:34 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Agner <stefan@agner.ch>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH] dt-bindings: gpio: vf610: Add i.MX94 support
Date: Thu,  6 Mar 2025 12:09:21 -0500
Message-Id: <20250306170921.241690-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a21553c-7e61-4038-16e2-08dd5cd1aad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?brpJjpKxfPTQN4zcQUfU+8dQUHv08D0GGBTTBx8GIIy7kRcUigeEuS2XIfHP?=
 =?us-ascii?Q?mrYQNB6Iq8NRn3gft7xlN0UhsMAcIoX7pCdI8HVFEKvcHxKsDZ7DX/U+9ura?=
 =?us-ascii?Q?4ISu7tVCiUluiuUrOfqC2DxV6MNXVhwZJltggzV9TuwVEJ8EQHXkb8tAeZvj?=
 =?us-ascii?Q?z3slXyTqIBLqO8Vi2BQOO/3jo9lcSI2Pmd9X+GlZ8wbwNKEnRXoiyuVn7Na+?=
 =?us-ascii?Q?sBAGAmuXGTqB/00f6uuoyUtPAcoBryj+Z8wBnHWppU0oUf5xZwI9oLEvopi5?=
 =?us-ascii?Q?4/DoQBJyohSTwEvW3sIp1dWA7AG6WGWpOXE9yjGhlt/nur+eAP1r1XOGXAAx?=
 =?us-ascii?Q?goj1gULv2XmBxThEYmXObdnc5h5d2WLcFEvckP1rzIczihKSDAfBzy/Fyt8/?=
 =?us-ascii?Q?4L345bdQRgjOgXUKZiYp5fRypWYn2JOlakAjxa+xtKrYJW5Tknz9mONI0Fn9?=
 =?us-ascii?Q?jY+Ob+9/7Py84z+yzbgXW22Jh6vMKHKO0kqNIDgn72IKbus3rI1h2b8Vz2j+?=
 =?us-ascii?Q?wQ1fsuYhM1ByPIoIE8MA0jbZxniRbyuZdpC4ekQsUEH79/6VBkC4yT9kkv6w?=
 =?us-ascii?Q?tWAeE5Qv/FMZXcB0y8ADooCxhvWJulsjR/ZWP4Sgl8kgIIJoGfjdGP9s+ly6?=
 =?us-ascii?Q?OlK8jKGpd3zf3NAIfh9seqQngsSJQpNNRJsgJzli4eMmkU3bLMEE2Fa6gXMB?=
 =?us-ascii?Q?IiWCcwunp+1ljdhrlT+MMqphOu9pbCzMmVrUl8YreTGvdRSoLqEu37pd7LCV?=
 =?us-ascii?Q?qQ5ljQFwGp7gaQqWdpGIjxAoyJAT+p4P46GPekGJCPbdmU7auhbq21vxeDI2?=
 =?us-ascii?Q?REm4kIJtDR+W1F3wP65WfXCggHKJyZtMT89Z3obi6a929dxbXDR4KcE0zp1D?=
 =?us-ascii?Q?65BE/Qt5RCSmWV7ieAeTKvbbyXzS4cFi3ifG6lRzMpTUDobEqtv7FZLSyEHI?=
 =?us-ascii?Q?ldVunvavL8JXpQIQk6MUNqIKNQtw+SJNoSkH+2wkqVB7qVEeyAnw9oivMOe/?=
 =?us-ascii?Q?x6MClNTvyJytzmrfDyaC++GskZqsr2SOyp9OS7dkQ+s13VpxCkQl7zKdlXYo?=
 =?us-ascii?Q?zmkIOQi+TiYCADWNTpWB7hzlmNdhPTd03WTkARhP7xyqTLmR5tGU8etji3kI?=
 =?us-ascii?Q?+IqCdTZh930lIZnjp9q548OrKOJcZ7KnqnTpi5GHbsmpcOsbWPitBuB/6YRc?=
 =?us-ascii?Q?mUNYkAx9uvt2/vW/lc2bqe6Az+yj8hl/ZkGbsuYXan9kkaZQXdDByN0vxq5f?=
 =?us-ascii?Q?xkmpjjiHBIi1qYhEYq8PWLes85F/UTAPheuFcVRoVlZ2NAwFmD5KRiVsxXvm?=
 =?us-ascii?Q?NHzJcaXkWTy/SzB/mqgOFbIK7xs4Ls6do+X3LU/Hdf5PHqSadq2TeQ/MT0I8?=
 =?us-ascii?Q?euJBcgLNULhkwMY9IjtyocNEqN9PIGpMSeMkgRc32Oqqcm4xqrZnFOTytDKW?=
 =?us-ascii?Q?QNexvn0pqZiXpmBc8cpIdLO3AELI3jus?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CDXpUembsymngVA8C24n8+DfANTFjMHUdSMxCxqnsRXc5NJey5tTHl9nLoFx?=
 =?us-ascii?Q?CShwhUbP8K2nAeuQgERMb4rzl9mHNoyOmBXkcfg0TFbD/1yy71dhJJzrx1c0?=
 =?us-ascii?Q?JCBTp42l660RMQ1Kui0ARivjcYbQZUBUUO1dFioGUVSePARPpjTbF2TsxUTg?=
 =?us-ascii?Q?WPyh1JR4yWJx4nTP7K92Ax6qHzuiNVH6chk69KxR0z0K/3sxLGkZLbPmQZ87?=
 =?us-ascii?Q?BpQOOgbJZNaU92MZE4sxcTHkToDmM0J2mnrOVeWwHaYMvtrxzm1rW4PYney0?=
 =?us-ascii?Q?xV++blhFHui4umk2DKkn5cxzO87N026jUwu61rKnz7YA2xtIHbQ9aTh11LCG?=
 =?us-ascii?Q?O7HtbG2M9tqZZxoOWoRuusmlscJpp9i4/8FoU9MJ4xzndMuJgXwkjUBCPEqe?=
 =?us-ascii?Q?+EuGWeB/r9EIR/ogVwTwvHbd6Ci8YzJC/we6S7qUt/nE7iMvQM6bP62bT3wu?=
 =?us-ascii?Q?bBEPxBBkxn5ij1cpj6r/ysobWeaH+aVQDmrPTjsToISAtQa3tSPmwE6K0+JK?=
 =?us-ascii?Q?ruOTmlNVKWhJcD3ueP7bFSjAWoHaDiq2fcTwG2Xg4QXkCnXsI3deFHwGs4jh?=
 =?us-ascii?Q?ojJi8p6Lvn1dUvKkZ9GslM6fqSIaXRpPjb7PF4kr2sCChPlMZip2eeMRo/AW?=
 =?us-ascii?Q?UjifBtb2rAU2EpVTE+RrgXD8FquSRZbcV/s0cYp7hKldc+no0Z0xIma/oTdD?=
 =?us-ascii?Q?9csBCYQWrfCEL6Mi7/UbXJvltBabw9+/PniSyNTfmRkQR5+Jz/xJd3Dbq1GX?=
 =?us-ascii?Q?lVjTc8Y3k5zb/Ja9rRe1At8WT2RWhoYuAxMcj+palmjd7Y24G9fI+MTe3kST?=
 =?us-ascii?Q?NANN4atge6RWaP7h3WSpRVqXMwcprz1eP7K/6RUMnZcoyfIweH3FWV/MuFEA?=
 =?us-ascii?Q?KDq6htqFWmLTkFXi/941Wk85YxFJAR17V/SscmZBQg+p0Kbr0gi/Ld/CS2HX?=
 =?us-ascii?Q?uWe10xowqc78zsd482fxxDrXtPgEJ6pCn/deRxF546EfDup7UXyNMgYChSt/?=
 =?us-ascii?Q?fQxR5/EohH943jU5AXqVqZ42pY0Eotpedbr/Unx1lrczm0sY7HlrBQQbtfd6?=
 =?us-ascii?Q?3mO4peI1dUG7K1yIRyiiswoKOLL5SYyyKHmQOG8qo8n1C8tSXpLY7ZaRZ+ys?=
 =?us-ascii?Q?XKZ81/YTITITRhwYSgCGngFhGTZ+QuwhDI0RqfOUn1atoRNe/NUExCk2LiFj?=
 =?us-ascii?Q?Wo0rcXWbDBQCgFqzBpsYwbAUYhOX6hZL4lwILJunDsEy1+4LRat8XcOO7Nn9?=
 =?us-ascii?Q?EgIoDf/embCfbXkg3r641+8XxD4oSyZnx5I8nw5HGGNUz0yRJiVdfVN51ctd?=
 =?us-ascii?Q?LZeY/mmnqcfl3mHYHmPwzrgJjX/ewHsFwDOScZenfONvlTKpJ8DwIRDFSvxn?=
 =?us-ascii?Q?TXnGp0KbjqbU0Rr8uU++JOeYapz+/Bhcnmg6jYBL02gYzqQYYlYtEL9zTf9F?=
 =?us-ascii?Q?YnM9Okxbw0oPXdC2GUwahCXX68NOcnp68tDXnic/9RKD/bUjB5wKJSiip3+3?=
 =?us-ascii?Q?SZTP3+FEBuoFiQlFHjnpQgSmZOWT/omxl/F1ZF1FI6zvKiwooO2QiO+5Tsv8?=
 =?us-ascii?Q?KHqjqSWRmheulTJOQ5muL5eHdjoxQQIC0u/4e105?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a21553c-7e61-4038-16e2-08dd5cd1aad4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:09:34.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhskmRCVO+V3jRBft3M6Bq9P5iWYcVxnecXs6zY/yNkG2Tdh143TbQrXlLHAyQqplxZkFILLMayW5WYuXdyNrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9179

Add compatible string "fsl,imx94-gpio" for the i.MX94 chip, which is
backward compatible with i.MX8ULP. Set it to fall back to
"fsl,imx8ulp-gpio".

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index cabda2eab4a23..4fb32e9aec0a3 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - fsl,imx93-gpio
+              - fsl,imx94-gpio
               - fsl,imx95-gpio
           - const: fsl,imx8ulp-gpio
 
-- 
2.34.1


